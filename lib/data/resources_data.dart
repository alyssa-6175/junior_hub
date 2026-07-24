import 'package:flutter/material.dart';
import '../models/resource.dart';

// mapping url links
const Map<String, String> kLinkUrls = {
  'Knowt AP Hub': 'https://knowt.com/ap',
  'CrackAP practice questions': 'https://www.crackap.com/index.html',
  'Schoolhouse SAT Bootcamps': 'https://schoolhouse.world/sat-bootcamp',
  'Desmos SAT calculator practice':
      'https://www.desmos.com/testing/collegeboard/graphing',
  'Knowt SAT Hub': 'https://knowt.com/exams/SAT',
  'ACT exam sections and structure':
      'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/act-exam-sections-and-structure.html',
  'ACT free practice and prep':
      'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/free-act-test-prep.html',
  'USA AI Olympiad': 'https://www.usaaio.org/2026-usa-na-aio',
  'National Science Bowl': 'https://science.osti.gov/wdts/nsb',
  'NACLO': 'https://www.naclo.org/',
  'USNCO': 'https://www.acs.org/education/olympiad.html',
  'AAPT U.S. Physics Team': 'https://www.aapt.org/physicsteam/',
  'AP Classroom': 'https://myap.collegeboard.org/',
  'Official AP course list': 'https://apstudents.collegeboard.org/courses',
  'Official AP exam questions':
      'https://apcentral.collegeboard.org/courses/past-exam-questions',
  'AP CS Exam Prep : Test & Course Content': 'https://www.apcsexamprep.com/',
  'Khan Academy': 'https://www.khanacademy.org/',
  'Albert AP practice': 'https://www.albert.io/ap',
  'Fiveable AP study guides': 'https://fiveable.me/',
  'Code.org AP CSP':
      'https://code.org/en-US/curriculum/computer-science-principles',
  'CodingBat Java': 'https://codingbat.com/java',
  'USACO': 'https://usaco.org/',
  'USACO Guide': 'https://usaco.guide/',
  'MAA AMC registration': 'https://maa.org/amcreg/',
  'AoPS AMC archive':
      'https://artofproblemsolving.com/wiki/index.php/AMC_Problems_and_Solutions',
  'Congressional App Challenge': 'https://www.congressionalappchallenge.us/',
  'CyberPatriot registration':
      'https://www.uscyberpatriot.org/competition/Competition-Overview/join-the-competition',
  'CyberPatriot schedule':
      'https://www.uscyberpatriot.org/competition/current-competition/competition-schedule',
  'Wharton registration':
      'https://globalyouth.wharton.upenn.edu/competitions/investment-competition/register-now/',
  'Breakthrough Junior Challenge': 'https://breakthroughjuniorchallenge.org/',
  'StellarXplorers dates and fees':
      'https://www.stellarxplorers.org/dates-fees.html',
  'C-SPAN StudentCam': 'https://www.studentcam.org/',
  'Science Olympiad': 'https://www.soinc.org/',
  'USABO': 'https://www.usabo-trc.org/',
  'National Economics Challenge':
      'https://councilforeconed.org/national-economics-challenge/',
  'High School Fed Challenge':
      'https://www.newyorkfed.org/outreach-and-education/high-school/fed-challenge',
  'Conrad Challenge': 'https://www.conradchallenge.org/',
  'College Board SAT practice': 'https://satsuite.collegeboard.org/practice',
  'Bluebook': 'https://bluebook.collegeboard.org/',
  'Khan Academy SAT': 'https://www.khanacademy.org/test-prep/digital-sat',
  'Official ACT practice':
      'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/free-act-test-prep.html',

  // Original Google Drive AP practice tests
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
  // ===========================================================================
  // COMPETITIONS
  // ===========================================================================
  const Resource(
    id: 'usaco',
    title: 'USA Computing Olympiad (USACO)',
    category: 'competition',
    field: 'cs',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online',
    timeCommitment: 'Four-hour contest',
    majorTags: ['cs', 'algorithms', 'problem_solving'],
    applicationInfo: 'Free account registration on the official USACO site.',
    description: 'Programming contests with Bronze through Platinum divisions.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://usaco.org/',
    links: ['USACO', 'USACO Guide'],
    detailNote:
        'The next official contest date was not posted when checked; no estimated date is shown.',
  ),
  const Resource(
    id: 'amc',
    title: 'AMC 10 / AMC 12',
    category: 'competition',
    field: 'math',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Registered school or competition center',
    timeCommitment: '75 minutes per contest',
    majorTags: ['math', 'problem_solving', 'logic'],
    applicationInfo:
        'Students register through an approved school or competition manager.',
    description:
        'MAA mathematics competitions that lead to the AIME and USA(J)MO.',
    deadline: 'September 30, 2026 (early registration)',
    deadlineIso: '2026-09-30T23:59:00-04:00',
    icon: Icons.emoji_events,
    url: 'https://maa.org/amcreg/',
    links: ['MAA AMC registration', 'AoPS AMC archive'],
    detailNote:
        'Regular registration: October 15; late registration: October 28. AMC A: November 5; AMC B: November 13, 2026.',
  ),
  const Resource(
    id: 'amc8',
    title: 'AMC 8',
    category: 'competition',
    field: 'math',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Registered school or competition center',
    timeCommitment: '40 minutes',
    majorTags: ['math', 'problem_solving', 'logic'],
    applicationInfo:
        'Students register through an approved school or competition manager.',
    description:
        'MAA mathematics competition for students in grade 8 and below.',
    deadline: 'October 28, 2026 (early registration)',
    deadlineIso: '2026-10-28T23:59:00-04:00',
    icon: Icons.emoji_events,
    url: 'https://maa.org/amcreg/',
    links: ['MAA AMC registration', 'AoPS AMC archive'],
    detailNote: 'Contest window: January 21–27, 2027.',
  ),
  const Resource(
    id: 'cac',
    title: 'Congressional App Challenge',
    category: 'competition',
    field: 'cs',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online submission; participating congressional districts',
    timeCommitment: 'Self-paced app project',
    majorTags: ['cs', 'app_dev', 'civics'],
    applicationInfo:
        'Eligibility and deadlines are district-specific; use the official district finder.',
    description:
        'Students build and submit an original app to their participating congressional district.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.emoji_events,
    url: 'https://www.congressionalappchallenge.us/',
    links: ['Congressional App Challenge'],
    detailNote:
        'No single verified nationwide 2026 deadline was posted when checked.',
  ),
  const Resource(
    id: 'cyberpatriot_afa',
    title: 'AFA CyberPatriot 19',
    category: 'competition',
    field: 'cs',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Online rounds; in-person National Finals',
    timeCommitment: 'Multiple four-hour rounds',
    majorTags: ['cybersecurity', 'cs', 'networking', 'linux'],
    applicationInfo: 'Teams of 2–6 students register through an adult coach.',
    description:
        'National youth cyber-defense competition focused on securing virtual systems and networks.',
    deadline: 'October 1, 2026 (team registration)',
    deadlineIso: '2026-10-01T23:59:00-04:00',
    icon: Icons.security,
    url:
        'https://www.uscyberpatriot.org/competition/Competition-Overview/join-the-competition',
    links: ['CyberPatriot registration', 'CyberPatriot schedule'],
    detailNote:
        'Student rosters are due October 21. Round 1 runs October 22–25, 2026.',
  ),
  const Resource(
    id: 'wharton_investment',
    title: 'Wharton Global High School Investment Competition',
    category: 'competition',
    field: 'business',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online; finalists may attend the Global Finale',
    timeCommitment: 'Multi-month team competition',
    majorTags: ['business', 'economics', 'finance', 'statistics'],
    applicationInfo: 'Free teams of 4–6 students with a teacher advisor.',
    description:
        'Teams develop a long-term investment strategy for a real-world client.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.trending_up,
    url:
        'https://globalyouth.wharton.upenn.edu/competitions/investment-competition/register-now/',
    links: ['Wharton registration'],
    detailNote:
        'The official site says 2026–27 registration opens in August, but it does not yet give a day or closing deadline.',
  ),
  const Resource(
    id: 'breakthrough_junior',
    title: 'Breakthrough Junior Challenge',
    category: 'competition',
    field: 'science',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online video submission',
    timeCommitment: 'Self-paced two-minute science video',
    majorTags: ['biology', 'physics', 'math', 'science_communication'],
    applicationInfo:
        'Open to eligible students ages 13–18; see official rules.',
    description:
        'Explain a challenging scientific or mathematical idea in a short original video.',
    deadline: 'September 15, 2026 at 11:59 PM PDT',
    deadlineIso: '2026-09-15T23:59:00-07:00',
    icon: Icons.science,
    url: 'https://breakthroughjuniorchallenge.org/',
    links: ['Breakthrough Junior Challenge'],
    detailNote: 'Peer review is required by September 30, 2026.',
  ),
  const Resource(
    id: 'stellarxplorers',
    title: 'StellarXplorers Space Design Competition',
    category: 'competition',
    field: 'engineering',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Online qualifiers; in-person National Finals',
    timeCommitment: 'Three qualifiers plus advancement rounds',
    majorTags: ['aerospace', 'physics', 'engineering', 'applied_math'],
    applicationInfo: 'Teams of 2–6 students with an adult team director.',
    description:
        'Teams solve orbit-planning, satellite-design, and launch-operations scenarios.',
    deadline: 'October 14, 2026 (team registration)',
    deadlineIso: '2026-10-14T23:59:00-04:00',
    icon: Icons.rocket_launch,
    url: 'https://www.stellarxplorers.org/dates-fees.html',
    links: ['StellarXplorers dates and fees'],
    detailNote: 'Competitors due October 21; payment due November 5, 2026.',
  ),
  const Resource(
    id: 'studentcam',
    title: 'C-SPAN StudentCam 2027',
    category: 'competition',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online documentary submission',
    timeCommitment: 'Self-paced 5–6 minute documentary',
    majorTags: ['film_prod', 'documentary', 'civics', 'journalism_media'],
    applicationInfo:
        'Open to U.S. students in grades 6–12, individually or in teams of up to 3.',
    description:
        'Create a documentary addressing the annual civic theme using C-SPAN footage.',
    deadline: 'January 20, 2027',
    deadlineIso: '2027-01-20T23:59:00-05:00',
    icon: Icons.videocam,
    url: 'https://www.studentcam.org/',
    links: ['C-SPAN StudentCam'],
  ),
  const Resource(
    id: 'science_olympiad',
    title: 'Science Olympiad',
    category: 'competition',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote:
        'School teams; invitational, regional, state, and national tournaments',
    timeCommitment: 'Season-long team preparation',
    majorTags: ['science', 'engineering', 'biology', 'chemistry', 'physics'],
    applicationInfo: 'Join or form a registered school team.',
    description:
        'Team-based STEM tournaments spanning laboratory, build, and knowledge events.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.science,
    url: 'https://www.soinc.org/',
    links: ['Science Olympiad'],
    detailNote:
        'Registration and tournament dates vary by state, so no single deadline is shown.',
  ),
  const Resource(
    id: 'usabo',
    title: 'USA Biology Olympiad (USABO)',
    category: 'competition',
    field: 'biology',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Online exams through a registered school',
    timeCommitment: 'Open exam; qualifiers advance',
    majorTags: ['biology', 'genetics', 'anatomy', 'ecology'],
    applicationInfo:
        'A school and its students must register through the official portal.',
    description:
        'National biology competition selecting the U.S. team for the International Biology Olympiad.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.biotech,
    url: 'https://www.usabo-trc.org/',
    links: ['USABO'],
    detailNote:
        'The 2026–27 registration deadline was not yet posted when checked.',
  ),
  const Resource(
    id: 'national_econ_challenge',
    title: 'National Economics Challenge',
    category: 'competition',
    field: 'business',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'State competitions and national rounds',
    timeCommitment: 'Team study plus competition rounds',
    majorTags: ['economics', 'business', 'statistics'],
    applicationInfo:
        'Register through the applicable state Council for Economic Education affiliate.',
    description:
        'Team competition in microeconomics, macroeconomics, current events, and analysis.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.account_balance,
    url: 'https://councilforeconed.org/national-economics-challenge/',
    links: ['National Economics Challenge'],
    detailNote:
        'Deadlines vary by state; no single national registration deadline is shown.',
  ),
  const Resource(
    id: 'fed_challenge',
    title: 'High School Fed Challenge',
    category: 'competition',
    field: 'business',
    scope: 'regional',
    format: 'hybrid',
    locationNote:
        'Rules and schedule depend on the participating Federal Reserve district',
    timeCommitment: 'Multi-week research and presentation project',
    majorTags: ['economics', 'business', 'public_policy'],
    applicationInfo:
        'Check eligibility through the relevant Federal Reserve Bank.',
    description:
        'Students research economics and monetary policy and present their analysis.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.account_balance,
    url:
        'https://www.newyorkfed.org/outreach-and-education/high-school/fed-challenge',
    links: ['High School Fed Challenge'],
    detailNote: 'Regional programs differ, so no nationwide date is shown.',
  ),
  const Resource(
    id: 'conrad_challenge',
    title: 'Conrad Challenge',
    category: 'competition',
    field: 'engineering',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'Online stages and an innovation summit',
    timeCommitment: 'Multi-stage innovation project',
    majorTags: ['innovation', 'entrepreneurship', 'engineering', 'science'],
    applicationInfo:
        'Teams develop and pitch an innovation; consult the current student guide.',
    description:
        'Innovation and entrepreneurship challenge for students ages 13–18.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.lightbulb,
    url: 'https://www.conradchallenge.org/',
    links: ['Conrad Challenge'],
    detailNote: 'A reliable 2026–27 deadline was not posted when checked.',
  ),
  const Resource(
    id: 'national_science_bowl',
    title: 'National Science Bowl',
    category: 'competition',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Regional competitions lead to the national finals',
    timeCommitment:
        'Team preparation plus regional and possible national events',
    majorTags: [
      'science',
      'math',
      'biology',
      'chemistry',
      'physics',
      'earth_science',
    ],
    applicationInfo:
        'Teams register for an eligible regional event through the official Department of Energy directory.',
    description:
        'Department of Energy quiz-bowl competition covering science, mathematics, and energy.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.science,
    url: 'https://science.osti.gov/wdts/nsb',
    links: ['National Science Bowl'],
    detailNote:
        'Regional registration deadlines vary, so there is no single national registration date.',
  ),
  const Resource(
    id: 'naclo',
    title: 'North American Computational Linguistics Open (NACLO)',
    category: 'competition',
    field: 'cs',
    scope: 'international',
    format: 'hybrid',
    locationNote:
        'University and school sites across the United States and Canada',
    timeCommitment:
        'Three-hour open round; qualifiers advance to an invitational round',
    majorTags: ['linguistics', 'cs', 'logic', 'problem_solving', 'nlp'],
    applicationInfo:
        'Student registration is free through the official NACLO site.',
    description:
        'Students solve language and computational-linguistics puzzles without needing prior linguistics knowledge.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.translate,
    url: 'https://www.naclo.org/',
    links: ['NACLO'],
    detailNote: 'The next competition cycle date was not posted when checked.',
  ),
  const Resource(
    id: 'usnco',
    title: 'U.S. National Chemistry Olympiad (USNCO)',
    category: 'competition',
    field: 'chemistry',
    scope: 'national',
    format: 'in_person',
    locationNote:
        'Local ACS section exams lead to the national exam and study camp',
    timeCommitment: 'Local exam plus advancement stages',
    majorTags: ['chemistry', 'lab_science', 'problem_solving'],
    applicationInfo:
        'Contact the applicable ACS local-section USNCO coordinator for 2027 participation.',
    description:
        'American Chemical Society competition that selects the U.S. International Chemistry Olympiad team.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.science,
    url: 'https://www.acs.org/education/olympiad.html',
    links: ['USNCO'],
    detailNote:
        'ACS directs 2027 students to local coordinators; a single nationwide student deadline is not posted.',
  ),
  const Resource(
    id: 'fma_usapho',
    title: 'F=ma Exam and U.S. Physics Olympiad',
    category: 'competition',
    field: 'physics',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Proctored through an eligible school or organization',
    timeCommitment: '75-minute qualifying exam; top students advance',
    majorTags: ['physics', 'mechanics', 'math', 'problem_solving'],
    applicationInfo:
        'A teacher or approved proctor registers students through AAPT.',
    description:
        'The F=ma mechanics exam is the qualifying pathway to the U.S. Physics Olympiad.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.calculate,
    url: 'https://www.aapt.org/physicsteam/',
    links: ['AAPT U.S. Physics Team'],
    detailNote:
        'The 2026 cycle has passed, and the next registration deadline is not yet published.',
  ),

  // ===========================================================================
  // AP COURSES AND EXAM RESOURCES
  // ===========================================================================
  const Resource(
    id: 'ap_2d_art',
    title: 'AP 2-D Art and Design',
    category: 'ap',
    field: 'art',
    description: 'Portfolio-based AP assessment.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-2-d-art-and-design',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'arts',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_3d_art',
    title: 'AP 3-D Art and Design',
    category: 'ap',
    field: 'art',
    description: 'Portfolio-based AP assessment.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-3-d-art-and-design',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'arts',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_drawing',
    title: 'AP Drawing',
    category: 'ap',
    field: 'art',
    description: 'Portfolio-based AP assessment.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-drawing',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'arts',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_art_history',
    title: 'AP Art History',
    category: 'ap',
    field: 'art_history',
    description: 'Art history analysis and visual-context skills.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-art-history',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'arts',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_music_theory',
    title: 'AP Music Theory',
    category: 'ap',
    field: 'music',
    description: 'Music theory, aural skills, and composition.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-music-theory',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'arts',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_english_lang',
    title: 'AP English Language and Composition',
    category: 'ap',
    field: 'english',
    description: 'Rhetorical reading and evidence-based writing.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-english-language-and-composition',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_english_lit',
    title: 'AP English Literature and Composition',
    category: 'ap',
    field: 'english',
    description: 'Literary analysis across genres and periods.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-english-literature-and-composition',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_african_american',
    title: 'AP African American Studies',
    category: 'ap',
    field: 'history',
    description: 'Interdisciplinary study of African American experiences.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-african-american-studies',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'history',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_comp_gov',
    title: 'AP Comparative Government and Politics',
    category: 'ap',
    field: 'polisci',
    description: 'Comparative political systems and analysis.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-comparative-government-and-politics',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'history',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_euro',
    title: 'AP European History',
    category: 'ap',
    field: 'history',
    description: 'European history from approximately 1450 to the present.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-european-history',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'history',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_human_geo',
    title: 'AP Human Geography',
    category: 'ap',
    field: 'geography',
    description:
        'Population, culture, cities, development, and spatial patterns.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-human-geography',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'history',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_macro',
    title: 'AP Macroeconomics',
    category: 'ap',
    field: 'economics',
    description:
        'National economies, stabilization policy, and international economics.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-macroeconomics',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP Macro Exam 2022',
      'AP Macro Exam 2022 (2)',
      'AP Macro Exam 2019',
      'AP Macro Exam 2013',
      'AP Macro Exam 2012',
    ],
    apSubCategory: 'econ',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_micro',
    title: 'AP Microeconomics',
    category: 'ap',
    field: 'economics',
    description: 'Markets, firms, consumer choice, and market failure.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-microeconomics',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP Micro Exam 2019',
      'AP Micro Exam 2018',
      'AP Mico Exam 2017',
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
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_psych',
    title: 'AP Psychology',
    category: 'ap',
    field: 'psychology',
    description: 'Scientific foundations of behavior and mental processes.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-psychology',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'history',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_us_gov',
    title: 'AP United States Government and Politics',
    category: 'ap',
    field: 'polisci',
    description:
        'U.S. institutions, civil rights, political behavior, and argumentation.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-united-states-government-and-politics',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'history',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_us_history',
    title: 'AP United States History',
    category: 'ap',
    field: 'history',
    description: 'U.S. history from 1491 to the present.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-united-states-history',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
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
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_world',
    title: 'AP World History: Modern',
    category: 'ap',
    field: 'history',
    description:
        'Global historical developments from approximately 1200 onward.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-world-history-modern',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
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
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_calc_ab',
    title: 'AP Calculus AB',
    category: 'ap',
    field: 'math',
    description: 'Differential and integral calculus.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-calculus-ab',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'math',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_calc_bc',
    title: 'AP Calculus BC',
    category: 'ap',
    field: 'math',
    description:
        'Calculus AB topics plus additional integration, parametric, polar, and series topics.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-calculus-bc',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP Calc BC Exam 2018',
      'AP Calc BC Exam 2017',
      'AP Calc BC Exam 2016',
      'AP Calc BC Exam 2015',
      'AP Calc BC Exam 2014',
      'AP Calc BC Exam 2013',
      'AP Calc BC Exam 2012',
    ],
    apSubCategory: 'math',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_csa',
    title: 'AP Computer Science A',
    category: 'ap',
    field: 'cs',
    description: 'Object-oriented programming and algorithms in Java.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-computer-science-a',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'AP CS Exam Prep : Test & Course Content',
      'CodingBat Java',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP CSA Exam 2015',
      'AP CSA Exam 2014',
      'AP CSA Exam 2008',
    ],
    apSubCategory: 'cs',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_csp',
    title: 'AP Computer Science Principles',
    category: 'ap',
    field: 'cs',
    description:
        'Computing systems, networks, data, algorithms, programming, and societal impact.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-computer-science-principles',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'AP CS Exam Prep : Test & Course Content',
      'Code.org AP CSP',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP CSP Exam 2018',
      'AP CSP Exam 2016',
    ],
    apSubCategory: 'cs',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_precalc',
    title: 'AP Precalculus',
    category: 'ap',
    field: 'math',
    description: 'Functions, modeling, trigonometry, and analytic reasoning.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-precalculus',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'math',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_stats',
    title: 'AP Statistics',
    category: 'ap',
    field: 'statistics',
    description:
        'Data analysis, probability, sampling, and statistical inference.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-statistics',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
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
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_bio',
    title: 'AP Biology',
    category: 'ap',
    field: 'biology',
    description:
        'Cellular processes, genetics, evolution, ecology, and inquiry.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-biology',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
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
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_chem',
    title: 'AP Chemistry',
    category: 'ap',
    field: 'chemistry',
    description:
        'Atomic structure, reactions, kinetics, equilibrium, and thermodynamics.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-chemistry',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP Chem Exam 2018',
      'AP Chem Exam 2017',
      'AP Chem Exam 2016',
      'AP Chem Exam 2015',
      'AP Chem Exam 2014',
      'AP Chem Exam 2013',
      'AP Chem Exam 2012',
    ],
    apSubCategory: 'science',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_env_sci',
    title: 'AP Environmental Science',
    category: 'ap',
    field: 'env_sci',
    description: 'Environmental systems, human impacts, and solutions.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-environmental-science',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP Environmental Science Exam 2016',
    ],
    apSubCategory: 'science',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_physics_1',
    title: 'AP Physics 1: Algebra-Based',
    category: 'ap',
    field: 'physics',
    description: 'Algebra-based mechanics and related foundational physics.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-physics-1',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP Physics 1 Exam 2018',
      'AP Physics 1 Exam 2017',
      'AP Physics 1 Exam 2016',
      'AP Physics 1 Exam 2015',
      'AP Physics 1 Exam 2014',
    ],
    apSubCategory: 'science',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_physics_2',
    title: 'AP Physics 2: Algebra-Based',
    category: 'ap',
    field: 'physics',
    description:
        'Algebra-based thermodynamics, electromagnetism, optics, and modern physics.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-physics-2',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP Physics 2 Exam 2018',
      'AP Physics 2 Exam 2017',
      'AP Physics 2 Exam 2016',
      'AP Physics 2 Exam 2015',
      'AP Physics 2 Exam 2014',
    ],
    apSubCategory: 'science',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_physics_c_em',
    title: 'AP Physics C: Electricity and Magnetism',
    category: 'ap',
    field: 'physics',
    description: 'Calculus-based electricity and magnetism.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-physics-c-electricity-and-magnetism',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
      'AP Physics C E&M Exam 2018',
      'AP Physics C E&M Exam 2017',
      'AP Physics C E&M Exam 2016',
      'AP Physics c E&M Exam 2015',
      'AP Physics C E&M Exam 2013',
      'AP Physics C E&M Exam 2012',
    ],
    apSubCategory: 'science',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_physics_c_mech',
    title: 'AP Physics C: Mechanics',
    category: 'ap',
    field: 'physics',
    description: 'Calculus-based classical mechanics.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-physics-c-mechanics',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
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
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_chinese',
    title: 'AP Chinese Language and Culture',
    category: 'ap',
    field: 'languages',
    description: 'Chinese language proficiency and cultural understanding.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-chinese-language-and-culture',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_french',
    title: 'AP French Language and Culture',
    category: 'ap',
    field: 'languages',
    description: 'French communication and cultural understanding.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-french-language-and-culture',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_german',
    title: 'AP German Language and Culture',
    category: 'ap',
    field: 'languages',
    description: 'German communication and cultural understanding.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-german-language-and-culture',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_italian',
    title: 'AP Italian Language and Culture',
    category: 'ap',
    field: 'languages',
    description: 'Italian communication and cultural understanding.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-italian-language-and-culture',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_japanese',
    title: 'AP Japanese Language and Culture',
    category: 'ap',
    field: 'languages',
    description: 'Japanese communication and cultural understanding.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-japanese-language-and-culture',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_latin',
    title: 'AP Latin',
    category: 'ap',
    field: 'languages',
    description:
        'Latin reading, translation, literary analysis, and Roman context.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-latin',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_spanish_lang',
    title: 'AP Spanish Language and Culture',
    category: 'ap',
    field: 'languages',
    description: 'Spanish communication and cultural understanding.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-spanish-language-and-culture',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_spanish_lit',
    title: 'AP Spanish Literature and Culture',
    category: 'ap',
    field: 'languages',
    description: 'Literary analysis of Spanish-language texts.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-spanish-literature-and-culture',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_research',
    title: 'AP Research',
    category: 'ap',
    field: 'research',
    description:
        'Yearlong independent research, academic paper, and presentation.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-research',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'capstone',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_seminar',
    title: 'AP Seminar',
    category: 'ap',
    field: 'research',
    description:
        'Evidence evaluation, collaborative inquiry, presentations, and end-of-course exam.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-seminar',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'capstone',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_business_finance',
    title: 'AP Business with Personal Finance',
    category: 'ap',
    field: 'business',
    description:
        'Business fundamentals, entrepreneurship, marketing, accounting, and personal finance.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-business-with-personal-finance',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'career',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),
  const Resource(
    id: 'ap_cybersecurity',
    title: 'AP Cybersecurity',
    category: 'ap',
    field: 'cs',
    description:
        'Risk analysis, layered mitigations, attack detection, and device security.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-cybersecurity',
    links: [
      'Official course page',
      'AP Classroom',
      'Official AP exam questions',
      'Khan Academy',
      'Albert AP practice',
      'Fiveable AP study guides',
      'AP CS Exam Prep : Test & Course Content',
      'Knowt AP Hub',
      'CrackAP practice questions',
    ],
    apSubCategory: 'career',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),

  // ===========================================================================
  // SAT PREPARATION
  // ===========================================================================
  const Resource(
    id: 'bluebook_tests',
    title: 'Bluebook Digital Practice Tests',
    category: 'sat',
    field: 'all',
    description:
        'The official College Board digital practice tests (Tests 4–10)',
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.menu_book,
    url: 'https://www.amazon.com/s?k=kaplan+sat+prep',
    links: ['Find on Amazon'],
  ),
  const Resource(
    id: 'desmos_sat_calculator',
    title: 'Desmos Digital SAT Calculator Practice',
    category: 'sat',
    field: 'math',
    description:
        'Practice with the same Desmos graphing-calculator environment provided for the digital SAT.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.calculate,
    url: 'https://www.desmos.com/testing/collegeboard/graphing',
    links: ['Desmos SAT calculator practice'],
  ),
  const Resource(
    id: 'knowt_sat_hub',
    title: 'Knowt SAT Hub',
    category: 'sat',
    field: 'all',
    description:
        'SAT notes, flashcards, and practice materials organized by test section.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.style,
    url: 'https://knowt.com/exams/SAT',
    links: ['Knowt SAT Hub'],
  ),

  // ===========================================================================
  // ACT PREPARATION
  // ===========================================================================
  const Resource(
    id: 'knowt_act',
    title: 'Knowt ACT Prep',
    category: 'act',
    field: 'all',
    description: 'AI-powered ACT practice with section-specific flashcard sets',
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.book,
    url: 'https://www.princetonreview.com/college/act-test-prep',
    links: ['Find on Amazon'],
  ),
  const Resource(
    id: 'act_english_res',
    title: 'ACT English: Grammar & Usage',
    category: 'act',
    field: 'all',
    description: 'Covers punctuation, grammar, usage, and sentence structure.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.edit,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/act-exam-sections-and-structure.html',
    links: [
      'act.org/content/act/en/products-and-services/the-act/test-preparation/english-test-description.html',
    ],
  ),
  const Resource(
    id: 'act_science_res',
    title: 'ACT Science: Data Interpretation',
    category: 'act',
    field: 'all',
    description:
        'ACT Science is about data interpretation and critical thinking.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.science,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/description-of-science-test.html',
    links: ['act.org/science', 'Kaplan ACT Science strategies'],
  ),
  const Resource(
    id: 'act_math_res',
    title: 'ACT Math: Full Prep',
    category: 'act',
    field: 'all',
    description: 'ACT Math covers pre-algebra through trigonometry.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.calculate,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/act-exam-sections-and-structure.html',
    links: ['khanacademy.org/act-math', 'Kaplan ACT Math'],
  ),
  const Resource(
    id: 'act_current_structure',
    title: 'Official ACT Sections and Structure',
    category: 'act',
    field: 'all',
    description:
        'Current official ACT timing, question counts, section coverage, and optional science and writing information.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.fact_check,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/act-exam-sections-and-structure.html',
    links: ['ACT exam sections and structure'],
  ),
  const Resource(
    id: 'act_free_practice_hub',
    title: 'Official ACT Free Practice and Prep',
    category: 'act',
    field: 'all',
    description:
        'Official practice quizzes, full-length practice tests, daily questions, answer keys, and test strategies.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.quiz,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/free-act-test-prep.html',
    links: ['ACT free practice and prep'],
  ),

  // ===========================================================================
  // RESEARCH PROGRAMS
  // ===========================================================================
  const Resource(
    id: 'rsi',
    title: 'RSI (Research Science Institute)',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
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
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.article,
    url: 'https://www.polygence.org',
    links: ['polygence.org', 'Browse mentors', 'Showcase past projects'],
  ),

  // ===========================================================================
  // INTERNSHIPS
  // ===========================================================================
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
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.business,
    url: 'https://stemgateway.nasa.gov',
    links: ['nasa.gov/careers/students', 'OSSI portal'],
  ),
];

