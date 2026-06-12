import 'package:flutter/material.dart';
import '../models/resource.dart';

// URL Links
/// Global map of link label → actual URL.
/// Used by all link rendering widgets so each label opens the right site.
/// Add new entries here whenever you add a new resource link label.
const Map<String, String> kLinkUrls = {
  // Khan Academy
  'Khan Academy AP CSP (free)':
      'https://www.khanacademy.org/computing/ap-computer-science-principles',
  'Khan Academy AP CSA':
      'https://www.khanacademy.org/computing/ap-computer-science-a',
  'Khan Academy AP Calculus BC':
      'https://www.khanacademy.org/math/ap-calculus-bc',
  'Khan Academy AP Calculus AB':
      'https://www.khanacademy.org/math/ap-calculus-ab',
  'Khan Academy AP Stats': 'https://www.khanacademy.org/math/ap-statistics',
  'Khan Academy AP Bio': 'https://www.khanacademy.org/science/ap-biology',
  'Khan Academy AP Chemistry':
      'https://www.khanacademy.org/science/ap-chemistry-beta',
  'Khan Academy AP Physics 1':
      'https://www.khanacademy.org/science/ap-physics-1',
  'Khan Academy AP US History':
      'https://www.khanacademy.org/humanities/ap-us-history',
  'Khan Academy AP World':
      'https://www.khanacademy.org/humanities/world-history',
  'Khan Academy AP Lang':
      'https://www.khanacademy.org/ela/cc-9th-grade-reading-and-writing',
  'Khan Academy AP Lit': 'https://www.khanacademy.org/ela/college-prep',
  'Khan Academy AP Psych':
      'https://www.khanacademy.org/social-science-finance-history/ap-college-psychology',
  'Khan Academy SAT prep': 'https://www.khanacademy.org/test-prep/sat',
  'khanacademy.org/sat': 'https://www.khanacademy.org/test-prep/sat',
  'khanacademy.org/sat-math': 'https://www.khanacademy.org/test-prep/sat',
  'khanacademy.org/sat-reading-and-writing':
      'https://www.khanacademy.org/test-prep/sat',
  'Link your PSAT score': 'https://www.khanacademy.org/test-prep/sat',
  'khanacademy.org/act-math': 'https://www.khanacademy.org/test-prep/act',
  'Khan Academy AP Physics 2':
      'https://www.khanacademy.org/science/ap-physics-2',
  // College Board / AP Classroom
  'AP Classroom (official)': 'https://myap.collegeboard.org/',
  'AP Classroom': 'https://myap.collegeboard.org/',
  'AP Classroom login': 'https://myap.collegeboard.org/',
  'College Board – 8 official practice tests':
      'https://satsuite.collegeboard.org/sat/practice-preparation/practice-tests',
  'Download all 8 tests (free)':
      'https://satsuite.collegeboard.org/sat/practice-preparation/practice-tests',
  'satsuite.collegeboard.org/practice':
      'https://satsuite.collegeboard.org/sat/practice-preparation/practice-tests',
  'bluebook.app.collegeboard.org': 'https://bluebook.app.collegeboard.org/',
  'Bluebook – Digital SAT app': 'https://bluebook.app.collegeboard.org/',
  'Past AP FRQs (2001–2024)':
      'https://apcentral.collegeboard.org/courses/exam-questions',
  'Past AP FRQs': 'https://apcentral.collegeboard.org/courses/exam-questions',
  'Past AP Physics C FRQs':
      'https://apcentral.collegeboard.org/courses/ap-physics-c-mechanics/exam',
  'Official 2023 AP CSP FRQ packet':
      'https://apcentral.collegeboard.org/courses/ap-computer-science-principles/exam',
  // Princeton Review
  "Princeton Review 2025":
      'https://www.princetonreview.com/college/ap-test-prep',
  "Princeton Review AP Chem":
      'https://www.princetonreview.com/college/ap-chemistry-test-prep',
  "Princeton Review AP English Lang":
      'https://www.princetonreview.com/college/ap-english-language-test-prep',
  "Princeton Review APUSH":
      'https://www.princetonreview.com/college/ap-us-history-test-prep',
  "Princeton Review BC":
      'https://www.princetonreview.com/college/ap-calculus-test-prep',
  "Princeton Review 1550+ SAT":
      'https://www.princetonreview.com/college/sat-test-prep',
  "Find on Amazon": 'https://www.amazon.com/',
  // Barron's
  "Barron's AP CSA": 'https://www.barronbooks.com/category/test-prep/ap/',
  "Barron's AP Calc AB": 'https://www.barronbooks.com/category/test-prep/ap/',
  "Barron's AP Biology": 'https://www.barronbooks.com/category/test-prep/ap/',
  "Barron's AP Statistics":
      'https://www.barronbooks.com/category/test-prep/ap/',
  "Barron's AP Psychology":
      'https://www.barronbooks.com/category/test-prep/ap/',
  "Barron's AP World": 'https://www.barronbooks.com/category/test-prep/ap/',
  "Barron's AP Physics": 'https://www.barronbooks.com/category/test-prep/ap/',
  // Other prep tools
  'Code.org curriculum (free)': 'https://code.org/educate/csp',
  'Code.org AP CSP curriculum': 'https://code.org/educate/csp',
  'CodingBat Java practice': 'https://codingbat.com/java/AP-1',
  'Calc Medic': 'https://www.calc-medic.com/',
  'Calc Medic (free)': 'https://www.calc-medic.com/',
  'Stapplet tools (free)': 'https://stapplet.com/',
  'Bozeman Science (YouTube, free)': 'https://www.youtube.com/@BozemanScience',
  "Chad's Chemistry (YouTube)": 'https://www.youtube.com/@ChadsTutorials',
  'Flipping Physics (YouTube)': 'https://www.youtube.com/@FlippingPhysics',
  'Flipping Physics': 'https://www.youtube.com/@FlippingPhysics',
  'Tom Richey (YouTube)': 'https://www.youtube.com/@TomRichey',
  'Litcharts (free analysis)': 'https://www.litcharts.com/',
  'AMSCO textbook': 'https://www.perfectionlearning.com/amsco.html',
  'Albert.io – AP CSP MCQs':
      'https://www.albert.io/ap-computer-science-principles',
  'Albert.io AP CSP MCQs':
      'https://www.albert.io/ap-computer-science-principles',
  'Albert.io – AP CSP': 'https://www.albert.io/ap-computer-science-principles',
  'Start practicing': 'https://www.khanacademy.org/test-prep/sat',
  // Competitions
  'usaco.org': 'https://usaco.org/',
  'USACO Guide (free)': 'https://usaco.guide/',
  'Past problems & editorials': 'https://usaco.guide/problems/',
  'maa.org/math-competitions': 'https://www.maa.org/math-competitions',
  'Art of Problem Solving': 'https://artofproblemsolving.com/',
  'Past AMC problems':
      'https://artofproblemsolving.com/wiki/index.php/AMC_Problems_and_Solutions',
  'The Art of Problem Solving': 'https://artofproblemsolving.com/',
  'vashti.net/nacbb': 'https://www.vashti.net/nacbb/',
  'Open exam prep resources': 'https://www.vashti.net/nacbb/',
  'soinc.org': 'https://soinc.org/',
  'uscyberpatriot.org': 'https://www.uscyberpatriot.org/',
  'congressionalappchallenge.us': 'https://www.congressionalappchallenge.us/',
  'Submit your app': 'https://www.congressionalappchallenge.us/',
  // Research
  'cee.org/rsi': 'https://www.cee.org/programs/research-science-institute',
  'Application portal':
      'https://www.cee.org/programs/research-science-institute',
  'math.mit.edu/research/highschool/primes':
      'https://math.mit.edu/research/highschool/primes/index.php',
  'training.nih.gov/programs/hs-sip':
      'https://www.training.nih.gov/programs/hs-sip',
  'polygence.org': 'https://www.polygence.org/',
  'Browse mentors': 'https://www.polygence.org/mentors',
  'Showcase past projects': 'https://www.polygence.org/showcase',
  // Internships
  'buildyourfuture.withgoogle.com/programs/cssi':
      'https://buildyourfuture.withgoogle.com/programs/computer-science-summer-institute',
  'Apply now':
      'https://buildyourfuture.withgoogle.com/programs/computer-science-summer-institute',
  'nasa.gov/careers/students': 'https://www.nasa.gov/stem/highschool-students/',
  'OSSI portal': 'https://intern.nasa.gov/',
  // Knowt / ACT / SAT misc
  'knowt.com/exams/SAT': 'https://knowt.com/exams/SAT',
  'Free account available': 'https://knowt.com/',
  'knowt.com/exams/ACT': 'https://knowt.com/exams/ACT',
  'Kaplan ACT Math': 'https://www.kaptest.com/act/test-prep/act-math',
  'Kaplan ACT Science strategies':
      'https://www.kaptest.com/act/test-prep/act-science',
  'act.org/science':
      'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/science-test-description.html',

  // AP Practice tests
  'AP CSP Exam 2018':
      'https://drive.google.com/file/d/1Kw57ziu0UQF8x7nasTmMeQ0VQkBxqAeU/view',
  'AP CSP Exam 2016':
      'https://drive.google.com/file/d/1opAkTOyhpMy2wFVtjbYCioAQZtA89Kg7/view',

  'AP CSA Exam 2015':
      'https://drive.google.com/file/d/1p3QA6qOb1gZGAok_ao_j5G_wIh3pJNUo/view',
  'AP CSA Exam 2014':
      'https://drive.google.com/file/d/1RTYl33OIPRph22XO7fHkY5S_b5vQE5qS/view',
  'AP CSA Exam 2008':
      'https://drive.google.com/file/d/1VwDUwLuDtbxZkAeIhus9YMjxj-6MV8hl/view',

  'AP Calc BC Exam 2018':
      'https://drive.google.com/file/d/1BodpD5UcMyXixG5ilj-7PfS4P5rIxoT4/view',
  'AP Calc BC Exam 2017':
      'https://drive.google.com/file/d/1WrA09duD8Ntm9hX0SJ3wrgN6MYjFhVwE/view',
  'AP Calc BC Exam 2016':
      'https://drive.google.com/file/d/1_DrYtKoCILbaLkhkgJMj-xcU5qOrbXMN/view',
  'AP Calc BC Exam 2015':
      'https://drive.google.com/file/d/1z1KXGkkaotk6fGbykczsaqufHRJBcwvc/view',
  'AP Calc BC Exam 2014':
      'https://drive.google.com/file/d/1_1IZe8gc0F_HlkgYdI1PU-uZYURpti9r/view',
  'AP Calc BC Exam 2013':
      'https://drive.google.com/file/d/1NKPh7jDMDfbdgYRNN_Oi_eMgXwDgzg2h/view',
  'AP Calc BC Exam 2012':
      'https://drive.google.com/file/d/1ceDFN8GUuePdXf3W6C9FIUyEUWy3Y4fH/view',

  'AP Statistics Exam 2018':
      'https://drive.google.com/file/d/1z6CCYw2-JEn7hR70GW7OOojCSBqMHER5/view',
  'AP Statistics Exam 2017':
      'https://drive.google.com/file/d/1hoDIUUv7NeSegpNERvg2Ev3R_dGpNCa8/view',
  'AP Statistics Exam 2016':
      'https://drive.google.com/file/d/1gN7xTkNsoTmFDVDd9KmTLdiJabxy_WE6/view',
  'AP Statistics Exam 2015':
      'https://drive.google.com/file/d/1Mfu2fNMC33S5KQbo9KfBZJbBYhfO73pW/view',
  'AP Statistics Exam 2014':
      'https://drive.google.com/file/d/1wRgMfcqUTrJivGUKFLnFZX7MrExj7P0o/view',
  'AP Statistics Exam 2013':
      'https://drive.google.com/file/d/1PjOCDiggHyAQGuEz2Or_3AmfSkAJbj92/view',
  'AP Statistics Exam 2012':
      'https://drive.google.com/file/d/15KSOznyaaITWqYWLyUhcITfmDXP4yCEt/view',

  'AP Bio Exam 2018':
      'https://drive.google.com/file/d/1qhQrGfFBDgC2OuzXDYPSNnI6wo2gN5V4/view',
  'AP Bio Exam 2017':
      'https://drive.google.com/file/d/1yS6fXqX-xY9ihgSyREFEvi52VyEz3SuO/view',
  'AP Bio Exam 2016':
      'https://drive.google.com/file/d/1IyUMiqCeYabxEC7BXjuh0TDoXuu1Gr9h/view',
  'AP Bio Exam 2015':
      'https://drive.google.com/file/d/1cLX2cpDANDcb_EXDA3zyN72zMqjM1sgP/view',
  'AP Bio Exam 2014':
      'https://drive.google.com/file/d/14ztUPnCrXmvGMMwmen2FgZNe8ztLIFZP/view',
  'AP Bio Exam 2013':
      'https://drive.google.com/file/d/1djGbzZoZcOmRMjJEiWuyyKpB-q-TZgeh/view',
  'AP Bio Exam 2012':
      'https://drive.google.com/file/d/1IrAEguQ1d7jKEas27A_sqjawGA6adwrB/view',
  'AP Bio Exam 2008':
      'https://drive.google.com/file/d/1-We8Gz_UNAcvt3wmroHM9NE2eOIfsBni/view',

  'AP Chem Exam 2018':
      'https://drive.google.com/file/d/1itkuaM3VHJvYXL0VxzHCHXbh9izkSy5n/view',
  'AP Chem Exam 2017':
      'https://drive.google.com/file/d/1eFCnW1O_qWcj3GrCSztLn-6r_av3w0Mh/view',
  'AP Chem Exam 2016':
      'https://drive.google.com/file/d/19KLHB5LjK3XdSMJHh0gDsTQQFjFVGLYY/view',
  'AP Chem Exam 2015':
      'https://drive.google.com/file/d/1DhuhPK6ArZ_66W7CP2xQeriyzAh9tfAE/view',
  'AP Chem Exam 2014':
      'https://drive.google.com/file/d/1rVmyPeR3b1cJi6gMxaJ-J660igq5vrZZ/view',
  'AP Chem Exam 2013':
      'https://drive.google.com/file/d/1Lm-IK26c6a3DTFdUpJrdcMUHxgRHE1ze/view',
  'AP Chem Exam 2012':
      'https://drive.google.com/file/d/1fzrq_Z6htMGYTzmhPl_1_wNPnaHDYOXZ/view',

  'AP Physics 1 Exam 2018':
      'https://drive.google.com/file/d/154RD52gmBS2gBw_HJGkaVHgHDPJfmhoh/view',
  'AP Physics 1 Exam 2017':
      'https://drive.google.com/file/d/1jOAr6IiXOx4oJ9vIid_0cNFJLNBiv8-2/view',
  'AP Physics 1 Exam 2016':
      'https://drive.google.com/file/d/1RdA_9CO5uSn5eANh0GoRSXsz-OpnZQk5/view',
  'AP Physics 1 Exam 2015':
      'https://drive.google.com/file/d/1qstnMnzWSVZDQTVCk5K34luI8YCF0Woy/view',
  'AP Physics 1 Exam 2014':
      'https://drive.google.com/file/d/1DInPD-MN-fdrwJpwNsaxZBsfOtciPxsi/view',

  'AP Physics 2 Exam 2018':
      'https://drive.google.com/file/d/1qCavuPZilli1w5SVAj_3bikYUIGBE0TN/view',
  'AP Physics 2 Exam 2017':
      'https://drive.google.com/file/d/1fN2y70yunbbYtKAWCFUr86XU76mM_jOH/view',
  'AP Physics 2 Exam 2016':
      'https://drive.google.com/file/d/1KgmEgb-j8Tv_qAgVagRjkLUWU_ETEzT-/view',
  'AP Physics 2 Exam 2015':
      'https://drive.google.com/file/d/1BbJ4fUWADtnT06yHMe4j0FTlCpbhvA7F/view',
  'AP Physics 2 Exam 2014':
      'https://drive.google.com/file/d/1rlYBi6Uj6lXop_J2lbMMlGXc9RCHg8My/view',

  'AP Physics C Mechanics Exam 2019':
      'https://drive.google.com/file/d/1QqDnJVMUDHdogXSeQJUStt23hEvNohpb/view',
  'AP Physics c Mechanics Exam 2018':
      'https://drive.google.com/file/d/1Yr6NGW2WM8nArJuyWLRSSk7FEe0MgmIu/view',
  'AP Physics C Mechanics Exam 2017':
      'https://drive.google.com/file/d/1GYKKKga-AFeV6x8qKGRWTBgtEVsyvUut/view',
  'AP Physics C Mechanics Exam 2016':
      'https://drive.google.com/file/d/1if4EfkAnfqsxA5CkdqGpBoSweMtQ2xtM/view',
  'AP Physics C Mechanics Exam 2015':
      'https://drive.google.com/file/d/1xn2gz_awAVW1xm8_BTA-7k6PyECNtgUm/view',
  'AP Physics C Mechanics Exam 2014':
      'https://drive.google.com/file/d/1iMY-zctSQ0sWwXnkrP6sXQWU28W11KxO/view',
  'AP Physics C Mechanics Exam 2013':
      'https://drive.google.com/file/d/1BVFPkYr1NgIVOFtw_GZsIWlSzmtqxnLE/view',
  'AP Physics C Mechanics Exam 2012':
      'https://drive.google.com/file/d/123S1RpkTe1lTEWEAsQ5OnQhciLQDHJKI/view',

  'AP Physics C E&M Exam 2018':
      'https://drive.google.com/file/d/1ZoDo1uHC3Xvg-wZ0oDMXrtWYbRs3PW6y/view',
  'AP Physics C E&M Exam 2017':
      'https://drive.google.com/file/d/1CU4qRYemclVX8t-jgmLEA4nR7gXN8sEh/view',
  'AP Physics C E&M Exam 2016':
      'https://drive.google.com/file/d/1nFBFrhVmbjC0v3hLnKgWc3jCEwFFF9Nt/view',
  'AP Physics c E&M Exam 2015':
      'https://drive.google.com/file/d/1MVXQy5gqna58nkU7QDd7FCKiWRlnyH4O/view',
  'AP Physics C E&M Exam 2013':
      'https://drive.google.com/file/d/1TCkvgQUow1HTH-yZXkfnrglf2sEJmEJz/view',
  'AP Physics C E&M Exam 2012':
      'https://drive.google.com/file/d/14IM-C0UeYVCqQM-W-GRbA5vFo2Y5DOpq/view',

  'AP US History Exam 2019':
      'https://drive.google.com/file/d/1sKZJvapFrlLjTYcTCQDNyaYeY1Z89vue/view',
  'AP US History Exam 2018':
      'https://drive.google.com/file/d/1waAlmDohe8NMmDFi6SOw7KaM42bYXm__/view',
  'AP US History Exam 2017':
      'https://drive.google.com/file/d/11XludA3NYrKmwD-JQS8ApmovP35pw9Lx/view',
  'AP US History Exam 2016':
      'https://drive.google.com/file/d/1ht90YP5T-qxHWNfhqdDAAQ_g384d9Ses/view',
  'AP US History Exam 2015':
      'https://drive.google.com/file/d/1mT3ONrlz4J3_10ap893uqWovnIXYOvfL/view',
  'AP US History Exam 2015 (2)':
      'https://drive.google.com/file/d/1T4X-rWHqvBK2NrY0X3LLvf5WxgsrazVF/view',
  'AP US History Exam 2014':
      'https://drive.google.com/file/d/1Xwzp6Ds54FPH80TeZub9fCXLUxydkdMk/view',
  'AP US History Exam 2013':
      'https://drive.google.com/file/d/1peNNEokKcZb9gjex-bBnB216ZwyGFqWR/view',
  'AP US History Exam 2012':
      'https://drive.google.com/file/d/1vR_27dTrtTh6vGZLdvuChNaqnaINpDvW/view',
  'AP US History Exam 2008':
      'https://drive.google.com/file/d/1byxkMfaD9Nm-Jze6PiQ2SEg6MNjxfVBH/view',

  'AP Micro Exam 2019':
      'https://drive.google.com/file/d/1jDj8myqX_DvKHa7tW3Ab4_As8mvK7cGi/view',
  'AP Micro Exam 2018':
      'https://drive.google.com/file/d/1G-Fp9hpfb4d__T25lfQUgFiOo3BBPj2C/view',
  'AP Mico Exam 2017':
      'https://drive.google.com/file/d/1qB9rrmfswd4j-KTtE5ZZ0IBQa4wlZC6I/view',
  'AP Micro Exam 2016':
      'https://drive.google.com/file/d/1Fr3V9BNQ1WZ7RHZpzdr_UP-tgzTEoNX5/view',
  'AP Micro Exam 2015':
      'https://drive.google.com/file/d/1SksjlDh-NXTSgtOdGb38iW47oix2NAhy/view',
  'AP Micro Exam 2014':
      'https://drive.google.com/file/d/1KzUyFUf2P9KcQhQ0rpCh1FXWQIjaVUdz/view',
  'AP Micro Exam 2013':
      'https://drive.google.com/file/d/1VJFhG_YEIT3UI5Cmujt3jxp__wC5h6Z_/view',
  'AP Micro Exam 2012':
      'https://drive.google.com/file/d/1uq0SmYDiogxMyi54P-KSE0PX5QoLvGJI/view',
  'AP Micro Exam 2008':
      'https://drive.google.com/file/d/1HT-R9SpuYYDdy5v3v5lBatp7Jk5J5iws/view',
  'AP Micro Exam 2005':
      'https://drive.google.com/file/d/1qNdMaAshXNSU2I3owBhvNIiCpPKbhj-K/view',
  'AP Micro Exam 2000 (MCQ)':
      'https://drive.google.com/file/d/1aMFKiToHh0p8zYJtsKtLj47NAX7IuNdl/view',

  'AP Macro Exam 2022':
      'https://drive.google.com/file/d/1ffkuCYvNdC19BZC1eGCIdt0_iFHGtX4L/view',
  'AP Macro Exam 2022 (2)':
      'https://drive.google.com/file/d/1ZO6Niti772pEUCgeTaBEBJKoTmCOrk1T/view',
  'AP Macro Exam 2019':
      'https://drive.google.com/file/d/1_b4Lb9bLUQU5Cfu6BzCU5ZxpXJiSzcEg/view',
  'AP Macro Exam 2013':
      'https://drive.google.com/file/d/1VNzA2aye5jkxWJvr2Y_EIcRoy7bkTl03/view',
  'AP Macro Exam 2012':
      'https://drive.google.com/file/d/1XmmYhQMstfz1eeuHiTSmdgHVtP9MH48c/view',
};

