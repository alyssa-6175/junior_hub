import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:junior_hub/app_colors.dart';
import 'package:junior_hub/firebase_options.dart';
import 'package:junior_hub/providers/app_provider.dart';
import 'package:junior_hub/screens/main_shell.dart';

/// Local-only QA entry point that opens the complete authenticated shell
/// without changing production authentication behavior.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (_) => AppProvider(),
      child: MaterialApp(
        title: 'JuniorHub QA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: kNavy,
            primary: kNavy,
            secondary: kGold,
            surface: kSurface,
          ),
          scaffoldBackgroundColor: kBackground,
          textTheme: GoogleFonts.interTextTheme(),
        ),
        home: const MainShell(),
      ),
    ),
  );
}