// ===========================================================================
// DEADLINE MODEL
// ===========================================================================
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

  //autocomputed

  DateTime get _parsed {
    if (dateIso.isEmpty) {
      // No date set (TODO items), treat as far future so they sink to bottom
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

  /// Auto-calculated urgency, matches PersonalDeadline logic
  String get urgency {
    if (isTodo) return 'later';
    final d = daysUntil;
    if (d < 0) return 'past';
    if (d <= 30) return 'urgent';
    if (d <= 90) return 'soon';
    return 'later';
  }
}

// ===========================================================================
// GROUPED UPCOMING DEADLINE ITEMS
// ===========================================================================
const List<DeadlineItem> upcomingDeadlines = [
  // ===========================================================================
  // AP ASSESSMENTS
  // Exact 2027 subject dates are not yet published by College Board.
  // ===========================================================================
  DeadlineItem(
    title: 'AP 2-D Art and Design assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_2d_art',
  ),
  DeadlineItem(
    title: 'AP 3-D Art and Design assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_3d_art',
  ),
  DeadlineItem(
    title: 'AP Drawing assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_drawing',
  ),
  DeadlineItem(
    title: 'AP Art History assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_art_history',
  ),
  DeadlineItem(
    title: 'AP Music Theory assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_music_theory',
  ),
  DeadlineItem(
    title: 'AP English Language and Composition assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_english_lang',
  ),
  DeadlineItem(
    title: 'AP English Literature and Composition assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_english_lit',
  ),
  DeadlineItem(
    title: 'AP African American Studies assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_african_american',
  ),
  DeadlineItem(
    title: 'AP Comparative Government and Politics assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_comp_gov',
  ),
  DeadlineItem(
    title: 'AP European History assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_euro',
  ),
  DeadlineItem(
    title: 'AP Human Geography assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_human_geo',
  ),
  DeadlineItem(
    title: 'AP Macroeconomics assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_macro',
  ),
  DeadlineItem(
    title: 'AP Microeconomics assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_micro',
  ),
  DeadlineItem(
    title: 'AP Psychology assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_psych',
  ),
  DeadlineItem(
    title: 'AP United States Government and Politics assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_us_gov',
  ),
  DeadlineItem(
    title: 'AP United States History assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_us_history',
  ),
  DeadlineItem(
    title: 'AP World History: Modern assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_world',
  ),
  DeadlineItem(
    title: 'AP Calculus AB assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_calc_ab',
  ),
  DeadlineItem(
    title: 'AP Calculus BC assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_calc_bc',
  ),
  DeadlineItem(
    title: 'AP Computer Science A assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_csa',
  ),
  DeadlineItem(
    title: 'AP Computer Science Principles assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_csp',
  ),
  DeadlineItem(
    title: 'AP Precalculus assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_precalc',
  ),
  DeadlineItem(
    title: 'AP Statistics assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_stats',
  ),
  DeadlineItem(
    title: 'AP Biology assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_bio',
  ),
  DeadlineItem(
    title: 'AP Chemistry assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_chem',
  ),
  DeadlineItem(
    title: 'AP Environmental Science assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_env_sci',
  ),
  DeadlineItem(
    title: 'AP Physics 1: Algebra-Based assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_physics_1',
  ),
  DeadlineItem(
    title: 'AP Physics 2: Algebra-Based assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_physics_2',
  ),
  DeadlineItem(
    title: 'AP Physics C: Electricity and Magnetism assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_physics_c_em',
  ),
  DeadlineItem(
    title: 'AP Physics C: Mechanics assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_physics_c_mech',
  ),
  DeadlineItem(
    title: 'AP Chinese Language and Culture assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_chinese',
  ),
  DeadlineItem(
    title: 'AP French Language and Culture assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_french',
  ),
  DeadlineItem(
    title: 'AP German Language and Culture assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_german',
  ),
  DeadlineItem(
    title: 'AP Italian Language and Culture assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_italian',
  ),
  DeadlineItem(
    title: 'AP Japanese Language and Culture assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_japanese',
  ),
  DeadlineItem(
    title: 'AP Latin assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_latin',
  ),
  DeadlineItem(
    title: 'AP Spanish Language and Culture assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_spanish_lang',
  ),
  DeadlineItem(
    title: 'AP Spanish Literature and Culture assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_spanish_lit',
  ),
  DeadlineItem(
    title: 'AP Research assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_research',
  ),
  DeadlineItem(
    title: 'AP Seminar assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_seminar',
  ),
  DeadlineItem(
    title: 'AP Business with Personal Finance assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_business_finance',
  ),
  DeadlineItem(
    title: 'AP Cybersecurity assessment',
    date: 'TODO',
    dateIso: '',
    resourceId: 'ap_cybersecurity',
  ),

  // ===========================================================================
  // SAT REGISTRATION DEADLINES AND TEST DATES
  // ===========================================================================
  DeadlineItem(
    title: 'August 2026 SAT registration deadline',
    date: 'Aug 7, 2026 at 11:59 PM ET',
    dateIso: '2026-08-07T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'August 2026 SAT',
    date: 'Aug 22, 2026',
    dateIso: '2026-08-22T08:00:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'September 2026 SAT registration deadline',
    date: 'Aug 28, 2026 at 11:59 PM ET',
    dateIso: '2026-08-28T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'September 2026 SAT',
    date: 'Sep 12, 2026',
    dateIso: '2026-09-12T08:00:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'October 2026 SAT registration deadline',
    date: 'Sep 18, 2026 at 11:59 PM ET',
    dateIso: '2026-09-18T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'October 2026 SAT',
    date: 'Oct 3, 2026',
    dateIso: '2026-10-03T08:00:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'November 2026 SAT registration deadline',
    date: 'Oct 23, 2026 at 11:59 PM ET',
    dateIso: '2026-10-23T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'November 2026 SAT',
    date: 'Nov 7, 2026',
    dateIso: '2026-11-07T08:00:00-05:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'December 2026 SAT registration deadline',
    date: 'Nov 20, 2026 at 11:59 PM ET',
    dateIso: '2026-11-20T23:59:00-05:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'December 2026 SAT',
    date: 'Dec 5, 2026',
    dateIso: '2026-12-05T08:00:00-05:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'March 2027 SAT registration deadline',
    date: 'Feb 19, 2027 at 11:59 PM ET',
    dateIso: '2027-02-19T23:59:00-05:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'March 2027 SAT',
    date: 'Mar 6, 2027',
    dateIso: '2027-03-06T08:00:00-05:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'May 2027 SAT registration deadline',
    date: 'Apr 16, 2027 at 11:59 PM ET',
    dateIso: '2027-04-16T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'May 2027 SAT',
    date: 'May 1, 2027',
    dateIso: '2027-05-01T08:00:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'June 2027 SAT registration deadline',
    date: 'May 21, 2027 at 11:59 PM ET',
    dateIso: '2027-05-21T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'June 2027 SAT',
    date: 'Jun 5, 2027',
    dateIso: '2027-06-05T08:00:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),

  // ===========================================================================
  // ACT REGISTRATION DEADLINES AND TEST DATES
  // ===========================================================================
  DeadlineItem(
    title: 'September 2026 ACT registration deadline',
    date: 'Aug 14, 2026',
    dateIso: '2026-08-14T23:59:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'September 2026 ACT',
    date: 'Sep 19, 2026',
    dateIso: '2026-09-19T08:00:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'October 2026 ACT registration deadline',
    date: 'Sep 11, 2026',
    dateIso: '2026-09-11T23:59:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'October 2026 ACT',
    date: 'Oct 17, 2026',
    dateIso: '2026-10-17T08:00:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'December 2026 ACT registration deadline',
    date: 'Nov 6, 2026',
    dateIso: '2026-11-06T23:59:00-06:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'December 2026 ACT',
    date: 'Dec 12, 2026',
    dateIso: '2026-12-12T08:00:00-06:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'February 2027 ACT registration deadline',
    date: 'Jan 22, 2027',
    dateIso: '2027-01-22T23:59:00-06:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'February 2027 ACT',
    date: 'Feb 27, 2027',
    dateIso: '2027-02-27T08:00:00-06:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'April 2027 ACT registration deadline',
    date: 'Mar 5, 2027',
    dateIso: '2027-03-05T23:59:00-06:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'April 2027 ACT',
    date: 'Apr 10, 2027',
    dateIso: '2027-04-10T08:00:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'June 2027 ACT registration deadline',
    date: 'May 7, 2027',
    dateIso: '2027-05-07T23:59:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'June 2027 ACT',
    date: 'Jun 12, 2027',
    dateIso: '2027-06-12T08:00:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'July 2027 ACT registration deadline',
    date: 'Jun 4, 2027',
    dateIso: '2027-06-04T23:59:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'July 2027 ACT',
    date: 'Jul 10, 2027',
    dateIso: '2027-07-10T08:00:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),

  // ===========================================================================
  // COMPETITION DEADLINES
  // ===========================================================================
  DeadlineItem(
    title: 'Breakthrough Junior Challenge',
    date: 'September 15, 2026 at 11:59 PM PDT',
    dateIso: '2026-09-15T23:59:00-07:00',
    resourceId: 'breakthrough_junior',
    majorTags: ['biology', 'physics', 'math', 'science_communication'],
  ),
  DeadlineItem(
    title: 'AMC 10 / AMC 12',
    date: 'September 30, 2026 (early registration)',
    dateIso: '2026-09-30T23:59:00-04:00',
    resourceId: 'amc',
    majorTags: ['math', 'problem_solving', 'logic'],
  ),
  DeadlineItem(
    title: 'AFA CyberPatriot 19',
    date: 'October 1, 2026 (team registration)',
    dateIso: '2026-10-01T23:59:00-04:00',
    resourceId: 'cyberpatriot_afa',
    majorTags: ['cybersecurity', 'cs', 'networking', 'linux'],
  ),
  DeadlineItem(
    title: 'StellarXplorers Space Design Competition',
    date: 'October 14, 2026 (team registration)',
    dateIso: '2026-10-14T23:59:00-04:00',
    resourceId: 'stellarxplorers',
    majorTags: ['aerospace', 'physics', 'engineering', 'applied_math'],
  ),
  DeadlineItem(
    title: 'AMC 8',
    date: 'October 28, 2026 (early registration)',
    dateIso: '2026-10-28T23:59:00-04:00',
    resourceId: 'amc8',
    majorTags: ['math', 'problem_solving', 'logic'],
  ),
  DeadlineItem(
    title: 'C-SPAN StudentCam 2027',
    date: 'January 20, 2027',
    dateIso: '2027-01-20T23:59:00-05:00',
    resourceId: 'studentcam',
    majorTags: ['film_prod', 'documentary', 'civics', 'journalism_media'],
  ),

  // ===========================================================================
  // RESEARCH DEADLINES
  // ===========================================================================
  // No verified upcoming research deadline is currently available.

  // ===========================================================================
  // INTERNSHIP DEADLINES
  // ===========================================================================
  // No verified upcoming internship deadline is currently available.
];

// ===========================================================================
// HELPER FUNCTIONS
// ===========================================================================
// ===========================================================================
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
