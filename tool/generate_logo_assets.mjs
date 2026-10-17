import { mkdir, readFile, writeFile } from 'node:fs/promises';
import { createRequire } from 'node:module';
import { dirname, resolve } from 'node:path';

const sourcePath = process.argv[2];
const projectRoot = resolve(process.argv[3] ?? '.');
const sharpModulePath = process.argv[4] ?? 'sharp';
const sharp = createRequire(import.meta.url)(sharpModulePath);

if (!sourcePath) {
  throw new Error('Usage: node tool/generate_logo_assets.mjs <source.png> [project-root]');
}

const transparent = { r: 0, g: 0, b: 0, alpha: 0 };

async function removeWhiteBackground(path) {
  const { data, info } = await sharp(path)
    .removeAlpha()
    .raw()
    .toBuffer({ resolveWithObject: true });
  const output = Buffer.alloc(info.width * info.height * 4);

  for (let source = 0, target = 0; source < data.length; source += 3, target += 4) {
    const red = data[source];
    const green = data[source + 1];
    const blue = data[source + 2];
    const distanceFromWhite = Math.max(255 - red, 255 - green, 255 - blue);
    const alpha = distanceFromWhite <= 2
      ? 0
      : distanceFromWhite >= 24
        ? 255
        : Math.round(((distanceFromWhite - 2) / 22) * 255);

    if (alpha === 0) {
      output[target] = 0;
      output[target + 1] = 0;
      output[target + 2] = 0;
    } else if (alpha < 255) {
      const opacity = alpha / 255;
      output[target] = Math.max(0, Math.min(255, Math.round((red - 255 * (1 - opacity)) / opacity)));
      output[target + 1] = Math.max(0, Math.min(255, Math.round((green - 255 * (1 - opacity)) / opacity)));
      output[target + 2] = Math.max(0, Math.min(255, Math.round((blue - 255 * (1 - opacity)) / opacity)));
    } else {
      output[target] = red;
      output[target + 1] = green;
      output[target + 2] = blue;
    }
    output[target + 3] = alpha;
  }

  return {
    data: output,
    width: info.width,
    height: info.height,
  };
}

async function centeredSquare(input, size, inset) {
  return sharp(input)
    .trim({ background: transparent })
    .resize(size - inset * 2, size - inset * 2, {
      fit: 'contain',
      background: transparent,
    })
    .extend({ top: inset, bottom: inset, left: inset, right: inset, background: transparent })
    .png()
    .toBuffer();
}

async function pngToIco(png) {
  const header = Buffer.alloc(22);
  header.writeUInt16LE(0, 0);
  header.writeUInt16LE(1, 2);
  header.writeUInt16LE(1, 4);
  header[6] = 0;
  header[7] = 0;
  header[8] = 0;
  header[9] = 0;
  header.writeUInt16LE(1, 10);
  header.writeUInt16LE(32, 12);
  header.writeUInt32LE(png.length, 14);
  header.writeUInt32LE(header.length, 18);
  return Buffer.concat([header, png]);
}

const raw = await removeWhiteBackground(sourcePath);
const rawInput = { raw: { width: raw.width, height: raw.height, channels: 4 } };

const fullLogo = await sharp(raw.data, rawInput)
  .trim({ background: transparent })
  .resize({ width: 896 })
  .extend({ top: 64, bottom: 64, left: 64, right: 64, background: transparent })
  .png()
  .toBuffer();

// The cap and tassel are the compact mark from the supplied artwork. A square
// crop keeps it readable in navigation bars, favicons, and launcher icons.
const markPixels = Buffer.from(raw.data);
for (let y = 780; y < 1150; y += 1) {
  for (let x = 620; x < 960; x += 1) {
    const pixel = (y * raw.width + x) * 4;
    const red = markPixels[pixel];
    const green = markPixels[pixel + 1];
    const blue = markPixels[pixel + 2];
    if (y >= 810 || (blue > green && green > red && blue - red > 70)) {
      markPixels[pixel + 3] = 0;
    }
  }
}
const capCrop = await sharp(markPixels, rawInput)
  .extract({ left: 200, top: 380, width: 760, height: 760 })
  .png()
  .toBuffer();
const logoMark = await centeredSquare(capCrop, 1024, 96);
const maskableMark = await centeredSquare(capCrop, 1024, 205);

const outputs = [
  ['assets/logo.png', fullLogo],
  ['assets/logo_mark.png', logoMark],
  ['web/favicon.png', await sharp(logoMark).resize(64, 64).png().toBuffer()],
  ['web/icons/Icon-192.png', await sharp(logoMark).resize(192, 192).png().toBuffer()],
  ['web/icons/Icon-512.png', await sharp(logoMark).resize(512, 512).png().toBuffer()],
  ['web/icons/Icon-maskable-192.png', await sharp(maskableMark).resize(192, 192).png().toBuffer()],
  ['web/icons/Icon-maskable-512.png', await sharp(maskableMark).resize(512, 512).png().toBuffer()],
];

const windowsPng = await sharp(logoMark).resize(256, 256).png().toBuffer();
outputs.push(['windows/runner/resources/app_icon.ico', await pngToIco(windowsPng)]);

for (const [relativePath, contents] of outputs) {
  const outputPath = resolve(projectRoot, relativePath);
  await mkdir(dirname(outputPath), { recursive: true });
  await writeFile(outputPath, contents);
  const written = await readFile(outputPath);
  console.log(`${relativePath}: ${written.length} bytes`);
}
