import 'package:flutter/material.dart';
import '../models/resource.dart';

// mapping url links
const Map<String, String> kLinkUrls = {
  // AP Classroom / College Board
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

  // Khan Academy
  'Khan Academy AP CSP (free)':
      'https://www.khanacademy.org/computing/ap-computer-science-principles',
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
  'Khan Academy AP Physics 2':
      'https://www.khanacademy.org/science/ap-physics-2',
  'Khan Academy AP US History':
      'https://www.khanacademy.org/humanities/ap-us-history',
  'Khan Academy AP US Government and Politics':
      'https://www.khanacademy.org/humanities/ap-us-government-and-politics',
  'Khan Academy AP Art History':
      'https://www.khanacademy.org/humanities/ap-art-history',
  'Khan Academy AP World':
      'https://www.khanacademy.org/humanities/world-history-project-ap',
  'Khan Academy AP Environmental Science':
      'https://www.khanacademy.org/science/ap-college-environmental-science',
  'Khan Academy AP Macroeconomics':
      'https://www.khanacademy.org/economics-finance-domain/ap-macroeconomics',
  'Khan Academy AP Microeconomics':
      'https://www.khanacademy.org/economics-finance-domain/ap-microeconomics',
  'Khan Academy SAT prep': 'https://www.khanacademy.org/test-prep/sat',
  'khanacademy.org/sat': 'https://www.khanacademy.org/test-prep/sat',
  'khanacademy.org/sat-math': 'https://www.khanacademy.org/test-prep/sat',
  'khanacademy.org/sat-reading-and-writing':
      'https://www.khanacademy.org/test-prep/sat',
  'khanacademy.org/act-math': 'https://www.khanacademy.org/test-prep/act',
  'Start practicing': 'https://www.khanacademy.org/test-prep/sat',

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

  // Other
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
  "Find on Amazon": 'https://www.amazon.com/',

  // Knowt / ACT / SAT misc
  'knowt.com/exams/SAT': 'https://knowt.com/exams/SAT',
  'Free account available': 'https://knowt.com/',
  'knowt.com/exams/ACT': 'https://knowt.com/exams/ACT',
  'Kaplan ACT Math': 'https://www.kaptest.com/act/test-prep/act-math',
  'Kaplan ACT Science strategies':
      'https://www.kaptest.com/act/test-prep/act-science',
  'act.org/science':
      'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/science-test-description.html',

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

  // Research & Internships
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
  'buildyourfuture.withgoogle.com/programs/cssi':
      'https://buildyourfuture.withgoogle.com/programs/computer-science-summer-institute',
  'Apply now':
      'https://buildyourfuture.withgoogle.com/programs/computer-science-summer-institute',
  'nasa.gov/careers/students': 'https://www.nasa.gov/stem/highschool-students/',
  'OSSI portal': 'https://intern.nasa.gov/',

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
  'AP Environmental Science Exam 2016':
      'https://drive.google.com/file/d/1ZS1xVQaLIfECzYLf64uwJ7_gFItV3zUy/view',
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
  'AP Physics C Mechanics Exam 2018':
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
  'AP World History Exam 2018':
      'https://drive.google.com/file/d/1syaNRBvsIm_zmD3k-co4Jg2Sf1u3F-Jt/view',
  'AP World History Exam 2017':
      'https://drive.google.com/file/d/1K8uhQ8yQW0Ph6yjaQyBRP-PqfEn-GwKq/view',
  'AP World History Exam 2017 (2)':
      'https://drive.google.com/file/d/1DT3uxO0wGDw1fwoWmzaohKvPDVWYta8X/view',
  'AP World History Exam 2016':
      'https://drive.google.com/file/d/1wo_TvA8oedudJKiDwG43xZcRqU0e-iV2/view',
  'AP World History Exam 2016 (2)':
      'https://drive.google.com/file/d/1BkmJRvonfm_K1cMEaD6929aGEIITxpYX/view',
  'AP World History Exam 2015':
      'https://drive.google.com/file/d/166mykY-QXx0_heBSXiDHNvb-tWtJA-lR/view',
  'AP World History Exam 2014':
      'https://drive.google.com/file/d/1XHRkFFyDLdMlfcYdmr2uYUUyWQXg1IlX/view',
  'AP World History Exam 2013':
      'https://drive.google.com/file/d/1ZCD3Qnd9VrYz9xeQBP4Q1PMrE0uatPGT/view',
  'AP World History Exam 2011':
      'https://drive.google.com/file/d/1TuPq4gezJi9sITPfVYsiUvcK7sVyBmjw/view',
  'AP World History Exam 2008':
      'https://drive.google.com/file/d/1opitptknJO2DJE3yUVMgKMwPjfg4fELS/view',
  'AP World History Exam 2007':
      'https://drive.google.com/file/d/1vJaiFCcwvLBTfbKPmb5M9Md87HHupOCe/view',
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
// ─────────────────────────────────────────────────────────────────────────────
final List<Resource> allResources = [
  // === GENERAL COMPETITIONS ===
  const Resource(
    //UPDATE DEADLINE LATER, DON'T KNOW YET
    id: 'usaco',
    title: 'USACO',
    category: 'competition',
    field: 'cs',
    scope: 'national',
    locationNote: 'Online (from home)',
    timeCommitment: '4-hour contest window',
    majorTags: ['cs', 'data_sci', 'ai'],
    applicationInfo:
        'Register at usaco.org before the contest window, completely free!',
    description:
        '4 divisions, bronze to platinum. The contest window stretches from December to March, register before each window opens',
    deadline: 'UPDATE LATER',
    icon: Icons.emoji_events,
    url: 'http://www.usaco.org',
    links: ['usaco.org', 'USACO Guide (free)', 'Past problems & editorials'],
    detailNote:
        "Start at the level you're most comfortable with, the USACO Guide at usaco.guide is good for practice, work through it in order and make sure you understand each concept",
  ),
  const Resource(
    //MULTIPLE DEADLINES, FIX
    id: 'amc',
    title: 'AMC 10 / 12',
    category: 'competition',
    field: 'math',
    scope: 'national',
    locationNote: 'In-person at registered schools/centers',
    timeCommitment: '75 mins (AMC 10/12)',
    majorTags: ['math', 'problem_solving', 'logic'],
    applicationInfo:
        'Register through school or local testing center with registration fee',
    description:
        'The American Mathematics Competitions (AMC) is the gateway to AIME, USAMO, and the US IMO team',
    deadline: 'September 30, 2026 (Early Bird)',
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
        'Register online at official portal, submit video/code, free!',
    description:
        'Annual app-building competition organized by members of congress, web apps allowed',
    deadline: 'October 26, 2026',
    icon: Icons.emoji_events,
    url: 'https://www.congressionalappchallenge.us',
    links: ['congressionalappchallenge.us', 'Submit your app'],
  ),
  const Resource(
    //NOTHING YET ON WHEN REGISTRATION ENDS
    id: 'usabo',
    title: 'USABO',
    category: 'competition',
    field: 'biology',
    scope: 'national',
    locationNote: 'In-person at registered schools/centers',
    timeCommitment: '50-min open exam, 120-min semifinal',
    majorTags: ['biology', 'genetics', 'anatomy'],
    applicationInfo: 'The school must register as testing center',
    description:
        'USA Biology Olympiad (USABO), open exam in January, semifinals in March, opt students represent the US at the IBO',
    deadline: 'August 1, 2026 (Registration Opens)',
    icon: Icons.emoji_events,
    url: 'https://www.usabo-trc.org',
    links: ['vashti.net/nacbb', 'Open exam prep resources'],
  ),
  const Resource(
    //NOTHING ON WHEN REGISTRATION ENDS
    id: 'cyberpatriot_afa',
    title: 'AFA CyberPatriot XIX — National Youth Cyber Defense Competition',
    category: 'competition',
    field: 'cs',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online rounds; National Finals in-person (Washington D.C.)',
    timeCommitment: 'Multiple 6-hour weekend rounds (~5 months)',
    majorTags: ['cybersecurity', 'cs', 'data_sci', 'networking', 'linux'],
    applicationInfo:
        'Register at uscyberpatriot.org. Teams of 2–6 students with a coach. Registration fee may apply.',
    description:
        'The largest national youth cyber defense competition in the US, run by the Air Force Association. Teams secure virtual operating systems against simulated cyber attacks.',
    deadline: 'May 1, 2026 (Registration Opens)',
    deadlineIso: '2025-10-31T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://www.uscyberpatriot.org',
    links: ['uscyberpatriot.org', 'Teams of 2–6 + coach'],
  ),

  // === BUSINESS / FINANCE / ECONOMICS ===
  const Resource(
    //NEED TO BE MORE SPECIFIC LATER
    id: 'wharton_investment',
    title: 'Wharton Global High School Investment Competition',
    category: 'competition',
    field: 'business',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Virtual rounds; Global Finale at Wharton, Philadelphia',
    timeCommitment: '10 weeks (Oct–Dec)',
    majorTags: ['business', 'economics', 'statistics', 'data_sci'],
    applicationInfo:
        'Teams of 4–7 students with a teacher advisor. Register at globalyouth.wharton.upenn.edu. Free to enter.',
    description:
        'A free global investment challenge where teams of 4–7 high schoolers manage a simulated \$100k portfolio over 10 weeks.',
    deadline: 'August 2026 (Registration Opens)',
    deadlineIso: '2026-09-12T23:59:00Z',
    icon: Icons.emoji_events,
    url:
        'https://globalyouth.wharton.upenn.edu/competitions/investment-competition/',
    links: [
      'globalyouth.wharton.upenn.edu/competitions/investment-competition/',
      'Free — no entry fee',
    ],
  ),
  const Resource(
    //NOT DECIDED YET
    id: 'national_econ_challenge',
    title: 'National Economics Challenge',
    category: 'competition',
    field: 'business',
    scope: 'national',
    format: 'virtual',
    locationNote: 'State competitions + virtual nationals',
    timeCommitment: 'Study + 1–2 competition days',
    majorTags: ['economics', 'business', 'statistics'],
    applicationInfo:
        'Register through your state Council for Economic Education affiliate. Team and individual divisions.',
    description:
        'Run by the Council for Economic Education, this is the premier high school economics quiz competition in the US.',
    deadline: 'TBD (Most likely Jan-April 2027)',
    deadlineIso: '2026-03-31T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://councilforeconed.org/national-economics-challenge/',
    links: [
      'councilforeconed.org/national-economics-challenge/',
      'Free to compete',
    ],
  ),
  const Resource(
    //DONT KNOW YET
    id: 'fed_challenge',
    title: 'High School Fed Challenge',
    category: 'competition',
    field: 'business',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Regional Federal Reserve Bank branches',
    timeCommitment: '~3 months prep + regional/national rounds',
    majorTags: ['economics', 'business', 'pub_policy'],
    applicationInfo:
        'Teams of 3–6 students present a monetary policy analysis. Register through your regional Fed branch.',
    description:
        'Teams research and present on US monetary policy to Federal Reserve economists, fielding tough Q&A.',
    deadline: 'TBD (Most likely February 2027)',
    deadlineIso: '2026-10-31T23:59:00Z',
    icon: Icons.emoji_events,
    url:
        'https://www.newyorkfed.org/outreach-and-education/high-school/fed-challenge',
    links: ['newyorkfed.org/outreach-and-education/high-school/fed-challenge'],
  ),
  const Resource(
    id: 'udc_capital_cup',
    title: 'UDC Capital Cup Entrepreneurship Competition',
    category: 'competition',
    field: 'business',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Washington, D.C.',
    timeCommitment: 'TODO',
    majorTags: ['entrepreneurship', 'business', 'social_impact'],
    applicationInfo: 'TODO — fill in application details',
    description:
        'An entrepreneurship pitch competition for high school students.',
    deadline: 'June 30, 2026',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url:
        'https://www.udc.edu/sbpa/events/udc-capital-cup-entrepreneurship-competition',
    links: ['udc.edu'],
  ),
  const Resource(
    id: 'case_catalyst',
    title: 'CaseCatalyst Case Competition',
    category: 'competition',
    field: 'business',
    scope: 'national',
    format: 'virtual',
    locationNote: 'TODO',
    timeCommitment: 'TODO',
    majorTags: ['business', 'economics', 'entrepreneurship'],
    applicationInfo: 'TODO — fill in application details',
    description:
        'A high school case competition testing real-world business problems.',
    deadline: 'July 5, 2026',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.casecatalyst.org',
    links: ['casecatalyst.org'],
  ),
  const Resource(
    //DONT KNOW YET
    id: 'intl_econ_essay',
    title: 'International Economics Essay Competition',
    category: 'competition',
    field: 'business',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: 'TODO',
    majorTags: ['economics', 'intl_rel', 'pub_policy'],
    applicationInfo: 'TODO — fill in application details',
    description: 'An essay competition on topics in international economics.',
    deadline: 'TBD (Around September 2026)',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'TODO',
    links: ['TODO'],
  ),
  const Resource(
    //DONT KNOW YET
    id: 'global_impact_competition',
    title: 'Global Impact Competition',
    category: 'competition',
    field: 'business',
    scope: 'international',
    format: 'virtual',
    locationNote: 'TODO',
    timeCommitment: 'TODO',
    majorTags: ['entrepreneurship', 'social_impact', 'innovation', 'intl_rel'],
    applicationInfo: 'TODO — fill in application details',
    description:
        'A competition developing solutions with measurable global impact.',
    deadline: 'TBD (Around June 2027)',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'TODO',
    links: ['TODO'],
  ),

  // === SCIENCE / STEM / RESEARCH ===
  const Resource(
    //tbd later
    id: 'conrad_challenge',
    title: 'Conrad Challenge',
    category: 'competition',
    field: 'science',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Virtual; Innovation Summit in-person for finalists',
    timeCommitment: '~5 months (Oct–Mar)',
    majorTags: ['innovation', 'entrepreneurship', 'env_sci', 'cs', 'biology'],
    applicationInfo:
        'Teams of 2–5 students. Submission includes a business plan and prototype. Free to enter.',
    description:
        'A global STEM innovation challenge inspired by Pete Conrad. Finalists pitch at the in-person Innovation Summit.',
    deadline: 'Jan 2026 (submission)',
    deadlineIso: '2026-01-31T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://conradchallenge.org',
    links: ['conradchallenge.org', 'Free to enter'],
  ),
  const Resource(
    id: 'breakthrough_junior',
    title: 'Breakthrough Junior Challenge',
    category: 'competition',
    field: 'science',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: 'Video creation (2–3 weeks)',
    majorTags: ['biology', 'physics', 'neuroscience', 'cog_sci', 'chemistry'],
    applicationInfo:
        'Submit a 3-minute video explaining a complex science or math concept creatively.',
    description:
        'Students create a short video explaining a challenging concept. Winner receives \$250,000 scholarship.',
    deadline: 'September 15th, 2026',
    deadlineIso: '2026-06-30T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://breakthroughjuniorchallenge.org',
    links: ['breakthroughjuniorchallenge.org', '\$250k scholarship for winner'],
  ),
  const Resource(
    id: 'stellarxplorers',
    title: 'StellarXplorers Aerospace STEM Program Contest',
    category: 'competition',
    field: 'science',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online rounds; national finals vary',
    timeCommitment: '~4 months (Nov–Feb)',
    majorTags: ['aerospace', 'physics', 'cs', 'applied_math'],
    applicationInfo:
        'Register at stellarxplorers.org. Teams use STK software. Coach required.',
    description:
        'A national aerospace competition where teams design satellite missions using STK.',
    deadline: 'Oct 2025 (reg. closes)',
    deadlineIso: '2025-10-31T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://www.stellarxplorers.org',
    links: ['stellarxplorers.org'],
  ),
  const Resource(
    id: 'citadel_terminal',
    title: 'Citadel High School Terminal Competition',
    category: 'competition',
    field: 'cs',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online',
    timeCommitment: '1 competition day (7 hrs)',
    majorTags: ['cs', 'data_sci', 'ai', 'applied_math', 'statistics'],
    applicationInfo:
        'Apply at citadel.com. Teams of 1–4. Algorithmic coding in Python.',
    description:
        'Citadel\'s Terminal competition challenges students to build an algorithmic trading strategy in Python.',
    deadline: 'Rolling (multiple per year)',
    deadlineIso: '2026-12-31T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://terminal.c1games.com',
    links: ['terminal.c1games.com', 'Python algorithmic strategy'],
  ),
  const Resource(
    id: 'nyas_junior_academy',
    title: 'NYAS The Junior Academy',
    category: 'competition',
    field: 'science',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online collaboration + virtual presentations',
    timeCommitment: '~6 months (Nov–May)',
    majorTags: ['biology', 'cs', 'innovation', 'env_sci', 'neuroscience'],
    applicationInfo: 'Apply at juniorsacademy.org. Free for accepted students.',
    description:
        'The New York Academy of Sciences\' selective global STEM program.',
    deadline: 'Nov 2025 (application)',
    deadlineIso: '2025-11-30T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://www.juniorsacademy.org',
    links: ['juniorsacademy.org'],
  ),
  const Resource(
    id: 'aspiring_scholars',
    title: 'Aspiring Scholars Directed Research Program',
    category: 'competition',
    field: 'science',
    scope: 'regional',
    format: 'in_person',
    locationNote: 'California (Bay Area)',
    timeCommitment: 'TODO — multi-week research program',
    majorTags: ['biology', 'cs', 'neuroscience', 'chemistry', 'data_sci'],
    applicationInfo: 'TODO — fill in application details',
    description:
        'Directed research program providing hands-on mentored research experience.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.aspiringscholars.org',
    links: ['aspiringscholars.org'],
  ),
  const Resource(
    id: 'intl_psych_olympiad',
    title: 'International Psychology Olympiad',
    category: 'competition',
    field: 'science',
    scope: 'international',
    format: 'in_person',
    locationNote: 'TODO — host country varies annually',
    timeCommitment: 'TODO',
    majorTags: ['psych', 'behavioral', 'cog_sci', 'neuroscience'],
    applicationInfo: 'TODO — typically selected through national olympiad',
    description:
        'An international competition testing high school students\' knowledge of psychology.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://psycholympics.com',
    links: ['psycholympics.com'],
  ),
  const Resource(
    id: 'verge_challenge',
    title: 'Verge Challenge',
    category: 'competition',
    field: 'science',
    scope: 'national',
    format: 'virtual',
    locationNote: 'TODO',
    timeCommitment: 'TODO',
    majorTags: ['innovation', 'entrepreneurship', 'env_sci', 'social_impact'],
    applicationInfo: 'TODO — fill in application details',
    description:
        'A challenge to develop innovative solutions to pressing problems.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'TODO',
    links: ['TODO'],
  ),

  // === LAW / POLICY / SOCIAL SCIENCES ===
  const Resource(
    id: 'leb_art_equity',
    title: 'LegalEagleBee — 1st Art for Equity Competition',
    category: 'competition',
    field: 'social',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: '1–2 weeks (artwork creation)',
    majorTags: ['civil_rights', 'fine_arts', 'humanities', 'law_general'],
    applicationInfo: 'Check legaleaglebee.com for current cycle dates.',
    description:
        'Art competition exploring themes of equity, justice, and civil rights.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.legaleaglebee.com',
    links: ['legaleaglebee.com'],
  ),
  const Resource(
    id: 'leb_policy_brief',
    title: 'LegalEagleBee — 2nd Policy Brief Competition',
    category: 'competition',
    field: 'social',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: '1–3 weeks (research + writing)',
    majorTags: [
      'pub_policy_law',
      'pub_policy',
      'polisci',
      'law_general',
      'civil_rights',
    ],
    applicationInfo:
        'Check legaleaglebee.com for the current prompt and deadline.',
    description: 'Students write a policy brief on a designated legal topic.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.legaleaglebee.com',
    links: ['legaleaglebee.com'],
  ),
  const Resource(
    id: 'leb_policy_video',
    title: 'LegalEagleBee — 3rd Policy Video Competition',
    category: 'competition',
    field: 'social',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: '1–3 weeks (filming + editing)',
    majorTags: ['pub_policy_law', 'film_prod', 'digital_media', 'civil_rights'],
    applicationInfo:
        'Check legaleaglebee.com for the current prompt and deadline.',
    description:
        'Students produce a short advocacy video on a legal or policy topic.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.legaleaglebee.com',
    links: ['legaleaglebee.com'],
  ),
  const Resource(
    id: 'leb_court_case',
    title: 'LegalEagleBee — 9th Court Case Competition',
    category: 'competition',
    field: 'social',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online rounds',
    timeCommitment: '2–4 weeks (research + oral argument prep)',
    majorTags: ['law_general', 'prelaw', 'constitutional_law', 'polisci'],
    applicationInfo: 'Check legaleaglebee.com for the current case prompt.',
    description:
        'Students research and argue both the petitioner and respondent sides of a legal case.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.legaleaglebee.com',
    links: ['legaleaglebee.com'],
  ),
  const Resource(
    id: 'columbia_law_review_essay',
    title: 'Columbia Law Review Essay Competition',
    category: 'competition',
    field: 'social',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: 'TODO',
    majorTags: ['law_general', 'prelaw', 'constitutional_law', 'intl_law'],
    applicationInfo: 'TODO — fill in application details',
    description: 'An essay competition exploring issues in law.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.columbialawreview.org',
    links: ['columbialawreview.org'],
  ),
  const Resource(
    id: 'columbia_polireview_essay',
    title: 'Columbia Political Review High School Essay Contest',
    category: 'competition',
    field: 'social',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: 'TODO',
    majorTags: ['polisci', 'pub_policy', 'intl_rel', 'journalism_media'],
    applicationInfo: 'TODO — fill in application details',
    description: 'An essay contest on political science and policy topics.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.columbiapoliticalreview.com',
    links: ['columbiapoliticalreview.com'],
  ),
  const Resource(
    id: 'lsesu_essay',
    title: 'LSESU Annual Essay Competition',
    category: 'competition',
    field: 'social',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online submission — London School of Economics',
    timeCommitment: 'TODO',
    majorTags: ['economics', 'polisci', 'intl_rel', 'pub_policy', 'sociology'],
    applicationInfo: 'TODO — fill in application details',
    description:
        'An annual essay competition on topics in social science and economics.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.lsesu.com',
    links: ['lsesu.com'],
  ),
  const Resource(
    id: 'culr_essay',
    title: 'CULR High School Essay Contest',
    category: 'competition',
    field: 'social',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: 'TODO',
    majorTags: ['law_general', 'polisci', 'pub_policy_law'],
    applicationInfo: 'TODO — fill in application details',
    description: 'The Columbia Undergraduate Law Review\'s essay contest.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'TODO',
    links: ['TODO'],
  ),

  // === SCHOLARSHIPS ===
  const Resource(
    id: 'coca_cola_scholars',
    title: 'Coca-Cola Scholars Program',
    category: 'competition',
    field: 'all',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online application; Scholar Weekend in Atlanta',
    timeCommitment: 'Application ~3–5 hrs',
    majorTags: ['entrepreneurship', 'social_impact', 'nonprofit', 'leadership'],
    applicationInfo: 'Apply at coca-colascholarsfoundation.org.',
    description: '150 scholars selected annually for a \$20,000 scholarship.',
    deadline: 'Oct 31, 2026',
    deadlineIso: '2026-10-31T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://www.coca-colascholarsfoundation.org',
    links: ['coca-colascholarsfoundation.org'],
  ),
  const Resource(
    id: 'gates_scholarship',
    title: 'The Gates Scholarship',
    category: 'competition',
    field: 'all',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online application',
    timeCommitment: 'Application ~5–10 hrs; extensive essays',
    majorTags: ['social_impact', 'entrepreneurship', 'leadership', 'nonprofit'],
    applicationInfo: 'Apply at thegatesscholarship.org.',
    description:
        'Highly selective, full-ride scholarship for minority students from low-income backgrounds.',
    deadline: 'Sep 15, 2026',
    deadlineIso: '2026-09-15T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://www.thegatesscholarship.org',
    links: ['thegatesscholarship.org'],
  ),

  // === WRITING / HUMANITIES / ARTS ===
  const Resource(
    id: 'platt_family_essay',
    title: 'Platt Family Scholarship Prize Essay Contest',
    category: 'competition',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: '1–3 weeks (research + essay)',
    majorTags: ['humanities', 'polisci', 'intl_rel', 'english'],
    applicationInfo: 'Submit at lincolnforum.org.',
    description:
        'Essay contest on Abraham Lincoln\'s relevance to contemporary democracy.',
    deadline: 'Mar 2026 (approx.)',
    deadlineIso: '2026-03-31T23:59:00Z',
    icon: Icons.emoji_events,
    url:
        'https://www.thelincolnforum.org/platt-family-scholarship-prize-essay-contest/',
    links: ['thelincolnforum.org'],
  ),
  const Resource(
    id: 'ayn_rand_essay',
    title: 'Ayn Rand Institute Essay Contests',
    category: 'competition',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: '1–2 weeks per essay',
    majorTags: ['english', 'humanities', 'polisci', 'prelaw'],
    applicationInfo: 'Submit at aynrand.org/students.',
    description:
        'Annual essay contests on Ayn Rand\'s novels with substantial cash prizes.',
    deadline: 'Apr 2026 (Fountainhead)',
    deadlineIso: '2026-04-28T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://aynrand.org/students/essay-contests/',
    links: ['aynrand.org/students/essay-contests/'],
  ),
  const Resource(
    id: 'foyle_young_poets',
    title: '2026 Foyle Young Poets of the Year Award',
    category: 'competition',
    field: 'humanities',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: 'Submit up to 3 poems',
    majorTags: ['poetry', 'creative_writing', 'english'],
    applicationInfo: 'Submit at foyleyoungpoets.org.',
    description:
        'One of the world\'s most prestigious poetry competitions for young writers.',
    deadline: 'Jul 31, 2026',
    deadlineIso: '2026-07-31T23:59:00Z',
    icon: Icons.emoji_events,
    url:
        'https://poetrysociety.org.uk/competitions/foyle-young-poets-of-the-year-award/',
    links: ['poetrysociety.org.uk'],
  ),
  const Resource(
    id: 'red_wheelbarrow_poetry',
    title: 'Red Wheelbarrow Poetry Prize 2026',
    category: 'competition',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: 'TODO',
    majorTags: ['poetry', 'creative_writing', 'english'],
    applicationInfo: 'TODO — fill in application details',
    description:
        'A poetry prize for high school students celebrating creative verse.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'TODO',
    links: ['TODO'],
  ),
  const Resource(
    id: 'anthology_nature_writing',
    title: 'Anthology Nature Writing Competition 2026',
    category: 'competition',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: 'TODO',
    majorTags: ['creative_writing', 'nature_writing', 'env_sci', 'english'],
    applicationInfo: 'TODO — fill in application details',
    description:
        'A nature writing competition exploring the intersection of writing and the natural world.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'TODO',
    links: ['TODO'],
  ),
  const Resource(
    id: 'nyt_summer_reading',
    title: 'NYT 17th Annual Summer Reading Contest',
    category: 'competition',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online — NYT Learning Network',
    timeCommitment: 'Weekly submissions throughout summer',
    majorTags: [
      'english',
      'journalism_media',
      'humanities',
      'creative_writing',
    ],
    applicationInfo: 'Submit written responses to weekly NYT article prompts.',
    description:
        'The New York Times\' annual summer reading and writing contest.',
    deadline: 'Aug 2026 (weekly through summer)',
    deadlineIso: '2026-08-31T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://www.nytimes.com/section/learning',
    links: ['nytimes.com/section/learning'],
  ),
  const Resource(
    id: 'studentcam',
    title: 'C-SPAN StudentCam Documentary Contest',
    category: 'competition',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: '6–10 weeks (filming + editing)',
    majorTags: [
      'film_prod',
      'documentary',
      'polisci',
      'pub_policy',
      'journalism_media',
    ],
    applicationInfo:
        'Create a 5–6 minute documentary on a federal policy issue.',
    description:
        'C-SPAN\'s national documentary competition with over \$100,000 in total prizes.',
    deadline: 'Jan 2026 (approx.)',
    deadlineIso: '2026-01-20T23:59:00Z',
    icon: Icons.emoji_events,
    url: 'https://www.studentcam.org',
    links: ['studentcam.org'],
  ),
  const Resource(
    id: 'young_filmmakers',
    title: 'Young Filmmakers Competition',
    category: 'competition',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission',
    timeCommitment: 'TODO',
    majorTags: [
      'film_prod',
      'documentary',
      'digital_media',
      'creative_writing',
    ],
    applicationInfo: 'TODO — fill in application details',
    description: 'A film competition for high school student filmmakers.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'TODO',
    links: ['TODO'],
  ),

  // === AP COURSES ===
  const Resource(
    id: 'ap_csp',
    title: 'AP CS: Principles',
    category: 'ap',
    field: 'cs',
    description: 'Programming fundamentals, very basic introduction to CS',
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
  ),
  const Resource(
    id: 'ap_csa',
    title: 'AP CS: A (Java)',
    category: 'ap',
    field: 'cs',
    description: "Object-oriented programming in Java",
    deadline: 'May 2026 (exam)',
    icon: Icons.laptop_mac,
    url: 'https://apstudents.collegeboard.org/courses/ap-computer-science-a',
    links: [
      'CodingBat Java practice',
      "Barron's AP CSA",
      'AP Classroom',
      'AP CSA Exam 2015',
      'AP CSA Exam 2014',
      'AP CSA Exam 2008',
    ],
    apSubCategory: 'cs',
  ),
  const Resource(
    id: 'ap_calcab',
    title: 'AP Calculus AB',
    category: 'ap',
    field: 'math',
    description: 'Limits, derivatives, and integrals',
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
  const Resource(
    id: 'ap_calcbc',
    title: 'AP Calculus BC',
    category: 'ap',
    field: 'math',
    description:
        'Extends AB to include sequences, series, and parametric equations',
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
        'Z-tests, T-tests, Chi-square, binomcdf, geometpdf, methodology',
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
  ),
  const Resource(
    id: 'ap_bio',
    title: 'AP Biology',
    category: 'ap',
    field: 'biology',
    description: 'Evolution, cellular processes, genetics, and ecology',
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
        'Atomic structure, bonding, thermodynamics, kinetics, and equilibrium',
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
    description: 'Ecosystems, biodiversity, energy resources + consumption',
    deadline: 'May 2026 (exam)',
    icon: Icons.science,
    url: 'https://apstudents.collegeboard.org/courses/ap-es',
    links: [
      'Khan Academy AP Environmental Science',
      'AP Environmental Science Exam 2016',
    ],
    apSubCategory: 'science',
  ),
  const Resource(
    id: 'ap_phys1',
    title: 'AP Physics 1',
    category: 'ap',
    field: 'physics',
    description: 'Algebra-based: mechanics, waves, and circuits',
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
        'Algebra-based: thermodynamics, fluids, E&M, optics, modern physics',
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
    description: 'Calculus-based mechanics',
    deadline: 'May 2026 (exam)',
    icon: Icons.bolt,
    url: 'https://apstudents.collegeboard.org/courses/ap-physics-c-mechanics',
    links: [
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
    title: 'AP Physics C: E & M',
    category: 'ap',
    field: 'physics',
    description: 'Calculus-based E&M',
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
    description: 'Rhetorical analysis, argumentation, and synthesis',
    deadline: 'May 2026 (exam)',
    icon: Icons.edit,
    url:
        'https://apstudents.collegeboard.org/courses/ap-english-language-and-composition',
    links: ['AP Classroom', 'Princeton Review AP English Lang'],
    apSubCategory: 'lang',
  ),
  const Resource(
    id: 'ap_enlit',
    title: 'AP English Literature',
    category: 'ap',
    field: 'english',
    description: 'Literary analysis essays and relevant questions',
    deadline: 'May 2026 (exam)',
    icon: Icons.edit,
    url:
        'https://apstudents.collegeboard.org/courses/ap-english-literature-and-composition',
    links: ['AP Classroom', 'Litcharts (free analysis)'],
    apSubCategory: 'lang',
  ),
  const Resource(
    id: 'ap_ush',
    title: 'AP US History',
    category: 'ap',
    field: 'history',
    description: 'Survey of American history from 1491 to present',
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
    id: 'ap_usg',
    title: 'AP US Government and Politics',
    category: 'ap',
    field: 'history',
    description: 'Study of the United States Government and its Politics',
    deadline: 'May 2026 (exam)',
    icon: Icons.history_edu,
    url: 'https://apstudents.collegeboard.org/courses/ap-united-states-gov',
    links: ['Khan Academy AP US Government and Politics'],
    apSubCategory: 'history',
  ),
  const Resource(
    id: 'ap_arthistory',
    title: 'AP Art History',
    category: 'ap',
    field: 'art',
    description: 'Art history and analysis',
    deadline: 'May 2026 (exam)',
    icon: Icons.history_edu,
    url: 'https://apstudents.collegeboard.org/courses/ap-art-history',
    links: ['Khan Academy AP Art History'],
    apSubCategory: 'history',
  ),
  const Resource(
    id: 'ap_world',
    title: 'AP World History',
    category: 'ap',
    field: 'history',
    description: 'Global history from 1200 CE to present',
    deadline: 'May 2026 (exam)',
    icon: Icons.public,
    url: 'https://apstudents.collegeboard.org/courses/ap-world-history-modern',
    links: [
      'Khan Academy AP World',
      'Tom Richey (YouTube)',
      "Barron's AP World",
      'AP World History Exam 2018',
      'AP World History Exam 2017',
      'AP World History Exam 2017 (2)',
      'AP World History Exam 2016',
      'AP World History Exam 2016 (2)',
      'AP World History Exam 2015',
      'AP World History Exam 2014',
      'AP World History Exam 2013',
      'AP World History Exam 2011',
      'AP World History Exam 2008',
      'AP World History Exam 2007',
    ],
    apSubCategory: 'history',
  ),
  const Resource(
    id: 'ap_psych',
    title: 'AP Psychology',
    category: 'ap',
    field: 'science',
    description: 'Research methods, biological bases, sensation, learning',
    deadline: 'May 2026 (exam)',
    icon: Icons.psychology,
    url: 'https://apstudents.collegeboard.org/courses/ap-psychology',
    links: ["Barron's AP Psychology", 'AP Classroom'],
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
      'Khan Academy AP Microeconomics',
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
      'Khan Academy AP Macroeconomics',
    ],
    apSubCategory: 'econ',
  ),

  // === RESEARCH & INTERNSHIPS ===
  const Resource(
    id: 'rsi',
    title: 'RSI — Research Science Institute',
    category: 'research',
    field: 'all',
    scope: 'international',
    locationNote: 'In-person at MIT',
    timeCommitment: '6 weeks full-time in summer',
    majorTags: ['research', 'stem', 'academia'],
    applicationInfo:
        'Extensive application (essays, recs, scores), free to attend',
    description:
        'MIT-hosted residential summer research program, widely considered the most selective HS program in the US',
    deadline: 'Dec 15, 2025 (apply)',
    icon: Icons.school,
    url: 'https://www.cee.org/programs/research-science-institute',
    links: ['cee.org/rsi', 'Application portal'],
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
    applicationInfo: 'Rigorous application with entrance problem set',
    description:
        'Remote year-long math and CS research mentored by MIT graduate students',
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
    applicationInfo: 'Online application with resume/coursework, paid stipend',
    description:
        'Paid summer research at NIH campuses where you work alongside scientists in real biomedical research labs',
    deadline: 'Jan 15, 2026 (apply)',
    icon: Icons.science,
    url: 'https://www.training.nih.gov/programs/hs-sip',
    links: ['training.nih.gov/programs/hs-sip', 'Application portal'],
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
    applicationInfo: 'Apply online with project interests',
    description:
        'Mentored research program in any subject, work with a PhD mentor to produce a paper.',
    deadline: null,
    icon: Icons.article,
    url: 'https://www.polygence.org',
    links: ['polygence.org', 'Browse mentors', 'Showcase past projects'],
  ),
  const Resource(
    id: 'nasa',
    title: 'NASA STEM Enhancement',
    category: 'internship',
    field: 'physics',
    scope: 'national',
    locationNote: 'In-person at NASA centers or remote',
    timeCommitment: '8-10 weeks full-time in summer',
    majorTags: ['physics', 'engineering', 'space'],
    applicationInfo: 'Apply via NASA STEM Gateway, requires essays/recs, paid',
    description: 'Paid summer research at NASA centers nationwide',
    deadline: 'Mar 2026 (apply)',
    icon: Icons.business,
    url: 'https://stemgateway.nasa.gov',
    links: ['nasa.gov/careers/students', 'OSSI portal'],
  ),

  // === SAT / ACT PREP ===
  const Resource(
    id: 'bluebook_tests',
    title: 'Bluebook Digital Practice Tests',
    category: 'sat',
    field: 'all',
    description:
        'The official College Board digital practice tests (Tests 4–10)',
    deadline: null,
    icon: Icons.computer,
    url: 'https://bluebook.collegeboard.org',
    links: ['bluebook.collegeboard.org', 'Free download'],
  ),
  const Resource(
    id: 'paper_practice_tests',
    title: 'Full-Length Paper Practice Tests',
    category: 'sat',
    field: 'all',
    description: 'Official College Board paper/PDF practice tests',
    deadline: null,
    icon: Icons.article_outlined,
    url: 'https://satsuite.collegeboard.org/practice/practice-tests/paper',
    links: [
      'satsuite.collegeboard.org/practice/practice-tests/paper',
      'Free PDF download',
    ],
  ),
  const Resource(
    id: 'cb_question_bank',
    title: 'Student Question Bank',
    category: 'sat',
    field: 'all',
    description:
        'Official College Board question bank, thousands of real SAT questions',
    deadline: null,
    icon: Icons.quiz_outlined,
    url: 'https://mypractice.collegeboard.org/questionbank/search',
    links: ['https://mypractice.collegeboard.org/questionbank/search'],
  ),
  const Resource(
    id: 'cb_practice_specific_questions',
    title: 'Practice Specific Questions (Post-Test)',
    category: 'sat',
    field: 'all',
    description:
        'Practice the exact question types and skills you missed most in Bluebook',
    deadline: null,
    icon: Icons.track_changes_outlined,
    url: 'https://bluebook.collegeboard.org',
    links: ['bluebook.collegeboard.org'],
  ),
  const Resource(
    id: 'cb_official_study_guide',
    title: 'Official SAT Study Guide',
    category: 'sat',
    field: 'all',
    description:
        'The College Board\'s official study guide includes full-length practice tests',
    deadline: null,
    icon: Icons.menu_book_outlined,
    url:
        'https://store.collegeboard.org/sto/productdetail.do?Itemkey=000194984',
    links: ['Available in print or PDF'],
  ),
  const Resource(
    id: 'khan_academy_sat',
    title: 'Khan Academy SAT Practice',
    category: 'sat',
    field: 'all',
    description: 'Official SAT practice on Khan Academy',
    deadline: null,
    icon: Icons.school_outlined,
    url: 'https://www.khanacademy.org/sat',
    links: ['khanacademy.org/sat'],
  ),
  const Resource(
    id: 'princeton_review_sat',
    title: 'The Princeton Review – SAT Prep',
    category: 'sat',
    field: 'all',
    description: 'One of the most popular third-party SAT prep books',
    deadline: null,
    icon: Icons.menu_book,
    url: 'https://www.amazon.com/s?k=princeton+review+sat',
    links: ['Find on Amazon'],
  ),
  const Resource(
    id: 'kaplan_sat',
    title: 'Kaplan SAT Prep',
    category: 'sat',
    field: 'all',
    description: 'Kaplan\'s SAT prep book offers method-based strategies',
    deadline: null,
    icon: Icons.menu_book,
    url: 'https://www.amazon.com/s?k=kaplan+sat+prep',
    links: ['Find on Amazon'],
  ),
  const Resource(
    id: 'knowt_act',
    title: 'Knowt ACT Prep',
    category: 'act',
    field: 'all',
    description: 'AI-powered ACT practice with section-specific flashcard sets',
    deadline: null,
    icon: Icons.quiz,
    url: 'https://knowt.com/exams/ACT',
    links: ['knowt.com/exams/ACT'],
  ),
  const Resource(
    id: 'act_official',
    title: 'ACT Official Practice',
    category: 'act',
    field: 'all',
    description: 'Official ACT practice tests from act.org. 5 free tests.',
    deadline: null,
    icon: Icons.check_circle_outline,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/free-act-test-prep.html',
    links: ['act.org/products/high-school-resources'],
  ),
  const Resource(
    id: 'act_khan',
    title: 'Khan Academy ACT Prep',
    category: 'act',
    field: 'all',
    description:
        'ACT prep video lessons and practice questions covering all sections.',
    deadline: null,
    icon: Icons.smart_display,
    url: 'https://www.khanacademy.org/test-prep/act',
    links: ['khanacademy.org/test-prep/act'],
  ),
  const Resource(
    id: 'pr_act',
    title: 'Princeton Review ACT Prep',
    category: 'act',
    field: 'all',
    description: '2025 edition with 6 full-length practice tests.',
    deadline: null,
    icon: Icons.book,
    url: 'https://www.princetonreview.com/college/act-test-prep',
    links: ['Find on Amazon'],
  ),
  const Resource(
    id: 'act_english_res',
    title: 'ACT English — Grammar & Usage',
    category: 'act',
    field: 'all',
    description: 'Covers punctuation, grammar, usage, and sentence structure.',
    deadline: null,
    icon: Icons.edit,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/english-test-description.html',
    links: [
      'act.org/content/act/en/products-and-services/the-act/test-preparation/english-test-description.html',
    ],
  ),
  const Resource(
    id: 'act_science_res',
    title: 'ACT Science — Data Interpretation',
    category: 'act',
    field: 'all',
    description:
        'ACT Science is about data interpretation and critical thinking.',
    deadline: null,
    icon: Icons.science,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/science-test-description.html',
    links: ['act.org/science', 'Kaplan ACT Science strategies'],
  ),
  const Resource(
    id: 'act_math_res',
    title: 'ACT Math — Full Prep',
    category: 'act',
    field: 'all',
    description: 'ACT Math covers pre-algebra through trigonometry.',
    deadline: null,
    icon: Icons.calculate,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/math-test-description.html',
    links: ['khanacademy.org/act-math', 'Kaplan ACT Math'],
  ),
];

class DeadlineItem {
  final String title;
  final String date; // Human-readable display string, e.g. "Dec 15, 2025"
  final String dateIso; // ISO-8601, e.g. "2025-12-15T23:59:00Z"
  final List<String> majorTags;
  final String? resourceId;

  const DeadlineItem({
    required this.title,
    required this.date,
    required this.dateIso,
    this.majorTags = const [],
    this.resourceId,
  });

  // ── Computed from dateIso — never stored, never hardcoded ─────────────────

  DateTime get _parsed {
    if (dateIso.isEmpty) {
      // No date set (TODO items) — treat as far future so they sink to bottom
      return DateTime.now().add(const Duration(days: 9999));
    }
    try {
      return DateTime.parse(dateIso);
    } catch (_) {
      return DateTime.now().add(const Duration(days: 9999));
    }
  }

  /// Days until this deadline from today. Negative = already past.
  int get daysUntil {
    final today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    final target = DateTime(_parsed.year, _parsed.month, _parsed.day);
    return target.difference(today).inDays;
  }

  bool get isExpired => daysUntil < 0;
  bool get isTodo => dateIso.isEmpty;

  /// Auto-calculated urgency — matches PersonalDeadline logic exactly.
  String get urgency {
    if (isTodo) return 'later';
    final d = daysUntil;
    if (d < 0) return 'past';
    if (d <= 30) return 'urgent';
    if (d <= 90) return 'soon';
    return 'later';
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// DEADLINES LIST — urgency field removed from every entry
// ─────────────────────────────────────────────────────────────────────────────

const List<DeadlineItem> upcomingDeadlines = [
  // ── 2025 ──────────────────────────────────────────────────────────────────
  DeadlineItem(
    title: 'AFA CyberPatriot XIX',
    date: 'Oct 2025 (reg. closes)',
    dateIso: '2025-10-31T23:59:00Z',
    resourceId: 'cyberpatriot_afa',
    majorTags: ['cybersecurity', 'cs', 'data_sci', 'networking', 'linux'],
  ),
  DeadlineItem(
    title: 'StellarXplorers Aerospace STEM Program',
    date: 'Oct 2025 (reg. closes)',
    dateIso: '2025-10-31T23:59:00Z',
    resourceId: 'stellarxplorers',
    majorTags: ['aerospace', 'physics', 'cs', 'applied_math'],
  ),
  DeadlineItem(
    title: 'AMC 8 / 10 / 12',
    date: 'Nov 6, 2025',
    dateIso: '2025-11-06T23:59:00Z',
    resourceId: 'amc',
    majorTags: ['math', 'problem_solving', 'logic'],
  ),
  DeadlineItem(
    title: 'NYAS The Junior Academy',
    date: 'Nov 2025 (application)',
    dateIso: '2025-11-30T23:59:00Z',
    resourceId: 'nyas_junior_academy',
    majorTags: ['biology', 'cs', 'innovation', 'env_sci', 'neuroscience'],
  ),
  DeadlineItem(
    title: 'Research Science Institute (RSI)',
    date: 'Dec 15, 2025 (apply)',
    dateIso: '2025-12-15T23:59:00Z',
    resourceId: 'rsi',
    majorTags: ['research', 'stem', 'academia'],
  ),
  DeadlineItem(
    title: 'USACO December Contest',
    date: 'Dec 13–16, 2025',
    dateIso: '2025-12-16T23:59:00Z',
    resourceId: 'usaco',
    majorTags: ['cs', 'data_sci', 'ai'],
  ),
  DeadlineItem(
    title: 'Congressional App Challenge',
    date: 'Dec 21, 2025',
    dateIso: '2025-12-21T23:59:00Z',
    resourceId: 'cac',
    majorTags: ['cs', 'app_dev', 'civics'],
  ),
  DeadlineItem(
    title: 'MIT PRIMES-USA',
    date: 'Dec 2025 (opens)',
    dateIso: '2025-12-31T23:59:00Z',
    resourceId: 'primes',
    majorTags: ['math', 'cs', 'computational_biology'],
  ),

  // ── Jan–May 2026 ──────────────────────────────────────────────────────────
  DeadlineItem(
    title: 'NIH High School Internship',
    date: 'Jan 15, 2026 (apply)',
    dateIso: '2026-01-15T23:59:00Z',
    resourceId: 'nih',
    majorTags: ['biology', 'medicine', 'research'],
  ),
  DeadlineItem(
    title: 'C-SPAN StudentCam Documentary Contest',
    date: 'Jan 2026 (approx.)',
    dateIso: '2026-01-20T23:59:00Z',
    resourceId: 'studentcam',
    majorTags: [
      'film_prod',
      'documentary',
      'polisci',
      'pub_policy',
      'journalism_media',
    ],
  ),
  DeadlineItem(
    title: 'Conrad Challenge',
    date: 'Jan 2026 (submission)',
    dateIso: '2026-01-31T23:59:00Z',
    resourceId: 'conrad_challenge',
    majorTags: ['innovation', 'entrepreneurship', 'env_sci', 'cs', 'biology'],
  ),
  DeadlineItem(
    title: 'USABO',
    date: 'Jan 2026',
    dateIso: '2026-01-31T23:59:00Z',
    resourceId: 'usabo',
    majorTags: ['biology', 'genetics', 'anatomy'],
  ),
  DeadlineItem(
    title: 'National Economics Challenge',
    date: 'Mar 2026 (state reg. varies)',
    dateIso: '2026-03-31T23:59:00Z',
    resourceId: 'national_econ_challenge',
    majorTags: ['economics', 'business', 'statistics'],
  ),
  DeadlineItem(
    title: 'Platt Family Scholarship Prize Essay',
    date: 'Mar 2026 (approx.)',
    dateIso: '2026-03-31T23:59:00Z',
    resourceId: 'platt_family_essay',
    majorTags: ['humanities', 'polisci', 'intl_rel', 'english'],
  ),
  DeadlineItem(
    title: 'NASA STEM Enhancement',
    date: 'Mar 2026 (apply)',
    dateIso: '2026-03-31T23:59:00Z',
    resourceId: 'nasa',
    majorTags: ['physics', 'engineering', 'space'],
  ),
  DeadlineItem(
    title: 'Ayn Rand Institute Essay Contests',
    date: 'Apr 2026 (Fountainhead)',
    dateIso: '2026-04-28T23:59:00Z',
    resourceId: 'ayn_rand_essay',
    majorTags: ['english', 'humanities', 'polisci', 'prelaw'],
  ),
  DeadlineItem(
    title: 'AP Exams',
    date: 'May 2026',
    dateIso: '2026-05-31T23:59:00Z',
    resourceId: 'ap_csp', // representative — links to AP section generally
    majorTags: [],
  ),
  DeadlineItem(
    title: 'Breakthrough Junior Challenge',
    date: 'Jun 2026 (approx.)',
    dateIso: '2026-06-30T23:59:00Z',
    resourceId: 'breakthrough_junior',
    majorTags: ['biology', 'physics', 'neuroscience', 'cog_sci', 'chemistry'],
  ),

  // ── Jun–Dec 2026 ──────────────────────────────────────────────────────────
  DeadlineItem(
    title: 'Foyle Young Poets Award',
    date: 'Jul 31, 2026',
    dateIso: '2026-07-31T23:59:00Z',
    resourceId: 'foyle_young_poets',
    majorTags: ['poetry', 'creative_writing', 'english'],
  ),
  DeadlineItem(
    title: 'SAT August Test Date',
    date: 'Aug 22, 2026',
    dateIso: '2026-08-22T23:59:00Z',
    resourceId: 'bluebook_tests',
  ),
  DeadlineItem(
    title: 'NYT Summer Reading Contest',
    date: 'Aug 2026',
    dateIso: '2026-08-31T23:59:00Z',
    resourceId: 'nyt_summer_reading',
    majorTags: [
      'english',
      'journalism_media',
      'humanities',
      'creative_writing',
    ],
  ),
  DeadlineItem(
    title: 'Wharton Global Investment Competition',
    date: 'Sep 2026 (opens ~Jun)',
    dateIso: '2026-09-12T23:59:00Z',
    resourceId: 'wharton_investment',
    majorTags: ['business', 'economics', 'statistics', 'data_sci'],
  ),
  DeadlineItem(
    title: 'The Gates Scholarship',
    date: 'Sep 15, 2026',
    dateIso: '2026-09-15T23:59:00Z',
    resourceId: 'gates_scholarship',
    majorTags: ['social_impact', 'entrepreneurship', 'leadership', 'nonprofit'],
  ),
  DeadlineItem(
    title: 'High School Fed Challenge',
    date: 'Oct 2026 (regional dates vary)',
    dateIso: '2026-10-31T23:59:00Z',
    resourceId: 'fed_challenge',
    majorTags: ['economics', 'business', 'pub_policy'],
  ),
  DeadlineItem(
    title: 'Coca-Cola Scholars Program',
    date: 'Oct 31, 2026',
    dateIso: '2026-10-31T23:59:00Z',
    resourceId: 'coca_cola_scholars',
    majorTags: ['entrepreneurship', 'social_impact', 'nonprofit', 'leadership'],
  ),
  DeadlineItem(
    title: 'Citadel High School Terminal Competition',
    date: 'Rolling (multiple per year)',
    dateIso: '2026-12-31T23:59:00Z',
    resourceId: 'citadel_terminal',
    majorTags: ['cs', 'data_sci', 'ai', 'applied_math', 'statistics'],
  ),

  // ── TODO — date unknown, fill in when available ───────────────────────────
  // These all get urgency: 'later' automatically via the isTodo fallback.
  DeadlineItem(
    title: 'UDC Capital Cup Entrepreneurship',
    date: 'TODO',
    dateIso: '',
    resourceId: 'udc_capital_cup',
  ),
  DeadlineItem(
    title: 'CaseCatalyst Case Competition',
    date: 'TODO',
    dateIso: '',
    resourceId: 'case_catalyst',
  ),
  DeadlineItem(
    title: 'International Economics Essay',
    date: 'TODO',
    dateIso: '',
    resourceId: 'intl_econ_essay',
  ),
  DeadlineItem(
    title: 'Global Impact Competition',
    date: 'TODO',
    dateIso: '',
    resourceId: 'global_impact_competition',
  ),
  DeadlineItem(
    title: 'Aspiring Scholars Directed Research',
    date: 'TODO',
    dateIso: '',
    resourceId: 'aspiring_scholars',
  ),
  DeadlineItem(
    title: 'International Psychology Olympiad',
    date: 'TODO',
    dateIso: '',
    resourceId: 'intl_psych_olympiad',
  ),
  DeadlineItem(
    title: 'Verge Challenge',
    date: 'TODO',
    dateIso: '',
    resourceId: 'verge_challenge',
  ),
  DeadlineItem(
    title: 'LegalEagleBee — Art for Equity',
    date: 'TODO',
    dateIso: '',
    resourceId: 'leb_art_equity',
  ),
  DeadlineItem(
    title: 'LegalEagleBee — Policy Brief',
    date: 'TODO',
    dateIso: '',
    resourceId: 'leb_policy_brief',
  ),
  DeadlineItem(
    title: 'LegalEagleBee — Policy Video',
    date: 'TODO',
    dateIso: '',
    resourceId: 'leb_policy_video',
  ),
  DeadlineItem(
    title: 'LegalEagleBee — Court Case',
    date: 'TODO',
    dateIso: '',
    resourceId: 'leb_court_case',
  ),
  DeadlineItem(
    title: 'Columbia Law Review Essay',
    date: 'TODO',
    dateIso: '',
    resourceId: 'columbia_law_review_essay',
  ),
  DeadlineItem(
    title: 'Columbia Political Review Essay',
    date: 'TODO',
    dateIso: '',
    resourceId: 'columbia_polireview_essay',
  ),
  DeadlineItem(
    title: 'LSESU Annual Essay',
    date: 'TODO',
    dateIso: '',
    resourceId: 'lsesu_essay',
  ),
  DeadlineItem(
    title: 'CULR High School Essay',
    date: 'TODO',
    dateIso: '',
    resourceId: 'culr_essay',
  ),
  DeadlineItem(
    title: 'Red Wheelbarrow Poetry Prize',
    date: 'TODO',
    dateIso: '',
    resourceId: 'red_wheelbarrow_poetry',
  ),
  DeadlineItem(
    title: 'Anthology Nature Writing',
    date: 'TODO',
    dateIso: '',
    resourceId: 'anthology_nature_writing',
  ),
  DeadlineItem(
    title: 'Young Filmmakers Competition',
    date: 'TODO',
    dateIso: '',
    resourceId: 'young_filmmakers',
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