// ─────────────────────────────────────────────────────────────────────────────
// ALL RESOURCES
// To add a new resource, copy any existing block and change the values.
// ─────────────────────────────────────────────────────────────────────────────
final List<Resource> allResources = [
  // ── Competitions ───────────────────────────────────────────────────────────
  const Resource(
    id: 'usaco',
    title: 'USACO',
    category: 'competition',
    field: 'cs',
    scope: 'national',
    locationNote: 'Online (from home)',
    timeCommitment: '4-hour contest window',
    majorTags: ['cs', 'data_sci', 'ai'],
    applicationInfo: 'Register at usaco.org before the contest window. Free.',
    description:
        '4 divisions (Bronze to Platinum). Contest windows in December, January, February, and March. Register before each window opens.',
    deadline: 'Dec 13–16, 2025',
    icon: Icons.emoji_events,
    url: 'http://www.usaco.org',
    links: ['usaco.org', 'USACO Guide (free)', 'Past problems & editorials'],
    detailNote:
        'Start with Bronze. The USACO Guide at usaco.guide is the single best free resource — work through it in order.',
  ),
  const Resource(
    id: 'amc',
    title: 'AMC 8 / 10 / 12',
    category: 'competition',
    field: 'math',
    scope: 'national',
    locationNote: 'In-person at registered schools/centers',
    timeCommitment: '40 mins (AMC 8) or 75 mins (AMC 10/12)',
    majorTags: ['math', 'problem_solving', 'logic'],
    applicationInfo:
        'Register through school or local testing center. Small fee applies.',
    description:
        'American Mathematics Competitions. AMC 10/12 are the gateway to AIME, USAMO, and the US IMO team.',
    deadline: 'Nov 6, 2025',
    icon: Icons.emoji_events,
    url: 'https://maa.org/math-competitions',
    links: [
      'maa.org/math-competitions',
      'Art of Problem Solving',
      'Past AMC problems',
    ],
  ),
  const Resource(
    id: 'cac',
    title: 'Congressional App Challenge',
    category: 'competition',
    field: 'cs',
    scope: 'national',
    locationNote: 'Online submission',
    timeCommitment: 'Flexible (self-paced app development)',
    majorTags: ['cs', 'app_dev', 'civics'],
    applicationInfo:
        'Register online at official portal. Submit video/code. Free.',
    description:
        'Annual app-building competition organized by Members of Congress. Any district can submit an app.',
    deadline: 'Dec 21, 2025',
    icon: Icons.emoji_events,
    url: 'https://www.congressionalappchallenge.us',
    links: ['congressionalappchallenge.us', 'Submit your app'],
  ),
  const Resource(
    id: 'usabo',
    title: 'USABO',
    category: 'competition',
    field: 'biology',
    scope: 'national',
    locationNote: 'In-person at registered schools/centers',
    timeCommitment: '50-min Open Exam, 120-min Semifinal',
    majorTags: ['biology', 'genetics', 'anatomy'],
    applicationInfo:
        'School must register as testing center. Free or small fee.',
    description:
        'USA Biology Olympiad. Open exam in January, semifinals in March. Top students represent the US at the IBO.',
    deadline: 'Jan 2026',
    icon: Icons.emoji_events,
    url: 'https://www.usabo-trc.org',
    links: ['vashti.net/nacbb', 'Open exam prep resources'],
  ),
  const Resource(
    id: 'scioly',
    title: 'Science Olympiad',
    category: 'competition',
    field: 'all',
    scope: 'national',
    locationNote: 'In-person at regional/state host sites',
    timeCommitment: 'Academic year prep + full-day tournaments',
    majorTags: ['science', 'engineering', 'teamwork'],
    applicationInfo:
        'Join or start a school team. Registration handled by coach.',
    description:
        'Team-based competition with 23 events spanning biology, chemistry, physics, earth science, and engineering.',
    deadline: 'Spring 2026',
    icon: Icons.emoji_events,
    url: 'https://www.soinc.org',
    links: ['soinc.org', 'Event list & trial events'],
  ),
  const Resource(
    id: 'cyberpatriot',
    title: 'CyberPatriot',
    category: 'competition',
    field: 'cs',
    scope: 'national',
    locationNote: 'Online from school/home, Nationals in-person',
    timeCommitment: 'Multiple 6-hour weekend rounds',
    majorTags: ['cs', 'cybersecurity', 'networking', 'linux'],
    applicationInfo:
        'Register a team with a coach online. Fee applies (waivers available).',
    description:
        'National cybersecurity competition by the Air Force Association. Team-based with multiple qualifying rounds.',
    deadline: 'Oct 2025 (registration)',
    icon: Icons.emoji_events,
    url: 'https://www.uscyberpatriot.org',
    links: ['uscyberpatriot.org'],
  ),

  // ── AP Courses ─────────────────────────────────────────────────────────────

  // AP COMPUTER SCIENCE PRINCIPLES
  const Resource(
    id: 'ap_csp',
    title: 'AP CS: Principles',
    category: 'ap',
    field: 'cs',
    description:
        'Covers algorithms, the internet, data, and programming fundamentals. Accessible intro CS AP with a project component.',
    deadline: 'May 2026 (exam)',
    icon: Icons.laptop_mac,
    url:
        'https://apstudents.collegeboard.org/courses/ap-computer-science-principles',
    links: [
      'Khan Academy AP CSP (free)',
      'Code.org curriculum (free)',
      'Princeton Review 2025',
      'AP Classroom (official)',
      'AP CSP Exam 2018',
      'AP CSP Exam 2016',
    ],
    apSubCategory: 'cs',
    detailNote:
        'Khan Academy + Code.org cover all content for free. Princeton Review has 5 full practice tests if you want more.',
  ),

  // AP COMPUTER SCIENCE A
  const Resource(
    id: 'ap_csa',
    title: 'AP CS: A (Java)',
    category: 'ap',
    field: 'cs',
    description:
        'Object-oriented programming in Java: classes, inheritance, recursion, and the AP subset of Java.',
    deadline: 'May 2026 (exam)',
    icon: Icons.laptop_mac,
    url: 'https://apstudents.collegeboard.org/courses/ap-computer-science-a',
    links: [
      'Khan Academy AP CSA',
      'CodingBat Java practice',
      "Barron's AP CSA",
      'AP Classroom',
      'AP CSA Exam 2015',
      'AP CSA Exam 2014',
      'AP CSA Exam 2008',
    ],
    apSubCategory: 'cs',
  ),

  //AP CALCULUS AB
  const Resource(
    id: 'ap_calcab',
    title: 'AP Calculus AB',
    category: 'ap',
    field: 'math',
    description:
        'Limits, derivatives, and integrals. Equivalent to a first-semester college calculus course.',
    deadline: 'May 2026 (exam)',
    icon: Icons.menu_book,
    url: 'https://apstudents.collegeboard.org/courses/ap-calculus-ab',
    links: [
      'Khan Academy AP Calculus AB',
      'Past AP FRQs (2001–2024)',
      'Calc Medic (free)',
      "Barron's AP Calc AB",
    ],
    apSubCategory: 'math',
  ),

  // AP CALCULUS BC
  const Resource(
    id: 'ap_calcbc',
    title: 'AP Calculus BC',
    category: 'ap',
    field: 'math',
    description:
        'Extends AB to include sequences, series, and parametric equations. Covers a full year of college calculus.',
    deadline: 'May 2026 (exam)',
    icon: Icons.menu_book,
    url: 'https://apstudents.collegeboard.org/courses/ap-calculus-bc',
    links: [
      'Khan Academy AP Calculus BC',
      'Past AP FRQs (2001–2024)',
      'Calc Medic',
      'Princeton Review BC',
      'AP Calc BC Exam 2018',
      'AP Calc BC Exam 2017',
      'AP Calc BC Exam 2016',
      'AP Calc BC Exam 2014',
      'AP Calc BC Exam 2013',
      'AP Calc BC Exam 2012',
    ],
    apSubCategory: 'math',
  ),
  const Resource(
    id: 'ap_stats',
    title: 'AP Statistics',
    category: 'ap',
    field: 'math',
    description:
        'Exploring data, sampling, probability, and statistical inference. Great for pre-med, social science, or data tracks.',
    deadline: 'May 2026 (exam)',
    icon: Icons.bar_chart,
    url: 'https://apstudents.collegeboard.org/courses/ap-statistics',
    links: [
      'Khan Academy AP Stats',
      'Stapplet tools (free)',
      "Barron's AP Statistics",
      'AP Statistics Exam 2018',
      'AP Statistics Exam 2017',
      'AP Statistics Exam 2016',
      'AP Statistics Exam 2015',
      'AP Statistics Exam 2014',
      'AP Statistics Exam 2013',
      'AP Statistics Exam 2012',
    ],
    apSubCategory: 'math',
    detailNote:
        'Know how to use a graphing calculator VERY WELL! TI-84 recommended.',
  ),
  const Resource(
    id: 'ap_bio',
    title: 'AP Biology',
    category: 'ap',
    field: 'biology',
    description:
        'Covers evolution, cellular processes, genetics, and ecology. Lab-based with 8 required science practices.',
    deadline: 'May 2026 (exam)',
    icon: Icons.science,
    url: 'https://apstudents.collegeboard.org/courses/ap-biology',
    links: [
      'Khan Academy AP Bio',
      'Bozeman Science (YouTube, free)',
      "Barron's AP Biology",
      'AP Classroom',
      'AP Bio Exam 2018',
      'AP Bio Exam 2017',
      'AP Bio Exam 2016',
      'AP Bio Exam 2015',
      'AP Bio Exam 2014',
      'AP Bio Exam 2013',
      'AP Bio Exam 2012',
      'AP Bio Exam 2008',
    ],
    apSubCategory: 'science',
  ),
  const Resource(
    id: 'ap_chem',
    title: 'AP Chemistry',
    category: 'ap',
    field: 'biology',
    description:
        'Atomic structure, bonding, thermodynamics, kinetics, and equilibrium. One of the most rigorous AP sciences.',
    deadline: 'May 2026 (exam)',
    icon: Icons.science,
    url: 'https://apstudents.collegeboard.org/courses/ap-chemistry',
    links: [
      'Khan Academy AP Chemistry',
      "Chad's Chemistry (YouTube)",
      'Princeton Review AP Chem',
      'AP Chem Exam 2018',
      'AP Chem Exam 2017',
      'AP Chem Exam 2016',
      'AP Chem Exam 2015',
      'AP Chem Exam 2014',
      'AP Chem Exam 2013',
      'AP Chem Exam 2012',
    ],
    apSubCategory: 'science',
  ),

  const Resource(
    id: 'ap_es',
    title: 'AP Environmental Science',
    category: 'ap',
    field: 'science',
    description: 'lowk dont know yet smone please tell me',
    deadline: 'May 2026 (exam)',
    icon: Icons.science,
    url: 'https://apstudents.collegeboard.org/courses/ap-chemistry',
    links: [
      'Khan Academy AP Chemistry',
      "Chad's Chemistry (YouTube)",
      'Princeton Review AP Chem',
      'AP Chem Exam 2018',
      'AP Chem Exam 2017',
      'AP Chem Exam 2016',
      'AP Chem Exam 2015',
      'AP Chem Exam 2014',
      'AP Chem Exam 2013',
      'AP Chem Exam 2012',
    ],
    apSubCategory: 'science',
  ),

  const Resource(
    id: 'ap_phys1',
    title: 'AP Physics 1',
    category: 'ap',
    field: 'physics',
    description:
        'Algebra-based: mechanics, waves, and circuits. Inquiry-focused with heavily weighted FRQs.',
    deadline: 'May 2026 (exam)',
    icon: Icons.bolt,
    url:
        'https://apstudents.collegeboard.org/courses/ap-physics-1-algebra-based',
    links: [
      'Khan Academy AP Physics 1',
      'Flipping Physics (YouTube)',
      "Barron's AP Physics",
      "AP Physics 1 Exam 2018",
      'AP Physics 1 Exam 2017',
      'AP Physics 1 Exam 2016',
      'AP Physics 1 Exam 2015',
      'AP Physics 1 Exam 2014',
    ],
    apSubCategory: 'science',
  ),

  const Resource(
    id: 'ap_phys2',
    title: 'AP Physics 2',
    category: 'ap',
    field: 'physics',
    description:
        'Algebra-based: covering thermodynamics, fluids, electricity and magnetism, optics, and modern physics.',
    deadline: 'May 2026 (exam)',
    icon: Icons.bolt,
    url:
        'https://apstudents.collegeboard.org/courses/ap-physics-2-algebra-based',
    links: [
      'Khan Academy AP Physics 2',
      'AP Physics 2 Exam 2018',
      'AP Physics 2 Exam 2017',
      'AP Physics 2 Exam 2016',
      'AP Physics 2 Exam 2015',
      'AP Physics 2 Exam 2014',
    ],
    apSubCategory: 'science',
  ),
  const Resource(
    id: 'ap_physc',
    title: 'AP Physics C: Mech',
    category: 'ap',
    field: 'physics',
    description:
        'Calculus-based mechanics. Requires concurrent or prior calculus. Strong preparation for engineering programs.',
    deadline: 'May 2026 (exam)',
    icon: Icons.bolt,
    url: 'https://apstudents.collegeboard.org/courses/ap-physics-c-mechanics',
    links: [
      'Khan Academy Physics',
      'Flipping Physics (YouTube)',
      'Past AP Physics C FRQs',
      'AP Physics C Mechanics Exam 2019',
      'AP Physics C Mechanics Exam 2018',
      'AP Physics C Mechanics Exam 2017',
      'AP Physics C Mechanics Exam 2016',
      'AP Physics C Mechanics Exam 2015',
      'AP Physics C Mechanics Exam 2014',
      'AP Physics C Mechanics Exam 2013',
      'AP Physics C Mechanics Exam 2012',
    ],
    apSubCategory: 'science',
  ),
  const Resource(
    id: 'ap_physcem',
    title: 'AP Physics C: Electricity and Magnetism',
    category: 'ap',
    field: 'physics',
    description:
        'calculus-based, for students planning to specialize in the physical sciences or engineering',
    deadline: 'May 2026 (exam)',
    icon: Icons.bolt,
    url: 'https://apstudents.collegeboard.org/courses/ap-physics-c-mechanics',
    links: [
      'AP Physics C E&M Exam 2018',
      'AP Physics C E&M Exam 2017',
      'AP Physics C E&M Exam 2016',
      'AP Physics C E&M Exam 2015',
      'AP Physics C E&M Exam 2013',
      'AP Physics C E&M Exam 2012',
    ],
    apSubCategory: 'science',
  ),
  const Resource(
    id: 'ap_enlang',
    title: 'AP English Language',
    category: 'ap',
    field: 'english',
    description:
        'Rhetorical analysis, argumentation, and synthesis. 3 FRQ essays on the exam.',
    deadline: 'May 2026 (exam)',
    icon: Icons.edit,
    url:
        'https://apstudents.collegeboard.org/courses/ap-english-language-and-composition',
    links: [
      'Khan Academy AP Lang',
      'AP Classroom',
      'Princeton Review AP English Lang',
    ],
    apSubCategory: 'lang',
  ),
  const Resource(
    id: 'ap_enlit',
    title: 'AP English Literature',
    category: 'ap',
    field: 'english',
    description:
        'Close reading of poetry and prose. Literary analysis essays and a final open question on any novel.',
    deadline: 'May 2026 (exam)',
    icon: Icons.edit,
    url:
        'https://apstudents.collegeboard.org/courses/ap-english-literature-and-composition',
    links: ['Khan Academy AP Lit', 'AP Classroom', 'Litcharts (free analysis)'],
    apSubCategory: 'lang',
  ),
  const Resource(
    id: 'ap_ush',
    title: 'AP US History',
    category: 'ap',
    field: 'history',
    description:
        'Survey of American history from 1491 to present. DBQ and long-essay questions are the exam focus.',
    deadline: 'May 2026 (exam)',
    icon: Icons.history_edu,
    url: 'https://apstudents.collegeboard.org/courses/ap-united-states-history',
    links: [
      'Khan Academy AP US History',
      'AMSCO textbook',
      'Princeton Review APUSH',
      'AP US History Exam 2019',
      'AP US History Exam 2018',
      'AP US History Exam 2017',
      'AP US History Exam 2016',
      'AP US History Exam 2015',
      'AP US History Exam 2015 (2)',
      'AP US History Exam 2014',
      'AP US History Exam 2013',
      'AP US History Exam 2012',
      'AP US History Exam 2008',
    ],
    apSubCategory: 'history',
  ),
  const Resource(
    id: 'ap_world',
    title: 'AP World History',
    category: 'ap',
    field: 'history',
    description:
        'Global history from 1200 CE to present. Cross-cultural comparisons and causation analysis.',
    deadline: 'May 2026 (exam)',
    icon: Icons.public,
    url: 'https://apstudents.collegeboard.org/courses/ap-world-history-modern',
    links: [
      'Khan Academy AP World',
      'Tom Richey (YouTube)',
      "Barron's AP World",
    ],
    apSubCategory: 'history',
  ),
  const Resource(
    id: 'ap_psych',
    title: 'AP Psychology',
    category: 'ap',
    field: 'science',
    description:
        'Research methods, biological bases, sensation, learning, cognition, and social psychology.',
    deadline: 'May 2026 (exam)',
    icon: Icons.psychology,
    url: 'https://apstudents.collegeboard.org/courses/ap-psychology',
    links: ['Khan Academy AP Psych', "Barron's AP Psychology", 'AP Classroom'],
    apSubCategory: 'science',
  ),

  const Resource(
    id: 'ap_micro',
    title: 'AP Microeconomics',
    category: 'ap',
    field: 'econ',
    description: 'How people/business respond and make choices',
    deadline: 'May 2026 (exam)',
    icon: Icons.psychology,
    url: 'https://apstudents.collegeboard.org/courses/ap-microeconomics',
    links: [
      'AP Micro Exam 2019',
      'AP Micro Exam 2018',
      'AP Micro Exam 2017',
      'AP Micro Exam 2016',
      'AP Micro Exam 2015',
      'AP Micro Exam 2014',
      'AP Micro Exam 2013',
      'AP Micro Exam 2012',
      'AP Micro Exam 2008',
      'AP Micro Exam 2005',
      'AP Micro Exam 2000 (MCQ)',
    ],
    apSubCategory: 'econ',
  ),

  const Resource(
    id: 'ap_macro',
    title: 'AP Macroeconomics',
    category: 'ap',
    field: 'econ',
    description: 'How governments respond and make choices',
    deadline: 'May 2026 (exam)',
    icon: Icons.psychology,
    url: 'https://apstudents.collegeboard.org/courses/ap-macroeconomics',
    links: [
      'AP Macro Exam 2022',
      'AP Macro Exam 2022 (2)',
      'AP Macro Exam 2019',
      'AP Macro Exam 2013',
      'AP Macro Exam 2012',
    ],
    apSubCategory: 'econ',
  ),

  // ── Research ───────────────────────────────────────────────────────────────
  const Resource(
    id: 'rsi',
    title: 'RSI — Research Science Institute',
    category: 'research',
    field: 'all',
    scope: 'international',
    locationNote: 'In-person at MIT (Cambridge, MA)',
    timeCommitment: '6 weeks full-time in summer',
    majorTags: ['research', 'stem', 'academia'],
    applicationInfo:
        'Extensive application (essays, recs, scores). Free to attend.',
    description:
        'MIT-hosted residential summer research program. 80 students selected nationally. Widely considered the most selective HS program in the US.',
    deadline: 'Dec 15, 2025 (apply)',
    icon: Icons.school,
    url: 'https://www.cee.org/programs/research-science-institute',
    links: ['cee.org/rsi', 'Application portal', 'Past projects gallery'],
    detailNote:
        'Extremely selective (~1% acceptance). Apply regardless — the application process itself teaches you to articulate your interests.',
  ),
  const Resource(
    id: 'primes',
    title: 'MIT PRIMES-USA',
    category: 'research',
    field: 'cs',
    scope: 'national',
    locationNote: 'Online / Remote',
    timeCommitment: '10 hours/week for a full year',
    majorTags: ['math', 'cs', 'computational_biology'],
    applicationInfo: 'Rigorous application with entrance problem set. Free.',
    description:
        'Remote year-long math and CS research mentored by MIT graduate students. Separate tracks for math and CS.',
    deadline: 'Dec 2025 (opens)',
    icon: Icons.school,
    url: 'https://math.mit.edu/research/highschool/primes/usa',
    links: ['math.mit.edu/research/highschool/primes', 'Application info'],
  ),
  const Resource(
    id: 'nih',
    title: 'NIH High School Internship',
    category: 'research',
    field: 'biology',
    scope: 'national',
    locationNote: 'In-person at NIH campuses',
    timeCommitment: '8 weeks full-time in summer',
    majorTags: ['biology', 'medicine', 'research'],
    applicationInfo: 'Online application with resume/coursework. Paid stipend.',
    description:
        'Paid summer research at NIH campuses. Work alongside scientists in real biomedical research labs.',
    deadline: 'Jan 15, 2026 (apply)',
    icon: Icons.science,
    url: 'https://www.training.nih.gov/programs/hs-sip',
    links: ['training.nih.gov/programs/hs-sip', 'Application portal'],
    detailNote:
        'Must be 16+ by June. Strong bio/chem background recommended. Very competitive — apply early.',
  ),
  const Resource(
    id: 'polygence',
    title: 'Polygence',
    category: 'research',
    field: 'all',
    scope: 'international',
    locationNote: 'Online (remote)',
    timeCommitment: '10-15 sessions over 3-6 months',
    majorTags: ['research', 'mentorship', 'all_subjects'],
    applicationInfo:
        'Apply online with project interests. Tuition fee applies.',
    description:
        'Mentored research program in any subject. Work with a PhD mentor to produce a real research output — paper, project, or presentation.',
    deadline: null,
    icon: Icons.article,
    url: 'https://www.polygence.org',
    links: ['polygence.org', 'Browse mentors', 'Showcase past projects'],
  ),

  // ── Internships ────────────────────────────────────────────────────────────
  const Resource(
    id: 'cssi',
    title: 'Google CSSI',
    category: 'internship',
    field: 'cs',
    scope: 'national',
    locationNote: 'Online or select Google offices',
    timeCommitment: '3-4 weeks full-time in summer',
    majorTags: ['cs', 'programming', 'diversity'],
    applicationInfo:
        'Online application (transcript, essays). Free (stipend/swag).',
    description:
        'Computer Science Summer Institute. Free 3-week immersive program at Google offices. Food and housing included.',
    deadline: 'Feb 2026 (opens)',
    icon: Icons.business,
    url:
        'https://buildyourfuture.withgoogle.com/programs/computer-science-summer-institute',
    links: ['buildyourfuture.withgoogle.com/programs/cssi', 'Apply now'],
    detailNote:
        'Open to rising college freshmen from underrepresented backgrounds in CS. Competitive but very worth applying.',
  ),
  const Resource(
    id: 'nasa',
    title: 'NASA STEM Enhancement',
    category: 'internship',
    field: 'physics',
    scope: 'national',
    locationNote: 'In-person at NASA centers or Remote',
    timeCommitment: '8-10 weeks full-time in summer',
    majorTags: ['physics', 'engineering', 'space'],
    applicationInfo: 'Apply via NASA STEM Gateway. Requires essays/recs. Paid.',
    description:
        'Paid summer research at NASA centers nationwide. Covers engineering, science, and technology tracks.',
    deadline: 'Mar 2026 (apply)',
    icon: Icons.business,
    url: 'https://stemgateway.nasa.gov',
    links: ['nasa.gov/careers/students', 'OSSI portal'],
  ),
  const Resource(
    id: 'congressional_intern',
    title: 'Congressional Internship',
    category: 'internship',
    field: 'history',
    scope: 'national',
    locationNote: 'District Office or Washington D.C.',
    timeCommitment: 'Part-time (school year) or full-time (summer)',
    majorTags: ['history', 'policy', 'government'],
    applicationInfo:
        'Apply directly via representative\'s website. Requirements vary.',
    description:
        'Work in your Representative or Senator\'s office during the school year or summer. Unpaid but highly valuable for policy/gov tracks.',
    deadline: 'Rolling',
    icon: Icons.account_balance,
    url: 'https://www.house.gov/educators-and-students/internships',
    links: [
      'house.gov/educators-and-students/internships',
      'senate.gov/internships',
    ],
  ),

  // ── SAT / ACT ──────────────────────────────────────────────────────────────
  const Resource(
    id: 'knowt_sat',
    title: 'Knowt SAT Prep',
    category: 'sat',
    field: 'all',
    description:
        'AI-powered SAT practice with flashcards, practice tests, and explanations. Good for vocabulary and reading sections.',
    instructions:
        '• Create a free account to access flashcards and practice sets.\n'
        '• Use the flashcards specifically for vocabulary building and grammar rules.\n'
        '• Take short, timed section quizzes to build your test-taking endurance on the go.',
    url: 'https://knowt.com/exams/SAT',
    deadline: null,
    icon: Icons.quiz,
    links: ['knowt.com/exams/SAT', 'Free account available'],
    testSection: null,
  ),
  const Resource(
    id: 'knowt_act',
    title: 'Knowt ACT Prep',
    category: 'act',
    field: 'all',
    description:
        'AI-powered ACT practice with section-specific flashcard sets and timed question practice.',
    instructions:
        '• Search for specific flashcard sets targeting ACT Science reasoning and English grammar rules.\n'
        '• Use the spaced-repetition feature to memorize math formulas, since the ACT does not provide a formula sheet.\n'
        '• Complete bite-sized practice questions when you only have a few minutes to spare.',
    url: 'https://knowt.com/exams/ACT',
    deadline: null,
    icon: Icons.quiz,
    links: ['knowt.com/exams/ACT'],
    testSection: null,
  ),
  const Resource(
    id: 'sat_prep_plus',
    title: 'SAT Prep Plus (Kaplan)',
    category: 'sat',
    field: 'all',
    description:
        '5 full-length practice tests plus thousands of practice questions with detailed answer explanations.',
    instructions:
        '• Read through the test-taking strategy sections before diving into the actual practice tests.\n'
        '• Use the practice question banks to drill specific concepts you struggle with.\n'
        '• Always read the answer explanations, even for questions you guessed correctly!',
    deadline: null,
    icon: Icons.book,
    links: ['Find on Amazon', 'kaptest.com'],
    testSection: null,
  ),
  const Resource(
    id: 'cb_sat',
    title: 'College Board Official Tests',
    category: 'sat',
    field: 'all',
    description:
        '8 full-length official SAT practice tests with complete scoring guides. The most realistic prep available — made by the same org that writes the real exam.',
    instructions:
        '• These are the most realistic paper/PDF tests available.\n'
        '• Print them out and take them in a quiet room with a strict timer to simulate test day.\n'
        '• Grade your test using the official scoring guide to establish your baseline score.\n'
        '• Keep a spreadsheet of every question you miss and why you missed it.',
    deadline: null,
    icon: Icons.check_circle_outline,
    url: 'https://satsuite.collegeboard.org/practice',
    links: [
      'satsuite.collegeboard.org/practice',
      'Download all 8 tests (free)',
    ],
    detailNote:
        'Start here. Do one full timed test, score it, then study your weak areas before doing the next one.',
    testSection: null,
  ),
  const Resource(
    id: 'khan_sat',
    title: 'Khan Academy SAT Prep',
    category: 'sat',
    field: 'all',
    description:
        'Personalized SAT practice linked to your PSAT/NMSQT score. Identifies weak skills and targets them.',
    instructions:
        '• Link your College Board account so Khan Academy can import your past PSAT or SAT scores.\n'
        '• Let the algorithm build a personalized practice schedule targeting your specific weaknesses.\n'
        '• Complete at least 30 minutes of targeted skill practice a day to level up your subscores.',
    deadline: null,
    icon: Icons.smart_display,
    url: 'https://www.khanacademy.org/sat',
    links: ['khanacademy.org/sat', 'Link your PSAT score'],
    detailNote:
        'Completely free, in official partnership with College Board. Best free option for targeted prep.',
    testSection: null,
  ),
  const Resource(
    id: 'bluebook',
    title: 'Bluebook — Digital SAT App',
    category: 'sat',
    field: 'all',
    description:
        'Official College Board app for the digital SAT. Adaptive testing that mirrors the real exam interface exactly.',
    instructions:
        '• Download the Bluebook app from College Board — it\'s the only official digital SAT simulator.\n'
        '• Take a full practice test first under timed, real conditions before studying anything.\n'
        '• After the test, review every wrong answer and identify which units to target.\n'
        '• Study those units, then take another full test to measure improvement.\n'
        '• Repeat the cycle — test → review → study → test.',
    deadline: null,
    icon: Icons.laptop_mac,
    url: 'https://bluebook.app.collegeboard.org',
    links: ['bluebook.app.collegeboard.org'],
    detailNote:
        'Download and practice in this app if you\'re taking the digital SAT. Same interface as the real test.',
    testSection: null,
  ),
  const Resource(
    id: 'pr_sat',
    title: 'Princeton Review 1550+ SAT',
    category: 'sat',
    field: 'all',
    description:
        '2025 edition with advanced strategies for high scorers. 6 full practice tests with detailed answer explanations.',
    instructions:
        '• Take the diagnostic test at the beginning of the book to find your weak spots.\n'
        '• Focus heavily on the test-taking strategies (like the process of elimination and pacing tactics).\n'
        '• Work through the content review chapters specifically for areas where your score is lowest.',
    deadline: null,
    icon: Icons.book,
    url: 'https://www.princetonreview.com/college/sat-test-prep',
    links: ['Find on Amazon', 'Princeton Review site'],
    testSection: null,
  ),

  const Resource(
    id: 'act_official',
    title: 'ACT Official Practice',
    category: 'act',
    field: 'all',
    description:
        'Official ACT practice tests from act.org. 5 free tests covering English, Math, Reading, and Science.',
    instructions:
        '• Download and print the official PDF practice tests.\n'
        '• The ACT is incredibly fast-paced, so strict timing is crucial during your practice sessions.\n'
        '• Review your mistakes to see if they were due to content gaps or simply running out of time.',
    deadline: null,
    icon: Icons.check_circle_outline,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/free-act-test-prep.html',
    links: [
      'act.org/products/high-school-resources',
      'Download practice tests',
    ],
    detailNote:
        'The ACT has a Science section the SAT does not. If you are stronger in Science reasoning, consider the ACT.',
    testSection: null,
  ),
  const Resource(
    id: 'act_khan',
    title: 'Khan Academy ACT Prep',
    category: 'act',
    field: 'all',
    description:
        'ACT prep video lessons and practice questions covering all four test sections.',
    instructions:
        '• Watch the video lessons for specific math or grammar concepts you haven\'t learned in school yet.\n'
        '• Drill practice questions by filtering for specific subjects (Math, Science, English, Reading).\n'
        '• Review the step-by-step video solutions whenever you get stuck on a difficult problem.',
    deadline: null,
    icon: Icons.smart_display,
    url: 'https://www.khanacademy.org/test-prep/act',
    links: ['khanacademy.org/test-prep/act'],
    testSection: null,
  ),
  const Resource(
    id: 'pr_act',
    title: 'Princeton Review ACT Prep',
    category: 'act',
    field: 'all',
    description:
        '2025 edition with 6 full-length practice tests and section-by-section strategy.',
    instructions:
        '• Review the pacing guidelines; the ACT is a sprint and requires aggressive time management.\n'
        '• Focus on the science reasoning chapter to learn how to quickly interpret charts without reading the whole passage.\n'
        '• Take the full-length practice tests on weekends to build stamina for the 3-hour exam.',
    deadline: null,
    icon: Icons.book,
    url: 'https://www.princetonreview.com/college/act-test-prep',
    links: ['Find on Amazon', 'Princeton Review site'],
    testSection: null,
  ),

  const Resource(
    id: 'sat_math_khan',
    title: 'Khan Academy — SAT Math',
    category: 'sat',
    field: 'all',
    testSection: 'math',
    description:
        'Targeted SAT Math practice covering algebra, problem solving, and advanced math. Adaptive to your weak areas.',
    instructions:
        '• Start by taking the unit tests to pinpoint exactly which math concepts you are missing.\n'
        '• Watch the step-by-step video breakdowns for any algebra or geometry topics you forgot from previous years.\n'
        '• Keep a notebook of the specific formulas and exponent rules you constantly need to look up.',

    icon: Icons.calculate,
    links: ['khanacademy.org/sat-math'],
  ),
  const Resource(
    id: 'sat_rw_khan',
    title: 'Khan Academy — SAT Reading & Writing',
    category: 'sat',
    field: 'all',
    testSection: 'reading_writing',
    description:
        'SAT Reading & Writing prep: vocabulary in context, command of evidence, and rhetoric analysis.',
    instructions:
        '- Focus heavily on the "Command of Evidence" and "Words in Context" question types.\n'
        '- Practice reading the passages actively — write brief mental summaries of each paragraph as you go.\n'
        '- Drill grammar rules until punctuation questions become automatic.',
    icon: Icons.edit,
    links: ['khanacademy.org/sat-reading-and-writing'],
  ),
  const Resource(
    id: 'act_english_res',
    title: 'ACT English — Grammar & Usage',
    category: 'act',
    field: 'all',
    testSection: 'english',
    description:
        'Covers punctuation, grammar, usage, and sentence structure. The ACT English section is 45 minutes, 75 questions.',
    instructions:
        '• Review the fundamental rules of punctuation (commas, dashes, semicolons).\n'
        '• Memorize common grammar rules; the ACT tests the exact same handful of concepts repeatedly.\n'
        '• Practice reading the sentences in your head to catch awkward phrasing and subject-verb disagreements.',

    icon: Icons.edit,
    links: [
      'act.org/content/act/en/products-and-services/the-act/test-preparation/english-test-description.html',
    ],
  ),
  const Resource(
    id: 'act_science_res',
    title: 'ACT Science — Data Interpretation',
    category: 'act',
    field: 'all',
    testSection: 'science',
    description:
        'ACT Science is really about data interpretation and critical thinking — not memorized science facts.',
    instructions:
        '• Remember that you rarely need advanced science knowledge as it is mostly reading graphs and tables.\n'
        '• Skim the intro text quickly and jump straight to the charts to save time.\n'
        '• Practice tracking variables (e.g., as temperature goes up, what happens to pressure?).',

    icon: Icons.science,
    links: ['act.org/science', 'Kaplan ACT Science strategies'],
  ),
  const Resource(
    id: 'act_math_res',
    title: 'ACT Math — Full Prep',
    category: 'act',
    field: 'all',
    testSection: 'math',
    description:
        'ACT Math covers pre-algebra through trigonometry. Calculator allowed throughout. 60 questions, 60 minutes.',
    instructions:
        '• Memorize your basic formulas! Unlike the SAT, the ACT does not give you a formula sheet.\n'
        '• Practice pacing yourself to spend less than a minute on the easier early questions, saving time for the difficult ones at the end.\n'
        '• Use your calculator efficiently, but don\'t rely on it for simple mental arithmetic.',

    icon: Icons.calculate,
    links: ['khanacademy.org/act-math', 'Kaplan ACT Math'],
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// DEADLINES  (shown in the right-side panel)
// ─────────────────────────────────────────────────────────────────────────────
// ─────────────────────────────────────────────────────────────────────────────
// DEADLINES  (shown in the right-side panel)
// ─────────────────────────────────────────────────────────────────────────────
class DeadlineItem {
  final String title;
  final String date; // What the user sees (e.g., "Aug 22, 2026")
  final String
  dateIso; // What the computer reads (e.g., "2026-08-22T23:59:00Z")
  final String urgency;
  final List<String> majorTags;
  final String? resourceId;

  const DeadlineItem({
    required this.title,
    required this.date,
    required this.dateIso, // ← Added for the auto-delete logic
    required this.urgency,
    this.majorTags = const [],
    this.resourceId,
  });
}

const List<DeadlineItem> upcomingDeadlines = [
  DeadlineItem(
    title: 'SAT August test date',
    date: 'Aug 22, 2026',
    dateIso: '2026-08-22T23:59:00Z',
    urgency: 'urgent',
    resourceId: 'cb_sat',
  ),
  DeadlineItem(
    title: 'AP exam registration',
    date: 'Sep–Nov 2026',
    dateIso: '2026-11-30T23:59:00Z', // Set to end of November
    urgency: 'soon',
  ),
  DeadlineItem(
    title: 'Congressional App Challenge',
    date: 'Nov 1, 2026',
    dateIso: '2026-11-01T23:59:00Z',
    urgency: 'soon',
    resourceId: 'cac',
    majorTags: ['cs'],
  ),
  DeadlineItem(
    title: 'AMC 10/12 A & B',
    date: 'Nov 2026',
    dateIso: '2026-11-30T23:59:00Z', // Set to end of November
    urgency: 'soon',
    resourceId: 'amc',
    majorTags: ['applied_math', 'statistics'],
  ),
  DeadlineItem(
    title: 'RSI application deadline',
    date: 'Dec 15, 2026',
    dateIso: '2026-12-15T23:59:00Z',
    urgency: 'later',
    resourceId: 'rsi',
    majorTags: ['biology', 'cs', 'premed'],
  ),
  DeadlineItem(
    title: 'USACO December contest',
    date: 'Dec 15–18, 2026',
    dateIso: '2026-12-18T23:59:00Z', // Set to the end of the window
    urgency: 'later',
    resourceId: 'usaco',
    majorTags: ['cs', 'data_sci', 'ai'],
  ),
  DeadlineItem(
    title: 'NIH internship application',
    date: 'Jan 15, 2027',
    dateIso: '2027-01-15T23:59:00Z',
    urgency: 'later',
    resourceId: 'nih',
    majorTags: ['biology', 'premed', 'neuroscience'],
  ),
  DeadlineItem(
    title: 'USABO open exam',
    date: 'Feb 2027',
    dateIso: '2027-02-28T23:59:00Z', // Set to end of February
    urgency: 'later',
    resourceId: 'usabo',
    majorTags: ['biology', 'microbiology'],
  ),
  DeadlineItem(
    title: 'Google CSSI opens',
    date: 'Feb 2027',
    dateIso: '2027-02-28T23:59:00Z', // Set to end of February
    urgency: 'later',
    resourceId: 'cssi',
    majorTags: ['cs'],
  ),
];

// ─────────────────────────────────────────────────────────────────────────────
// HELPER FUNCTIONS
// ─────────────────────────────────────────────────────────────────────────────

/// All resources matching a category string.
List<Resource> resourcesByCategory(String category) =>
    allResources.where((r) => r.category == category).toList();

/// All resources relevant to a field (exact match + 'all' field resources).
List<Resource> resourcesByField(String field) =>
    allResources.where((r) => r.field == field || r.field == 'all').toList();

/// Resources for a field filtered by category type.
List<Resource> resourcesByFieldAndCategory(String field, String category) =>
    allResources
        .where(
          (r) =>
              (r.field == field || r.field == 'all') && r.category == category,
        )
        .toList();

/// All AP resources, optionally filtered by sub-category.
List<Resource> apResources({String? subCategory}) {
  final aps = allResources.where((r) => r.category == 'ap').toList();
  if (subCategory == null || subCategory == 'all') return aps;
  return aps.where((r) => r.apSubCategory == subCategory).toList();
}

/// Sort a list so seen items sink to the bottom.
List<Resource> sortBySeen(List<Resource> resources, Set<String> seen) {
  final notSeen = resources.where((r) => !seen.contains(r.id)).toList();
  final seenItems = resources.where((r) => seen.contains(r.id)).toList();
  return [...notSeen, ...seenItems];
}

/// Returns the best URL for a given link label + resource.
/// Checks kLinkUrls first, falls back to resource.url.
String? resolveUrl(String linkLabel, Resource resource) {
  return kLinkUrls[linkLabel] ?? resource.url;
}
