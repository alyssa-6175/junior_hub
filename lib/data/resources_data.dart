import 'package:flutter/material.dart';
import '../models/resource.dart';

// mapping url links
const Map<String, String> kLinkUrls = {
  'Email info@kirklandchamber.org': 'mailto:info@kirklandchamber.org',
  'Knowt AP Hub': 'https://knowt.com/ap',
  'CrackAP practice questions': 'https://www.crackap.com/index.html',
  // Course-specific AP resources
  'AP Art History Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-art-history',
  'AP Art History AP Classroom': 'https://myap.collegeboard.org/',
  'AP Art History Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-art-history/exam',
  'AP Art History Khan Academy':
      'https://www.khanacademy.org/humanities/ap-art-history',
  'AP Art History Fiveable Study Guides': 'https://fiveable.me/ap-art-history',
  'AP Art History Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Art-History',
  'AP Art History CrackAP Practice Questions':
      'https://www.crackap.com/ap/art-history/',
  'AP Music Theory Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-music-theory',
  'AP Music Theory AP Classroom': 'https://myap.collegeboard.org/',
  'AP Music Theory Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-music-theory/exam',
  'AP Music Theory Fiveable Study Guides':
      'https://fiveable.me/ap-music-theory',
  'AP Music Theory Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Music-Theory',
  'AP English Language and Composition Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-english-language-and-composition',
  'AP English Language and Composition AP Classroom':
      'https://myap.collegeboard.org/',
  'AP English Language and Composition Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-english-language-and-composition/exam',
  'AP English Language and Composition Fiveable Study Guides':
      'https://fiveable.me/ap-lang',
  'AP English Language and Composition Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-English-Language-and-Composition',
  'AP English Language and Composition CrackAP Practice Questions':
      'https://www.crackap.com/ap/english-language-and-composition/',
  'AP English Literature and Composition Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-english-literature-and-composition',
  'AP English Literature and Composition AP Classroom':
      'https://myap.collegeboard.org/',
  'AP English Literature and Composition Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-english-literature-and-composition/exam',
  'AP English Literature and Composition Fiveable Study Guides':
      'https://fiveable.me/ap-lit',
  'AP English Literature and Composition Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-English-Literature-and-Composition',
  'AP English Literature and Composition CrackAP Practice Questions':
      'https://www.crackap.com/ap/english-literature-and-composition/',
  'AP African American Studies Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-african-american-studies',
  'AP African American Studies AP Classroom': 'https://myap.collegeboard.org/',
  'AP African American Studies Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-african-american-studies/exam',
  'AP African American Studies Fiveable Study Guides':
      'https://fiveable.me/ap-african-american-studies',
  'AP African American Studies Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-African-American-Studies',
  'AP Comparative Government and Politics Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-comparative-government-and-politics',
  'AP Comparative Government and Politics AP Classroom':
      'https://myap.collegeboard.org/',
  'AP Comparative Government and Politics Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-comparative-government-and-politics/exam',
  'AP Comparative Government and Politics Fiveable Study Guides':
      'https://fiveable.me/ap-comp-gov',
  'AP Comparative Government and Politics Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Comparative-Government-and-Politics',
  'AP Comparative Government and Politics CrackAP Practice Questions':
      'https://www.crackap.com/ap/comparative-government-and-politics/',
  'AP European History Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-european-history',
  'AP European History AP Classroom': 'https://myap.collegeboard.org/',
  'AP European History Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-european-history/exam',
  'AP European History Fiveable Study Guides': 'https://fiveable.me/ap-euro',
  'AP European History Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-European-History',
  'AP European History CrackAP Practice Questions':
      'https://www.crackap.com/ap/european-history/',
  'AP Human Geography Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-human-geography',
  'AP Human Geography AP Classroom': 'https://myap.collegeboard.org/',
  'AP Human Geography Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-human-geography/exam',
  'AP Human Geography Fiveable Study Guides': 'https://fiveable.me/ap-hug',
  'AP Human Geography Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Human-Geography',
  'AP Human Geography CrackAP Practice Questions':
      'https://www.crackap.com/ap/human-geography/',
  'AP Macroeconomics Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-macroeconomics',
  'AP Macroeconomics AP Classroom': 'https://myap.collegeboard.org/',
  'AP Macroeconomics Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-macroeconomics/exam',
  'AP Macroeconomics Khan Academy':
      'https://www.khanacademy.org/economics-finance-domain/ap-macroeconomics',
  'AP Macroeconomics Fiveable Study Guides': 'https://fiveable.me/ap-macro',
  'AP Macroeconomics Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Macroeconomics',
  'AP Macroeconomics CrackAP Practice Questions':
      'https://www.crackap.com/ap/macroeconomics/',
  'AP Microeconomics Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-microeconomics',
  'AP Microeconomics AP Classroom': 'https://myap.collegeboard.org/',
  'AP Microeconomics Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-microeconomics/exam',
  'AP Microeconomics Khan Academy':
      'https://www.khanacademy.org/economics-finance-domain/ap-microeconomics',
  'AP Microeconomics Fiveable Study Guides': 'https://fiveable.me/ap-micro',
  'AP Microeconomics Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Microeconomics',
  'AP Microeconomics CrackAP Practice Questions':
      'https://www.crackap.com/ap/microeconomics/',
  'AP Psychology Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-psychology',
  'AP Psychology AP Classroom': 'https://myap.collegeboard.org/',
  'AP Psychology Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-psychology/exam',
  'AP Psychology Fiveable Study Guides': 'https://fiveable.me/ap-psych-revised',
  'AP Psychology Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Psychology',
  'AP Psychology CrackAP Practice Questions':
      'https://www.crackap.com/ap/psychology/',
  'AP United States Government and Politics Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-united-states-government-and-politics',
  'AP United States Government and Politics AP Classroom':
      'https://myap.collegeboard.org/',
  'AP United States Government and Politics Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-united-states-government-and-politics/exam',
  'AP United States Government and Politics Khan Academy':
      'https://www.khanacademy.org/humanities/ap-us-government-and-politics',
  'AP United States Government and Politics Fiveable Study Guides':
      'https://fiveable.me/ap-gov',
  'AP United States Government and Politics Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-United-States-Government-and-Politics',
  'AP United States Government and Politics CrackAP Practice Questions':
      'https://www.crackap.com/ap/us-government-and-politics/',
  'AP United States History Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-united-states-history',
  'AP United States History AP Classroom': 'https://myap.collegeboard.org/',
  'AP United States History Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-united-states-history/exam',
  'AP United States History Khan Academy':
      'https://www.khanacademy.org/humanities/ap-us-history',
  'AP United States History Fiveable Study Guides': 'https://fiveable.me/apush',
  'AP United States History Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-United-States-History',
  'AP United States History CrackAP Practice Questions':
      'https://www.crackap.com/ap/us-history/',
  'AP World History: Modern Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-world-history-modern',
  'AP World History: Modern AP Classroom': 'https://myap.collegeboard.org/',
  'AP World History: Modern Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-world-history-modern/exam',
  'AP World History: Modern Khan Academy':
      'https://www.khanacademy.org/humanities/world-history-project-ap',
  'AP World History: Modern Fiveable Study Guides':
      'https://fiveable.me/ap-world',
  'AP World History: Modern Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-World-History_Modern',
  'AP World History: Modern CrackAP Practice Questions':
      'https://www.crackap.com/ap/world-history/',
  'AP Calculus AB Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-calculus-ab',
  'AP Calculus AB AP Classroom': 'https://myap.collegeboard.org/',
  'AP Calculus AB Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-calculus-ab/exam',
  'AP Calculus AB Khan Academy':
      'https://www.khanacademy.org/math/ap-calculus-ab',
  'AP Calculus AB Fiveable Study Guides': 'https://fiveable.me/ap-calc',
  'AP Calculus AB Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Calculus-AB',
  'AP Calculus AB CrackAP Practice Questions':
      'https://www.crackap.com/ap/calculus-ab/',
  'AP Calculus BC Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-calculus-bc',
  'AP Calculus BC AP Classroom': 'https://myap.collegeboard.org/',
  'AP Calculus BC Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-calculus-bc/exam',
  'AP Calculus BC Khan Academy':
      'https://www.khanacademy.org/math/ap-calculus-bc',
  'AP Calculus BC Fiveable Study Guides': 'https://fiveable.me/ap-calc',
  'AP Calculus BC Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Calculus-BC',
  'AP Calculus BC CrackAP Practice Questions':
      'https://www.crackap.com/ap/calculus-bc/',
  'AP Computer Science A Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-computer-science-a',
  'AP Computer Science A AP Classroom': 'https://myap.collegeboard.org/',
  'AP Computer Science A Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-computer-science-a/exam',
  'AP Computer Science A Fiveable Study Guides':
      'https://fiveable.me/ap-comp-sci-a',
  'AP Computer Science A Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Computer-Science-A',
  'AP Computer Science A CrackAP Practice Questions':
      'https://www.crackap.com/ap/computer-science-a/',
  'AP Computer Science A AP CS Exam Prep: Test and Course Content':
      'https://www.apcsexamprep.com/',
  'APCS Exam Prep': 'https://www.apcsexamprep.com/',
  'AP Computer Science A CodingBat Java Practice': 'https://codingbat.com/java',
  'AP Computer Science Principles Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-computer-science-principles',
  'AP Computer Science Principles AP Classroom':
      'https://myap.collegeboard.org/',
  'AP Computer Science Principles Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-computer-science-principles/exam',
  'AP Computer Science Principles Khan Academy':
      'https://www.khanacademy.org/computing/ap-computer-science-principles',
  'AP Computer Science Principles Fiveable Study Guides':
      'https://fiveable.me/ap-comp-sci-p',
  'AP Computer Science Principles Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Computer-Science-Principles',
  'AP Computer Science Principles CrackAP Practice Questions':
      'https://www.crackap.com/ap/computer-science-principles/',
  'AP Computer Science Principles AP CS Exam Prep: Test and Course Content':
      'https://www.apcsexamprep.com/',
  'AP Computer Science Principles Code.org Curriculum':
      'https://code.org/en-US/curriculum/computer-science-principles',
  'AP Precalculus Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-precalculus',
  'AP Precalculus AP Classroom': 'https://myap.collegeboard.org/',
  'AP Precalculus Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-precalculus/exam',
  'AP Precalculus Fiveable Study Guides': 'https://fiveable.me/ap-pre-calc',
  'AP Precalculus Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Precalculus',
  'AP Statistics Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-statistics',
  'AP Statistics AP Classroom': 'https://myap.collegeboard.org/',
  'AP Statistics Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-statistics/exam',
  'AP Statistics Khan Academy':
      'https://www.khanacademy.org/math/ap-statistics',
  'AP Statistics Fiveable Study Guides': 'https://fiveable.me/ap-stats',
  'AP Statistics Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Statistics',
  'AP Statistics CrackAP Practice Questions':
      'https://www.crackap.com/ap/statistics/',
  'AP Biology Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-biology',
  'AP Biology AP Classroom': 'https://myap.collegeboard.org/',
  'AP Biology Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-biology/exam',
  'AP Biology Khan Academy': 'https://www.khanacademy.org/science/ap-biology',
  'AP Biology Fiveable Study Guides': 'https://fiveable.me/ap-bio',
  'AP Biology Knowt Study Guides': 'https://knowt.com/exams/AP/AP-Biology',
  'AP Biology CrackAP Practice Questions':
      'https://www.crackap.com/ap/biology/',
  'AP Chemistry Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-chemistry',
  'AP Chemistry AP Classroom': 'https://myap.collegeboard.org/',
  'AP Chemistry Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-chemistry/exam',
  'AP Chemistry Khan Academy':
      'https://www.khanacademy.org/science/ap-chemistry-beta',
  'AP Chemistry Fiveable Study Guides': 'https://fiveable.me/ap-chem',
  'AP Chemistry Knowt Study Guides': 'https://knowt.com/exams/AP/AP-Chemistry',
  'AP Chemistry CrackAP Practice Questions':
      'https://www.crackap.com/ap/chemistry/',
  'AP Environmental Science Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-environmental-science',
  'AP Environmental Science AP Classroom': 'https://myap.collegeboard.org/',
  'AP Environmental Science Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-environmental-science/exam',
  'AP Environmental Science Khan Academy':
      'https://www.khanacademy.org/science/ap-college-environmental-science',
  'AP Environmental Science Fiveable Study Guides':
      'https://fiveable.me/ap-enviro',
  'AP Environmental Science Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Environmental-Science',
  'AP Environmental Science CrackAP Practice Questions':
      'https://www.crackap.com/ap/environmental-science/',
  'AP Physics 1: Algebra-Based Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-physics-1',
  'AP Physics 1: Algebra-Based AP Classroom': 'https://myap.collegeboard.org/',
  'AP Physics 1: Algebra-Based Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-physics-1/exam',
  'AP Physics 1: Algebra-Based Khan Academy':
      'https://www.khanacademy.org/science/ap-physics-1',
  'AP Physics 1: Algebra-Based Fiveable Study Guides':
      'https://fiveable.me/ap-physics-1-revised',
  'AP Physics 1: Algebra-Based Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Physics-1_Algebra.Based',
  'AP Physics 1: Algebra-Based CrackAP Practice Questions':
      'https://www.crackap.com/ap/physics-1/',
  'AP Physics 2: Algebra-Based Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-physics-2',
  'AP Physics 2: Algebra-Based AP Classroom': 'https://myap.collegeboard.org/',
  'AP Physics 2: Algebra-Based Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-physics-2/exam',
  'AP Physics 2: Algebra-Based Khan Academy':
      'https://www.khanacademy.org/science/ap-physics-2',
  'AP Physics 2: Algebra-Based Fiveable Study Guides':
      'https://fiveable.me/ap-physics-2-revised',
  'AP Physics 2: Algebra-Based Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Physics-2_Algebra.Based',
  'AP Physics 2: Algebra-Based CrackAP Practice Questions':
      'https://www.crackap.com/ap/physics-2/',
  'AP Physics C: Electricity and Magnetism Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-physics-c-electricity-and-magnetism',
  'AP Physics C: Electricity and Magnetism AP Classroom':
      'https://myap.collegeboard.org/',
  'AP Physics C: Electricity and Magnetism Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-physics-c-electricity-and-magnetism/exam',
  'AP Physics C: Electricity and Magnetism Fiveable Study Guides':
      'https://fiveable.me/ap-physics-c-e-m',
  'AP Physics C: Electricity and Magnetism Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Physics-C_Electricity-and-Magnetism',
  'AP Physics C: Electricity and Magnetism CrackAP Practice Questions':
      'https://www.crackap.com/ap/physics-c-electricity-and-magnetism/',
  'AP Physics C: Mechanics Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-physics-c-mechanics',
  'AP Physics C: Mechanics AP Classroom': 'https://myap.collegeboard.org/',
  'AP Physics C: Mechanics Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-physics-c-mechanics/exam',
  'AP Physics C: Mechanics Fiveable Study Guides':
      'https://fiveable.me/ap-physics-c-mechanics',
  'AP Physics C: Mechanics Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Physics-C_Mechanics',
  'AP Physics C: Mechanics CrackAP Practice Questions':
      'https://www.crackap.com/ap/physics-c-mechanics/',
  'AP Chinese Language and Culture Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-chinese-language-and-culture',
  'AP Chinese Language and Culture AP Classroom':
      'https://myap.collegeboard.org/',
  'AP Chinese Language and Culture Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-chinese-language-and-culture/exam',
  'AP Chinese Language and Culture Fiveable Study Guides':
      'https://fiveable.me/ap-chinese',
  'AP Chinese Language and Culture Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Chinese-Language-and-Culture',
  'AP French Language and Culture Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-french-language-and-culture',
  'AP French Language and Culture AP Classroom':
      'https://myap.collegeboard.org/',
  'AP French Language and Culture Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-french-language-and-culture/exam',
  'AP French Language and Culture Fiveable Study Guides':
      'https://fiveable.me/ap-french',
  'AP French Language and Culture Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-French-Language-and-Culture',
  'AP German Language and Culture Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-german-language-and-culture',
  'AP German Language and Culture AP Classroom':
      'https://myap.collegeboard.org/',
  'AP German Language and Culture Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-german-language-and-culture/exam',
  'AP German Language and Culture Fiveable Study Guides':
      'https://fiveable.me/ap-german',
  'AP German Language and Culture Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-German-Language-and-Culture',
  'AP Italian Language and Culture Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-italian-language-and-culture',
  'AP Italian Language and Culture AP Classroom':
      'https://myap.collegeboard.org/',
  'AP Italian Language and Culture Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-italian-language-and-culture/exam',
  'AP Italian Language and Culture Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Italian-Language-and-Culture',
  'AP Japanese Language and Culture Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-japanese-language-and-culture',
  'AP Japanese Language and Culture AP Classroom':
      'https://myap.collegeboard.org/',
  'AP Japanese Language and Culture Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-japanese-language-and-culture/exam',
  'AP Japanese Language and Culture Fiveable Study Guides':
      'https://fiveable.me/ap-japanese',
  'AP Japanese Language and Culture Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Japanese-Language-and-Culture',
  'AP Latin Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-latin',
  'AP Latin AP Classroom': 'https://myap.collegeboard.org/',
  'AP Latin Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-latin/exam',
  'AP Latin Fiveable Study Guides': 'https://fiveable.me/ap-latin',
  'AP Latin Knowt Study Guides': 'https://knowt.com/exams/AP/AP-Latin',
  'AP Spanish Language and Culture Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-spanish-language-and-culture',
  'AP Spanish Language and Culture AP Classroom':
      'https://myap.collegeboard.org/',
  'AP Spanish Language and Culture Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-spanish-language-and-culture/exam',
  'AP Spanish Language and Culture Fiveable Study Guides':
      'https://fiveable.me/ap-spanish-lang',
  'AP Spanish Language and Culture Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Spanish-Language-and-Culture',
  'AP Spanish Language and Culture CrackAP Practice Questions':
      'https://www.crackap.com/ap/spanish-language-culture/',
  'AP Spanish Literature and Culture Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-spanish-literature-and-culture',
  'AP Spanish Literature and Culture AP Classroom':
      'https://myap.collegeboard.org/',
  'AP Spanish Literature and Culture Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-spanish-literature-and-culture/exam',
  'AP Spanish Literature and Culture Fiveable Study Guides':
      'https://fiveable.me/ap-spanish-lit',
  'AP Spanish Literature and Culture Knowt Study Guides':
      'https://knowt.com/exams/AP/AP-Spanish-Literature-and-Culture',
  'AP Business with Personal Finance Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-business-with-personal-finance',
  'AP Business with Personal Finance AP Classroom':
      'https://myap.collegeboard.org/',
  'AP Business with Personal Finance Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-business-personal-finance/exam',
  'AP Cybersecurity Official Course Page':
      'https://apstudents.collegeboard.org/courses/ap-cybersecurity',
  'AP Cybersecurity AP Classroom': 'https://myap.collegeboard.org/',
  'AP Cybersecurity Official Exam Page':
      'https://apcentral.collegeboard.org/courses/ap-cybersecurity/exam',
  'AP Cybersecurity AP CS Exam Prep: Test and Course Content':
      'https://www.apcsexamprep.com/',
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
  'AP CS Exam Prep : Test & Course Content': 'https://www.apcsexamprep.com/',
  'Khan Academy': 'https://www.khanacademy.org/',
  'Albert AP practice': 'https://www.albert.io/subjects/high-school/ap',
  'Fiveable AP study guides': 'https://fiveable.me/',
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
Resource _competition({
  required String id,
  required String title,
  required String field,
  required String scope,
  required String format,
  required String locationNote,
  required List<String> majorTags,
  required String applicationInfo,
  required String description,
  required String url,
  String? deadline,
  String? deadlineIso,
  String? detailNote,
  String timeCommitment = 'Check the current competition cycle',
  IconData icon = Icons.emoji_events,
}) => Resource(
  id: id,
  title: title,
  category: 'competition',
  field: field,
  scope: scope,
  format: format,
  locationNote: locationNote,
  timeCommitment: timeCommitment,
  majorTags: majorTags,
  applicationInfo: applicationInfo,
  description: description,
  deadline: deadline,
  deadlineIso: deadlineIso,
  icon: icon,
  url: url,
  links: [title],
  detailNote: detailNote ??
      'Dates and eligibility can change between cycles, so confirm the current rules on the official site',
);

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
    description:
        'Solve algorithmic programming problems at your own level, then move from Bronze through Platinum as your speed and technique improve',
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
        'Take on 25 inventive math problems in 75 minutes, with strong scores opening the path to AIME and the USA mathematical olympiads',
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
        'A fast, approachable 25-question contest that rewards creative problem solving for students in grade 8 and below',
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
        'Create an original app, explain the problem it solves, and submit it to the competition run by your congressional district',
    deadline: 'October 26, 2026 at 12:00 PM ET',
    deadlineIso: '2026-10-26T12:00:00-04:00',
    icon: Icons.emoji_events,
    url: 'https://www.congressionalappchallenge.us/',
    links: ['Congressional App Challenge'],
    detailNote:
        'Students may compete individually or in teams of up to four through a participating congressional district',
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
        'Work with a team to find vulnerabilities, harden virtual systems, and keep services running during timed cyber defense rounds',
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
        'Build a thoughtful investment strategy for a real client, track a simulated portfolio, and defend your decisions in a final report',
    deadline: 'September 11, 2026 at 5:00 PM ET',
    deadlineIso: '2026-09-11T17:00:00-04:00',
    icon: Icons.trending_up,
    url:
        'https://globalyouth.wharton.upenn.edu/competitions/investment-competition/register-now/',
    links: ['Wharton registration'],
    detailNote:
        'Registration for the 2026–27 competition closes at 5:00 PM Eastern Time',
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
        'Turn a difficult idea in science or math into a clear, creative two-minute video that a curious student could actually understand',
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
        'Use aerospace software and teamwork to solve realistic orbit planning, satellite design, and launch operations scenarios',
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
        'Tell a focused civic story in a short documentary that combines your own reporting with relevant C-SPAN footage',
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
        'Prepare with a school team for a mix of lab work, engineering builds, and rapid-fire knowledge events across the sciences',
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
        'Test your depth in biology through a national exam series that ultimately selects the U.S. team for the International Biology Olympiad',
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
        'Combine economic theory with current events as your team works through microeconomics, macroeconomics, and a case analysis',
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
        'Research a real economic question, make sense of monetary policy, and present your conclusions to economists in your Federal Reserve district',
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
        'Race another team to answer questions in biology, chemistry, physics, math, Earth science, and energy',
    deadline: 'November 23, 2026 at 11:59 PM local time',
    deadlineIso: '2026-11-23T23:59:00-08:00',
    icon: Icons.science,
    url: 'https://science.osti.gov/wdts/nsb',
    links: ['National Science Bowl'],
    detailNote:
        'Registration opens October 5 at noon Eastern. An approved school must submit Team 1 by November 23 to keep its reserved regional spot',
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
        'Crack unfamiliar language patterns using logic and careful observation, with no prior linguistics or second-language experience required',
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
        'Move from a local chemistry exam to national rounds and, for the top students, a chance to join the U.S. International Chemistry Olympiad team',
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
        'Solve a demanding set of mechanics problems under time pressure, with top scorers advancing to the U.S. Physics Olympiad exam',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.calculate,
    url: 'https://www.aapt.org/physicsteam/',
    links: ['AAPT U.S. Physics Team'],
    detailNote:
        'The 2026 cycle has passed, and the next registration deadline is not yet published.',
  ),

  const Resource(
    id: 'first_robotics',
    title: 'FIRST Robotics Competition',
    category: 'competition',
    field: 'engineering',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Local teams compete at regional and district events',
    timeCommitment: 'Full build season plus competitions',
    majorTags: ['engineering', 'robotics', 'cs', 'business'],
    applicationInfo:
        'Join an existing team or start one with adult mentors through FIRST',
    description:
        'Design, program, and build a full-size competition robot with a team, then test it in fast-paced alliance matches',
    deadline: 'November 17, 2026 (event registration)',
    deadlineIso: '2026-11-17T12:00:00-05:00',
    icon: Icons.precision_manufacturing,
    url: 'https://www.firstinspires.org/programs/frc/',
    links: ['FIRST Robotics Competition', '2027 season materials'],
    detailNote:
        'The 2027 game launches January 9, 2027, and individual team signup timing may vary',
  ),
  const Resource(
    id: 'national_history_day',
    title: 'National History Day',
    category: 'competition',
    field: 'humanities',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Local and affiliate contests lead to the national contest',
    timeCommitment: 'Long-term research project plus contest presentations',
    majorTags: ['history', 'research', 'english', 'digital_media'],
    applicationInfo:
        'Start through your school or local affiliate and follow its registration calendar',
    description:
        'Choose a historical question you care about, research original sources, and present your argument as a paper, exhibit, performance, documentary, or website',
    icon: Icons.history_edu,
    url: 'https://nhd.org/en/contest/',
    links: ['National History Day contest', 'Find a local affiliate'],
    detailNote:
        'Local deadlines vary because students advance through affiliate contests before nationals',
  ),
  const Resource(
    id: 'regeneron_isef',
    title: 'Regeneron International Science and Engineering Fair',
    category: 'competition',
    field: 'science',
    scope: 'international',
    format: 'in_person',
    locationNote:
        'Qualify through an affiliated local, regional, or state fair',
    timeCommitment: 'Independent research project plus qualifying fairs',
    majorTags: ['science', 'engineering', 'research', 'cs', 'math'],
    applicationInfo:
        'Students in grades 9 through 12 must first qualify through a Society-affiliated fair',
    description:
        'Turn an original research or engineering project into a competition entry and advance through an affiliated fair to reach ISEF',
    icon: Icons.biotech,
    url: 'https://www.societyforscience.org/isef/',
    links: ['Regeneron ISEF', 'Find an affiliated fair', 'ISEF rules'],
    detailNote:
        'Affiliated-fair calendars differ, so begin with the fair serving your school or region',
  ),
  const Resource(
    id: 'regeneron_sts',
    title: 'Regeneron Science Talent Search 2027',
    category: 'competition',
    field: 'science',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online application with finals in Washington, DC',
    timeCommitment: 'Independent research paper and a detailed application',
    majorTags: ['science', 'research', 'engineering', 'cs', 'math'],
    applicationInfo:
        'Open to eligible students in their final year of secondary school with individual research',
    description:
        'Present a substantial independent research project through a paper, essays, recommendations, and a holistic application',
    deadline: 'November 5, 2026 at 8:00 PM ET',
    deadlineIso: '2026-11-05T20:00:00-05:00',
    icon: Icons.science,
    url: 'https://www.societyforscience.org/regeneron-sts/',
    links: ['Regeneron STS', '2027 application requirements'],
    detailNote:
        'The technical support deadline is November 4, so the program recommends submitting before the final day',
  ),
  const Resource(
    id: 'diamond_challenge',
    title: 'Diamond Challenge',
    category: 'competition',
    field: 'business',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'Online submission with live or virtual pitch rounds',
    timeCommitment: 'Several months to build and pitch a venture concept',
    majorTags: ['business', 'entrepreneurship', 'social_impact', 'innovation'],
    applicationInfo:
        'Teams of two to four students ages 14 to 18 enter with an adult advisor and choose a business or social innovation track',
    description:
        'Turn a business or social-impact idea into a tested venture concept, written submission, and competition pitch',
    deadline: 'January 14, 2027 at 5:00 PM ET',
    deadlineIso: '2027-01-14T17:00:00-05:00',
    icon: Icons.diamond_outlined,
    url: 'https://diamondchallenge.org/competition/',
    links: ['Diamond Challenge competition', '2027 timeline and rules'],
  ),
  const Resource(
    id: 'blue_ocean_competition',
    title: 'Blue Ocean Student Entrepreneur Competition',
    category: 'competition',
    field: 'business',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online pitch submission',
    timeCommitment: 'Self-paced venture design and a short video pitch',
    majorTags: ['business', 'entrepreneurship', 'innovation', 'marketing'],
    applicationInfo:
        'High school students may register for the 2027 competition and compete from anywhere',
    description:
        'Design an original business idea around an unmet need and explain the strategy in a concise virtual pitch',
    deadline: 'February 21, 2027 at 11:59 PM local time',
    deadlineIso: '2027-02-21T23:59:00-08:00',
    icon: Icons.waves_outlined,
    url: 'https://blueoceancompetition.org/compete/',
    links: ['Blue Ocean competition', '2027 competition timeline'],
    detailNote:
        'The submission deadline follows the student’s local time zone',
  ),
  const Resource(
    id: 'technovation_girls',
    title: 'Technovation Girls',
    category: 'competition',
    field: 'cs',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Global program with online curriculum and local chapters',
    timeCommitment: 'Season runs from roughly August through May',
    majorTags: ['cs', 'ai', 'app_dev', 'entrepreneurship', 'social_impact'],
    applicationInfo:
        'Free for girls and students who identify in a female-centered environment, ages 8 to 18; participants may work in teams',
    description:
        'Build an app or AI-based solution to a community problem, then pair the technology with a business plan and pitch',
    icon: Icons.phone_android_outlined,
    url: 'https://technovationchallenge.org/get-involved/students/',
    links: ['Technovation Girls student page', '2026–2027 season updates'],
    detailNote:
        'Student registration for the new season was not open when checked, so use the official notification form for updates',
  ),

  // ORIGINAL COMMENTED-OUT SUMMER AND SEASONAL COMPETITIONS
  // Kept for future date verification and reactivation.
  // const Resource(
  // SUMMER ONLY, CHECK BACK LATER FOR 2027
  //   id: 'citadel_terminal',
  //   title: 'Citadel High School Terminal Competition',
  //   category: 'competition',
  //   field: 'cs',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online',
  //   timeCommitment: '1 competition day (7 hrs)',
  //   majorTags: ['cs', 'data_sci', 'ai', 'applied_math', 'statistics'],
  //   applicationInfo:
  //       'Apply at citadel.com. Teams of 1-4. Algorithmic coding in Python.',
  //   description:
  //       'Citadel\'s Terminal competition challenges students to build an algorithmic trading strategy in Python.',
  //   deadline: 'Rolling (multiple per year)',
  //   deadlineIso: '2026-12-31T23:59:00Z',
  //   icon: Icons.emoji_events,
  //   url: 'https://terminal.c1games.com',
  //   links: ['terminal.c1games.com', 'Python algorithmic strategy'],
  // ),
  // const Resource(
  // ALSO SUMMER
  //   id: 'nyas_junior_academy',
  //   title: 'NYAS The Junior Academy',
  //   category: 'competition',
  //   field: 'science',
  //   scope: 'international',
  //   format: 'virtual',
  //   locationNote: 'Online collaboration + virtual presentations',
  //   timeCommitment: '~6 months (Nov-May)',
  //   majorTags: ['biology', 'cs', 'innovation', 'env_sci', 'neuroscience'],
  //   applicationInfo: 'Apply at juniorsacademy.org. Free for accepted students.',
  //   description:
  //       'The New York Academy of Sciences\' selective global STEM program.',
  //   deadline: 'Nov 2025 (application)',
  //   deadlineIso: '2025-11-30T23:59:00Z',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.juniorsacademy.org',
  //   links: ['juniorsacademy.org'],
  // ),
  // const Resource(
  //   //TODO LATER
  //   id: 'aspiring_scholars',
  //   title: 'Aspiring Scholars Directed Research Program',
  //   category: 'competition',
  //   field: 'science',
  //   scope: 'regional',
  //   format: 'in_person',
  //   locationNote: 'California (Bay Area)',
  //   timeCommitment: 'TODO: multi-week research program',
  //   majorTags: ['biology', 'cs', 'neuroscience', 'chemistry', 'data_sci'],
  //   applicationInfo: 'TODO: fill in application details',
  //   description:
  //       'Directed research program providing hands-on mentored research experience.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.aspiringscholars.org',
  //   links: ['aspiringscholars.org'],
  // ),
  // const Resource(
  // TODO: SUMMER DEADLINE
  //   id: 'intl_psych_olympiad',
  //   title: 'International Psychology Olympiad',
  //   category: 'competition',
  //   field: 'science',
  //   scope: 'international',
  //   format: 'in_person',
  //   locationNote: 'TODO: host country varies annually',
  //   timeCommitment: 'TODO',
  //   majorTags: ['psych', 'behavioral', 'cog_sci', 'neuroscience'],
  //   applicationInfo: 'TODO: typically selected through national olympiad',
  //   description:
  //       'An international competition testing high school students\' knowledge of psychology.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'https://psycholympics.com',
  //   links: ['psycholympics.com'],
  // ),
  // const Resource(
  //   //application closes in september, maybe next year
  //   id: 'verge_challenge',
  //   title: 'Verge Challenge',
  //   category: 'competition',
  //   field: 'science',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'TODO',
  //   timeCommitment: 'TODO',
  //   majorTags: ['innovation', 'entrepreneurship', 'env_sci', 'social_impact'],
  //   applicationInfo: 'TODO: fill in application details',
  //   description:
  //       'A challenge to develop innovative solutions to pressing problems.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'TODO',
  //   links: ['TODO'],
  // ),
  // const Resource(
  //   id: 'leb_art_equity',
  //   title: 'LegalEagleBee | 1st Art for Equity Competition',
  //   category: 'competition',
  //   field: 'social',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: '1-2 weeks (artwork creation)',
  //   majorTags: ['civil_rights', 'fine_arts', 'humanities', 'law_general'],
  //   applicationInfo: 'Check legaleaglebee.com for current cycle dates.',
  //   description:
  //       'Art competition exploring themes of equity, justice, and civil rights.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.legaleaglebee.com',
  //   links: ['legaleaglebee.com'],
  // ),
  // const Resource(
  //   id: 'leb_policy_brief',
  //   title: 'LegalEagleBee | 2nd Policy Brief Competition',
  //   category: 'competition',
  //   field: 'social',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: '1-3 weeks (research + writing)',
  //   majorTags: [
  //     'pub_policy_law',
  //     'pub_policy',
  //     'polisci',
  //     'law_general',
  //     'civil_rights',
  //   ],
  //   applicationInfo:
  //       'Check legaleaglebee.com for the current prompt and deadline.',
  //   description: 'Students write a policy brief on a designated legal topic.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.legaleaglebee.com',
  //   links: ['legaleaglebee.com'],
  // ),
  // const Resource(
  //   id: 'leb_policy_video',
  //   title: 'LegalEagleBee | 3rd Policy Video Competition',
  //   category: 'competition',
  //   field: 'social',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: '1-3 weeks (filming + editing)',
  //   majorTags: ['pub_policy_law', 'film_prod', 'digital_media', 'civil_rights'],
  //   applicationInfo:
  //       'Check legaleaglebee.com for the current prompt and deadline.',
  //   description:
  //       'Students produce a short advocacy video on a legal or policy topic.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.legaleaglebee.com',
  //   links: ['legaleaglebee.com'],
  // ),
  // const Resource(
  //   id: 'leb_court_case',
  //   title: 'LegalEagleBee | 9th Court Case Competition',
  //   category: 'competition',
  //   field: 'social',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online rounds',
  //   timeCommitment: '2-4 weeks (research + oral argument prep)',
  //   majorTags: ['law_general', 'prelaw', 'constitutional_law', 'polisci'],
  //   applicationInfo: 'Check legaleaglebee.com for the current case prompt.',
  //   description:
  //       'Students research and argue both the petitioner and respondent sides of a legal case.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.legaleaglebee.com',
  //   links: ['legaleaglebee.com'],
  // ),
  // const Resource(
  //   id: 'columbia_law_review_essay',
  //   title: 'Columbia Law Review Essay Competition',
  //   category: 'competition',
  //   field: 'social',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: 'TODO',
  //   majorTags: ['law_general', 'prelaw', 'constitutional_law', 'intl_law'],
  //   applicationInfo: 'TODO: fill in application details',
  //   description: 'An essay competition exploring issues in law.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.columbialawreview.org',
  //   links: ['columbialawreview.org'],
  // ),
  // const Resource(
  //   id: 'columbia_polireview_essay',
  //   title: 'Columbia Political Review High School Essay Contest',
  //   category: 'competition',
  //   field: 'social',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: 'TODO',
  //   majorTags: ['polisci', 'pub_policy', 'intl_rel', 'journalism_media'],
  //   applicationInfo: 'TODO: fill in application details',
  //   description: 'An essay contest on political science and policy topics.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.columbiapoliticalreview.com',
  //   links: ['columbiapoliticalreview.com'],
  // ),
  // const Resource(
  //   id: 'culr_essay',
  //   title: 'CULR High School Essay Contest',
  //   category: 'competition',
  //   field: 'social',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: 'TODO',
  //   majorTags: ['law_general', 'polisci', 'pub_policy_law'],
  //   applicationInfo: 'TODO: fill in application details',
  //   description: 'The Columbia Undergraduate Law Review\'s essay contest.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'TODO',
  //   links: ['TODO'],
  // ),
  // const Resource(
  //   id: 'platt_family_essay',
  //   title: 'Platt Family Scholarship Prize Essay Contest',
  //   category: 'competition',
  //   field: 'humanities',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: '1-3 weeks (research + essay)',
  //   majorTags: ['humanities', 'polisci', 'intl_rel', 'english'],
  //   applicationInfo: 'Submit at lincolnforum.org.',
  //   description:
  //       'Essay contest on Abraham Lincoln\'s relevance to contemporary democracy.',
  //   deadline: 'Mar 2026 (approx.)',
  //   deadlineIso: '2026-03-31T23:59:00Z',
  //   icon: Icons.emoji_events,
  //   url:
  //       'https://www.thelincolnforum.org/platt-family-scholarship-prize-essay-contest/',
  //   links: ['thelincolnforum.org'],
  // ),
  // const Resource(
  //   id: 'foyle_young_poets',
  //   title: '2026 Foyle Young Poets of the Year Award',
  //   category: 'competition',
  //   field: 'humanities',
  //   scope: 'international',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: 'Submit up to 3 poems',
  //   majorTags: ['poetry', 'creative_writing', 'english'],
  //   applicationInfo: 'Submit at foyleyoungpoets.org.',
  //   description:
  //       'One of the world\'s most prestigious poetry competitions for young writers.',
  //   deadline: 'Jul 31, 2026',
  //   deadlineIso: '2026-07-31T23:59:00Z',
  //   icon: Icons.emoji_events,
  //   url:
  //       'https://poetrysociety.org.uk/competitions/foyle-young-poets-of-the-year-award/',
  //   links: ['poetrysociety.org.uk'],
  // ),
  // const Resource(
  //   id: 'red_wheelbarrow_poetry',
  //   title: 'Red Wheelbarrow Poetry Prize 2026',
  //   category: 'competition',
  //   field: 'humanities',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: 'TODO',
  //   majorTags: ['poetry', 'creative_writing', 'english'],
  //   applicationInfo: 'TODO: fill in application details',
  //   description:
  //       'A poetry prize for high school students celebrating creative verse.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'TODO',
  //   links: ['TODO'],
  // ),
  // const Resource(
  //   id: 'nyt_summer_reading',
  //   title: 'NYT 17th Annual Summer Reading Contest',
  //   category: 'competition',
  //   field: 'humanities',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online: NYT Learning Network',
  //   timeCommitment: 'Weekly submissions throughout summer',
  //   majorTags: [
  //     'english',
  //     'journalism_media',
  //     'humanities',
  //     'creative_writing',
  //   ],
  //   applicationInfo: 'Submit written responses to weekly NYT article prompts.',
  //   description:
  //       'The New York Times\' annual summer reading and writing contest.',
  //   deadline: 'Aug 2026 (weekly through summer)',
  //   deadlineIso: '2026-08-31T23:59:00Z',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.nytimes.com/section/learning',
  //   links: ['nytimes.com/section/learning'],
  // ),
  // const Resource(
  //new 2026 deadline
  //   id: 'studentcam',
  //   title: 'C-SPAN StudentCam Documentary Contest',
  //   category: 'competition',
  //   field: 'humanities',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: '6-10 weeks (filming + editing)',
  //   majorTags: [
  //     'film_prod',
  //     'documentary',
  //     'polisci',
  //     'pub_policy',
  //     'journalism_media',
  //   ],
  //   applicationInfo:
  //       'Create a 5-6 minute documentary on a federal policy issue.',
  //   description:
  //       'C-SPAN\'s national documentary competition with over \$100,000 in total prizes.',
  //   deadline: 'Jan 2026 (approx.)',
  //   deadlineIso: '2026-01-20T23:59:00Z',
  //   icon: Icons.emoji_events,
  //   url: 'https://www.studentcam.org',
  //   links: ['studentcam.org'],
  // ),
  // const Resource(
  //   id: 'young_filmmakers',
  //   title: 'Young Filmmakers Competition',
  //   category: 'competition',
  //   field: 'humanities',
  //   scope: 'national',
  //   format: 'virtual',
  //   locationNote: 'Online submission',
  //   timeCommitment: 'TODO',
  //   majorTags: [
  //     'film_prod',
  //     'documentary',
  //     'digital_media',
  //     'creative_writing',
  //   ],
  //   applicationInfo: 'TODO: fill in application details',
  //   description: 'A film competition for high school student filmmakers.',
  //   deadline: 'TODO',
  //   deadlineIso: '',
  //   icon: Icons.emoji_events,
  //   url: 'TODO',
  //   links: ['TODO'],
  // ),

  // More current high-school competitions
  _competition(
    id: 'frontier_cascadia',
    title: 'Frontier Cascadia',
    field: 'cs',
    scope: 'regional',
    format: 'in_person',
    locationNote: 'Seattle, Washington',
    majorTags: ['cs', 'app_dev', 'engineering', 'design'],
    applicationInfo:
        'Apply through the official participant form when the next event opens',
    description:
        'Spend a weekend building a real project with other high school students, mentors, workshops, and plenty of room for beginners',
    url: 'https://frontiercascadia.org/',
    timeCommitment: 'Weekend high school hackathon',
    icon: Icons.code,
  ),
  _competition(
    id: 'mit_blueprint',
    title: 'MIT Blueprint',
    field: 'cs',
    scope: 'national',
    format: 'in_person',
    locationNote: 'MIT campus, Cambridge, Massachusetts',
    majorTags: ['cs', 'app_dev', 'engineering'],
    applicationInfo:
        'High school students apply individually through the event site',
    description:
        'Learn from MIT mentors, team up with other students, and turn an idea into a working software or hardware project',
    url: 'https://blueprint.hackmit.org/',
    timeCommitment: 'Weekend hackathon',
    icon: Icons.code,
  ),
  _competition(
    id: 'hacktj',
    title: 'HackTJ',
    field: 'cs',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Northern Virginia',
    majorTags: ['cs', 'app_dev', 'design'],
    applicationInfo:
        'Open to current high school students through participant registration',
    description:
        'Build something bold in 24 hours with workshops, mentors, teammates, and a welcoming track for first-time hackers',
    url: 'https://hacktj.org/',
    timeCommitment: '24-hour hackathon',
    icon: Icons.code,
  ),
  _competition(
    id: 'picoctf',
    title: 'picoCTF',
    field: 'cs',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online',
    majorTags: ['cs', 'cybersecurity', 'cryptography'],
    applicationInfo:
        'Create a free account and join the annual competition as an eligible student',
    description:
        'Solve beginner-friendly cybersecurity puzzles in forensics, cryptography, web security, reverse engineering, and more',
    url: 'https://picoctf.org/',
    timeCommitment: 'Multi-day online capture-the-flag',
    icon: Icons.security,
  ),
  _competition(
    id: 'national_cyber_league',
    title: 'National Cyber League',
    field: 'cs',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online in the United States and Canada',
    majorTags: ['cs', 'cybersecurity', 'networking'],
    applicationInfo:
        'Students age 13 or older can register for an individual and team season',
    description:
        'Practice in a guided cyber range, then test real skills in individual and team games covering modern security work',
    url: 'https://nationalcyberleague.org/',
    deadline: 'October 13, 2026 (late registration)',
    deadlineIso: '2026-10-13T23:59:00-04:00',
    detailNote:
        'Regular registration ends October 9. The individual game runs October 23–25 and the team game runs November 6–8, 2026',
    timeCommitment: 'Season with practice, individual, and team games',
    icon: Icons.security,
  ),
  _competition(
    id: 'american_rocketry_challenge',
    title: 'American Rocketry Challenge',
    field: 'engineering',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Local qualification flights and a national final',
    majorTags: ['engineering', 'aerospace', 'physics'],
    applicationInfo:
        'Students in grades 6–12 register as a team with an adult advisor',
    description:
        'Design, build, and fly a model rocket toward a new altitude, duration, and payload target each season',
    url: 'https://www.rocketrychallenge.org/',
    deadline: 'December 6, 2026 at 11:59 PM ET',
    deadlineIso: '2026-12-06T23:59:00-05:00',
    timeCommitment: 'Season-long build and flight challenge',
    icon: Icons.rocket_launch,
  ),
  _competition(
    id: 'future_city_high_school',
    title: 'Future City High School',
    field: 'engineering',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Regional events and national championship',
    majorTags: ['engineering', 'sustainability', 'urban_planning'],
    applicationInfo:
        'Form a high school team and register through the official program',
    description:
        'Use the engineering design process to imagine a resilient city and explain how your team would make it work',
    url: 'https://futurecity.org/',
    timeCommitment: 'Multi-month team design project',
    icon: Icons.engineering,
  ),

  _competition(
    id: 'purple_comet',
    title: 'Purple Comet Math Meet',
    field: 'math',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online',
    majorTags: ['math', 'problem_solving'],
    applicationInfo:
        'A teacher or adult supervisor registers a free high school team',
    description:
        'Work as a team on a lively set of challenging problems in a free international online math meet',
    url: 'https://www.purplecomet.org/',
    timeCommitment: '90-minute team contest',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'hmmt',
    title: 'Harvard-MIT Mathematics Tournament',
    field: 'math',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Harvard or MIT campus, Massachusetts',
    majorTags: ['math', 'problem_solving'],
    applicationInfo:
        'School teams and eligible individuals apply through the tournament site',
    description:
        'Take on demanding individual, team, and guts-round problems at one of the largest student-run high school math tournaments',
    url: 'https://www.hmmt.org/',
    deadline: 'September 20, 2026 (registration)',
    deadlineIso: '2026-09-20T23:59:00-04:00',
    timeCommitment: 'One-day tournament',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'arml',
    title: 'American Regions Mathematics League',
    field: 'math',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Regional teams compete at several U.S. host sites',
    majorTags: ['math', 'problem_solving'],
    applicationInfo: 'Join a regional team or ask a coach about forming one',
    description:
        'Compete on a 15-person regional team through individual, team, power, and relay rounds',
    url: 'https://www.arml.com/',
    timeCommitment: 'Annual team tournament',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'm3_challenge',
    title: 'MathWorks Math Modeling Challenge',
    field: 'math',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online',
    majorTags: ['math', 'statistics', 'modeling'],
    applicationInfo:
        'Eligible schools register a team of three to five juniors or seniors with a coach',
    description:
        'Use data, research, and mathematical modeling to tackle a real issue during one focused problem-solving weekend',
    url: 'https://m3challenge.siam.org/',
    timeCommitment: '14-hour team challenge',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'himcm',
    title: 'High School Mathematical Contest in Modeling',
    field: 'math',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online through a school or approved program',
    majorTags: ['math', 'statistics', 'modeling', 'writing'],
    applicationInfo: 'An advisor registers a team of up to four students',
    description:
        'Choose a real-world problem, build a mathematical model, and communicate your reasoning in a polished team paper',
    url: 'https://www.comap.com/contests/himcm-midmcm',
    deadline: 'November 4, 2026 at 2:00 PM ET',
    deadlineIso: '2026-11-04T14:00:00-05:00',
    timeCommitment: 'Up to 14 days',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'mathcon',
    title: 'MathCON',
    field: 'math',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Online qualifying round and in-person national finals',
    majorTags: ['math', 'problem_solving'],
    applicationInfo:
        'Students register through a participating school or approved organization',
    description:
        'Start with an accessible online math competition and earn a chance to solve deeper problems at the national finals',
    url: 'https://www.mathcon.org/',
    deadline: 'March 17, 2027 (online round)',
    deadlineIso: '2027-03-17T23:59:00-05:00',
    detailNote:
        'Registration is open, and coordinators may add students through the final day of the online testing window',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'math_league',
    title: 'Math League High School Contests',
    field: 'math',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Hosted by schools and local contest sites',
    majorTags: ['math', 'problem_solving'],
    applicationInfo:
        'Ask a teacher, parent, or coach to locate or host a high school contest',
    description:
        'Build consistency through short local contests, then advance toward state, national, and international championship events',
    url: 'https://mathleague.org/hs.php',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'math_kangaroo',
    title: 'Math Kangaroo USA',
    field: 'math',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'In-person and approved online centers',
    majorTags: ['math', 'logic', 'problem_solving'],
    applicationInfo:
        'Students in grades 1–12 register through an approved center',
    description:
        'Try creative, visual, and logical problems in a friendly international contest with grade-level rankings',
    url: 'https://mathkangaroo.org/mks/',
    deadline: 'December 31, 2026 (regular registration)',
    deadlineIso: '2026-12-31T23:59:00-05:00',
    detailNote:
        'Late registration remains available through February 1, 2027',
    timeCommitment: '75-minute individual contest',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'csmc',
    title: 'Canadian Senior Mathematics Contest',
    field: 'math',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Participating schools worldwide',
    majorTags: ['math', 'proof', 'problem_solving'],
    applicationInfo:
        'A school contest supervisor orders and administers the contest',
    description:
        'Solve a mix of short-answer and full-solution problems where clear mathematical communication matters',
    url: 'https://cemc.uwaterloo.ca/contests/csimc',
    deadline: 'October 22, 2026 (school ordering)',
    deadlineIso: '2026-10-22T23:59:00-04:00',
    timeCommitment: 'Two-hour contest',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'stanford_math_tournament',
    title: 'Stanford Math Tournament',
    field: 'math',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Stanford campus with a separate online tournament',
    majorTags: ['math', 'problem_solving'],
    applicationInfo:
        'U.S. high school teams apply for the campus event; other students can use the online option',
    description:
        'Choose subject tests, collaborate on team rounds, and meet a large community of students who genuinely enjoy hard math',
    url: 'https://www.stanfordmathtournament.org/',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'berkeley_math_tournament',
    title: 'Berkeley Math Tournament',
    field: 'math',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'UC Berkeley and online options',
    majorTags: ['math', 'problem_solving'],
    applicationInfo:
        'High school students register in teams when applications open',
    description:
        'Work through individual and collaborative rounds written and run by UC Berkeley students',
    url: 'https://bmt.berkeley.edu/',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'pumac',
    title: 'Princeton University Mathematics Competition',
    field: 'math',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Princeton University, New Jersey',
    majorTags: ['math', 'problem_solving'],
    applicationInfo:
        'High school teams apply through the PUMaC registration process',
    description:
        'Test advanced problem solving through individual subject rounds, team events, and a fast-paced power competition',
    url: 'https://pumac.princeton.edu/',
    icon: Icons.calculate,
  ),
  _competition(
    id: 'caribou_math',
    title: 'Caribou Mathematics Competition',
    field: 'math',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online through a school or coordinator',
    majorTags: ['math', 'logic', 'problem_solving'],
    applicationInfo:
        'Register through a participating school, coordinator, or approved homeschool setup',
    description:
        'Solve interactive math and logic problems across several rounds during the school year',
    url: 'https://cariboutests.com/',
    icon: Icons.calculate,
  ),

  _competition(
    id: 'genes_in_space',
    title: 'Genes in Space',
    field: 'biology',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online proposal with finalist presentations',
    majorTags: ['biology', 'genetics', 'space_science'],
    applicationInfo:
        'U.S. students in grades 7–12 submit individually or in a team',
    description:
        'Design a DNA experiment that could help solve a real challenge of living and working in space',
    url: 'https://www.genesinspace.org/us-contest/',
    icon: Icons.biotech,
  ),
  _competition(
    id: 'international_brain_bee',
    title: 'International Brain Bee',
    field: 'biology',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Local and national bees lead to the world championship',
    majorTags: ['biology', 'neuroscience', 'health'],
    applicationInfo:
        'Start with the recognized local or national Brain Bee for your region',
    description:
        'Study the brain, neurological conditions, anatomy, and neuroscience research as you advance through quiz and practical rounds',
    url: 'https://www.thebrainbee.org/',
    icon: Icons.biotech,
  ),
  _competition(
    id: 'envirothon',
    title: 'NCF-Envirothon',
    field: 'science',
    scope: 'international',
    format: 'in_person',
    locationNote:
        'Local and regional events lead to an international competition',
    majorTags: ['environmental_science', 'ecology', 'sustainability'],
    applicationInfo:
        'Students in grades 9–12 join a team through their state or provincial program',
    description:
        'Apply field knowledge in ecology, forestry, soils, wildlife, and current environmental issues with a five-person team',
    url: 'https://envirothon.org/',
    icon: Icons.eco,
  ),
  _competition(
    id: 'stockholm_junior_water_prize',
    title: 'Stockholm Junior Water Prize',
    field: 'science',
    scope: 'international',
    format: 'hybrid',
    locationNote:
        'National competitions lead to the international final in Stockholm',
    majorTags: ['environmental_science', 'chemistry', 'sustainability'],
    applicationInfo:
        'Submit original water-related research through the official national organizer',
    description:
        'Turn original research on water quality, conservation, treatment, or access into a concise scientific competition project',
    url: 'https://www.siwi.org/prizes/stockholm-junior-water-prize/',
    icon: Icons.water_drop,
  ),
  _competition(
    id: 'physicsbowl',
    title: 'PhysicsBowl',
    field: 'physics',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Participating schools administer the exam',
    majorTags: ['physics', 'math', 'problem_solving'],
    applicationInfo:
        'A teacher registers students through the American Association of Physics Teachers',
    description:
        'Measure your physics problem-solving speed against students from schools around the world in a focused multiple-choice exam',
    url: 'https://www.aapt.org/programs/physicsbowl/',
    timeCommitment: '45-minute contest',
    icon: Icons.science,
  ),
  _competition(
    id: 'national_ocean_sciences_bowl',
    title: 'National Ocean Sciences Bowl',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Regional bowls lead to a national final',
    majorTags: ['oceanography', 'biology', 'chemistry', 'earth_science'],
    applicationInfo:
        'Join a four-student high school team through the nearest regional bowl',
    description:
        'Race through ocean science questions and work as a team on topics spanning biology, chemistry, geology, policy, and technology',
    url: 'https://nosb.org/',
    icon: Icons.water,
  ),
  _competition(
    id: 'biogeneius',
    title: 'BioGENEius Challenges',
    field: 'biology',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'Regional programs and an international showcase',
    majorTags: ['biology', 'biotechnology', 'research'],
    applicationInfo:
        'Enter through a participating regional BioGENEius program',
    description:
        'Present original biotechnology research and learn how scientific ideas move from the lab toward real-world use',
    url: 'https://biotechinstitute.org/biogeneius/',
    icon: Icons.biotech,
  ),

  _competition(
    id: 'deca_competitive_events',
    title: 'DECA Competitive Events',
    field: 'business',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Local, state, and international conferences',
    majorTags: ['business', 'finance', 'marketing', 'entrepreneurship'],
    applicationInfo:
        'Join a high school DECA chapter and select an eligible competitive event',
    description:
        'Practice business through role-plays, case studies, prepared projects, and simulations in finance, marketing, hospitality, and entrepreneurship',
    url: 'https://www.deca.org/compete',
    icon: Icons.business_center,
  ),
  _competition(
    id: 'fbla_competitive_events',
    title: 'FBLA High School Competitive Events',
    field: 'business',
    scope: 'national',
    format: 'hybrid',
    locationNote:
        'Local and state events lead to the National Leadership Conference',
    majorTags: ['business', 'finance', 'marketing', 'cs'],
    applicationInfo:
        'Join or form an FBLA High School chapter and choose a competitive event',
    description:
        'Choose from dozens of tests, presentations, role-plays, and production events across business, finance, technology, and communication',
    url: 'https://www.fbla.org/high-school/competitive-events/',
    icon: Icons.business_center,
  ),
  _competition(
    id: 'bpa_competitions',
    title: 'Business Professionals of America Competitions',
    field: 'business',
    scope: 'national',
    format: 'hybrid',
    locationNote:
        'Chapter events, virtual competitions, and a national conference',
    majorTags: ['business', 'finance', 'it', 'leadership'],
    applicationInfo:
        'Participate through an eligible BPA secondary-school chapter',
    description:
        'Show what you can do in business, finance, IT, marketing, leadership, and workplace skills through practical competitive events',
    url: 'https://bpa.org/competitions/',
    icon: Icons.business_center,
  ),
  _competition(
    id: 'national_personal_finance_challenge',
    title: 'National Personal Finance Challenge',
    field: 'business',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'State competitions lead to the national finals',
    majorTags: ['finance', 'economics', 'business'],
    applicationInfo:
        'A teacher or coach registers a high school team through the applicable state program',
    description:
        'Work with a team to make smart decisions about income, spending, saving, investing, credit, and financial risk',
    url: 'https://financechallenge.unl.edu/',
    icon: Icons.account_balance_wallet,
  ),
  _competition(
    id: 'nfte_wsi',
    title: 'NFTE World Series of Innovation',
    field: 'business',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online',
    majorTags: ['entrepreneurship', 'business', 'innovation'],
    applicationInfo:
        'Young people enter individually or in teams through the current challenge portal',
    description:
        'Design an actionable idea around a global challenge and shape it into a clear entrepreneurial solution',
    url: 'https://innovation.nfte.com/',
    icon: Icons.lightbulb,
  ),
  _competition(
    id: 'harvard_crimson_case',
    title: 'Harvard Crimson Global Case Competition',
    field: 'business',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online regional and global rounds',
    majorTags: ['business', 'strategy', 'consulting'],
    applicationInfo:
        'Students ages 13–18 register individually, then compete in a team of two to four',
    description:
        'Step into a consultant role, unpack a company challenge, and present a practical strategy under a tight deadline',
    url: 'https://www.casecomp.org/',
    deadline: 'October 14, 2026 at 11:59 PM GMT',
    deadlineIso: '2026-10-14T23:59:00Z',
    icon: Icons.business_center,
  ),
  _competition(
    id: 'global_youth_entrepreneurship_challenge',
    title: 'Global Youth Entrepreneurship Challenge',
    field: 'business',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online',
    majorTags: ['entrepreneurship', 'business', 'innovation'],
    applicationInfo:
        'Eligible students ages 14–18 form a team of three to eight',
    description:
        'Create and pitch a sustainable business idea for a global issue during an intense 12-hour online challenge',
    url: 'https://entreplanet.org/GYEC/',
    timeCommitment: '12-hour team challenge',
    icon: Icons.lightbulb,
  ),
  _competition(
    id: 'tie_young_entrepreneurs',
    title: 'TiE Young Entrepreneurs Global Competition',
    field: 'business',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'Local TiE chapters and a global final',
    majorTags: ['entrepreneurship', 'business', 'pitching'],
    applicationInfo:
        'Apply through a participating local TiE Young Entrepreneurs program',
    description:
        'Learn the basics of launching a company, build a team plan, and pitch to experienced entrepreneurs and investors',
    url: 'https://tie.org/tye/',
    icon: Icons.lightbulb,
  ),
  _competition(
    id: 'ja_titan',
    title: 'JA Titan Business Challenge',
    field: 'business',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online simulation with local and regional events',
    majorTags: ['business', 'economics', 'strategy'],
    applicationInfo:
        'Check Junior Achievement in your area for a student competition or classroom event',
    description:
        'Run a simulated company, balance price, production, marketing, and research decisions, and compete on business performance',
    url: 'https://jausa.ja.org/programs/ja-titan',
    icon: Icons.business_center,
  ),
  _competition(
    id: 'international_economics_olympiad',
    title: 'International Economics Olympiad',
    field: 'business',
    scope: 'international',
    format: 'in_person',
    locationNote: 'National selection leads to the international olympiad',
    majorTags: ['economics', 'finance', 'business'],
    applicationInfo:
        'Enter through the official national selection process for your country',
    description:
        'Combine economics theory, financial literacy, and a business case as part of a national team',
    url: 'https://ieo-official.org/',
    icon: Icons.account_balance,
  ),

  _competition(
    id: 'scholastic_awards',
    title: 'Scholastic Art & Writing Awards',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Regional programs and national recognition',
    majorTags: ['creative_writing', 'art', 'journalism_media'],
    applicationInfo:
        'Students in grades 7–12 submit work through their regional program',
    description:
        'Share original art or writing across a wide range of categories, from poetry and journalism to photography and design',
    url: 'https://www.artandwriting.org/',
    deadline: 'December 1, 2026–January 6, 2027 (varies by region)',
    deadlineIso: '2026-12-01T23:59:00-05:00',
    detailNote:
        'Regional programs set their own deadlines. The first close December 1, 2026, while some remain open through January 6, 2027',
    icon: Icons.edit_note,
  ),
  _competition(
    id: 'bennington_young_writers',
    title: 'Bennington Young Writers Awards',
    field: 'humanities',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online submission through a sponsoring teacher',
    majorTags: ['creative_writing', 'english', 'poetry'],
    applicationInfo:
        'High school students submit poetry, fiction, or nonfiction with a teacher sponsor',
    description:
        'Send your strongest poetry, fiction, or nonfiction to a focused college-run competition for young writers',
    url: 'https://www.bennington.edu/events/young-writers-awards',
    icon: Icons.edit_note,
  ),
  _competition(
    id: 'poetry_out_loud',
    title: 'Poetry Out Loud',
    field: 'humanities',
    scope: 'national',
    format: 'in_person',
    locationNote: 'School and state contests lead to national finals',
    majorTags: ['poetry', 'public_speaking', 'english'],
    applicationInfo:
        'Ask a teacher or school coordinator about joining the local recitation program',
    description:
        'Choose a published poem, make it your own through careful recitation, and build confidence on stage',
    url: 'https://www.arts.gov/initiatives/poetry-out-loud',
    icon: Icons.record_voice_over,
  ),
  _competition(
    id: 'nsda_nationals',
    title: 'National Speech & Debate Tournament',
    field: 'humanities',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Qualifying district tournaments lead to nationals',
    majorTags: ['debate', 'public_speaking', 'civics'],
    applicationInfo:
        'Compete through an NSDA member school and qualify through your district',
    description:
        'Develop arguments, performances, and speaking skills across debate, interpretation, oratory, and extemporaneous events',
    url: 'https://www.speechanddebate.org/national-tournament/',
    icon: Icons.record_voice_over,
  ),
  _competition(
    id: 'we_the_people',
    title: 'We the People Constitutional Competition',
    field: 'humanities',
    scope: 'national',
    format: 'in_person',
    locationNote: 'State competitions lead to national finals',
    majorTags: ['civics', 'history', 'public_policy'],
    applicationInfo:
        'Participate through a class or school team using the official state program',
    description:
        'Prepare thoughtful constitutional testimony as a class, then answer judges’ follow-up questions in simulated hearings',
    url: 'https://civiced.org/we-the-people',
    icon: Icons.account_balance,
  ),
  _competition(
    id: 'npr_student_podcast',
    title: 'NPR Student Podcast Challenge',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online audio submission',
    majorTags: ['journalism_media', 'audio', 'storytelling'],
    applicationInfo:
        'Middle and high school students submit with an educator or parent sponsor',
    description:
        'Report, interview, write, and edit a short podcast that tells a story only you and your community could tell',
    url: 'https://studentpodcastchallenge.npr.org/',
    icon: Icons.podcasts,
  ),
  _competition(
    id: 'profile_in_courage',
    title: 'Profile in Courage Essay Contest',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online essay submission',
    majorTags: ['history', 'civics', 'english'],
    applicationInfo:
        'Eligible U.S. high school students submit an original essay through the JFK Library',
    description:
        'Research a lesser-known act of political courage and explain the choices, risks, and consequences behind it',
    url:
        'https://www.jfklibrary.org/learn/education/profile-in-courage-essay-contest',
    icon: Icons.edit_note,
  ),
  _competition(
    id: 'foyle_young_poets_active',
    title: 'Foyle Young Poets of the Year Award',
    field: 'humanities',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online poetry submission',
    majorTags: ['poetry', 'creative_writing', 'english'],
    applicationInfo:
        'Young poets ages 11–17 may submit original poems for free',
    description:
        'Send your most distinctive poems to a free international award built specifically for young writers',
    url:
        'https://poetrysociety.org.uk/competitions/foyle-young-poets-of-the-year-award/',
    icon: Icons.edit_note,
  ),
  _competition(
    id: 'afsa_essay',
    title: 'AFSA National High School Essay Contest',
    field: 'humanities',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online essay submission',
    majorTags: ['international_relations', 'history', 'english'],
    applicationInfo:
        'Eligible U.S. students in grades 9–12 submit an original essay on the annual prompt',
    description:
        'Explore diplomacy and international affairs through a research-based essay tied to a new foreign-service question each year',
    url: 'https://afsa.org/essay-contest',
    icon: Icons.public,
  ),
  _competition(
    id: 'national_high_school_ethics_bowl',
    title: 'National High School Ethics Bowl',
    field: 'humanities',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Regional bowls lead to the national championship',
    majorTags: ['philosophy', 'ethics', 'debate'],
    applicationInfo:
        'Form a school team and register with the nearest recognized regional competition',
    description:
        'Discuss difficult ethical cases with clarity and empathy, responding to another team without treating the round like a shouting match',
    url: 'https://nhseb.unc.edu/',
    icon: Icons.forum,
  ),
  _competition(
    id: 'youngarts',
    title: 'YoungArts National Competition',
    field: 'humanities',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Online application with in-person award programs',
    majorTags: ['art', 'creative_writing', 'film_prod', 'performing_arts'],
    applicationInfo:
        'U.S. artists ages 15–18 or in grades 10–12 submit a portfolio or audition',
    description:
        'Share polished work in writing, visual arts, film, music, dance, theater, design, or voice for feedback and national recognition',
    url: 'https://youngarts.org/apply/',
    deadline: 'October 6, 2026 at 8:00 PM ET',
    deadlineIso: '2026-10-06T20:00:00-04:00',
    icon: Icons.palette,
  ),
  _competition(
    id: 'john_locke_essay',
    title: 'John Locke Global Essay Prize',
    field: 'humanities',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online essay submission',
    majorTags: ['philosophy', 'economics', 'history', 'public_policy'],
    applicationInfo:
        'Students choose a question and register before submitting through the official portal',
    description:
        'Build a careful argument around a challenging question in philosophy, politics, economics, history, psychology, theology, or law',
    url: 'https://www.johnlockeinstitute.com/essay-competition',
    icon: Icons.edit_note,
  ),
  _competition(
    id: 'congressional_art_competition',
    title: 'Congressional Art Competition',
    field: 'humanities',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Entries are handled by participating congressional offices',
    majorTags: ['art', 'civics', 'design'],
    applicationInfo:
        'Check the rules and deadline from your U.S. representative’s district office',
    description:
        'Submit an original two-dimensional artwork through your congressional district for a chance to be displayed at the U.S. Capitol',
    url:
        'https://www.house.gov/educators-and-students/congressional-art-competition',
    icon: Icons.palette,
  ),
  _competition(
    id: 'davidson_fellows',
    title: 'Davidson Fellows Scholarship',
    field: 'science',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online application with an awards event in Washington, D.C.',
    majorTags: ['science', 'cs', 'engineering', 'math', 'humanities', 'art'],
    applicationInfo:
        'U.S. citizens or permanent residents age 18 or younger submit a significant completed body of work with two nominators',
    description:
        'Present a substantial original project in science, technology, engineering, mathematics, literature, music, philosophy, or an interdisciplinary field for a scholarship of up to \$100,000',
    url:
        'https://www.davidsongifted.org/gifted-programs/fellows-scholarship/',
    timeCommitment: 'Major completed project plus a detailed application',
    icon: Icons.workspace_premium,
  ),
  _competition(
    id: 'nasa_herc',
    title: 'NASA Human Exploration Rover Challenge',
    field: 'engineering',
    scope: 'international',
    format: 'in_person',
    locationNote: 'U.S. Space & Rocket Center in Huntsville, Alabama',
    majorTags: ['engineering', 'aerospace', 'robotics', 'physics'],
    applicationInfo:
        'Middle school and high school teams submit a proposal and work with an adult mentor under the 2027 handbook',
    description:
        'Spend the school year designing and testing a human-powered or remote-controlled rover, then navigate lunar-style terrain and mission tasks at NASA’s final event',
    url:
        'https://www.nasa.gov/learning-resources/nasa-human-exploration-rover-challenge/',
    deadline: 'September 17, 2026 at 8:00 AM CT',
    deadlineIso: '2026-09-17T08:00:00-05:00',
    detailNote:
        'The 2027 team proposal is due at 8:00 AM Central Time',
    timeCommitment: 'Nine-month engineering challenge; finals April 21–24, 2027',
    icon: Icons.rocket_launch,
  ),
  _competition(
    id: 'mate_rov',
    title: 'MATE ROV Competition',
    field: 'engineering',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Regional events can lead to the world championship',
    majorTags: ['engineering', 'robotics', 'marine_science', 'cs'],
    applicationInfo:
        'Students form a team, choose the appropriate competition class, and register through a participating regional event',
    description:
        'Design an underwater robot around a real marine mission while your team also builds the technical documentation, presentation, and project-management side of the company',
    url: 'https://materovcompetition.org/',
    timeCommitment: 'Season-long ROV build and regional competition',
    icon: Icons.water,
  ),
  _competition(
    id: 'mit_think',
    title: 'MIT THINK Scholars Program',
    field: 'engineering',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Online project mentorship with a possible trip to MIT',
    majorTags: ['science', 'engineering', 'cs', 'research'],
    applicationInfo:
        'U.S. high school students submit a proposal for a feasible one-semester project that can be completed with a \$1,000 budget',
    description:
        'Turn a well-researched STEM idea into a realistic proposal, with finalists receiving project funding, weekly mentorship, and an MIT campus visit when offered',
    url: 'https://think.mit.edu/',
    timeCommitment: 'Proposal followed by one semester of work for finalists',
    icon: Icons.science_outlined,
  ),
  _competition(
    id: 'igem_high_school',
    title: 'iGEM High School Competition',
    field: 'biology',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'Team research locally with an international jamboree',
    majorTags: ['biology', 'biotech', 'engineering', 'cs', 'entrepreneurship'],
    applicationInfo:
        'A high school, community lab, or approved organizer registers the team through an adult principal investigator',
    description:
        'Build a synthetic-biology project from experiment design through safety, modeling, community engagement, a public wiki, and a final presentation',
    url: 'https://competition.igem.org/registration/overview',
    timeCommitment: 'Multi-month research and engineering season',
    icon: Icons.biotech,
  ),
  _competition(
    id: 'hosa_competitive_events',
    title: 'HOSA Competitive Events',
    field: 'biology',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'Regional and state events can lead to the International Leadership Conference',
    majorTags: ['health', 'biology', 'medicine', 'leadership'],
    applicationInfo:
        'Join an eligible HOSA chapter, select one event, and follow the deadlines set by your state association and advisor',
    description:
        'Choose from health-science tests, clinical skills, emergency preparedness, biomedical debate, research, leadership, and team events',
    url: 'https://hosa.org/guidelines/',
    timeCommitment: 'Chapter preparation plus regional and state rounds',
    icon: Icons.medical_services_outlined,
  ),
  _competition(
    id: 'harvard_crimson_essay',
    title: 'Harvard Crimson Global Essay Competition',
    field: 'humanities',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Fully online',
    majorTags: ['writing', 'journalism_media', 'creative_writing', 'humanities'],
    applicationInfo:
        'Middle and high school students register online and submit an essay in the creative, argumentative, or journalistic category',
    description:
        'Respond to a university-style prompt in one of three writing categories, use the included workshops, and have your essay evaluated in a global field',
    url: 'https://www.essaycomp.org/',
    timeCommitment: 'Registration, optional workshops, and one polished essay',
    icon: Icons.edit_note,
  ),
  _competition(
    id: 'harvard_crimson_business',
    title: 'Harvard Crimson Business Competition',
    field: 'business',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'Online preliminary round with an invited championship at Harvard',
    majorTags: ['business', 'entrepreneurship', 'finance', 'public_policy'],
    applicationInfo:
        'Students in grades 6–12 may enter individually or in a team and develop a business plan around a published global challenge',
    description:
        'Identify a real global problem, research the market, and shape a feasible business plan that can advance from an online round to a live championship',
    url: 'https://programs.thecrimson.com/hcbc-guidelines',
    timeCommitment: 'Multi-stage business plan and presentation',
    icon: Icons.business_center,
  ),
  _competition(
    id: 'codeforces_contests',
    title: 'Codeforces Contests',
    field: 'cs',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online',
    majorTags: ['cs', 'algorithms', 'problem_solving'],
    applicationInfo:
        'Create a free account and enter any rated round whose start time and rules work for you',
    description:
        'Practice competitive programming in frequent timed rounds, earn a rating, and learn from editorials and other competitors’ solutions afterward',
    url: 'https://codeforces.com/contests',
    timeCommitment: 'Frequent contests, usually two to three hours each',
    icon: Icons.code,
  ),

  // ===========================================================================
  // AP COURSES AND EXAM RESOURCES
  // ===========================================================================
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
      'AP Art History Official Course Page',
      'AP Art History AP Classroom',
      'AP Art History Official Exam Page',
      'AP Art History Khan Academy',
      'AP Art History Fiveable Study Guides',
      'AP Art History Knowt Study Guides',
      'AP Art History CrackAP Practice Questions',
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
      'AP Music Theory Official Course Page',
      'AP Music Theory AP Classroom',
      'AP Music Theory Official Exam Page',
      'AP Music Theory Fiveable Study Guides',
      'AP Music Theory Knowt Study Guides',
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
    description:
        'Learn how nonfiction writers persuade, then build your own evidence-based arguments across essays, speeches, and articles',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-english-language-and-composition',
    links: [
      'AP English Language and Composition Official Course Page',
      'AP English Language and Composition AP Classroom',
      'AP English Language and Composition Official Exam Page',
      'AP English Language and Composition Fiveable Study Guides',
      'AP English Language and Composition Knowt Study Guides',
      'AP English Language and Composition CrackAP Practice Questions',
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
    description:
        'Read fiction, poetry, and drama closely, with more focus on literary interpretation than the nonfiction emphasis in AP English Language',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-english-literature-and-composition',
    links: [
      'AP English Literature and Composition Official Course Page',
      'AP English Literature and Composition AP Classroom',
      'AP English Literature and Composition Official Exam Page',
      'AP English Literature and Composition Fiveable Study Guides',
      'AP English Literature and Composition Knowt Study Guides',
      'AP English Literature and Composition CrackAP Practice Questions',
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
      'AP African American Studies Official Course Page',
      'AP African American Studies AP Classroom',
      'AP African American Studies Official Exam Page',
      'AP African American Studies Fiveable Study Guides',
      'AP African American Studies Knowt Study Guides',
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
      'AP Comparative Government and Politics Official Course Page',
      'AP Comparative Government and Politics AP Classroom',
      'AP Comparative Government and Politics Official Exam Page',
      'AP Comparative Government and Politics Fiveable Study Guides',
      'AP Comparative Government and Politics Knowt Study Guides',
      'AP Comparative Government and Politics CrackAP Practice Questions',
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
      'AP European History Official Course Page',
      'AP European History AP Classroom',
      'AP European History Official Exam Page',
      'AP European History Fiveable Study Guides',
      'AP European History Knowt Study Guides',
      'AP European History CrackAP Practice Questions',
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
      'AP Human Geography Official Course Page',
      'AP Human Geography AP Classroom',
      'AP Human Geography Official Exam Page',
      'AP Human Geography Fiveable Study Guides',
      'AP Human Geography Knowt Study Guides',
      'AP Human Geography CrackAP Practice Questions',
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
      'AP Macroeconomics Official Course Page',
      'AP Macroeconomics AP Classroom',
      'AP Macroeconomics Official Exam Page',
      'AP Macroeconomics Khan Academy',
      'AP Macroeconomics Fiveable Study Guides',
      'AP Macroeconomics Knowt Study Guides',
      'AP Macroeconomics CrackAP Practice Questions',
      'AP Macro Exam 2022',
      'AP Macro Exam 2019',
      'AP Macro Exam 2013',
      'AP Macro Exam 2012',
    ],
    apSubCategory: 'history',
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
      'AP Microeconomics Official Course Page',
      'AP Microeconomics AP Classroom',
      'AP Microeconomics Official Exam Page',
      'AP Microeconomics Khan Academy',
      'AP Microeconomics Fiveable Study Guides',
      'AP Microeconomics Knowt Study Guides',
      'AP Microeconomics CrackAP Practice Questions',
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
    ],
    apSubCategory: 'history',
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
      'AP Psychology Official Course Page',
      'AP Psychology AP Classroom',
      'AP Psychology Official Exam Page',
      'AP Psychology Fiveable Study Guides',
      'AP Psychology Knowt Study Guides',
      'AP Psychology CrackAP Practice Questions',
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
      'AP United States Government and Politics Official Course Page',
      'AP United States Government and Politics AP Classroom',
      'AP United States Government and Politics Official Exam Page',
      'AP United States Government and Politics Khan Academy',
      'AP United States Government and Politics Fiveable Study Guides',
      'AP United States Government and Politics Knowt Study Guides',
      'AP United States Government and Politics CrackAP Practice Questions',
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
      'AP United States History Official Course Page',
      'AP United States History AP Classroom',
      'AP United States History Official Exam Page',
      'AP United States History Khan Academy',
      'AP United States History Fiveable Study Guides',
      'AP United States History Knowt Study Guides',
      'AP United States History CrackAP Practice Questions',
      'AP US History Exam 2019',
      'AP US History Exam 2018',
      'AP US History Exam 2017',
      'AP US History Exam 2016',
      'AP US History Exam 2015',
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
      'AP World History: Modern Official Course Page',
      'AP World History: Modern AP Classroom',
      'AP World History: Modern Official Exam Page',
      'AP World History: Modern Khan Academy',
      'AP World History: Modern Fiveable Study Guides',
      'AP World History: Modern Knowt Study Guides',
      'AP World History: Modern CrackAP Practice Questions',
      'AP World History Exam 2018',
      'AP World History Exam 2017',
      'AP World History Exam 2016',
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
    description:
        'A first college calculus course covering limits, derivatives, integrals, and differential equations at a steadier pace than Calculus BC',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-calculus-ab',
    links: [
      'AP Calculus AB Official Course Page',
      'AP Calculus AB AP Classroom',
      'AP Calculus AB Official Exam Page',
      'AP Calculus AB Khan Academy',
      'AP Calculus AB Fiveable Study Guides',
      'AP Calculus AB Knowt Study Guides',
      'AP Calculus AB CrackAP Practice Questions',
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
        'Covers all Calculus AB material plus parametric and polar functions, advanced integration, and infinite sequences and series',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-calculus-bc',
    links: [
      'AP Calculus BC Official Course Page',
      'AP Calculus BC AP Classroom',
      'AP Calculus BC Official Exam Page',
      'AP Calculus BC Khan Academy',
      'AP Calculus BC Fiveable Study Guides',
      'AP Calculus BC Knowt Study Guides',
      'AP Calculus BC CrackAP Practice Questions',
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
    description:
        'A Java programming course focused on writing code, object-oriented design, data structures, and algorithms',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-computer-science-a',
    links: [
      'AP Computer Science A Official Course Page',
      'AP Computer Science A AP Classroom',
      'AP Computer Science A Official Exam Page',
      'AP Computer Science A Fiveable Study Guides',
      'AP Computer Science A Knowt Study Guides',
      'AP Computer Science A CrackAP Practice Questions',
      'APCS Exam Prep',
      'AP Computer Science A CodingBat Java Practice',
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
        'A broad introduction to computing, data, networks, and technology impacts, with less emphasis on advanced coding than Computer Science A',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-computer-science-principles',
    links: [
      'AP Computer Science Principles Official Course Page',
      'AP Computer Science Principles AP Classroom',
      'AP Computer Science Principles Official Exam Page',
      'AP Computer Science Principles Khan Academy',
      'AP Computer Science Principles Fiveable Study Guides',
      'AP Computer Science Principles Knowt Study Guides',
      'AP Computer Science Principles CrackAP Practice Questions',
      'APCS Exam Prep',
      'AP Computer Science Principles Code.org Curriculum',
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
      'AP Precalculus Official Course Page',
      'AP Precalculus AP Classroom',
      'AP Precalculus Official Exam Page',
      'AP Precalculus Fiveable Study Guides',
      'AP Precalculus Knowt Study Guides',
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
      'AP Statistics Official Course Page',
      'AP Statistics AP Classroom',
      'AP Statistics Official Exam Page',
      'AP Statistics Khan Academy',
      'AP Statistics Fiveable Study Guides',
      'AP Statistics Knowt Study Guides',
      'AP Statistics CrackAP Practice Questions',
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
      'AP Biology Official Course Page',
      'AP Biology AP Classroom',
      'AP Biology Official Exam Page',
      'AP Biology Khan Academy',
      'AP Biology Fiveable Study Guides',
      'AP Biology Knowt Study Guides',
      'AP Biology CrackAP Practice Questions',
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
      'AP Chemistry Official Course Page',
      'AP Chemistry AP Classroom',
      'AP Chemistry Official Exam Page',
      'AP Chemistry Khan Academy',
      'AP Chemistry Fiveable Study Guides',
      'AP Chemistry Knowt Study Guides',
      'AP Chemistry CrackAP Practice Questions',
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
      'AP Environmental Science Official Course Page',
      'AP Environmental Science AP Classroom',
      'AP Environmental Science Official Exam Page',
      'AP Environmental Science Khan Academy',
      'AP Environmental Science Fiveable Study Guides',
      'AP Environmental Science Knowt Study Guides',
      'AP Environmental Science CrackAP Practice Questions',
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
    description:
        'An algebra-based introduction to motion, forces, energy, momentum, rotation, and oscillations',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-physics-1',
    links: [
      'AP Physics 1: Algebra-Based Official Course Page',
      'AP Physics 1: Algebra-Based AP Classroom',
      'AP Physics 1: Algebra-Based Official Exam Page',
      'AP Physics 1: Algebra-Based Khan Academy',
      'AP Physics 1: Algebra-Based Fiveable Study Guides',
      'AP Physics 1: Algebra-Based Knowt Study Guides',
      'AP Physics 1: Algebra-Based CrackAP Practice Questions',
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
        'Continues the algebra-based sequence with fluids, thermodynamics, electricity, magnetism, optics, and modern physics',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-physics-2',
    links: [
      'AP Physics 2: Algebra-Based Official Course Page',
      'AP Physics 2: Algebra-Based AP Classroom',
      'AP Physics 2: Algebra-Based Official Exam Page',
      'AP Physics 2: Algebra-Based Khan Academy',
      'AP Physics 2: Algebra-Based Fiveable Study Guides',
      'AP Physics 2: Algebra-Based Knowt Study Guides',
      'AP Physics 2: Algebra-Based CrackAP Practice Questions',
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
    description:
        'A calculus-based course on electric fields, circuits, magnetic fields, and electromagnetism for students comfortable with calculus',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url:
        'https://apstudents.collegeboard.org/courses/ap-physics-c-electricity-and-magnetism',
    links: [
      'AP Physics C: Electricity and Magnetism Official Course Page',
      'AP Physics C: Electricity and Magnetism AP Classroom',
      'AP Physics C: Electricity and Magnetism Official Exam Page',
      'AP Physics C: Electricity and Magnetism Fiveable Study Guides',
      'AP Physics C: Electricity and Magnetism Knowt Study Guides',
      'AP Physics C: Electricity and Magnetism CrackAP Practice Questions',
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
    description:
        'A calculus-based mechanics course that studies motion, forces, energy, momentum, rotation, and oscillations in greater mathematical depth',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-physics-c-mechanics',
    links: [
      'AP Physics C: Mechanics Official Course Page',
      'AP Physics C: Mechanics AP Classroom',
      'AP Physics C: Mechanics Official Exam Page',
      'AP Physics C: Mechanics Fiveable Study Guides',
      'AP Physics C: Mechanics Knowt Study Guides',
      'AP Physics C: Mechanics CrackAP Practice Questions',
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
      'AP Chinese Language and Culture Official Course Page',
      'AP Chinese Language and Culture AP Classroom',
      'AP Chinese Language and Culture Official Exam Page',
      'AP Chinese Language and Culture Fiveable Study Guides',
      'AP Chinese Language and Culture Knowt Study Guides',
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
      'AP French Language and Culture Official Course Page',
      'AP French Language and Culture AP Classroom',
      'AP French Language and Culture Official Exam Page',
      'AP French Language and Culture Fiveable Study Guides',
      'AP French Language and Culture Knowt Study Guides',
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
      'AP German Language and Culture Official Course Page',
      'AP German Language and Culture AP Classroom',
      'AP German Language and Culture Official Exam Page',
      'AP German Language and Culture Fiveable Study Guides',
      'AP German Language and Culture Knowt Study Guides',
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
      'AP Italian Language and Culture Official Course Page',
      'AP Italian Language and Culture AP Classroom',
      'AP Italian Language and Culture Official Exam Page',
      'AP Italian Language and Culture Knowt Study Guides',
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
      'AP Japanese Language and Culture Official Course Page',
      'AP Japanese Language and Culture AP Classroom',
      'AP Japanese Language and Culture Official Exam Page',
      'AP Japanese Language and Culture Fiveable Study Guides',
      'AP Japanese Language and Culture Knowt Study Guides',
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
      'AP Latin Official Course Page',
      'AP Latin AP Classroom',
      'AP Latin Official Exam Page',
      'AP Latin Fiveable Study Guides',
      'AP Latin Knowt Study Guides',
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
      'AP Spanish Language and Culture Official Course Page',
      'AP Spanish Language and Culture AP Classroom',
      'AP Spanish Language and Culture Official Exam Page',
      'AP Spanish Language and Culture Fiveable Study Guides',
      'AP Spanish Language and Culture Knowt Study Guides',
      'AP Spanish Language and Culture CrackAP Practice Questions',
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
      'AP Spanish Literature and Culture Official Course Page',
      'AP Spanish Literature and Culture AP Classroom',
      'AP Spanish Literature and Culture Official Exam Page',
      'AP Spanish Literature and Culture Fiveable Study Guides',
      'AP Spanish Literature and Culture Knowt Study Guides',
    ],
    apSubCategory: 'lang',
    detailNote:
        'The 2027 assessment date was not published when checked. Confirm the date on College Board before planning travel or testing.',
  ),

  const Resource(
    id: 'ap_seminar',
    title: 'AP Seminar',
    category: 'ap',
    field: 'english',
    description:
        'Interdisciplinary inquiry, source analysis, argument, and collaboration.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-seminar',
    links: ['Official AP Seminar course page'],
    apSubCategory: 'capstone',
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
      'AP Business with Personal Finance Official Course Page',
      'AP Business with Personal Finance AP Classroom',
      'AP Business with Personal Finance Official Exam Page',
    ],
    apSubCategory: 'history',
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
      'AP Cybersecurity Official Course Page',
      'AP Cybersecurity AP Classroom',
      'AP Cybersecurity Official Exam Page',
      'APCS Exam Prep',
    ],
    apSubCategory: 'cs',
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
    id: 'cb_sat_practice_hub',
    title: 'College Board SAT Practice Hub',
    category: 'sat',
    field: 'all',
    description:
        'The official starting point for study plans, Bluebook tests, question banks, student guides, and practice advice',
    icon: Icons.verified_outlined,
    url: 'https://satsuite.collegeboard.org/practice',
    links: ['Free official College Board materials'],
  ),
  const Resource(
    id: 'cb_sat_student_guide',
    title: 'College Board SAT Student Guide',
    category: 'sat',
    field: 'all',
    description:
        'The official student handbook for test-day rules, digital testing, scores, and section expectations',
    icon: Icons.article_outlined,
    url: 'https://satsuite.collegeboard.org/media/pdf/sat-student-guide.pdf',
    links: ['Free official PDF'],
  ),
  const Resource(
    id: 'cb_sat_skills_insight',
    title: 'College Board SAT Skills Insight',
    category: 'sat',
    field: 'all',
    description:
        'Official score-band skill descriptions with example questions for reading, writing, and math',
    icon: Icons.insights_outlined,
    url:
        'https://satsuite.collegeboard.org/media/pdf/skills-insight-digital-sat-suite.pdf',
    links: ['Free official PDF'],
  ),
  const Resource(
    id: 'cb_sat_sample_questions',
    title: 'College Board Digital SAT Sample Questions',
    category: 'sat',
    field: 'all',
    description:
        'A compact official set showing the question styles, skills, answer formats, and explanations used on the digital SAT',
    icon: Icons.quiz_outlined,
    url:
        'https://satsuite.collegeboard.org/media/pdf/digital-sat-sample-questions.pdf',
    links: ['Free official PDF'],
  ),
  const Resource(
    id: 'barrons_digital_sat',
    title: 'Barron\'s Digital SAT Study Guide Premium',
    category: 'sat',
    field: 'all',
    description:
        'A paid 2027 study guide with content review, strategy lessons, practice questions, and online companion materials',
    icon: Icons.menu_book_outlined,
    url: 'https://www.barronseduc.com/digital-sat',
    links: ['Paid book', 'Digital SAT edition'],
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
  const Resource(
    id: 'schoolhouse_sat_bootcamp',
    title: 'Schoolhouse SAT Bootcamps',
    category: 'sat',
    field: 'all',
    description:
        'Free small-group bootcamps led by trained peer tutors before major SAT dates',
    icon: Icons.groups,
    url: 'https://schoolhouse.world/sat-bootcamp',
    links: ['Join a Schoolhouse SAT bootcamp'],
  ),
  const Resource(
    id: 'preparc_sat',
    title: 'PrepArc Digital SAT Practice',
    category: 'sat',
    field: 'all',
    description:
        'Free human-written digital SAT questions organized by skill and difficulty',
    icon: Icons.quiz_outlined,
    url: 'https://preparc.app/',
    links: ['Practice on PrepArc'],
  ),
  const Resource(
    id: 'sat_1600io',
    title: '1600.io Digital SAT Course',
    category: 'sat',
    field: 'all',
    description:
        'Detailed SAT lessons, official test explanations, Desmos strategies, and math practice',
    icon: Icons.school_outlined,
    url: 'https://1600.io/',
    links: ['Explore 1600.io', 'Free preview available'],
  ),
  const Resource(
    id: 'uworld_sat',
    title: 'UWorld Digital SAT Question Bank',
    category: 'sat',
    field: 'all',
    description:
        'Challenging adaptive practice with thorough explanations and performance tracking',
    icon: Icons.analytics_outlined,
    url: 'https://collegeprep.uworld.com/sat/',
    links: ['UWorld SAT prep', 'Free trial available'],
  ),
  const Resource(
    id: 'magoosh_sat_test',
    title: 'Magoosh Free SAT Practice Test',
    category: 'sat',
    field: 'all',
    description:
        'A free digital practice test with a score estimate and answer explanations',
    icon: Icons.assignment_outlined,
    url: 'https://sat.magoosh.com/practice_tests/free',
    links: ['Take the Magoosh practice test'],
  ),
  const Resource(
    id: 'test_innovators_sat',
    title: 'Test Innovators Digital SAT Prep',
    category: 'sat',
    field: 'all',
    description:
        'Timed adaptive practice tests with diagnostic reports and targeted lessons',
    icon: Icons.track_changes,
    url: 'https://www.testinnovators.com/sat/',
    links: ['Test Innovators SAT'],
  ),
  const Resource(
    id: 'varsity_tutors_sat',
    title: 'Varsity Tutors SAT Practice',
    category: 'sat',
    field: 'all',
    description:
        'Free diagnostic tests, flashcards, and short practice sets for both SAT sections',
    icon: Icons.style,
    url: 'https://www.varsitytutors.com/sat-practice-tests',
    links: ['Varsity Tutors SAT tools'],
  ),
  const Resource(
    id: 'free_test_prep_sat',
    title: 'FreeTestPrep SAT Drills',
    category: 'sat',
    field: 'all',
    description:
        'Short SAT math and reading-writing drills with explanations after every question',
    icon: Icons.bolt,
    url: 'https://freetestprep.com/sat/',
    links: ['Free SAT drills'],
  ),
  const Resource(
    id: 'larry_learns_sat',
    title: 'Larry Learns SAT Practice',
    category: 'sat',
    field: 'all',
    description:
        'A large free question library with diagnostics, explanations, and score tools',
    icon: Icons.psychology_outlined,
    url: 'https://www.larrylearns.com/',
    links: ['Larry Learns SAT'],
  ),
  const Resource(
    id: 'critical_reader_sat',
    title: 'The Critical Reader SAT Guides',
    category: 'sat',
    field: 'english',
    testSection: 'reading_writing',
    description:
        'Focused reading, grammar, and vocabulary guidance from Erica Meltzer',
    icon: Icons.menu_book_outlined,
    url: 'https://thecriticalreader.com/books-3/',
    links: ['The Critical Reader SAT books'],
  ),
  const Resource(
    id: 'college_panda_sat_math',
    title: 'The College Panda SAT Math',
    category: 'sat',
    field: 'math',
    testSection: 'math',
    description:
        'A rigorous SAT math guide with topic lessons and exam-style problem sets',
    icon: Icons.calculate_outlined,
    url: 'https://thecollegepanda.com/books/sat-math/',
    links: ['College Panda SAT Math'],
  ),
  const Resource(
    id: 'scalar_learning_sat',
    title: 'Scalar Learning SAT Math Videos',
    category: 'sat',
    field: 'math',
    testSection: 'math',
    description:
        'Worked SAT math problems and full practice-test walkthroughs on video',
    icon: Icons.smart_display_outlined,
    url: 'https://www.youtube.com/@ScalarLearning',
    links: ['Watch Scalar Learning'],
  ),
  const Resource(
    id: 'collegeboard_tailored_practice',
    title: 'College Board Tailored Practice',
    category: 'sat',
    field: 'all',
    description:
        'Official targeted question sets based on your Bluebook practice-test results',
    icon: Icons.track_changes_outlined,
    url: 'https://satsuite.collegeboard.org/practice',
    links: ['College Board Tailored Practice'],
  ),
  const Resource(
    id: 'tutorllini_sat_math',
    title: 'Tutorllini Digital SAT Math Videos',
    category: 'sat',
    field: 'math',
    testSection: 'math',
    description:
        'Free Digital SAT math lessons, Desmos strategies, formula sheets, and complete test walkthroughs',
    icon: Icons.smart_display,
    url: 'https://www.youtube.com/@Tutorllini',
    links: ['Tutorllini Digital SAT Math'],
  ),
  const Resource(
    id: 'mathchops_sat',
    title: 'Mathchops Adaptive SAT Math',
    category: 'sat',
    field: 'math',
    testSection: 'math',
    description:
        'Adaptive SAT math practice that adjusts difficulty and mixes older skills back into review',
    icon: Icons.quiz_outlined,
    url: 'https://www.mathchops.com/',
    links: ['Mathchops SAT practice', 'Free and paid plans'],
  ),
  const Resource(
    id: 'prepscholar_sat',
    title: 'PrepScholar Digital SAT Course',
    category: 'sat',
    field: 'all',
    description:
        'A paid adaptive course with diagnostics, lessons, study plans, and a large practice library',
    icon: Icons.school_outlined,
    url: 'https://www.prepscholar.com/sat/s/',
    links: ['PrepScholar SAT course', 'Paid with a trial'],
  ),
  const Resource(
    id: 'supertutor_sat',
    title: 'SupertutorTV Digital SAT Prep',
    category: 'sat',
    field: 'all',
    description:
        'Video-led Digital SAT lessons, original practice tests, strategy videos, and a paid self-paced course',
    icon: Icons.smart_display,
    url: 'https://supertutortv.com/the-best-sat-prep-course-ever/',
    links: ['SupertutorTV SAT course', 'Free videos available'],
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
    description:
        'Official full-length practice tests, answer keys, online quizzes, and preparation guidance',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.check_circle_outline,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/free-act-test-prep.html',
    links: ['act.org/products/high-school-resources'],
  ),
  const Resource(
    id: 'pr_act',
    title: 'Princeton Review ACT Prep',
    category: 'act',
    field: 'all',
    description:
        'Updated Enhanced ACT instruction, practice tests, strategy lessons, and course options',
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
    testSection: 'english',
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
    testSection: 'science',
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
    testSection: 'math',
    description: 'ACT Math covers pre-algebra through trigonometry.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.calculate,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/act-exam-sections-and-structure.html',
    links: ['Official ACT Math overview'],
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
  const Resource(
    id: 'magoosh_act_free_test',
    title: 'Magoosh Free ACT Practice Test',
    category: 'act',
    field: 'all',
    description:
        'Free full and section-length ACT tests with score estimates and skill reports',
    icon: Icons.assignment_outlined,
    url: 'https://act.magoosh.com/practice_tests/free',
    links: ['Take the free Magoosh ACT'],
  ),
  const Resource(
    id: 'uworld_act',
    title: 'UWorld ACT Question Bank',
    category: 'act',
    field: 'all',
    description:
        'Exam-style ACT questions with visual explanations and progress analytics',
    icon: Icons.analytics_outlined,
    url: 'https://collegeprep.uworld.com/act/',
    links: ['UWorld ACT prep', 'Free trial available'],
  ),
  const Resource(
    id: 'varsity_tutors_act',
    title: 'Varsity Tutors ACT Practice Tests',
    category: 'act',
    field: 'all',
    description:
        'Free diagnostics, practice tests, flashcards, and questions of the day',
    icon: Icons.style,
    url: 'https://www.varsitytutors.com/act-practice-tests',
    links: ['Varsity Tutors ACT tools'],
  ),
  const Resource(
    id: 'free_test_prep_act',
    title: 'FreeTestPrep ACT Drills',
    category: 'act',
    field: 'all',
    description:
        'Quick practice sets for English, math, reading, and science with explanations',
    icon: Icons.bolt,
    url: 'https://freetestprep.com/act/',
    links: ['Free ACT practice drills'],
  ),
  const Resource(
    id: 'shrutam_act',
    title: 'Shrutam Free ACT Prep',
    category: 'act',
    field: 'all',
    description:
        'Free lessons, practice questions, and mock tests covering every ACT section',
    icon: Icons.school_outlined,
    url: 'https://www.shrutam.com/act/',
    links: ['Study with Shrutam'],
  ),
  const Resource(
    id: 'actify_prep',
    title: 'Actify Targeted ACT Practice',
    category: 'act',
    field: 'all',
    description:
        'Free targeted sessions with explanations, answer review, and progress tracking',
    icon: Icons.track_changes,
    url: 'https://actifyprep.com/',
    links: ['Practice with Actify'],
  ),
  const Resource(
    id: 'test_innovators_act',
    title: 'Test Innovators ACT Prep',
    category: 'act',
    field: 'all',
    description:
        'Realistic online tests, timing practice, and detailed diagnostic reports',
    icon: Icons.computer,
    url: 'https://www.testinnovators.com/act/',
    links: ['Test Innovators ACT'],
  ),
  const Resource(
    id: 'kaplan_free_act_test',
    title: 'Kaplan Free ACT Practice Test',
    category: 'act',
    field: 'all',
    description:
        'A free timed ACT practice test with a personalized score report',
    icon: Icons.assignment_turned_in_outlined,
    url: 'https://www.kaptest.com/act/free/act-free-practice-test',
    links: ['Kaplan free ACT test'],
  ),
  const Resource(
    id: 'princeton_free_act_test',
    title: 'Princeton Review Free ACT Test',
    category: 'act',
    field: 'all',
    description:
        'A full-length practice option with scoring and a performance breakdown',
    icon: Icons.fact_check_outlined,
    url: 'https://www.princetonreview.com/college/free-act-practice-test',
    links: ['Princeton Review free ACT test'],
  ),
  const Resource(
    id: 'critical_reader_act_english',
    title: 'The Critical Reader ACT English Guide',
    category: 'act',
    field: 'english',
    testSection: 'english',
    description:
        'Rule-based grammar and rhetoric review written specifically for ACT English',
    icon: Icons.edit_note,
    url:
        'https://thecriticalreader.com/product/the-complete-guide-to-act-english/',
    links: ['ACT English guide'],
  ),
  const Resource(
    id: 'college_panda_act_math',
    title: 'The College Panda ACT Math',
    category: 'act',
    field: 'math',
    testSection: 'math',
    description:
        'Advanced ACT math instruction with focused exercises and mixed review',
    icon: Icons.calculate_outlined,
    url: 'https://thecollegepanda.com/books/act-math/',
    links: ['College Panda ACT Math'],
  ),
  const Resource(
    id: 'larry_learns_act',
    title: 'Larry Learns ACT Practice',
    category: 'act',
    field: 'all',
    description:
        'Free ACT practice across all sections with diagnostics and explanations',
    icon: Icons.psychology_outlined,
    url: 'https://www.larrylearns.com/act',
    links: ['Larry Learns ACT'],
  ),
  const Resource(
    id: 'act_official_sample_questions',
    title: 'Official ACT Online Sample Questions',
    category: 'act',
    field: 'all',
    description:
        'Current official sample questions for English, math, reading, science, and writing',
    icon: Icons.verified_outlined,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation/free-act-test-prep/act-online-test-sample-questions.html',
    links: ['Official ACT sample questions'],
  ),
  const Resource(
    id: 'act_official_prep_guide',
    title: 'The Official ACT Prep Guide',
    category: 'act',
    field: 'all',
    description:
        'The current ACT guide with authentic practice tests, answer explanations, and section review',
    icon: Icons.menu_book_outlined,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation.html',
    links: ['Official ACT preparation products', 'Paid book'],
  ),
  const Resource(
    id: 'act_official_subject_guides',
    title: 'Official ACT Subject Guides',
    category: 'act',
    field: 'all',
    description:
        'Official paid guides with focused review and authentic practice for individual ACT sections',
    icon: Icons.library_books_outlined,
    url:
        'https://www.act.org/content/act/en/products-and-services/the-act/test-preparation.html',
    links: ['Official ACT preparation products', 'Paid books'],
  ),
  const Resource(
    id: 'barrons_act',
    title: 'Barron\'s ACT Study Guide Premium',
    category: 'act',
    field: 'all',
    description:
        'A paid 2026 guide with full-length practice tests, section review, strategies, and online practice',
    icon: Icons.menu_book_outlined,
    url: 'https://www.barronseduc.com/booksonline',
    links: ['Paid book', 'ACT Study Guide Premium 2026'],
  ),
  const Resource(
    id: 'prepscholar_act',
    title: 'PrepScholar Enhanced ACT Course',
    category: 'act',
    field: 'all',
    description:
        'A paid adaptive course rebuilt for the Enhanced ACT with diagnostics, lessons, and practice tests',
    icon: Icons.school_outlined,
    url: 'https://www.prepscholar.com/act-test-prep/',
    links: ['PrepScholar ACT course', 'Paid with a trial'],
  ),
  const Resource(
    id: 'magoosh_act_course',
    title: 'Magoosh Enhanced ACT Course',
    category: 'act',
    field: 'all',
    description:
        'A lower-cost paid course with video lessons, timed tests, practice questions, and study schedules',
    icon: Icons.smart_display,
    url: 'https://act.magoosh.com/',
    links: ['Magoosh ACT course', 'Seven-day trial'],
  ),
  const Resource(
    id: 'preppros_act',
    title: 'PrepPros Ultimate ACT Course',
    category: 'act',
    field: 'all',
    description:
        'Detailed Enhanced ACT lessons, books, study plans, official-test walkthroughs, and extensive practice',
    icon: Icons.school_outlined,
    url: 'https://www.preppros.io/act-course',
    links: ['PrepPros ACT course', 'Paid course'],
  ),
  const Resource(
    id: 'supertutor_act',
    title: 'SupertutorTV Enhanced ACT Prep',
    category: 'act',
    field: 'all',
    description:
        'Video-based Enhanced ACT instruction with free strategy videos and a paid self-paced course',
    icon: Icons.smart_display,
    url: 'https://supertutortv.com/act/',
    links: ['SupertutorTV ACT prep', 'Free videos available'],
  ),
  const Resource(
    id: 'mathchops_act',
    title: 'Mathchops Adaptive ACT Math',
    category: 'act',
    field: 'math',
    testSection: 'math',
    description:
        'Adaptive ACT math drills that target weak topics while continuing to review mastered skills',
    icon: Icons.quiz_outlined,
    url: 'https://www.mathchops.com/',
    links: ['Mathchops ACT math', 'Free and paid plans'],
  ),

  // ===========================================================================
  // INDEPENDENT COLLEGE COURSES FOR HIGH SCHOOL STUDENTS
  // ===========================================================================
  const Resource(
    id: 'uw_summer_sessions_high_school',
    title: 'UW Summer Sessions',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer'],
    field: 'all',
    scope: 'local',
    format: 'hybrid',
    locationNote: 'UW Seattle campus, with some online courses',
    timeCommitment: 'Four-and-a-half-week or nine-week summer courses',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Linear algebra and advanced mathematics',
      'Computer science and data science',
      'Biology, chemistry, physics, and astronomy',
      'Economics, business, and public policy',
      'Psychology and social sciences',
      'Writing, literature, history, and languages',
      'Art, design, music, and communication',
    ],
    applicationInfo:
        'U.S. high school students who have completed eighth grade apply directly. Students under 18 only need the university form signed by a parent or guardian',
    instructions:
        'Browse the public course offerings, apply online, pay the application fee, activate the UW NetID, register for an open course in Register.UW, and pay tuition. EPS involvement is optional and is not part of UW enrollment',
    description:
        'Take a regular UW summer course alongside university students and earn graded UW credit on an official transcript',
    icon: Icons.account_balance_outlined,
    url:
        'https://www.summer.uw.edu/registration-costs/how-to-register/us-high-school-students',
    links: ['UW registration steps', 'Course offerings', 'Tuition and fees'],
    detailNote:
        'UW offers nearly 1,000 summer courses across more than 100 fields. Introductory 100-level classes are the simplest starting point, while courses such as multivariable calculus or linear algebra require the listed prerequisites and available space',
  ),
  const Resource(
    id: 'uiuc_netmath_high_school',
    title: 'University of Illinois NetMath',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer', 'school_year', 'self_paced'],
    field: 'math',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online through the University of Illinois Urbana-Champaign',
    timeCommitment: 'Most courses are self-paced over 16 weeks',
    majorTags: ['stem', 'math', 'cs', 'engineering', 'data_science', 'physics'],
    courseOfferings: [
      'College Algebra and Trigonometry',
      'MATH 241: Calculus III',
      'MATH 257: Linear Algebra with Computational Applications',
      'MATH 285: Introductory Differential Equations',
      'MATH 314: Introduction to Higher Mathematics',
      'MATH 416: Abstract Linear Algebra',
      'MATH 417: Abstract Algebra',
      'MATH 423: Differential Geometry',
      'MATH 444: Elementary Real Analysis',
      'MATH 453: Number Theory',
    ],
    applicationInfo:
        'Students age 15 or older register directly through the university’s nondegree portal after documenting the published prerequisites',
    instructions:
        'Choose a course, check its prerequisite evidence, create a nondegree account, submit the course request, confirm the university letter of intent, activate the Illinois NetID, and pay tuition',
    description:
        'Earn University of Illinois transcript credit through rigorous online mathematics courses built for independent enrollment',
    icon: Icons.calculate_outlined,
    url: 'https://netmath.illinois.edu/academics/netmath-high-school-programs',
    links: ['High school courses', 'Course catalog', 'Registration'],
    detailNote:
        'Options range from college algebra to Calculus III, differential equations, number theory, and real analysis. MATH 257 Linear Algebra with Computational Applications is a three-credit course using Python and requires prior calculus and programming preparation',
  ),
  const Resource(
    id: 'asu_universal_learner',
    title: 'ASU Universal Learner Courses',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer', 'school_year', 'self_paced'],
    field: 'all',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Fully online through Arizona State University',
    timeCommitment: 'Usually 8 or 16 weeks',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'College algebra, precalculus, and calculus for engineers',
      'Introduction to programming',
      'English composition and human communication',
      'Psychology, macroeconomics, and microeconomics',
      'Biology and environmental science',
      'U.S. history and government',
      'Business and entrepreneurship',
    ],
    applicationInfo:
        'Students enroll directly with a small initial fee and pay the transcript fee only if they choose to keep the completed course',
    instructions:
        'Create an account, choose a course, pay the registration fee, complete the work, review the final grade, and purchase ASU transcript credit only when you want the result recorded',
    description:
        'Try a real ASU course online and decide after seeing the final grade whether to add it to an official transcript',
    icon: Icons.laptop_chromebook_outlined,
    url: 'https://ea.asu.edu/courses/',
    links: ['Course catalog', 'Enrollment and credit FAQs', 'Course calendar'],
    detailNote:
        'The catalog covers business, communication, design, health, humanities, math, science, social science, and technology. This is a lower-risk choice because an unsuccessful attempt does not have to be added to the transcript',
  ),
  const Resource(
    id: 'und_enroll_anytime',
    title: 'UND Enroll Anytime',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer', 'school_year', 'self_paced'],
    field: 'all',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Fully online through the University of North Dakota',
    timeCommitment: 'Self-paced, with up to nine months for most courses',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'College algebra, precalculus, and calculus',
      'General chemistry and nutrition',
      'Introduction to psychology',
      'American government and economics',
      'English composition and communication',
      'Business and world languages',
    ],
    applicationInfo:
        'High school students independently enroll in eligible 100- and 200-level courses after meeting the prerequisites',
    instructions:
        'Choose an eligible lower-division course, confirm prerequisites and proctoring rules, register and pay directly through UND, finish the graded work, and order the university transcript',
    description:
        'Complete a self-paced university course on your own schedule and receive a permanent University of North Dakota grade',
    icon: Icons.schedule_outlined,
    url: 'https://und.edu/academics/online/enroll-anytime/index.html',
    links: ['Course catalog', 'High school eligibility', 'Registration'],
    detailNote:
        'Subjects include mathematics, chemistry, government, psychology, languages, communication, and humanities. Introductory courses are approachable first choices, while calculus, science, and language sequences need more preparation',
  ),
  const Resource(
    id: 'berkeley_precollege_scholars',
    title: 'UC Berkeley Pre-College Scholars',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer'],
    field: 'all',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'UC Berkeley campus or virtual summer track',
    timeCommitment: 'Usually one or two six- or eight-week courses',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science and data science',
      'Engineering and mathematics',
      'Biology, chemistry, and physics',
      'Economics and business',
      'Psychology, sociology, and political science',
      'Writing, literature, and languages',
      'Art, architecture, and design',
    ],
    applicationInfo:
        'High school students apply directly and select eligible lower-division Berkeley Summer Sessions courses',
    instructions:
        'Choose the on-campus or virtual track, browse eligible courses, apply through Berkeley’s portal, submit the requested student and family materials, then register and pay after admission',
    description:
        'Join regular UC Berkeley summer classes, earn university credit, and receive a Berkeley transcript',
    icon: Icons.account_balance_outlined,
    url: 'https://summer.berkeley.edu/students/high-school',
    links: ['High school program', 'Application', 'Summer class schedule'],
    detailNote:
        'Hundreds of lower-division courses span science, engineering, computing, economics, social science, languages, arts, and humanities. Check prerequisites carefully because the accelerated schedule moves quickly',
  ),
  const Resource(
    id: 'ucla_summer_high_school_courses',
    title: 'UCLA Summer Courses for High School Students',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer'],
    field: 'all',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'UCLA campus, online, or an approved intensive format',
    timeCommitment: 'Most courses run for six weeks',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science, engineering, and mathematics',
      'Biology, chemistry, physics, and health',
      'Economics, business, and public affairs',
      'Psychology and social science',
      'Writing, literature, and languages',
      'Film, media, and performing arts',
    ],
    applicationInfo:
        'High school students register directly for one or two courses from UCLA’s approved course list',
    instructions:
        'Review the current approved list, confirm prerequisites and format, submit the UCLA Summer Sessions registration materials and fee, enroll in the course, and pay tuition',
    description:
        'Study beside college students in an approved UCLA course and finish with graded UCLA credit on an official transcript',
    icon: Icons.school_outlined,
    url: 'https://summer.ucla.edu/high-school-students/',
    links: ['High school options', 'Approved courses', 'Registration and fees'],
    detailNote:
        'The approved list changes each summer and includes in-person and online options across many majors. Regular summer courses focus on the actual class without requiring a separate school partnership',
  ),
  const Resource(
    id: 'stanford_summer_high_school',
    title: 'Stanford Summer Session',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer'],
    field: 'all',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Stanford campus with commuter and residential choices',
    timeCommitment: 'Eight-week summer quarter',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science and data science',
      'Engineering and mathematics',
      'Biology and human health',
      'Economics and entrepreneurship',
      'Psychology and social science',
      'Writing, literature, philosophy, and politics',
      'Art, music, and film',
    ],
    applicationInfo:
        'Current sophomores, juniors, and seniors who meet the age range apply directly with a transcript and essay',
    instructions:
        'Review eligibility and courses, apply to Summer Session, submit the transcript and essay, accept admission, choose commuter or residential status, then register in Axess',
    description:
        'Attend Stanford’s regular summer quarter as a visiting high school student and earn Stanford credit with an official transcript',
    icon: Icons.account_balance_outlined,
    url: 'https://summer.stanford.edu/high-school',
    links: ['High school Summer Session', 'Course catalog', 'Application'],
    detailNote:
        'More than 130 courses cover over 30 departments and every Summer Session course carries Stanford University credit. Admission is selective and the required course load makes this a substantial commitment',
  ),
  const Resource(
    id: 'harvard_secondary_school_program',
    title: 'Harvard Secondary School Program',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer'],
    field: 'all',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Harvard campus, online, or Boston-area commuter option',
    timeCommitment: 'Four-week or seven-week intensive program',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Molecular and cellular biology',
      'Computer science, data science, mathematics, and statistics',
      'Psychology and neuroscience',
      'Economics and entrepreneurship',
      'Law, government, and sociology',
      'Creative writing, literature, history, and languages',
    ],
    applicationInfo:
        'Eligible high school students apply directly to the selective credit-bearing program',
    instructions:
        'Choose the four- or seven-week format, review age and graduation-year eligibility, apply with the requested academic materials, accept admission, then register for one or two courses',
    description:
        'Complete a Harvard Summer School course for college credit through an online, commuter, or residential option',
    icon: Icons.school_outlined,
    url:
        'https://summer.harvard.edu/high-school-programs/secondary-school-program/',
    links: ['Program details', 'Credit course catalog', 'Application and cost'],
    detailNote:
        'The seven-week catalog includes more than 200 courses in biology, psychology, entrepreneurship, law, computer science, writing, sociology, and other fields. The separate two-week Pre-College Program does not award credit',
  ),
  const Resource(
    id: 'cornell_precollege_studies',
    title: 'Cornell Precollege Studies',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer', 'school_year'],
    field: 'all',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Cornell campus or online summer and winter courses',
    timeCommitment: 'Three- or six-week courses',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Engineering and computer science',
      'Biology, health, and animal science',
      'Business and economics',
      'Architecture, art, and design',
      'Public policy, government, and social science',
      'Writing and humanities',
    ],
    applicationInfo:
        'Eligible high school juniors and seniors ages 15 to 19 apply directly to Cornell Precollege Studies',
    instructions:
        'Choose an online, commuter, or residential session, browse eligible courses, apply with the required student materials, accept admission, register, and pay tuition',
    description:
        'Take a Cornell course alongside undergraduates and earn three to twelve credits on an official Cornell transcript',
    icon: Icons.school_outlined,
    url: 'https://sce.cornell.edu/precollege',
    links: ['Precollege Studies', 'Credit courses', 'Application and tuition'],
    detailNote:
        'Courses explore majors across STEM, business, policy, social science, humanities, and the arts. Online choices add flexibility, while campus courses provide a traditional university experience',
  ),
  const Resource(
    id: 'boston_university_high_school_honors',
    title: 'Boston University High School Honors',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer'],
    field: 'all',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Boston University campus, with selected online courses',
    timeCommitment: 'Six-week summer program',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science, mathematics, and statistics',
      'Biology, neuroscience, health sciences, and physics',
      'Business, management, economics, and hospitality',
      'Political science and international relations',
      'Psychology, sociology, and anthropology',
      'Writing, literature, and languages',
      'Film, media, photography, theatre, music, and visual arts',
    ],
    applicationInfo:
        'Students entering junior or senior year apply directly and choose one or two approved undergraduate courses',
    instructions:
        'Review the course list, check prerequisites, apply through BU Summer Term, choose commuter or residential status, then register and pay after admission',
    description:
        'Choose from more than 80 BU undergraduate courses, study with college students, and earn up to eight university credits',
    icon: Icons.school_outlined,
    url: 'https://www.bu.edu/summer/high-school-programs/high-school-honors/',
    links: ['Program details', 'Approved courses', 'Application and costs'],
    detailNote:
        'Subjects include computer science, business, biology, neuroscience, economics, languages, mathematics, statistics, writing, media, art, and social science',
  ),
  const Resource(
    id: 'georgetown_summer_college',
    title: 'Georgetown Summer College',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer'],
    field: 'all',
    scope: 'national',
    format: 'hybrid',
    locationNote: 'Georgetown campus in Washington, D.C., or online',
    timeCommitment: 'Five-week on-campus or eight-week online courses',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Government and international relations',
      'Economics and business',
      'Writing and humanities',
      'Psychology and social science',
      'Biology and health',
      'Computer science and mathematics',
      'Law and public policy',
    ],
    applicationInfo:
        'Eligible high school students apply directly and may take up to two approved courses per session',
    instructions:
        'Review the course list and eligibility, apply to Summer College, submit the requested academic and family materials, then enroll and pay after admission',
    description:
        'Take a Georgetown course with undergraduate students and receive credit on an official university transcript',
    icon: Icons.account_balance_outlined,
    url: 'https://summer.georgetown.edu/programs/SHS04/college-credit-courses/',
    links: ['Summer College', 'Course options', 'Application and tuition'],
    detailNote:
        'Courses are generally three credits and cover fields such as government, international relations, economics, business, writing, science, and humanities',
  ),
  const Resource(
    id: 'alabama_early_college',
    title: 'University of Alabama Early College',
    category: 'dual_credit',
    collegeCourseType: 'independent',
    courseTermTags: ['summer', 'school_year'],
    field: 'all',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online, with optional summer experiences in Alabama',
    timeCommitment: 'Semester-length university courses',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science and engineering',
      'Chemistry and mathematics',
      'Business, communication, and economics',
      'Political science, English, and history',
      'Psychology and anthropology',
      'World languages and art history',
    ],
    applicationInfo:
        'Students who have completed eighth grade and meet the GPA requirement apply directly to Early College',
    instructions:
        'Submit the Early College application and academic record, complete the introductory readiness course and orientation, then choose and register for an approved course',
    description:
        'Build a University of Alabama transcript independently through online courses across more than 80 subjects',
    icon: Icons.school_outlined,
    url: 'https://earlycollege.ua.edu/',
    links: ['Early College', 'Course list', 'Eligibility and tuition'],
    detailNote:
        'Options include chemistry, communication, engineering, languages, mathematics, computer science, political science, English, history, and the arts',
  ),

  // Counselor-supported dual enrollment options
  const Resource(
    id: 'bellevue_college_dual_credit',
    title: 'Bellevue College Running Start',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['school_year'],
    field: 'all',
    scope: 'local',
    format: 'hybrid',
    locationNote: 'Bellevue campus with online options that vary by quarter',
    timeCommitment: 'One college quarter at a time',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science and information technology',
      'Mathematics, statistics, and laboratory science',
      'Business, accounting, and economics',
      'Psychology and social science',
      'English, communication, and world languages',
      'Art, design, music, and health sciences',
    ],
    applicationInfo:
        'Eligible juniors and seniors coordinate enrollment and course equivalencies with their high school',
    instructions:
        'Apply to Bellevue College, complete placement and orientation, work with the school counselor on the enrollment verification form, then register for approved courses',
    description:
        'Take Bellevue College classes tuition-free within the Running Start credit limit while earning high school and college credit',
    icon: Icons.school_outlined,
    url: 'https://www.bellevuecollege.edu/high-school-dual-credit/',
    links: ['Running Start', 'Admissions steps', 'Course catalog'],
    detailNote:
        'A broad local catalog for writing, psychology, business, computer science, languages, mathematics, laboratory science, and general education',
  ),
  const Resource(
    id: 'cascadia_running_start',
    title: 'Cascadia College Running Start',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['summer', 'school_year'],
    field: 'all',
    scope: 'local',
    format: 'hybrid',
    locationNote: 'Bothell, Redmond, online, and hybrid options',
    timeCommitment: 'One quarter at a time, part-time or full-time',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science and engineering',
      'Mathematics and natural science',
      'Environmental studies and earth science',
      'Business',
      'Communication, creative arts, and design',
      'Psychology, education, and human services',
    ],
    applicationInfo:
        'Eligible juniors and seniors need placement, orientation, and a school-approved enrollment verification form',
    instructions:
        'Apply to Cascadia, submit the Running Start contract and placement documents, complete registration orientation, then coordinate the quarterly verification form with the counselor',
    description:
        'Earn high school and college credit together through a flexible Eastside-area Running Start schedule',
    icon: Icons.school_outlined,
    url:
        'https://www.cascadia.edu/student-resources/high-school-programs/running.aspx',
    links: ['Running Start', 'Application', 'Quarterly deadlines'],
    detailNote:
        'Course areas include business, communication and design, environmental studies, health, STEM, social science, and education',
  ),
  const Resource(
    id: 'lwtech_running_start',
    title: 'LWTech Running Start',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['summer', 'school_year'],
    field: 'all',
    scope: 'local',
    format: 'hybrid',
    locationNote: 'Kirkland campus with selected online and hybrid classes',
    timeCommitment: 'One college quarter at a time',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science and software development',
      'Engineering technology and electronics',
      'Design and digital gaming',
      'Business and entrepreneurship',
      'Health sciences',
      'Biology, chemistry, and mathematics',
      'Transportation and manufacturing',
    ],
    applicationInfo:
        'Eligible juniors and seniors complete college admission and submit school authorization before registering',
    instructions:
        'Apply for Running Start, establish placement, attend orientation, complete the enrollment verification form with the counselor, then choose approved classes',
    description:
        'Combine transferable academics with hands-on technical courses at Lake Washington Institute of Technology',
    icon: Icons.engineering_outlined,
    url:
        'https://www.lwtech.edu/academics/high-school/running-start/index.aspx',
    links: ['Running Start', 'Programs', 'Enrollment steps'],
    detailNote:
        'A strong option for engineering technology, computing, design, business, health, and career-focused technical fields',
  ),
  const Resource(
    id: 'seattle_colleges_running_start',
    title: 'Seattle Colleges Running Start',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['school_year'],
    field: 'all',
    scope: 'local',
    format: 'hybrid',
    locationNote: 'North Seattle, Seattle Central, or South Seattle College',
    timeCommitment: 'One college quarter at a time',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science, engineering, and natural science',
      'Mathematics, business, and accounting',
      'Nursing and allied health',
      'Psychology and social science',
      'English, communication, and languages',
      'Art, music, film, and design',
      'Skilled trades and technical programs',
    ],
    applicationInfo:
        'Eligible juniors and seniors complete the selected college’s application and school verification process',
    instructions:
        'Choose a campus, apply, complete placement and orientation, coordinate the enrollment verification form with the counselor, then register for approved classes',
    description:
        'Compare three Seattle campuses with broad transfer, technical, arts, business, health, and STEM offerings',
    icon: Icons.location_city_outlined,
    url: 'https://www.seattlecolleges.edu/running-start',
    links: ['Running Start', 'Choose a campus', 'Application steps'],
  ),
  const Resource(
    id: 'uw_high_school',
    title: 'UW in the High School',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['school_year'],
    field: 'all',
    scope: 'regional',
    format: 'in_person',
    locationNote:
        'Available only through participating Washington high schools',
    timeCommitment: 'Runs with the approved high school course',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Calculus and advanced mathematics',
      'Computer programming',
      'Astronomy and earth science',
      'Biology, chemistry, and physics',
      'English composition and literature',
      'History and social science',
      'Spanish, French, German, and Japanese',
    ],
    applicationInfo:
        'Students may register only when their school offers an approved UW course with an approved teacher',
    instructions:
        'Ask the counseling office which current school courses carry UW credit, then follow the teacher and UW registration instructions during the enrollment window',
    description:
        'Earn University of Washington credit in an approved course taught at the high school',
    icon: Icons.account_balance_outlined,
    url: 'https://www.uwhs.uw.edu/',
    links: ['Program information', 'Course list', 'Registration'],
  ),
  const Resource(
    id: 'shoreline_running_start',
    title: 'Shoreline College Running Start',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['school_year'],
    field: 'all',
    scope: 'regional',
    format: 'hybrid',
    locationNote:
        'Shoreline campus with flexible morning and afternoon schedules',
    timeCommitment: 'Part-time or full-time college quarters',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science, engineering, and mathematics',
      'Natural science, health, and nursing',
      'Business and economics',
      'Psychology and social science',
      'Writing, communication, and languages',
      'Music, art, film, and automotive technology',
    ],
    applicationInfo:
        'Washington public-school juniors and seniors complete college placement and school enrollment verification',
    instructions:
        'Apply to Shoreline, establish English placement, attend the required onboarding, complete the verification form with the counselor, then register',
    description:
        'Choose advanced transfer or career courses that count toward high school and college requirements',
    icon: Icons.school_outlined,
    url:
        'https://www.shoreline.edu/high-school-programs/running-start/default.aspx',
    links: ['Running Start', 'Eligibility', 'Information sessions'],
  ),
  const Resource(
    id: 'edmonds_running_start',
    title: 'Edmonds College Running Start',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['summer', 'school_year'],
    field: 'all',
    scope: 'regional',
    format: 'hybrid',
    locationNote: 'Lynnwood campus with in-person and online classes',
    timeCommitment: 'Part-time or full-time college quarters',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science and engineering technology',
      'Mathematics and natural science',
      'Business, accounting, health, and nursing',
      'Psychology, education, and social science',
      'English, communication, art, and design',
      'Career and technical programs',
    ],
    applicationInfo:
        'Washington juniors and seniors may participate regardless of GPA, with school coordination for funded credits',
    instructions:
        'Apply to Edmonds, complete the Running Start enrollment steps, work with the counselor on the verification form and course plan, then register',
    description:
        'Take tuition-free college courses in transfer and career fields while completing high school requirements',
    icon: Icons.school_outlined,
    url: 'https://www.edmonds.edu/programs-and-degrees/running-start/',
    links: ['Running Start', 'Enroll', 'Costs and support'],
  ),
  const Resource(
    id: 'green_river_running_start',
    title: 'Green River College Running Start',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['summer', 'school_year'],
    field: 'all',
    scope: 'regional',
    format: 'hybrid',
    locationNote: 'Auburn-area campuses and online courses',
    timeCommitment: 'Part-time or full-time college quarters',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science and data analytics',
      'Engineering, mathematics, and natural science',
      'Business, accounting, nursing, and health',
      'Psychology and social science',
      'English, communication, and languages',
      'Aviation and career-technical programs',
    ],
    applicationInfo:
        'Academically qualified Washington juniors and seniors coordinate funded enrollment with their school',
    instructions:
        'Complete the Green River application and eligibility steps, build a course plan with school support, submit the verification form, then register',
    description:
        'Explore university-transfer and career-technical courses across Green River campuses or online',
    icon: Icons.school_outlined,
    url:
        'https://www.greenriver.edu/students/academics/running-start/about.html',
    links: ['Running Start', 'Get started', 'Programs and courses'],
  ),
  const Resource(
    id: 'highline_running_start',
    title: 'Highline College Running Start',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['summer', 'school_year'],
    field: 'all',
    scope: 'regional',
    format: 'hybrid',
    locationNote: 'Des Moines, Washington, with online course options',
    timeCommitment: 'Part-time or full-time college quarters',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'Computer science and cybersecurity',
      'Engineering, mathematics, and environmental science',
      'Business, accounting, health, and nursing',
      'Psychology and social science',
      'Writing, communication, and languages',
      'Career Start professional-technical pathways',
    ],
    applicationInfo:
        'Eligible juniors and seniors submit a new-student packet completed with a counselor and parent or guardian',
    instructions:
        'Apply to Highline, determine placement, complete the Running Start packet and verification form with the counselor, then attend onboarding and register',
    description:
        'Choose transfer courses or career-focused pathways while earning tuition-free high school and college credit',
    icon: Icons.school_outlined,
    url: 'https://highline.edu/apply-enroll/admissions/running-start.html',
    links: ['Running Start admission', 'Career Start', 'Course catalog'],
  ),
  const Resource(
    id: 'wa_running_start_directory',
    title: 'Washington Dual Credit Program Finder',
    category: 'dual_credit',
    collegeCourseType: 'counselor',
    courseTermTags: ['summer', 'school_year'],
    field: 'all',
    scope: 'regional',
    format: 'hybrid',
    locationNote: 'All 34 Washington community and technical colleges',
    timeCommitment: 'Varies by college and course',
    majorTags: ['all_subjects'],
    courseOfferings: [
      'University-transfer courses at 34 community and technical colleges',
      'Career and Technical Education dual credit',
      'College in the High School courses',
      'Running Start academic courses',
      'Professional and technical certificates',
    ],
    applicationInfo:
        'Use the official state guide to compare Running Start, College in the High School, and CTE dual credit routes',
    instructions:
        'Compare nearby participating colleges, choose a program, then work with the school counselor and college coordinator on its enrollment process',
    description:
        'Find additional accredited Washington dual-credit options when the featured local colleges do not fit your schedule or subject',
    icon: Icons.map_outlined,
    url:
        'https://www.sbctc.edu/becoming-a-student/high-school/dual-credit-student.aspx',
    links: ['State dual credit guide', 'College directory', 'Program FAQ'],
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
    format: 'in_person',
    locationNote: 'In-person at MIT',
    timeCommitment: '6 weeks full-time in summer',
    majorTags: ['research', 'stem', 'academia'],
    applicationInfo:
        'Apply with essays, recommendations, coursework, and test scores if available; the program is free to attend',
    description:
        'Spend a summer at MIT moving from advanced STEM classes into an original research project and final conference presentation',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://www.cee.org/programs/research-science-institute',
    links: ['cee.org/rsi', 'Application portal'],
    detailNote:
        'The 2027 application calendar is not posted yet, so confirm dates on the official page before preparing materials',
  ),
  const Resource(
    id: 'primes',
    title: 'MIT PRIMES-USA',
    category: 'research',
    field: 'cs',
    scope: 'national',
    format: 'virtual',
    locationNote: 'Online / Remote',
    timeCommitment: '10 hours/week for a full year',
    majorTags: ['math', 'cs', 'computational_biology'],
    applicationInfo:
        'Apply with school records, recommendations, and a challenging entrance problem set',
    description:
        'Work remotely for a full academic year on an original math, computer science, or computational biology problem with an MIT mentor',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://math.mit.edu/research/highschool/primes/usa',
    links: ['math.mit.edu/research/highschool/primes', 'Application info'],
    detailNote:
        'The 2027 application link is expected in September 2026 for eligible U.S. sophomores and juniors',
  ),
  const Resource(
    id: 'nih',
    title: 'NIH High School Internship',
    category: 'research',
    field: 'biology',
    scope: 'national',
    format: 'in_person',
    locationNote: 'In-person at NIH campuses',
    timeCommitment: '8 weeks full-time in summer',
    majorTags: ['biology', 'medicine', 'research'],
    applicationInfo:
        'The Summer 2027 application opens in mid-November 2026 and requires references, coursework, and research interests',
    description:
        'Join an NIH research group for a paid summer experience in biomedical, behavioral, or related health research',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.science,
    url: 'https://www.training.nih.gov/research-training/pb/sip/',
    links: ['NIH Summer Internship Program', 'NIH application guidance'],
    detailNote:
        'For 2027, eligible high school applicants must be seniors and meet the program age and citizenship or residency requirements',
  ),
  const Resource(
    id: 'polygence',
    title: 'Polygence',
    category: 'research',
    field: 'all',
    scope: 'international',
    format: 'virtual',
    locationNote: 'Online (remote)',
    timeCommitment: '10-15 sessions over 3-6 months',
    majorTags: ['research', 'mentorship', 'all_subjects'],
    applicationInfo: 'Apply online with project interests',
    description:
        'Build an independent project in a subject you choose through one-on-one online meetings with a research mentor',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.article,
    url: 'https://www.polygence.org',
    links: ['polygence.org', 'Browse mentors', 'Showcase past projects'],
    detailNote:
        'This is a paid mentorship service rather than a funded university research placement, so compare cost and mentor fit carefully',
  ),
  const Resource(
    id: 'bu_rise',
    title: 'Boston University RISE',
    category: 'research',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Boston University in Boston, Massachusetts',
    timeCommitment: '6 weeks full-time in summer',
    majorTags: ['science', 'engineering', 'research', 'biology', 'cs'],
    applicationInfo:
        'Designed for domestic students who are current high school juniors; check back for the 2027 application calendar',
    description:
        'Choose a faculty-mentored lab internship or a structured practicum, then share your work at a final research symposium',
    icon: Icons.science,
    url:
        'https://www.bu.edu/summer/high-school-programs/rise-internship-practicum/',
    links: ['Boston University RISE', 'RISE program details'],
  ),

  // ===========================================================================
  // INTERNSHIPS
  // ===========================================================================
  const Resource(
    id: 'nasa_sees',
    title: 'NASA SEES High School Internship',
    category: 'internship',
    field: 'physics',
    scope: 'national',
    format: 'hybrid',
    locationNote:
        'Remote projects with an optional on-site experience at UT Austin',
    timeCommitment: 'Summer research with virtual preparation and project work',
    majorTags: ['physics', 'engineering', 'space', 'earth_science', 'cs'],
    applicationInfo:
        'Nationally competitive program for current high school students; the 2027 application has not been posted yet',
    description:
        'Use NASA mission data with scientists and engineers on projects in Earth science, astronomy, remote sensing, and aerospace',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.business,
    url:
        'https://csr.utexas.edu/education-outreach/high-school-internships/sees/',
    links: ['NASA SEES internship', 'NASA learner opportunities'],
    detailNote:
        'The 2026 cycle accepted students in grades 10 and 11, and future participation depends on continued program funding',
  ),
  const Resource(
    id: 'gmu_assip',
    title: 'George Mason ASSIP',
    category: 'internship',
    field: 'science',
    scope: 'national',
    format: 'hybrid',
    locationNote:
        'George Mason University sites or remote, depending on mentor',
    timeCommitment: '8 weeks full-time in summer',
    majorTags: ['science', 'engineering', 'research', 'cs', 'psychology'],
    applicationInfo:
        'Applicants select prospective mentors; accepted students earn three college credits and may request need-based fee support',
    description:
        'Work one-on-one with a faculty mentor on an original project across fields ranging from wet-lab science to cybersecurity and social research',
    icon: Icons.science,
    url: 'https://science.gmu.edu/assip',
    links: ['George Mason ASSIP', 'ASSIP tuition and fees'],
    detailNote:
        'The 2027 calendar is not posted yet; the 2026 program required students to be at least 15, or 16 for wet-lab placements',
  ),
  const Resource(
    id: 'stanford_simr',
    title: 'Stanford Institutes of Medicine Summer Research Program',
    category: 'internship',
    field: 'biology',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Stanford School of Medicine in Stanford, California',
    timeCommitment: '8 weeks full-time in summer',
    majorTags: ['biology', 'medicine', 'neuroscience', 'bioengineering'],
    applicationInfo:
        'Open to eligible current high school juniors and seniors; check the program page for 2027 requirements',
    description:
        'Conduct hands-on medical research with a Stanford mentor in areas such as cancer biology, genetics, neuroscience, immunology, or bioengineering',
    icon: Icons.biotech,
    url: 'https://simr.stanford.edu/',
    links: ['Stanford SIMR', 'SIMR program information'],
    detailNote:
        'The program is highly selective and age, grade, location, and work-authorization rules can change by cycle',
  ),
  const Resource(
    id: 'simons_summer_research',
    title: 'Simons Summer Research Program',
    category: 'research',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Stony Brook University in Stony Brook, New York',
    timeCommitment: 'Summer faculty-mentored research program',
    majorTags: ['science', 'engineering', 'math', 'research'],
    applicationInfo:
        'For academically strong high school students; schools may have nomination requirements, so review the next cycle carefully',
    description:
        'Join a Stony Brook research group and complete a hands-on project in science, mathematics, or engineering',
    icon: Icons.science,
    url: 'https://www.stonybrook.edu/commcms/simons/index.php',
    links: ['Simons program overview', 'Simons application information'],
  ),
  const Resource(
    id: 'summer_science_program',
    title: 'Summer Science Program',
    category: 'research',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Residential programs hosted at partner college campuses',
    timeCommitment: 'About 5 to 6 weeks of full-time collaborative research',
    majorTags: ['science', 'biology', 'chemistry', 'physics', 'research'],
    applicationInfo:
        'Usually open to current high school juniors, including international applicants; substantial need-based aid is available',
    description:
        'Complete an intensive team research project in astrophysics, biochemistry, genomics, or synthetic chemistry',
    icon: Icons.science,
    url: 'https://summerscience.org/',
    links: ['Summer Science Program', 'SSP admissions and financial aid'],
  ),
  const Resource(
    id: 'clark_scholars',
    title: 'Anson L. Clark Scholars Program',
    category: 'research',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Texas Tech University in Lubbock, Texas',
    timeCommitment: '7 weeks full-time in summer',
    majorTags: ['science', 'engineering', 'humanities', 'research'],
    applicationInfo:
        'A very small cohort for rising seniors and recent graduates; review the next application cycle for project areas',
    description:
        'Conduct intensive university research with a faculty mentor in a field matched to your interests',
    icon: Icons.science,
    url: 'https://www.depts.ttu.edu/clarkscholars/index.php',
    links: ['Clark Scholars overview', 'Clark Scholars application details'],
    detailNote:
        'The program typically selects only twelve students, so students should apply alongside several other opportunities',
  ),
  const Resource(
    id: 'rockefeller_ssrp',
    title: 'Rockefeller Summer Science Research Program',
    category: 'research',
    field: 'biology',
    scope: 'national',
    format: 'in_person',
    locationNote: 'The Rockefeller University in New York City',
    timeCommitment: '7 weeks at about 35 hours per week',
    majorTags: ['biology', 'medicine', 'chemistry', 'research'],
    applicationInfo:
        'For current high school juniors and seniors who will be at least 16 by the program start',
    description:
        'Investigate a student-driven scientific question through team-based laboratory research and mentorship',
    icon: Icons.biotech,
    url: 'https://www.rockefeller.edu/outreach/ssrp/',
    links: ['Rockefeller SSRP', 'SSRP eligibility and application'],
  ),
  const Resource(
    id: 'ucsc_sip',
    title: 'UC Santa Cruz Science Internship Program',
    category: 'research',
    field: 'science',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'Online opening week followed by research at UC Santa Cruz',
    timeCommitment: '8 weeks of full-time summer research',
    majorTags: ['science', 'engineering', 'cs', 'humanities', 'research'],
    applicationInfo:
        'Open to high school students worldwide; projects span all five UCSC academic divisions and program fees apply',
    description:
        'Contribute to an authentic open-ended research project with a UCSC faculty, graduate, or postdoctoral mentor',
    icon: Icons.science,
    url: 'https://sip.ucsc.edu/',
    links: ['UCSC SIP overview', 'SIP application information'],
    detailNote:
        'This is a tuition-based program, with financial support initiatives for students from historically excluded backgrounds',
  ),
  const Resource(
    id: 'wolfram_hs_research',
    title: 'Wolfram High School Summer Research Program',
    category: 'research',
    field: 'cs',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Residential program in the Boston area',
    timeCommitment: 'About 2.5 weeks of intensive project work',
    majorTags: ['cs', 'math', 'data_sci', 'research'],
    applicationInfo:
        'For motivated high school students with strong quantitative interests; need-based scholarships are available',
    description:
        'Build a personalized computational research project and publish it as an interactive Wolfram essay',
    icon: Icons.computer,
    url: 'https://education.wolfram.com/summer-research-high-school/',
    links: ['Wolfram research program', 'Wolfram admissions information'],
  ),
  const Resource(
    id: 'aspirnaut_michigan',
    title: 'Aspirnaut Summer Research Internship',
    category: 'research',
    field: 'biology',
    scope: 'state',
    format: 'in_person',
    locationNote: 'University of Michigan in Ann Arbor, Michigan',
    timeCommitment: '6-week residential summer program',
    majorTags: ['biology', 'medicine', 'research'],
    applicationInfo:
        'For Michigan high school students entering senior year; housing, meals, and stipends are provided',
    description:
        'Work on an active life-science research project while learning how professional scientists design and communicate their work',
    icon: Icons.biotech,
    url: 'https://aspirnaut.lsi.umich.edu/',
    links: ['Aspirnaut program', 'Aspirnaut application information'],
  ),
  const Resource(
    id: 'tufts_research_experience',
    title: 'Tufts Summer Research Experience',
    category: 'research',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Tufts University in the Greater Boston area',
    timeCommitment: '6 weeks in summer',
    majorTags: ['science', 'research', 'biology', 'engineering'],
    applicationInfo:
        'A tuition-based pre-college research program for high school students; the school requests a high school contact during application',
    description:
        'Develop a research project with university guidance and present your findings at a concluding poster session',
    icon: Icons.science,
    url:
        'https://universitycollege.tufts.edu/pre-college/browse/tufts-summer-research-experience',
    links: ['Tufts research experience', 'Tufts program details'],
  ),
  const Resource(
    id: 'utah_hs_research',
    title: 'University of Utah High School Research Internship',
    category: 'research',
    field: 'engineering',
    scope: 'national',
    format: 'in_person',
    locationNote: 'University of Utah in Salt Lake City, Utah',
    timeCommitment: 'About 8 weeks in summer',
    majorTags: ['engineering', 'science', 'research'],
    applicationInfo:
        'For students graduating in the two classes specified for each cycle; project-specific math or technical readiness may be expected',
    description:
        'Join a College of Engineering laboratory and contribute to a mentored technical research project',
    icon: Icons.engineering,
    url:
        'https://www.price.utah.edu/k12/high-school-summer-research-internship',
    links: ['Utah research internship', 'Research project information'],
  ),
  const Resource(
    id: 'cosmos_ucsc',
    title: 'California COSMOS at UC Santa Cruz',
    category: 'research',
    field: 'science',
    scope: 'state',
    format: 'in_person',
    locationNote: 'Residential program at UC Santa Cruz',
    timeCommitment: '4 weeks in summer',
    majorTags: ['science', 'math', 'engineering', 'research'],
    applicationInfo:
        'Designed primarily for California high school students; tuition and financial-aid details vary by cycle',
    description:
        'Explore an advanced math or science cluster through hands-on university coursework, projects, and research communication',
    icon: Icons.science,
    url: 'https://cosmos.ucsc.edu/',
    links: ['COSMOS at UC Santa Cruz', 'COSMOS clusters and admissions'],
  ),
  const Resource(
    id: 'fred_hutch_ship',
    title: 'Fred Hutch Summer High School Internship',
    category: 'internship',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Fred Hutch Cancer Center in Seattle, Washington',
    timeCommitment: '8 weeks full-time in summer',
    majorTags: ['biology', 'medicine', 'public_health', 'research'],
    applicationInfo:
        'Paid program for students entering senior year who are at least 16 and live in Greater Seattle or the surrounding area',
    description:
        'Learn laboratory and scientific communication skills while completing a mentored cancer or biomedical research project',
    icon: Icons.biotech,
    url:
        'https://www.fredhutch.org/en/education-training/high-school-students/summer-high-school-internship-program.html',
    links: ['Fred Hutch high school internship', 'SHIP eligibility'],
    detailNote:
        'The program does not provide housing, so students must be able to commute to the Seattle campus',
  ),
  const Resource(
    id: 'nist_ship',
    title: 'NIST Summer High School Intern Program',
    category: 'internship',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote:
        'NIST campuses in Gaithersburg, Maryland, or Boulder, Colorado',
    timeCommitment: 'About 7 weeks in summer',
    majorTags: ['science', 'engineering', 'physics', 'cs', 'research'],
    applicationInfo:
        'For eligible high school students interested in laboratory research; citizenship and local commuting rules should be checked for each cycle',
    description:
        'Work alongside NIST researchers on measurement science, engineering, computing, physics, or related laboratory projects',
    icon: Icons.science,
    url: 'https://www.nist.gov/ship',
    links: ['NIST SHIP', 'NIST application and eligibility'],
  ),
  const Resource(
    id: 'ucsf_hip',
    title: 'UCSF High School Intern Program',
    category: 'internship',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'UC San Francisco laboratories',
    timeCommitment: '8-week paid summer internship',
    majorTags: ['biology', 'medicine', 'public_health', 'research'],
    applicationInfo:
        'Local eligibility rules apply; selection is designed to look beyond grades and prior access to science opportunities',
    description:
        'Learn how biomedical research works through paid laboratory placement, mentorship, professional development, and college preparation',
    icon: Icons.biotech,
    url: 'https://sep.ucsf.edu/programs/high-school-students/intern-program/',
    links: ['UCSF High School Intern Program', 'UCSF HIP application'],
  ),
  const Resource(
    id: 'ucsf_ssrp',
    title: 'UCSF Summer Student Research Program',
    category: 'internship',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'UCSF clinics and research laboratories in San Francisco',
    timeCommitment: '7 weeks in summer',
    majorTags: ['biology', 'medicine', 'public_health', 'research'],
    applicationInfo:
        'Places eligible high school and college students from diverse backgrounds into active clinical and basic-science projects',
    description:
        'Contribute to an active biomedical or clinical research project with a UCSF mentor',
    icon: Icons.biotech,
    url: 'https://summerstudents.ucsf.edu/',
    links: ['UCSF Summer Student Research Program', 'Program eligibility'],
  ),
  const Resource(
    id: 'fiu_summer_research',
    title: 'FIU High School Summer Research Internship',
    category: 'internship',
    field: 'science',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Florida International University in Miami, Florida',
    timeCommitment: '8 weeks in summer',
    majorTags: ['science', 'biology', 'engineering', 'research'],
    applicationInfo:
        'Eligibility and school partnerships vary by cycle; review the official page before applying',
    description:
        'Learn laboratory procedures and research methods while working with an FIU science mentor',
    icon: Icons.science,
    url:
        'https://case.fiu.edu/opportunities/internships-jobs/summer-research-internship/',
    links: ['FIU summer research internship', 'FIU program information'],
  ),
  const Resource(
    id: 'seattle_youth_employment',
    title: 'Seattle Youth Employment Program',
    category: 'internship',
    field: 'all',
    scope: 'local',
    format: 'in_person',
    locationNote: 'City departments, nonprofits, and employers across Seattle',
    timeCommitment:
        '6 to 8 weeks in summer, with school-year options available',
    majorTags: ['all_subjects', 'business', 'social_impact'],
    applicationInfo:
        'Paid placements have Seattle residency, school enrollment, age, and income eligibility rules; check the current application',
    description:
        'Build professional skills in a paid placement matched with a City department, community organization, or private employer',
    icon: Icons.business_center,
    url:
        'https://www.seattle.gov/human-services/services-and-programs/youth-and-young-adults/seattle-youth-employment-program',
    links: ['Seattle Youth Employment Program', 'SYEP eligibility'],
  ),
  const Resource(
    id: 'port_seattle_hs_internship',
    title: 'Port of Seattle High School Internships',
    category: 'internship',
    field: 'all',
    scope: 'local',
    format: 'in_person',
    locationNote: 'SEA Airport, Seattle waterfront, and Port facilities',
    timeCommitment: 'Paid summer and occasional winter placements',
    majorTags: ['all_subjects', 'business', 'engineering', 'env_sci'],
    applicationInfo:
        'Applicants must be at least 16, enrolled in or recently graduated from high school, and authorized to work in the United States',
    description:
        'Complete real projects in aviation, maritime operations, governance, community engagement, skilled trades, or green jobs',
    icon: Icons.business_center,
    url: 'https://www.portseattle.org/programs/high-school-internships',
    links: [
      'Port of Seattle high school internships',
      'Port application guide',
    ],
  ),
  const Resource(
    id: 'king_county_metro_internships',
    title: 'King County Metro High School Internships',
    category: 'internship',
    field: 'all',
    scope: 'local',
    format: 'in_person',
    locationNote: 'King County Metro teams across the Seattle region',
    timeCommitment: 'Varies by placement and application cycle',
    majorTags: ['all_subjects', 'engineering', 'public_policy', 'business'],
    applicationInfo:
        'Metro accepts high school students for selected roles and offers an interest form for notifications when the next cycle opens',
    description:
        'Gain public-sector experience in transportation, operations, communications, planning, technology, or green career pathways',
    icon: Icons.directions_bus,
    url: 'https://kingcounty.gov/en/dept/metro/about/careers/internships',
    links: ['King County Metro internships', '2027 internship interest form'],
  ),
  const Resource(
    id: 'kirkland_chamber_inquiry',
    title: 'Greater Kirkland Chamber Student Internship Inquiry',
    category: 'internship',
    field: 'business',
    scope: 'local',
    format: 'in_person',
    locationNote:
        'Greater Kirkland Chamber of Commerce in Kirkland, Washington',
    timeCommitment:
        'Flexible and arranged directly if a placement is available',
    majorTags: ['business', 'entrepreneurship', 'marketing', 'nonprofit'],
    applicationInfo:
        'Send a short, professional introduction and resume to info@kirklandchamber.org asking whether a student project, event, communications, or office placement is available',
    description:
        'Pitch a student-created internship or volunteer project supporting local business events, outreach, marketing, or community programs',
    icon: Icons.business_center,
    url: 'https://www.kirklandchamber.org/',
    links: ['Kirkland Chamber website', 'Email info@kirklandchamber.org'],
    detailNote:
        'This is a direct-outreach lead, not a standing advertised internship, so a placement is not guaranteed',
  ),
  const Resource(
    id: 'kirkland_ktub_jobs',
    title: 'Kirkland Teen Union Building Jobs and Volunteering',
    category: 'internship',
    field: 'education',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Kirkland Teen Union Building in Kirkland, Washington',
    timeCommitment: 'Year-round and summer opportunities vary',
    majorTags: ['education', 'social_work', 'nonprofit', 'social_impact'],
    applicationInfo:
        'Recreation Attendant roles begin at age 16, while teen volunteer opportunities and summer openings are posted separately',
    description:
        'Support teen programs, activities, drop-in operations, camps, and community events through paid or volunteer work',
    icon: Icons.groups,
    url: 'https://www.kirklandwa.gov/KTUB',
    links: ['KTUB opportunities', 'City of Kirkland employment openings'],
  ),
  const Resource(
    id: 'uw_bright_up',
    title: 'UW BRIGHT-UP Biomedical Research Internship',
    category: 'internship',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'University of Washington health-science programs in Seattle',
    timeCommitment: 'Summer biomedical research and training',
    majorTags: ['biology', 'medicine', 'public_health', 'research'],
    applicationInfo:
        'For high school students in grades 9 through 12 who meet at least one listed first-generation or low-income eligibility pathway',
    description:
        'Explore biomedical research and health careers through mentorship, skill-building, and a structured summer experience',
    icon: Icons.biotech,
    url: 'https://www.hcop.uw.edu/bright-up/',
    links: ['UW BRIGHT-UP', 'BRIGHT-UP eligibility'],
  ),
  const Resource(
    id: 'uw_teaching_tomorrow',
    title: 'UW Teaching Tomorrow Internship',
    category: 'internship',
    field: 'education',
    scope: 'local',
    format: 'hybrid',
    locationNote:
        'Seattle early-learning classrooms and University of Washington sessions',
    timeCommitment: '6 months from spring through summer',
    majorTags: ['education', 'social_work', 'psychology'],
    applicationInfo:
        'Paid program for eligible Seattle Public Schools students who meet the age requirement for the current cycle',
    description:
        'Work in an early-learning classroom while earning mentorship, professional training, credit, and an education credential',
    icon: Icons.school,
    url: 'https://cultivatelearning.uw.edu/high-school-internship/',
    links: ['Teaching Tomorrow internship', 'Program schedule and eligibility'],
  ),
  const Resource(
    id: 'princeton_llp',
    title: 'Princeton Laboratory Learning Program',
    category: 'research',
    field: 'science',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Princeton University laboratories in Princeton, New Jersey',
    timeCommitment: 'At least 5 weeks of weekday laboratory research',
    applicationInfo:
        'For local New Jersey students who are at least 16 and can commute daily; projects change each year',
    description:
        'Join a Princeton research group and complete a faculty-supervised science or engineering project',
    icon: Icons.science,
    url: 'https://scienceoutreach.princeton.edu/laboratory-learning-program',
    links: ['Princeton LLP overview', 'Current laboratory projects'],
  ),
  const Resource(
    id: 'nyu_arise',
    title: 'NYU ARISE Research Program',
    category: 'research',
    field: 'engineering',
    scope: 'local',
    format: 'in_person',
    locationNote: 'NYU Tandon School of Engineering in Brooklyn, New York',
    timeCommitment: 'Seven weeks of full-time summer research and training',
    applicationInfo:
        'For eligible New York City high school students with an interest in STEM research',
    description:
        'Train in research methods before joining an NYU engineering or science laboratory project',
    icon: Icons.engineering,
    url: 'https://k12stem.engineering.nyu.edu/programs/arise',
    links: ['NYU ARISE', 'ARISE eligibility and timeline'],
  ),
  const Resource(
    id: 'ucsb_rmp',
    title: 'UCSB Research Mentorship Program',
    category: 'research',
    field: 'science',
    scope: 'international',
    format: 'in_person',
    locationNote: 'Residential or commuter program at UC Santa Barbara',
    timeCommitment: 'Six weeks of intensive summer research',
    applicationInfo:
        'A tuition-based program for high school students with financial aid options listed by UCSB',
    description:
        'Develop an original interdisciplinary project with a university research mentor and present the results',
    icon: Icons.science,
    url: 'https://summer.ucsb.edu/programs/research-mentorship-program',
    links: ['UCSB RMP', 'RMP admissions'],
  ),
  const Resource(
    id: 'brookhaven_hsrp',
    title: 'Brookhaven High School Research Program',
    category: 'research',
    field: 'science',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Brookhaven National Laboratory in Upton, New York',
    timeCommitment: 'Six weeks full-time in summer',
    applicationInfo:
        'Recommended for students who completed 11th grade, are at least 16, and meet citizenship or residency requirements',
    description:
        'Collaborate with Brookhaven scientists and engineers on a laboratory project and final presentation',
    icon: Icons.science,
    url: 'https://www.bnl.gov/education/programs/program.php?q=219',
    links: ['Brookhaven HSRP', 'HSRP eligibility'],
  ),
  const Resource(
    id: 'jax_summer_student',
    title: 'JAX Summer Student Program',
    category: 'research',
    field: 'biology',
    scope: 'national',
    format: 'in_person',
    locationNote: 'The Jackson Laboratory in Bar Harbor, Maine',
    timeCommitment: 'Ten-week full-time research fellowship',
    applicationInfo:
        'High school applicants must be current seniors and meet the age and work authorization requirements',
    description:
        'Complete an independent genetics or genomics project with a JAX scientist and present your findings',
    icon: Icons.biotech,
    url:
        'https://www.jax.org/education-and-learning/high-school-students-and-undergraduates/programs-and-resources',
    links: ['JAX Summer Student Program', 'Student program details'],
  ),
  const Resource(
    id: 'jax_academic_fellowship',
    title: 'JAX Academic Year Research Fellowship',
    category: 'research',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'JAX campuses in Maine, Connecticut, and New York City',
    timeCommitment: 'At least 180 hours across a full academic year',
    applicationInfo:
        'For high school juniors and seniors age 16 or older who can earn school credit for the research',
    description:
        'Join a research group throughout the school year and build an independent mentored project',
    icon: Icons.biotech,
    url:
        'https://www.jax.org/education-and-learning/high-school-students-and-undergraduates/academic-year-internships',
    links: ['JAX academic year fellowships', 'Application guidelines'],
  ),
  const Resource(
    id: 'salk_heithoff_brody',
    title: 'Salk Heithoff-Brody High School Scholars',
    category: 'research',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Salk Institute in La Jolla, California',
    timeCommitment: 'Eight weeks of summer laboratory research',
    applicationInfo:
        'For students age 16 or older who live and attend school in San Diego County',
    description:
        'Work one-on-one with a Salk mentor on biomedical research and present at a final symposium',
    icon: Icons.biotech,
    url:
        'https://www.salk.edu/about/education-outreach/programs/high-school-scholars/',
    links: ['Salk High School Scholars', 'Eligibility and application'],
  ),
  const Resource(
    id: 'jefferson_lab_honors',
    title: 'Jefferson Lab High School Summer Honors',
    category: 'research',
    field: 'physics',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Jefferson Lab in Newport News, Virginia',
    timeCommitment: 'Six weeks full-time in summer',
    applicationInfo:
        'For students within the local commuting radius who are at least 16 and meet the academic requirements',
    description:
        'Contribute to a physics, engineering, computing, or accelerator-science project with laboratory staff',
    icon: Icons.science,
    url: 'https://www.jlab.org/stem/hsshp',
    links: ['Jefferson Lab honors program', 'Application requirements'],
  ),
  const Resource(
    id: 'seattle_childrens_rtp',
    title: 'Seattle Children’s Research Training Program',
    category: 'internship',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Seattle Children’s Research Institute in downtown Seattle',
    timeCommitment: 'Four weeks on weekdays in summer',
    applicationInfo:
        'For local students in grades 10 and 11 who can commute; the program is free and provides a stipend',
    description:
        'Learn laboratory skills in biochemistry, immunology, gene editing, and infectious disease before completing a project',
    icon: Icons.biotech,
    url:
        'https://www.seattlechildrens.org/research/centers-programs/science-education-department/high-school-training-programs/',
    links: ['Seattle Children’s RTP', 'RTP application timeline'],
  ),
  const Resource(
    id: 'isb_see_high_school',
    title: 'Institute for Systems Biology High School Internship',
    category: 'internship',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Institute for Systems Biology in Seattle, Washington',
    timeCommitment: 'About 40 hours per week during the summer placement',
    applicationInfo:
        'One application is used for several ISB internships and ambassador opportunities; eligibility varies by program',
    description:
        'Use systems thinking in a cross-disciplinary research, curriculum, or science communication project',
    icon: Icons.biotech,
    url:
        'https://see.isbscience.org/resources/for-students/high-school-intern-program/',
    links: ['ISB high school programs', 'ISB student FAQ'],
  ),
  const Resource(
    id: 'sps_career_quest',
    title: 'Seattle Public Schools Career Quest',
    category: 'internship',
    field: 'all',
    scope: 'local',
    format: 'in_person',
    locationNote:
        'Employers and Seattle Public Schools departments across Seattle',
    timeCommitment: 'Four-week paid summer internship with a weekly class',
    applicationInfo:
        'For eligible Seattle Public Schools students; most paid placements require students to be at least 16',
    description:
        'Earn pay and CTE credit while working in business, technology, arts, construction, education, or operations',
    icon: Icons.business_center,
    url:
        'https://www.seattleschools.org/departments/cte/regional-internships/career-quest-learning-in-pathway/career-quest-summer-internships/',
    links: ['SPS Career Quest', 'Career Quest pathways'],
  ),
  const Resource(
    id: 'sps_open_science_quest',
    title: 'Allen Institute Open Science Quest',
    category: 'internship',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Allen Institute in South Lake Union, Seattle',
    timeCommitment: 'Three-week summer science intensive',
    applicationInfo:
        'Offered through Seattle Public Schools for students who have completed biology; current details appear with summer internships',
    description:
        'Explore cell biology, neuroscience, and immunology with Allen Institute scientists while earning credit and a stipend',
    icon: Icons.biotech,
    url:
        'https://www.seattleschools.org/news/internships-for-high-school-students/',
    links: ['Open Science Quest details', 'SPS summer internships'],
  ),
  const Resource(
    id: 'microsoft_discovery',
    title: 'Microsoft High School Discovery Program',
    category: 'internship',
    field: 'cs',
    scope: 'local',
    format: 'in_person',
    locationNote:
        'Microsoft offices near Redmond, Washington, or Atlanta, Georgia',
    timeCommitment: 'Four-week summer internship',
    applicationInfo:
        'For graduating high school seniors entering college who live near an eligible office and are interested in technology',
    description:
        'Build a team project, learn professional skills, and receive mentorship from Microsoft employees',
    icon: Icons.computer,
    url: 'https://careers.microsoft.com/v2/global/en/discoveryprogram',
    links: ['Microsoft Discovery Program', 'Eligibility and application'],
  ),
  const Resource(
    id: 'uw_robinson_aide',
    title: 'UW Robinson Center Summer Classroom Aide',
    category: 'internship',
    field: 'education',
    scope: 'local',
    format: 'in_person',
    locationNote: 'University of Washington Seattle campus',
    timeCommitment: 'Temporary paid position from mid-June through July',
    applicationInfo:
        'Current high school and college students may apply; hiring dates and openings are updated each year',
    description:
        'Support enrichment instructors and younger students while building teaching and program leadership experience',
    icon: Icons.school,
    url: 'https://robinsoncenter.uw.edu/about/job-opportunities/',
    links: ['Robinson Center job opportunities'],
  ),
  const Resource(
    id: 'jhu_aspire',
    title: 'Johns Hopkins APL ASPIRE',
    category: 'internship',
    field: 'engineering',
    scope: 'local',
    format: 'in_person',
    locationNote:
        'Johns Hopkins Applied Physics Laboratory in Laurel, Maryland',
    timeCommitment: 'About 30 to 40 hours per week throughout the summer',
    applicationInfo:
        'An unpaid competitive program for eligible local high school juniors and seniors',
    description:
        'Complete a technical project with an APL mentor and explore applied science and engineering careers',
    icon: Icons.engineering,
    url: 'https://www.jhuapl.edu/education/stem-outreach/aspire',
    links: ['JHU APL ASPIRE', 'ASPIRE application process'],
  ),
  const Resource(
    id: 'smithsonian_nmnh_hs',
    title: 'Smithsonian Natural History High School Internship',
    category: 'internship',
    field: 'science',
    scope: 'local',
    format: 'in_person',
    locationNote: 'National Museum of Natural History in Washington, D.C.',
    timeCommitment: 'About eight weeks, Tuesday through Friday',
    applicationInfo:
        'For current high school students ages 15 to 18; project areas include both science and museum work',
    description:
        'Work with a museum department while developing research, public engagement, and career-ready skills',
    icon: Icons.museum_outlined,
    url:
        'https://internships.si.edu/opportunity/nmnh-summer-high-school-internship',
    links: ['Smithsonian NMNH internship', 'Internship project details'],
  ),
  const Resource(
    id: 'nsa_hs_work_study',
    title: 'NSA High School Work Study',
    category: 'internship',
    field: 'cs',
    scope: 'regional',
    format: 'in_person',
    locationNote:
        'NSA headquarters and selected field sites around the United States',
    timeCommitment: 'Part-time paid work during senior year',
    applicationInfo:
        'For high school juniors entering a school-sponsored work experience near an eligible NSA location',
    description:
        'Gain paid experience in computing, engineering technology, language analysis, design, logistics, or administration',
    icon: Icons.security,
    url: 'https://www.nsa.gov/Careers/Student-Programs/',
    links: ['NSA student programs', 'High School Work Study details'],
  ),
  const Resource(
    id: 'aeop_hs_apprenticeships',
    title: 'AEOP High School Apprenticeships',
    category: 'internship',
    field: 'science',
    scope: 'national',
    format: 'in_person',
    locationNote:
        'Participating university and Army research sites across the United States',
    timeCommitment: 'Summer research schedule varies by host site',
    applicationInfo:
        'Eligibility, age, citizenship, stipend, and commuting requirements differ across placement sites',
    description:
        'Work with a professional scientist or engineer on a real laboratory research project',
    icon: Icons.science,
    url: 'https://www.usaeop.com/program/high-school-internships/',
    links: ['AEOP high school apprenticeships', 'Browse host sites'],
  ),
  const Resource(
    id: 'amnh_srmp',
    title: 'American Museum of Natural History SRMP',
    category: 'research',
    field: 'science',
    scope: 'local',
    format: 'in_person',
    locationNote: 'American Museum of Natural History in New York City',
    timeCommitment:
        'Summer institute followed by a full academic year of research',
    majorTags: ['science', 'research', 'biology', 'earth_science', 'data_sci'],
    applicationInfo:
        'For eligible New York City high school students who can participate throughout the summer and school year',
    description:
        'Join a museum scientist on one research project and build the skills to present your work publicly',
    icon: Icons.museum_outlined,
    url:
        'https://www.amnh.org/learn-teach/teens/science-research-mentoring-program/join-srmp',
    links: ['AMNH SRMP', 'Current application guide'],
  ),
  const Resource(
    id: 'van_andel_hs_research',
    title: 'Van Andel High School Graduate Research Program',
    category: 'research',
    field: 'biology',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Van Andel Institute in Grand Rapids, Michigan',
    timeCommitment: 'Eight-week paid summer research program',
    majorTags: ['biology', 'medicine', 'research', 'biotech'],
    applicationInfo:
        'For recent high school graduates from the Grand Rapids area; the 2027 application window is scheduled for January through mid-March',
    description:
        'Work in a biomedical research laboratory, develop a scientific poster, and learn how research careers function day to day',
    icon: Icons.biotech_outlined,
    url: 'https://www.vai.org/graduate-school/hs-program/',
    links: ['Van Andel high school program', '2027 application information'],
  ),
  const Resource(
    id: 'asdrp_research',
    title: 'Aspiring Scholars Directed Research Program',
    category: 'research',
    field: 'science',
    scope: 'international',
    format: 'hybrid',
    locationNote: 'Bay Area laboratories with selected remote research groups',
    timeCommitment: 'Multi-month mentored research with regular group meetings',
    majorTags: ['research', 'science', 'cs', 'engineering', 'data_sci'],
    applicationInfo:
        'A tuition-based program with multiple application rounds and some financial aid; eligibility varies by research group',
    description:
        'Join a small research team, learn its methods, and contribute to a longer-term project under a working scientist',
    icon: Icons.science_outlined,
    url: 'https://www.asdrp.org/apply',
    links: ['ASDRP application process', 'Research departments'],
  ),
  const Resource(
    id: 'seattle_parks_career_explorations',
    title: 'Seattle Parks Career Explorations',
    category: 'internship',
    field: 'all',
    scope: 'local',
    format: 'in_person',
    locationNote: 'Seattle Parks and Recreation sites across Seattle',
    timeCommitment:
        'Mentorship followed by an eight-week paid summer placement',
    majorTags: ['all_subjects', 'education', 'public_policy', 'environment'],
    applicationInfo:
        'Seattle youth begin with the Career Explorations mentorship, which is the entry point for paid summer internship assignments',
    description:
        'Build workplace skills with a mentor, then support recreation, environmental, community, or youth programs across the city',
    icon: Icons.park_outlined,
    url:
        'https://www.seattle.gov/parks/childcare/teen-programs/career-explorations',
    links: ['Seattle Parks Career Explorations', 'Program eligibility'],
  ),
  const Resource(
    id: 'hutton_fisheries',
    title: 'Hutton Junior Fisheries Biology Program',
    category: 'internship',
    field: 'biology',
    scope: 'national',
    format: 'in_person',
    locationNote:
        'Placements with fisheries professionals across the United States',
    timeCommitment: 'Eight-week paid summer internship and mentoring program',
    majorTags: ['biology', 'ecology', 'env_sci', 'research'],
    applicationInfo:
        'Designed for current high school students, especially students from backgrounds underrepresented in fisheries and aquatic science',
    description:
        'Work alongside a fisheries professional on field sampling, habitat work, data collection, education, or aquatic-resource management',
    icon: Icons.water_outlined,
    url: 'https://hutton.fisheries.org/students/',
    links: ['Hutton student information', 'Program timeline and application'],
  ),
  const Resource(
    id: 'nps_student_pathways',
    title: 'National Park Service Student Opportunities',
    category: 'internship',
    field: 'all',
    scope: 'national',
    format: 'in_person',
    locationNote:
        'National parks and partner organizations across the United States',
    timeCommitment:
        'Placements range from summer projects to longer Pathways roles',
    majorTags: [
      'environment',
      'history',
      'engineering',
      'communications',
      'all_subjects',
    ],
    applicationInfo:
        'High school students may qualify for selected Pathways jobs and partner internships; each posting has its own age, location, and enrollment rules',
    description:
        'Find paid and stipend-supported work in conservation, history, maintenance, interpretation, communications, science, or visitor services',
    icon: Icons.landscape_outlined,
    url: 'https://www.nps.gov/subjects/youthprograms/jobs-and-internships.htm',
    links: ['NPS youth jobs and internships', 'NPS Pathways information'],
  ),
  const Resource(
    id: 'stanford_shtem_2027',
    title: 'Stanford SHTEM 2027',
    category: 'internship',
    field: 'engineering',
    scope: 'national',
    format: 'in_person',
    locationNote: 'Stanford University in Stanford, California',
    timeCommitment: 'Eight weeks, about 20 to 30 hours per week',
    majorTags: ['engineering', 'cs', 'research', 'humanities', 'biology'],
    applicationInfo:
        'Current U.S. high school juniors and seniors who are citizens or permanent residents may apply when the application opens in December 2026; the program is unpaid and has a 95 dollar application fee',
    description:
        'Work in a small mentored group on interdisciplinary research spanning engineering, computing, science, design, linguistics, psychology, and the humanities',
    icon: Icons.science_outlined,
    url:
        'https://compression.stanford.edu/outreach/shtem-summer-internships-high-schoolers',
    links: ['Stanford SHTEM 2027 overview', 'Eligibility and application'],
    detailNote:
        'Housing and transportation are not provided, and Stanford states that the internship is unpaid',
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
  // Official 2027 College Board exam schedule.
  // ===========================================================================
  DeadlineItem(
    title: 'AP Art History assessment',
    date: 'May 12, 2027, Session 2',
    dateIso: '2027-05-12T12:00:00-07:00',
    resourceId: 'ap_art_history',
  ),
  DeadlineItem(
    title: 'AP Music Theory assessment',
    date: 'May 10, 2027, Session 2',
    dateIso: '2027-05-10T12:00:00-07:00',
    resourceId: 'ap_music_theory',
  ),
  DeadlineItem(
    title: 'AP English Language and Composition assessment',
    date: 'May 12, 2027, Session 1',
    dateIso: '2027-05-12T08:00:00-07:00',
    resourceId: 'ap_english_lang',
  ),
  DeadlineItem(
    title: 'AP English Literature and Composition assessment',
    date: 'May 5, 2027, Session 1',
    dateIso: '2027-05-05T08:00:00-07:00',
    resourceId: 'ap_english_lit',
  ),
  DeadlineItem(
    title: 'AP African American Studies assessment',
    date: 'May 6, 2027, Session 2',
    dateIso: '2027-05-06T12:00:00-07:00',
    resourceId: 'ap_african_american',
  ),
  DeadlineItem(
    title: 'AP Comparative Government and Politics assessment',
    date: 'May 14, 2027, Session 1',
    dateIso: '2027-05-14T08:00:00-07:00',
    resourceId: 'ap_comp_gov',
  ),
  DeadlineItem(
    title: 'AP European History assessment',
    date: 'May 4, 2027, Session 2',
    dateIso: '2027-05-04T12:00:00-07:00',
    resourceId: 'ap_euro',
  ),
  DeadlineItem(
    title: 'AP Human Geography assessment',
    date: 'May 3, 2027, Session 1',
    dateIso: '2027-05-03T08:00:00-07:00',
    resourceId: 'ap_human_geo',
  ),
  DeadlineItem(
    title: 'AP Macroeconomics assessment',
    date: 'May 7, 2027, Session 2',
    dateIso: '2027-05-07T12:00:00-07:00',
    resourceId: 'ap_macro',
  ),
  DeadlineItem(
    title: 'AP Microeconomics assessment',
    date: 'May 4, 2027, Session 2',
    dateIso: '2027-05-04T12:00:00-07:00',
    resourceId: 'ap_micro',
  ),
  DeadlineItem(
    title: 'AP Psychology assessment',
    date: 'May 14, 2027, Session 2',
    dateIso: '2027-05-14T12:00:00-07:00',
    resourceId: 'ap_psych',
  ),
  DeadlineItem(
    title: 'AP United States Government and Politics assessment',
    date: 'May 4, 2027, Session 1',
    dateIso: '2027-05-04T08:00:00-07:00',
    resourceId: 'ap_us_gov',
  ),
  DeadlineItem(
    title: 'AP United States History assessment',
    date: 'May 7, 2027, Session 1',
    dateIso: '2027-05-07T08:00:00-07:00',
    resourceId: 'ap_us_history',
  ),
  DeadlineItem(
    title: 'AP World History: Modern assessment',
    date: 'May 6, 2027, Session 1',
    dateIso: '2027-05-06T08:00:00-07:00',
    resourceId: 'ap_world',
  ),
  DeadlineItem(
    title: 'AP Calculus AB assessment',
    date: 'May 10, 2027, Session 1',
    dateIso: '2027-05-10T08:00:00-07:00',
    resourceId: 'ap_calc_ab',
  ),
  DeadlineItem(
    title: 'AP Calculus BC assessment',
    date: 'May 10, 2027, Session 1',
    dateIso: '2027-05-10T08:00:00-07:00',
    resourceId: 'ap_calc_bc',
  ),
  DeadlineItem(
    title: 'AP Computer Science A assessment',
    date: 'May 12, 2027, Session 2',
    dateIso: '2027-05-12T12:00:00-07:00',
    resourceId: 'ap_csa',
  ),
  DeadlineItem(
    title: 'AP Computer Science Principles assessment',
    date: 'May 14, 2027, Session 1',
    dateIso: '2027-05-14T08:00:00-07:00',
    resourceId: 'ap_csp',
  ),
  DeadlineItem(
    title: 'AP Precalculus assessment',
    date: 'May 11, 2027, Session 1',
    dateIso: '2027-05-11T08:00:00-07:00',
    resourceId: 'ap_precalc',
  ),
  DeadlineItem(
    title: 'AP Statistics assessment',
    date: 'May 11, 2027, Session 2',
    dateIso: '2027-05-11T12:00:00-07:00',
    resourceId: 'ap_stats',
  ),
  DeadlineItem(
    title: 'AP Biology assessment',
    date: 'May 3, 2027, Session 2',
    dateIso: '2027-05-03T12:00:00-07:00',
    resourceId: 'ap_bio',
  ),
  DeadlineItem(
    title: 'AP Chemistry assessment',
    date: 'May 6, 2027, Session 2',
    dateIso: '2027-05-06T12:00:00-07:00',
    resourceId: 'ap_chem',
  ),
  DeadlineItem(
    title: 'AP Environmental Science assessment',
    date: 'May 13, 2027, Session 2',
    dateIso: '2027-05-13T12:00:00-07:00',
    resourceId: 'ap_env_sci',
  ),
  DeadlineItem(
    title: 'AP Physics 1: Algebra-Based assessment',
    date: 'May 5, 2027, Session 2',
    dateIso: '2027-05-05T12:00:00-07:00',
    resourceId: 'ap_physics_1',
  ),
  DeadlineItem(
    title: 'AP Physics 2: Algebra-Based assessment',
    date: 'May 6, 2027, Session 1',
    dateIso: '2027-05-06T08:00:00-07:00',
    resourceId: 'ap_physics_2',
  ),
  DeadlineItem(
    title: 'AP Physics C: Electricity and Magnetism assessment',
    date: 'May 5, 2027, Session 2',
    dateIso: '2027-05-05T12:00:00-07:00',
    resourceId: 'ap_physics_c_em',
  ),
  DeadlineItem(
    title: 'AP Physics C: Mechanics assessment',
    date: 'May 3, 2027, Session 1',
    dateIso: '2027-05-03T08:00:00-07:00',
    resourceId: 'ap_physics_c_mech',
  ),
  DeadlineItem(
    title: 'AP Chinese Language and Culture assessment',
    date: 'May 13, 2027, Session 2',
    dateIso: '2027-05-13T12:00:00-07:00',
    resourceId: 'ap_chinese',
  ),
  DeadlineItem(
    title: 'AP French Language and Culture assessment',
    date: 'May 6, 2027, Session 1',
    dateIso: '2027-05-06T08:00:00-07:00',
    resourceId: 'ap_french',
  ),
  DeadlineItem(
    title: 'AP German Language and Culture assessment',
    date: 'May 7, 2027, Session 1',
    dateIso: '2027-05-07T08:00:00-07:00',
    resourceId: 'ap_german',
  ),
  DeadlineItem(
    title: 'AP Italian Language and Culture assessment',
    date: 'May 3, 2027, Session 2',
    dateIso: '2027-05-03T12:00:00-07:00',
    resourceId: 'ap_italian',
  ),
  DeadlineItem(
    title: 'AP Japanese Language and Culture assessment',
    date: 'May 11, 2027, Session 1',
    dateIso: '2027-05-11T08:00:00-07:00',
    resourceId: 'ap_japanese',
  ),
  DeadlineItem(
    title: 'AP Latin assessment',
    date: 'May 14, 2027, Session 2',
    dateIso: '2027-05-14T12:00:00-07:00',
    resourceId: 'ap_latin',
  ),
  DeadlineItem(
    title: 'AP Spanish Language and Culture assessment',
    date: 'May 13, 2027, Session 1',
    dateIso: '2027-05-13T08:00:00-07:00',
    resourceId: 'ap_spanish_lang',
  ),
  DeadlineItem(
    title: 'AP Spanish Literature and Culture assessment',
    date: 'May 14, 2027, Session 1',
    dateIso: '2027-05-14T08:00:00-07:00',
    resourceId: 'ap_spanish_lit',
  ),
  DeadlineItem(
    title: 'AP Seminar assessment',
    date: 'May 10, 2027, Session 2',
    dateIso: '2027-05-10T12:00:00-07:00',
    resourceId: 'ap_seminar',
  ),
  DeadlineItem(
    title: 'AP Business with Personal Finance assessment',
    date: 'May 4, 2027, Session 1',
    dateIso: '2027-05-04T08:00:00-07:00',
    resourceId: 'ap_business_finance',
  ),
  DeadlineItem(
    title: 'AP Cybersecurity assessment',
    date: 'May 5, 2027, Session 1',
    dateIso: '2027-05-05T08:00:00-07:00',
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

  // Late registration deadlines
  DeadlineItem(
    title: 'August 2026 SAT late registration deadline',
    date: 'Aug 11, 2026 at 11:59 PM ET',
    dateIso: '2026-08-11T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'September 2026 SAT late registration deadline',
    date: 'Sep 1, 2026 at 11:59 PM ET',
    dateIso: '2026-09-01T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'October 2026 SAT late registration deadline',
    date: 'Sep 22, 2026 at 11:59 PM ET',
    dateIso: '2026-09-22T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'November 2026 SAT late registration deadline',
    date: 'Oct 27, 2026 at 11:59 PM ET',
    dateIso: '2026-10-27T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'December 2026 SAT late registration deadline',
    date: 'Nov 24, 2026 at 11:59 PM ET',
    dateIso: '2026-11-24T23:59:00-05:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'March 2027 SAT late registration deadline',
    date: 'Feb 23, 2027 at 11:59 PM ET',
    dateIso: '2027-02-23T23:59:00-05:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'May 2027 SAT late registration deadline',
    date: 'Apr 20, 2027 at 11:59 PM ET',
    dateIso: '2027-04-20T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'June 2027 SAT late registration deadline',
    date: 'May 25, 2027 at 11:59 PM ET',
    dateIso: '2027-05-25T23:59:00-04:00',
    resourceId: 'bluebook_tests',
    majorTags: ['sat'],
  ),
  DeadlineItem(
    title: 'September 2026 ACT late registration deadline',
    date: 'Sep 1, 2026',
    dateIso: '2026-09-01T23:59:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'October 2026 ACT late registration deadline',
    date: 'Sep 29, 2026',
    dateIso: '2026-09-29T23:59:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'December 2026 ACT late registration deadline',
    date: 'Nov 29, 2026',
    dateIso: '2026-11-29T23:59:00-06:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'February 2027 ACT late registration deadline',
    date: 'Feb 9, 2027',
    dateIso: '2027-02-09T23:59:00-06:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'April 2027 ACT late registration deadline',
    date: 'Mar 23, 2027',
    dateIso: '2027-03-23T23:59:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'June 2027 ACT late registration deadline',
    date: 'May 25, 2027',
    dateIso: '2027-05-25T23:59:00-05:00',
    resourceId: 'act_official',
    majorTags: ['act'],
  ),
  DeadlineItem(
    title: 'July 2027 ACT late registration deadline',
    date: 'Jun 22, 2027',
    dateIso: '2027-06-22T23:59:00-05:00',
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
    title: 'Congressional App Challenge',
    date: 'October 26, 2026 at 12:00 PM ET',
    dateIso: '2026-10-26T12:00:00-04:00',
    resourceId: 'cac',
    majorTags: ['cs', 'app_dev', 'civics'],
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
  DeadlineItem(
    title: 'Regeneron Science Talent Search 2027',
    date: 'November 5, 2026 at 8:00 PM ET',
    dateIso: '2026-11-05T20:00:00-05:00',
    resourceId: 'regeneron_sts',
    majorTags: ['science', 'research', 'engineering', 'cs', 'math'],
  ),
  DeadlineItem(
    title: 'Diamond Challenge 2027',
    date: 'January 14, 2027 at 5:00 PM ET',
    dateIso: '2027-01-14T17:00:00-05:00',
    resourceId: 'diamond_challenge',
    majorTags: ['business', 'entrepreneurship', 'social_impact'],
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
const Map<String, String> apQuestionBankHubs = {
  'Albert (paid)': 'https://www.albert.io/subjects/high-school/ap',
  'AP Practice Exams': 'https://www.appracticeexams.com/',
  'CrackAP': 'https://www.crackap.com/',
  'UWorld (paid)': 'https://collegeprep.uworld.com/ap/',
  'Varsity Tutors': 'https://www.varsitytutors.com/practice',
};

const Map<String, String> apGeneralStudyHubs = {
  'AP Daily': 'https://apstudents.collegeboard.org/ap-daily-archived',
  'APStudy': 'https://apstudy.org/',
  'Fiveable': 'https://fiveable.me/ap',
  'Kaplan (paid)': 'https://www.kaptest.com/ap',
  'Knowt': 'https://knowt.com/ap',
  'Marco Learning': 'https://marcolearning.com/students/ap-study-guides/',
  'Prep Den (paid)': 'https://prepden.com/',
  'Save My Exams (paid)': 'https://www.savemyexams.com/ap/',
};

const Map<String, String> _commonApLinks = {
  ...apQuestionBankHubs,
  ...apGeneralStudyHubs,
};

const Map<String, Map<String, String>> _apBookLinks = {
  'ap_bio': {
    'Course material · 5 Steps to a 5 AP Biology 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Biology+2027',
    'Course material · Barron’s AP Biology Premium 2027 (Amazon)': 'https://www.amazon.com/s?k=Barron%27s+AP+Biology+Premium+2027',
    'Course material · Princeton Review AP Biology Premium Prep 2027 (Amazon)': 'https://www.amazon.com/s?k=Princeton+Review+AP+Biology+Premium+Prep+2027',
  },
  'ap_calc_ab': {
    'Course material · 5 Steps to a 5 AP Calculus AB 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Calculus+AB+2027',
    'Course material · Princeton Review AP Calculus AB Premium Prep 2027 (Amazon)': 'https://www.amazon.com/s?k=Princeton+Review+AP+Calculus+AB+Premium+Prep+2027',
    'Course material · Pearson Calculus in SI Units (Amazon)': 'https://www.amazon.com/s?k=Pearson+Calculus+SI+Units+textbook',
  },
  'ap_calc_bc': {
    'Course material · 5 Steps to a 5 AP Calculus BC 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Calculus+BC+2027',
  },
  'ap_chem': {
    'Course material · Barron’s AP Chemistry Premium 2027 (Amazon)': 'https://www.amazon.com/s?k=Barron%27s+AP+Chemistry+Premium+2027',
    'Course material · Princeton Review AP Chemistry Premium Prep 2027 (Amazon)': 'https://www.amazon.com/s?k=Princeton+Review+AP+Chemistry+Premium+Prep+2027',
  },
  'ap_chinese': {
    'Course material · Barron’s AP Chinese Language and Culture 2027 (Amazon)': 'https://www.amazon.com/s?k=Barron%27s+AP+Chinese+Language+and+Culture+2027',
  },
  'ap_csa': {
    'Course material · 5 Steps to a 5 AP Computer Science A 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Computer+Science+A+2027',
    'Course material · Barron’s AP Computer Science A 2027 (Amazon)': 'https://www.amazon.com/s?k=Barron%27s+AP+Computer+Science+A+2027',
    'Course material · Princeton Review AP Computer Science A Prep 2027 (Amazon)': 'https://www.amazon.com/s?k=Princeton+Review+AP+Computer+Science+A+Prep+2027',
  },
  'ap_csp': {
    'Course material · 5 Steps to a 5 AP Computer Science Principles 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Computer+Science+Principles+2027',
  },
  'ap_env_sci': {
    'Course material · 5 Steps to a 5 AP Environmental Science 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Environmental+Science+2027',
    'Course material · Princeton Review AP Environmental Science Premium Prep 2027 (Amazon)': 'https://www.amazon.com/s?k=Princeton+Review+AP+Environmental+Science+Premium+Prep+2027',
  },
  'ap_french': {
    'Course material · 5 Steps to a 5 AP French Language and Culture 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+French+Language+and+Culture+2027',
    'Course material · Barron’s AP French Language and Culture 2027 (Amazon)': 'https://www.amazon.com/s?k=Barron%27s+AP+French+Language+and+Culture+2027',
  },
  'ap_human_geo': {
    'Course material · 5 Steps to a 5 AP Human Geography 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Human+Geography+2027',
    'Course material · Barron’s AP Human Geography Premium 2027 (Amazon)': 'https://www.amazon.com/s?k=Barron%27s+AP+Human+Geography+Premium+2027',
    'Course material · Princeton Review AP Human Geography Premium Prep 2027 (Amazon)': 'https://www.amazon.com/s?k=Princeton+Review+AP+Human+Geography+Premium+Prep+2027',
  },
  'ap_macro': {
    'Course material · 5 Steps to a 5 AP Macroeconomics 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Macroeconomics+2027',
  },
  'ap_micro': {
    'Course material · 5 Steps to a 5 AP Microeconomics 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Microeconomics+2027',
  },
  'ap_physics_c_mech': {
    'Course material · 5 Steps to a 5 AP Physics C 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Physics+C+2027',
    'Course material · Barron’s AP Physics C Premium 2027 (Amazon)': 'https://www.amazon.com/s?k=Barron%27s+AP+Physics+C+Premium+2027',
    'Course material · Princeton Review AP Physics C Premium Prep 2027 (Amazon)': 'https://www.amazon.com/s?k=Princeton+Review+AP+Physics+C+Premium+Prep+2027',
  },
  'ap_psych': {
    'Course material · 5 Steps to a 5 AP Psychology 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+Psychology+2027',
    'Course material · Barron’s AP Psychology Premium 2027 (Amazon)': 'https://www.amazon.com/s?k=Barron%27s+AP+Psychology+Premium+2027',
    'Course material · Princeton Review AP Psychology Premium Prep 2027 (Amazon)': 'https://www.amazon.com/s?k=Princeton+Review+AP+Psychology+Premium+Prep+2027',
  },
  'ap_us_history': {
    'Course material · Princeton Review AP U.S. History Premium Prep 2027 (Amazon)': 'https://www.amazon.com/s?k=Princeton+Review+AP+US+History+Premium+Prep+2027',
  },
  'ap_world': {
    'Course material · 5 Steps to a 5 AP World History: Modern 2027 (Amazon)': 'https://www.amazon.com/s?k=5+Steps+to+a+5+AP+World+History+Modern+2027',
  },
};

// Drive files supplied by the Junior Hub team. Every file ID is compared
// against existing Junior Hub URLs before it is included here.
const Map<String, Map<String, String>> _driveApFileLinks = {
  'ap_art_history': {
    'Practice test · AP Art History 2008':
        'https://drive.google.com/file/d/1GAZcySB_TbKzlEiP5oXWxV6LoBS21lBf/view',
    'Practice test · AP Art History 2010':
        'https://drive.google.com/file/d/1JHNWd6NJhttpQ8F9AiKxya_3g2lEBjwP/view',
    'Practice test · AP Art History 2012':
        'https://drive.google.com/file/d/1cNVagyqZ0PDeSrqDb-UH5nIQdyTP2JqB/view',
    'Practice test · AP Art History 2015':
        'https://drive.google.com/file/d/1FLpWl03amNUH3HUDRYhgrHhuYcRlIR1V/view',
  },
  'ap_bio': {
    'Practice test · 5 Steps to a 5 AP Biology 2024':
        'https://drive.google.com/file/d/1xo6joZDoCt1rmg7ZD22msWlHUZDKWvpc/view',
    'Practice test · Barron\'s AP Biology Practice Tests 2024':
        'https://drive.google.com/file/d/17K0kXk7uGUs_w4l5lmnPdj-PEEd2eT2Y/view',
    'Practice test · The Princeton Review AP Biology Prep 2024':
        'https://drive.google.com/file/d/1wAA6bZop-MMst_Ghy9YBk2L9oPI0WMMr/view',
  },
  'ap_calc_ab': {
    'Notes · AP Calculus AB Unit 1 study guide':
        'https://drive.google.com/file/d/10OpxcyYeOiApP9QhZTwh9sCwVjK4JlpI/view',
    'Notes · AP Calculus AB Unit 2 study guide':
        'https://drive.google.com/file/d/1XqLUk8NhkEj4mMZv0NEnI-DvfcZB3Yvp/view',
    'Notes · AP Calculus AB Unit 3 study guide':
        'https://drive.google.com/file/d/1fRzryuOFdj_50bT-dhWzsIDXlgRKeygF/view',
    'Notes · AP Calculus AB Unit 4 study guide':
        'https://drive.google.com/file/d/1P8k9L-QyWVhTIwr6E-aqX7zMqRdwppSZ/view',
    'Notes · AP Calculus AB Unit 6 study guide':
        'https://drive.google.com/file/d/1DCr09Ln-U5H77w83a9hlBNAdV2Ec4mo1/view',
    'Notes · AP Calculus AB Unit 7 study guide':
        'https://drive.google.com/file/d/1zl-iSVqmY1_YzapRn2WKxnR3TA-Vx8Sy/view',
    'Notes · AP Calculus AB Unit 7FRQCalc study guide':
        'https://drive.google.com/file/d/1ESjt14UcmKH4gSy__U67mTSBfv51QeB1/view',
    'Notes · AP Calculus AB Unit 7FRQNoCALC study guide':
        'https://drive.google.com/file/d/1Is1ndqbeM-12Uwr97Dt7bl5APlACaGNI/view',
    'Notes · AP Calculus AB Unit 8FRQNoCalc study guide':
        'https://drive.google.com/file/d/1YWADpDQ1jhiII6TuEGuhuk6qQQqKs8dw/view',
    'Notes · AP Calculus AB Unit 8MCQNoCalc study guide':
        'https://drive.google.com/file/d/1SWTLxtBcU4oLnD5DJCKcX-faGV6tyd6r/view',
    'Practice questions · AP Calculus AB Unit 1 test bank':
        'https://drive.google.com/file/d/1McEOT_ZnO7_oh4vuhmt611mRSTrlAWkb/view',
    'Practice questions · AP Calculus AB Unit 2 test bank':
        'https://drive.google.com/file/d/1TQdDqs-FHANwz-jH3SjBsx15V5CJHP6T/view',
    'Practice questions · AP Calculus AB Unit 3 test bank':
        'https://drive.google.com/file/d/12dkLiKZzrh4KL-zfXm-So5wSI_32Hh1P/view',
    'Practice questions · AP Calculus AB Unit 4 test bank':
        'https://drive.google.com/file/d/1GOEhMILdMS7_xtTkH5LipzVGeAomDSj9/view',
    'Practice questions · AP Calculus AB Unit 6 test bank':
        'https://drive.google.com/file/d/1XSMvyYd2uXGLHJcUJdaSKPztQxWTSSno/view',
    'Practice questions · AP Calculus AB Unit 7 test bank':
        'https://drive.google.com/file/d/1YfwnZZtabzwoA2pEkn6LBVclW8k6PxMB/view',
    'Practice questions · AP Calculus AB Unit 7FRQCalc test bank':
        'https://drive.google.com/file/d/1tgm9FE5XlXjUh0AQbtWzIeT5vzZqhvtG/view',
    'Practice questions · AP Calculus AB Unit 7FRQNoCALC test bank':
        'https://drive.google.com/file/d/12Cqsc8QmX24TLEC8yvpMy3JtYqag4YNn/view',
    'Practice questions · AP Calculus AB Unit 8FRQNoCalc test bank':
        'https://drive.google.com/file/d/1pRTLvi5OzsDMSFTgGL9yafq6QrWWsXIx/view',
    'Practice questions · AP Calculus AB Unit 8MCQCalc test bank':
        'https://drive.google.com/file/d/1R-cOG2M63hLk4TEP0j_kIIU25Nme3zEH/view',
    'Practice questions · AP Calculus AB Unit 8MCQNoCalc test bank':
        'https://drive.google.com/file/d/1wL3IU0PPAQiKSCXFt6CFFZcbFpGbWGG6/view',
    'Practice test · 5 Steps to a 5 AP Calculus AB 2024':
        'https://drive.google.com/file/d/1tFiO9oDN7QlWkZB9cjmmF3mUj3aBwdCC/view',
    'Practice test · AP Calculus AB 2008':
        'https://drive.google.com/file/d/12_9d2iffc_Bh_KuEJRwho619EzNmnUdu/view',
    'Practice test · AP Calculus AB 2012':
        'https://drive.google.com/file/d/1484GH1wRCj6ADvvs5kmFX1yvyqjw8N3I/view',
    'Practice test · AP Calculus AB 2013':
        'https://drive.google.com/file/d/1MzENiL9cfWDNeL6zq2Wlx0MQhfb6mPGH/view',
    'Practice test · AP Calculus AB 2014':
        'https://drive.google.com/file/d/1gcNQxng_vj9Q2Ap2iikckOLNb_J3EPPx/view',
    'Practice test · AP Calculus AB 2015':
        'https://drive.google.com/file/d/1Fy19E91RbfX0X7rG0XgMNujxCdmo_VLs/view',
    'Practice test · AP Calculus AB 2016 (1)':
        'https://drive.google.com/file/d/1T7XOO7vsO7_UHpQbSqtb_8QiQW6Hq8l_/view',
    'Practice test · AP Calculus AB 2016 (2)':
        'https://drive.google.com/file/d/1Ke7ryp_Szd1dyxpw3hx6TZ46PLQCmrz6/view',
    'Practice test · AP Calculus AB 2017':
        'https://drive.google.com/file/d/1mxq3e-3t7PrhTumopH6bVuVcn6rbMTYT/view',
    'Practice test · AP Calculus AB 2018':
        'https://drive.google.com/file/d/1VBhf0GCsEz2qCNu7alqeWg0TWAn6BDQi/view',
    'Practice test · AP Calculus AB 2020 (1)':
        'https://drive.google.com/file/d/1fVsI2zfWedxWYwnlMAtkgzlQ3AdxOpxt/view',
    'Practice test · AP Calculus AB 2020 (2)':
        'https://drive.google.com/file/d/1YKxFEvjM9JbmkiInfFzZG1MP-29a5DNW/view',
    'Practice test · AP Calculus AB 2020 (3)':
        'https://drive.google.com/file/d/1YuGuXJw0AvjJZvFyOgYBOM4EreN7Khoh/view',
    'Practice test · Combined AP Calculus AB and BC practice tests 2024':
        'https://drive.google.com/file/d/13BdDfW_04rWN4mbgSZw4uHNBYAkdWaJO/view',
    'Practice test · Combined AP Calculus AB and BC practice tests 2025':
        'https://drive.google.com/file/d/1cMuo1Ig3KUrHrtia9_oK-fNOgKTEvmdJ/view',
    'Practice test · Princeton - AP Calculus AB Practice Tests 2020':
        'https://drive.google.com/file/d/15FJl9RsYoYpdDGN3qzS7uaV-8U8agRNB/view',
    'Practice test · Textbook-Calculus in SI Units 2019 Pearson':
        'https://drive.google.com/file/d/1kqdL_Hn2DP7MUpKCy5xgcshEdIpHHPsp/view',
  },
  'ap_calc_bc': {
    'Practice test · 5 Steps to a 5 AP Calculus BC 2024':
        'https://drive.google.com/file/d/1m4vQliAtl7DZcv_nSBqrdoIwVenVhW0O/view',
    'Practice test · AP Calc BC 2015 (1)':
        'https://drive.google.com/file/d/1ZdG9sQRqNhtqyf0gJ9vAw0o2nFFvatEW/view',
  },
  'ap_chem': {
    'Practice test · Barron\'s AP Chemistry Practice Tests 2025':
        'https://drive.google.com/file/d/17siRtMFEif3SIqaiUSyJVM9KPCGgxd-X/view',
    'Practice test · The Princeton review - AP Chemistry Premium Prep 2023':
        'https://drive.google.com/file/d/1DWxTuwidpHQx1MKD1QiwKdMzit1iWCd9/view',
  },
  'ap_chinese': {
    'Practice test · AP Chinese 2016':
        'https://drive.google.com/file/d/1CAJ9JfyrDcAO37uaR1416GaV9LVAy9Ce/view',
    'Practice test · Barron\'s AP Chinese Language and Culture Practice Tests 2023':
        'https://drive.google.com/file/d/1boEfdBENGdEGikJJ09RukIFz_Gv2xoqD/view',
  },
  'ap_comp_gov': {
    'Practice test · AP Comp Gov 2008':
        'https://drive.google.com/file/d/1_9cNBWYlKUW5S9vThOvseXjoCRy2LFAy/view',
    'Practice test · AP Comp Gov 2009':
        'https://drive.google.com/file/d/1NTWah6X-_kCqAJR1SDM6D6zJCrYNKOGe/view',
    'Practice test · AP Comp Gov 2010':
        'https://drive.google.com/file/d/1hYHXVHJ1_WLlDG1cmxgjUAo_7HOD5Ws-/view',
    'Practice test · AP Comp Gov 2015':
        'https://drive.google.com/file/d/1hxr2P-4gBMil7loA2x7V55DGNd5L7dkZ/view',
  },
  'ap_csa': {
    'Practice test · 5 Steps to a 5 AP Computer Science A 2024':
        'https://drive.google.com/file/d/1OPunMhNVwZEiMZEZMUh88srM3_Zfn8ym/view',
    'Practice test · Barron\'s AP Computer Science A Practice Tests 2024':
        'https://drive.google.com/file/d/10TsrLVLlmZf70HNTj8ENkNkAWQdFP3XB/view',
    'Practice test · The Princeton Review AP Computer Science A Prep 2024':
        'https://drive.google.com/file/d/1vyFq7qgHiVSmiN98lVUYR__M6FdZt-se/view',
  },
  'ap_csp': {
    'Practice test · 5 Steps to a 5 AP Computer Science Principles 2023':
        'https://drive.google.com/file/d/1pVVE9dNij0W3niiM7-UmCBVc61_d-lLe/view',
    'Practice test · AP Computer Science Principles 2023 Practice Tests':
        'https://drive.google.com/file/d/1NS6taKvMq0m38FFJYHQftwOZ_MV3azrq/view',
  },
  'ap_english_lang': {
    'Practice test · AP Lang 2012':
        'https://drive.google.com/file/d/1C66nwrMpRItG631cqpHIJjJR_yizb_tH/view',
    'Practice test · AP Lang 2013':
        'https://drive.google.com/file/d/1f02_a6M0iELfPSOo__YaCPPxsD97ruUq/view',
    'Practice test · AP Lang 2015':
        'https://drive.google.com/file/d/1F9elQimIFjCSYEqsAu2fWksCvyY8jD1r/view',
    'Practice test · AP Lang 2016':
        'https://drive.google.com/file/d/1tr9P5bgg1wKFQ3LaPCVBhGM2Nkk1vqhV/view',
    'Practice test · AP Lang 2017':
        'https://drive.google.com/file/d/1CfX5ZSRovhkaGslwbizhKXbo-odUI6aj/view',
    'Practice test · AP Lang 2018':
        'https://drive.google.com/file/d/1BYCC0K1ByG2WRodqqPX1_xl4A_ErJl40/view',
  },
  'ap_english_lit': {
    'Practice test · AP Lit 2012':
        'https://drive.google.com/file/d/1BfK86gvsr9MRRZIAwil8vRNEK3V9HnG3/view',
    'Practice test · AP Lit 2013':
        'https://drive.google.com/file/d/1iJymXLXle4wCCcbJZ6hP4wLccdNljM8j/view',
    'Practice test · AP Lit 2014':
        'https://drive.google.com/file/d/1MhtlqQaooGYhoOtnhkR6Xt3mr4glknWA/view',
    'Practice test · AP Lit 2015':
        'https://drive.google.com/file/d/1SpXpDM8q23JOWCx8n2vr0NkAl9uBhq38/view',
    'Practice test · AP Lit 2016':
        'https://drive.google.com/file/d/1S2OS33n0nAHCGMTjaZZdJElGhuWiyGWI/view',
    'Practice test · AP Lit 2017':
        'https://drive.google.com/file/d/1Cb9E9mEeEX7045KXpZhNL8DEksScoJql/view',
    'Practice test · AP Lit 2018':
        'https://drive.google.com/file/d/1HzwRyyUkc0TIpOJaWn7tjO-MlQHNXGpp/view',
  },
  'ap_env_sci': {
    'Practice test · 5 Steps to a 5 AP Environmental Science 2021':
        'https://drive.google.com/file/d/1nYhT9JCh86oCiVk71kfOAZ24kRWdgcJE/view',
    'Practice test · The Princeton Review-AP Environmental Science Practice Tests 2020':
        'https://drive.google.com/file/d/1i2t4bzd7OA3P4zLPrOKIcsL3mw0jG8m7/view',
    'Practice test · The Princeton Review-AP Environmental Science Prep 2023':
        'https://drive.google.com/file/d/1r1l7-f3h7lasiKhqLiR7O9qw-lqjCKfo/view',
  },
  'ap_euro': {
    'Practice test · AP Euro 2008':
        'https://drive.google.com/file/d/1wY133JSzkjlFrBjIizaxviOd45mEt2pF/view',
    'Practice test · AP Euro 2015':
        'https://drive.google.com/file/d/1Fxb4yLuKKME3KCiiSDmEqE0dK08XDxge/view',
    'Practice test · AP Euro 2016':
        'https://drive.google.com/file/d/1lsqH0vY3ekKBo7ndoT_SCuOMq0iHT0aE/view',
    'Practice test · AP Euro 2017':
        'https://drive.google.com/file/d/1Rdd47JcyzN16VDXA8ZeN3bhE2FZl_K41/view',
  },
  'ap_french': {
    'Practice test · 5 Steps to a 5 AP French Language and Culture 2020':
        'https://drive.google.com/file/d/1tl_Wjwi3Uxo29VyuNT_fdbAVNy2UrvHU/view',
    'Practice test · AP French Lang 2008':
        'https://drive.google.com/file/d/1GQwbm3rb1zDJvTt2GUKteo9oNYhBe55E/view',
    'Practice test · AP French Lang 2011':
        'https://drive.google.com/file/d/1xcm7lGt9SdIt4IPARqwG4xtmqo_RsS29/view',
    'Practice test · AP French Lang 2017':
        'https://drive.google.com/file/d/1dAdk2hWYZu5XNe7hqTvUEJ-GZ7PVbgRL/view',
    'Practice test · Barron\'s AP French Language and Culture Practice Tests 2022':
        'https://drive.google.com/file/d/1kyC41pu_Wenqq05s9tc4be0XxUaeUFZu/view',
  },
  'ap_german': {
    'Practice test · AP German Practice 2017':
        'https://drive.google.com/file/d/1mcN3I-pe38vNq6XApCt6NaCNlEj5-uZN/view',
  },
  'ap_human_geo': {
    'Practice test · 5 Steps to a 5 AP Human Geography 2024':
        'https://drive.google.com/file/d/1tfCxCAoY90OH0be9MIVifxx4vMfbuTr3/view',
    'Practice test · AP Human Geography Practice Test':
        'https://drive.google.com/file/d/1tzlSDCOZvBf5j9gyZys-JHIr5kCS6Kb6/view',
    'Practice test · Barron\'s AP Human Geography Practice Tests 2024':
        'https://drive.google.com/file/d/1DYg-YJE5cu-ZPO1P0idms14Wj5O4vJE5/view',
    'Practice test · The Princeton Review AP Human Geography Premium Prep 2023':
        'https://drive.google.com/file/d/1H7lKYRADSJvWEgzYImHPo22fY-X9b-Ty/view',
  },
  'ap_italian': {
    'Practice test · AP Italian 2018':
        'https://drive.google.com/file/d/1m3hk5VNze1drHhHqkcPiDekAfIkotPZU/view',
  },
  'ap_japanese': {
    'Practice test · AP Japanese 2016':
        'https://drive.google.com/file/d/1V7tC_ic3t33iwqZLnUZCEJCUyQSm9Rhu/view',
  },
  'ap_latin': {
    'Practice test · AP Latin Vergil 2005':
        'https://drive.google.com/file/d/1vBtdUxIdwuvIB7odQwQrGugAjh4W_R8s/view',
    'Practice test · AP Latin Vergil 2008':
        'https://drive.google.com/file/d/1NH_1nJGezGN6qzL6cIfIYmYzuy8UIg9B/view',
    'Practice test · AP Latin Vergil 2012':
        'https://drive.google.com/file/d/1bSMlr9PpNSjLx8PCA3W5ostB9ts2HBqp/view',
    'Practice test · AP Latin Vergil 2018':
        'https://drive.google.com/file/d/1P9SJkeDgP7eGM2ddcWx6-czIxlLPAzol/view',
  },
  'ap_macro': {
    'Practice questions · AP Macro MCQ 1995':
        'https://drive.google.com/file/d/1LQAJO_bRa8CneoQqQKMu2O9M_7zSxaqv/view',
    'Practice questions · AP Macro Unit 2 MCQ':
        'https://drive.google.com/file/d/1LxbYIDbli1wbC2Fzy9vUZxneK2whw6Nx/view',
    'Practice questions · AP Macro Unit 2 MCQ-Answers':
        'https://drive.google.com/file/d/1rHzlEjvzJ6Nd_6adjS4q4q6WU0ajCq12/view',
    'Practice questions · AP Macro Unit 3.1-3.5 MCQs':
        'https://drive.google.com/file/d/1Dsi3VtEO9rHdJ-Lx4DOOiTelHhKkWEIC/view',
    'Practice questions · AP Macro Unit 3.1-3.5 MCQs-Answers':
        'https://drive.google.com/file/d/1NTFLTlgKbDQnvuH_OkyAq5tkwNQTz4zw/view',
    'Practice questions · AP Macro Unit 3.6-3.9 MCQs':
        'https://drive.google.com/file/d/1g2yCz_8Dkks7PuR5NvtkRGU3aLYiM_2i/view',
    'Practice questions · AP Macro Unit 3.6-3.9 MCQs-Answers':
        'https://drive.google.com/file/d/1yxyymPYv4eOzU6o22LKlal1x1G4ibfPC/view',
    'Practice questions · AP Macro Unit 4 MCQ':
        'https://drive.google.com/file/d/1KpYaowV_rGv1NhAIbO_WM2fF_Tnd8DXC/view',
    'Practice questions · AP Macro Unit 4 MCQ-Answers':
        'https://drive.google.com/file/d/1dWtfVDr4Qo9DBjUF0pGzySM68XDucDIz/view',
    'Practice questions · AP Macro Unit 5 MCQs':
        'https://drive.google.com/file/d/1iGgn-nTaBk4sWIV450J9NfKUDeZugB-x/view',
    'Practice questions · AP Macro Unit 5 MCQs-Answers':
        'https://drive.google.com/file/d/1ItuE1syCHRU-fRyyCbCMJKWJEJTgPs1z/view',
    'Practice test · 5 Steps to a 5 AP Macroeconomics 2022':
        'https://drive.google.com/file/d/1xYL-a54DoZxxnNAFqBjR4PaUJeFD-VNg/view',
    'Practice test · Combined AP Macro and Micro 2021':
        'https://drive.google.com/file/d/1nzv2MSEMJMIcC9mWp0gjSJrPK3KgAhOe/view',
    'Practice test · Combined AP Macro and Micro 2023':
        'https://drive.google.com/file/d/1hz_LLGip_0G6R3L20YzOJNaDMA45YW6d/view',
    'Practice test · Combined AP Macro and Micro 2024':
        'https://drive.google.com/file/d/1D0d3oLglp_iqKnbutY39naKwauNIvpTP/view',
  },
  'ap_micro': {
    'Practice test · 5 Steps to a 5 AP Microeconomics 2022':
        'https://drive.google.com/file/d/1P4hImtQrXsj5sr_r-Tgojs6-1sDPkc9o/view',
  },
  'ap_music_theory': {
    'Practice test · AP Music 2003':
        'https://drive.google.com/file/d/1Pmw16qSrN7dPzWEPP2gnYDlNCJYNXCqg/view',
    'Practice test · AP Music 2008':
        'https://drive.google.com/file/d/1fUywAfP3GwyrbRZYKZfnTz2KoTZiXLo5/view',
    'Practice test · AP Music 2016':
        'https://drive.google.com/file/d/1jlVxyDs6V52RZT9pZ6XSpOGBAeqSakpx/view',
  },
  'ap_physics_c_mech': {
    'Practice test · 5 Steps to a 5 AP Physics C 2024':
        'https://drive.google.com/file/d/1zXKvJvI3rgw_-OQY4sS9jLeFkEL_TLgz/view',
    'Practice test · Barron\'s AP Physics C Practice Tests 2024':
        'https://drive.google.com/file/d/1bm9-Z9k72dUeK3lAax0R5oKLhAm2rSSE/view',
    'Practice test · The Princeton Review AP Physics C Mechanics Prep 2020':
        'https://drive.google.com/file/d/1L_K-FPtK4px6fH3holIkRRoCQhOIcm5g/view',
  },
  'ap_psych': {
    'Practice questions · AP Psychology MCQ 2004':
        'https://drive.google.com/file/d/1mAe36FiwUaGWPok9dFjL7rSCz73frCSs/view',
    'Practice test · 5 Steps to a 5 AP Psychology 2021':
        'https://drive.google.com/file/d/1dWmLPAkYgNlyAgmdXWAlhabyFfgdcden/view',
    'Practice test · AP Psychology 2007':
        'https://drive.google.com/file/d/1n9lBELmoRwDtkVxbx6TgfmAko3lXZzVu/view',
    'Practice test · AP Psychology 2008':
        'https://drive.google.com/file/d/11-2A4UJvM66oLSGiRvWD1l0Fv6wRz51H/view',
    'Practice test · AP Psychology 2012':
        'https://drive.google.com/file/d/1V5okt4nTybncUce_YIfCeeG-Lsp3DuDB/view',
    'Practice test · AP Psychology 2013':
        'https://drive.google.com/file/d/1NgiKNyObFamW8c0KpKvC87bgJwNkUW51/view',
    'Practice test · AP Psychology 2014':
        'https://drive.google.com/file/d/1gxTvBr9UkgZ9KS2VsQdo4QmjoLRgIAiI/view',
    'Practice test · AP Psychology 2015':
        'https://drive.google.com/file/d/1apEOFnae6WlqdHQemXWKYD81lNKvI2sC/view',
    'Practice test · AP Psychology 2016':
        'https://drive.google.com/file/d/1ChEPXPm9RTCzRhgK4ob46YLql1VRNK0r/view',
    'Practice test · AP Psychology 2017':
        'https://drive.google.com/file/d/19g5Fg4Q9w5JVKfgu4RCfGJX4g8y7HEGm/view',
    'Practice test · AP Psychology 2018':
        'https://drive.google.com/file/d/1b38R0QRrA5Dpd25nR1APSJoqN5Bd_6BL/view',
    'Practice test · Barron\'s - AP Psychology 2022-2023 Practice Tests':
        'https://drive.google.com/file/d/10I7CVC5B9NDy7bJINbtPDjXVgMU_hsJi/view',
    'Practice test · Barron\'s - AP Psychology Practice Tests 2025':
        'https://drive.google.com/file/d/17vBE5VVtylih-xsvT3zA3gHqmgm6ouYL/view',
    'Practice test · The Princeton Review-AP Psychology Premium Prep 2022':
        'https://drive.google.com/file/d/1cQSUIk3bsmTHLOFcUQUXh89Kn7zlyecu/view',
  },
  'ap_spanish_lang': {
    'Practice test · AP Spanish Lang 2008':
        'https://drive.google.com/file/d/1QLt8rkUN-dLRYo3s92CZ1W-LWl_SPBtT/view',
  },
  'ap_spanish_lit': {
    'Practice test · AP Spanish Lit 2008':
        'https://drive.google.com/file/d/1S2ffzGFqgcXNN-a1-uK7vFn2YdBn_VaQ/view',
    'Practice test · AP Spanish Lit 2018':
        'https://drive.google.com/file/d/1OesBwHWvV0F1LtwW3syXBJvpyrOLMgVd/view',
  },
  'ap_us_gov': {
    'Practice test · AP US Gov 2008':
        'https://drive.google.com/file/d/1sTuTuH01yRZV2piufyHfQi251-Tgpl9I/view',
    'Practice test · AP US Gov 2012':
        'https://drive.google.com/file/d/1XGETXE6X-QPPgasErIeqq21OvwlZK4x6/view',
    'Practice test · AP US Gov 2013':
        'https://drive.google.com/file/d/1ynSnr2Rpln9lOZWT-AYPej384a-rDqUd/view',
    'Practice test · AP US Gov 2018':
        'https://drive.google.com/file/d/1PSD-O8gfccxNVo43oTE3YBqXrmxVAEgV/view',
  },
  'ap_us_history': {
    'Practice test · The Princeton Review AP US History 2021':
        'https://drive.google.com/file/d/1I2HB6vEjvRcmiHqNIOcDzLtLl-E9Klt9/view',
  },
  'ap_world': {
    'Practice test · 5 Steps to a 5 AP World History 2024':
        'https://drive.google.com/file/d/12d1y0R85Eq83grEc0OzGOk0f2eYmVqC_/view',
    'Practice test · AP World History 2002':
        'https://drive.google.com/file/d/15EARYGH1kn1MBkNpjrNz2eooy2ud5GCn/view',
  },
};

const Map<String, Map<String, String>> _supplementalApLinks = {
  'ap_art_history': {
    'Course material · Smarthistory AP Art History guide':
        'https://smarthistory.org/guide-type/syllabus/',
    'Course material · Google Arts and Culture collections':
        'https://artsandculture.google.com/',
    'Course material · The Met Heilbrunn Timeline of Art History':
        'https://www.metmuseum.org/toah/',
  },
  'ap_music_theory': {
    'Course material · MusicTheory.net lessons':
        'https://www.musictheory.net/lessons',
    'Practice questions · MusicTheory.net exercises':
        'https://www.musictheory.net/exercises',
    'Course material · uTheory music theory and ear training':
        'https://utheory.com/',
    'Course material · Open Music Theory textbook':
        'https://viva.pressbooks.pub/openmusictheory/',
    'Practice questions · Teoria ear training and exercises':
        'https://www.teoria.com/en/exercises/',
  },
  'ap_english_lang': {
    'Course material · Marco Learning free study guides':
        'https://marcolearning.com/students/ap-study-guides/',
    'Course material · Purdue OWL writing and rhetoric':
        'https://owl.purdue.edu/owl/general_writing/academic_writing/index.html',
    'Notes · AP English Language study guide':
        'https://uploads-ssl.webflow.com/605fe570e5454a357d1e1811/60a039a509ab73d9c20c9e67_SS-AP-English-Lang.pdf',
    'Notes · AP Language survival guide':
        'http://www.matermiddlehigh.org/ourpages/auto/2009/10/30/35408373/AP%20Language%20Survival%20Guide.pdf',
    'Practice test · High School Test Prep AP Language':
        'https://highschooltestprep.com/ap/english-language/',
    'Practice questions · Varsity Tutors AP English Language':
        'https://www.varsitytutors.com/ap_english_language-flashcards',
  },
  'ap_english_lit': {
    'Course material · Marco Learning free study guides':
        'https://marcolearning.com/students/ap-study-guides/',
    'Course material · Purdue OWL writing and literature':
        'https://owl.purdue.edu/owl/subject_specific_writing/writing_in_literature/index.html',
    'Video · Crash Course Literature playlists':
        'https://www.youtube.com/@crashcourse/search?query=literature',
    'Course material · Poetry Foundation poems and analysis':
        'https://www.poetryfoundation.org/',
  },
  'ap_euro': {
    'Video · Heimler’s History AP European History':
        'https://www.youtube.com/@heimlershistory',
    'Course material · Heimler review guide (paid)':
        'https://resources.heimlershistory.com/store',
    'Course material · Marco Learning free study guides':
        'https://marcolearning.com/students/ap-study-guides/',
    'Course material · Tom Richey AP European History':
        'https://www.tomrichey.net/ap-european-history.html',
    'Notes · Volke AP European History lecture notes':
        'http://www.volkeeurohistory.com/lecture-notes.html',
    'Notes · Lumisource AP European History review':
        'https://www.lumisource.io/ap/european-history/unit1/review',
    'Practice test · High School Test Prep AP European History':
        'https://highschooltestprep.com/ap/european-history/',
    'Practice questions · Varsity Tutors AP European History':
        'https://www.varsitytutors.com/ap_european_history-flashcards',
  },
  'ap_human_geo': {
    'Video · Heimler’s History AP Human Geography':
        'https://www.youtube.com/@heimlershistory',
    'Course material · Marco Learning free study guides':
        'https://marcolearning.com/students/ap-study-guides/',
    'Notes · AP Human Geography Big Ideas review packet':
        'http://apgeographymhs.files.wordpress.com/2012/04/sbigideaspacket2012.pdf',
    'Notes · Lumisource Human Geography unit reviews':
        'https://www.lumisource.io/ap/human-geography/unit1/review',
    'Practice test · High School Test Prep Human Geography':
        'https://highschooltestprep.com/ap/human-geography/',
    'Practice questions · Geography Quiz topic library':
        'https://geographyquiz.org',
    'Practice questions · Varsity Tutors Human Geography':
        'https://www.varsitytutors.com/ap_human_geography-flashcards',
  },
  'ap_macro': {
    'Video · Heimler’s History AP Macroeconomics':
        'https://www.youtube.com/@heimlershistory',
    'Video · ACDC Economics macroeconomics playlists':
        'https://www.youtube.com/user/ACDCLeadership/playlists',
    'Notes · AP Macroeconomics exam review sheet':
        'http://jsher.myclassupdates.com/sitebuildercontent/sitebuilderfiles/apmacroexamreviewsheet.pdf',
    'Notes · Macroeconomics course outlines':
        'http://www.course-notes.org/Economics/Macro_Economics/Outlines/Macroeconomics_15th_Edition_Textbook',
    'Practice test · Lumisource AP Macroeconomics':
        'https://www.lumisource.io/ap/macroeconomics/practice/all',
    'Practice questions · Varsity Tutors AP Macroeconomics':
        'https://www.varsitytutors.com/ap_macroeconomics-flashcards',
    'Practice questions · Hamilton AP Macro worksheets':
        'https://sites.google.com/hamilton.k12.wi.us/ap-macroeconomics/home/ap-exam-review/practice-problems',
  },
  'ap_micro': {
    'Video · ACDC Economics microeconomics playlists':
        'https://www.youtube.com/user/ACDCLeadership/playlists',
    'Video · Jason Welker economics lessons':
        'https://www.youtube.com/@JasonWelker',
    'Notes · Lumisource complete AP Micro review':
        'https://www.lumisource.io/ap/microeconomics/review/all',
    'Notes · AP Microeconomics study guide':
        'https://ahsanderson.weebly.com/uploads/1/3/7/7/13770485/ap-micro-exam-study-guide.pdf',
    'Practice test · Lumisource AP Microeconomics':
        'https://www.lumisource.io/ap/microeconomics/unit1/practice-test',
    'Practice questions · ReviewEcon AP Micro game':
        'https://www.reviewecon.com/games-activities/micro-mc-exam',
    'Practice questions · Varsity Tutors AP Microeconomics':
        'https://www.varsitytutors.com/ap_microeconomics-flashcards',
  },
  'ap_psych': {
    'Course material · Marco Learning free study guides':
        'https://marcolearning.com/students/ap-study-guides/',
    'Notes · WikiNotes AP Psychology chapter notes':
        'http://wikinotes.wikidot.com/psychology-index',
    'Notes · AP Psychology complete review document':
        'https://drive.google.com/file/d/1sQ6TcTzIdfs7sOPmk1Kh6sTOrwdtRCNj/view',
    'Notes · Simple Studies AP Psychology':
        'https://www.simplestudies.org/groups/ap-psychology',
    'Course material · SparkNotes Psychology':
        'https://www.sparknotes.com/psychology/',
  },
  'ap_comp_gov': {
    'Course material · C-SPAN Classroom Comparative Government':
        'https://sites.google.com/view/c-spanclassroom-featured/world-history-and-governments/ap-comparative-government-and-politics',
    'Course material · Mr. Tredinnick Comparative Government':
        'http://www.mrtredinnick.com/ap-comparative-government.html',
    'Notes · Comparative Government country comparison chart':
        'https://uploads-ssl.webflow.com/632be2995229ca0bd3715246/640a3e46ba2b9b0dac096585_AP_Comp_Gov_Cram_Chart.pdf',
    'Notes · Athens Academy Comparative Government notes':
        'http://athensdesantis.com/apcpsnotes.html',
    'Video · Comparative Government complete playlist':
        'https://www.youtube.com/playlist?list=PL0TCFkN2cK4eLzdttDpcCcjealYzf8LuG',
  },
  'ap_us_gov': {
    'Video · Heimler’s History AP Government':
        'https://www.youtube.com/@heimlershistory',
    'Course material · Marco Learning free study guides':
        'https://marcolearning.com/students/ap-study-guides/',
    'Course material · C-SPAN Classroom AP Government':
        'https://sites.google.com/view/c-spanclassroom-featured/u-s-government-and-civics/ap-u-s-government-and-politics',
    'Notes · EBSCO AP Government study guide':
        'https://support.ebsco.com/LEX/AP-US-Government-and-Politics-Study-Guide.pdf',
    'Notes · Social Studies Help AP Government notes':
        'http://www.socialstudieshelp.com/APGOV_Class_Page.htm',
    'Practice test · High School Test Prep AP Government':
        'https://highschooltestprep.com/ap/us-government/',
    'Practice questions · US Government Quiz':
        'https://www.usgovernmentquiz.com/',
    'Practice test · Lumisource AP Government':
        'https://www.lumisource.io/ap/us-government/unit1-1/practice-test',
  },
  'ap_us_history': {
    'Video · Heimler’s History AP United States History':
        'https://www.youtube.com/@heimlershistory',
    'Course material · Heimler review guide (paid)':
        'https://resources.heimlershistory.com/store',
    'Course material · Marco Learning free study guides':
        'https://marcolearning.com/students/ap-study-guides/',
    'Course material · Gilder Lehrman AP US History':
        'https://www.gilderlehrman.org/ap-us-history',
    'Course material · American History Central APUSH guide':
        'https://www.americanhistorycentral.com/entries/apush-guide/',
    'Notes · Doves Library APUSH period notes':
        'https://www.doveslibrary.com/history-and-social-sciences/ap-united-states-history/period-1-a-new-world-1491-1607/1-2-native-american-societies-before-european-contact',
    'Practice test · High School Test Prep AP US History':
        'https://highschooltestprep.com/ap/us-history/',
    'Practice questions · Gilder Lehrman APUSH questions':
        'https://www.gilderlehrman.org/ap-us-history/practice-questions',
  },
  'ap_world': {
    'Video · Heimler’s History AP World History':
        'https://www.youtube.com/@heimlershistory',
    'Course material · Heimler review guide (paid)':
        'https://resources.heimlershistory.com/store',
    'Course material · Marco Learning free study guides':
        'https://marcolearning.com/students/ap-study-guides/',
    'Course material · AP Worldipedia': 'http://www.apworldipedia.com',
    'Notes · AP World History complete study guide':
        'https://uploads-ssl.webflow.com/605fe570e5454a357d1e1811/609f602ab8c522d2fbb74495_SS-AP-World-History.pdf',
    'Notes · Lumisource AP World History review':
        'https://www.lumisource.io/ap/world-history/review/all',
    'Notes · Teacher Oz AP World exam review':
        'http://www.teacheroz.com/apexamreview.html',
    'Practice test · High School Test Prep AP World History':
        'https://highschooltestprep.com/ap/world-history/',
    'Practice test · Lumisource AP World History':
        'https://www.lumisource.io/ap/world-history/unit1/practice-test',
    'Course material · World History Encyclopedia':
        'https://www.worldhistory.org/',
  },
  'ap_calc_ab': {
    'Course material · Math Medic AP Calculus lessons':
        'https://mathmedic.com/',
    'Video · Math Medic exam review course (paid)':
        'https://mathmedic.com/blog/sneak-peek-of-the-math-medic-ap-exam-review-courses/',
    'Course material · Paul’s Online Calculus I notes':
        'https://tutorial.math.lamar.edu/Classes/CalcI/CalcI.aspx',
    'Notes · Paul’s complete calculus cheat sheet':
        'https://tutorial.math.lamar.edu/pdf/Calculus_Cheat_Sheet_All.pdf',
    'Notes · IITian Academy AP Calculus summaries':
        'https://www.iitianacademy.com/ap-calculus-ab-and-bc-concise-summary-notes/',
    'Notes · AP Calculus when-you-see reference sheet':
        'https://www.gpschools.org/cms/lib/MI01000971/Centricity/Domain/429/WhenYouSeeWAnswers.pdf',
    'Notes · Elaine Cheong AP Calculus review book':
        'http://www.elainetron.com/apcalc/apcalc.pdf',
  },
  'ap_calc_bc': {
    'Course material · Math Medic AP Calculus lessons':
        'https://mathmedic.com/',
    'Video · Math Medic exam review course (paid)':
        'https://mathmedic.com/blog/sneak-peek-of-the-math-medic-ap-exam-review-courses/',
    'Course material · Paul’s Online Calculus II notes':
        'https://tutorial.math.lamar.edu/Classes/CalcII/CalcII.aspx',
    'Course material · Mr. Felling AP Calculus BC':
        'https://www.mrfelling.com/apcalcbc.html',
    'Course material · Mr. Tiger AP Calculus AB and BC':
        'https://mrtigercalculus.weebly.com/new-ap-calculus-abbc.html',
    'Notes · Paul’s complete calculus cheat sheet':
        'https://tutorial.math.lamar.edu/pdf/Calculus_Cheat_Sheet_All.pdf',
    'Notes · AP Calculus BC final notes':
        'http://staff.orecity.k12.or.us/steven.becker/Final%20Notes%20for%20AB%20and%20BC.pdf',
  },
  'ap_precalc': {
    'Course material · Math Medic AP Precalculus lessons':
        'https://mathmedic.com/',
    'Video · Math Medic exam review course (paid)':
        'https://mathmedic.com/blog/sneak-peek-of-the-math-medic-ap-exam-review-courses/',
  },
  'ap_stats': {
    'Course material · Math Medic AP Statistics lessons':
        'https://mathmedic.com/',
    'Video · Math Medic exam review course (paid)':
        'https://mathmedic.com/blog/sneak-peek-of-the-math-medic-ap-exam-review-courses/',
    'Notes · Statistics Handbook':
        'https://mathguy.us/Handbooks/StatisticsHandbook.pdf',
    'Notes · EBSCO AP Statistics study guide':
        'https://support.ebsco.com/LEX/AP-Statistics_Study-Guide.pdf',
    'Course material · Dan Shuster AP Statistics chapters':
        'http://www.danshuster.com/apstat/apstat_chapters.htm',
    'Notes · AP Statistics review notes':
        'https://www.ilearnacademy.net/uploads/3/9/2/2/3922443/stat_review_notes.pdf',
  },
  'ap_csa': {
    'Course material · APCS Exam Prep complete AP CSA course':
        'https://www.apcsexamprep.com/pages/ap-csa-course',
    'Course material · APCS Exam Prep AP CSA resource hub':
        'https://www.apcsexamprep.com/pages/ap-csa-exam-prep-hub',
    'Practice test · APCS Exam Prep AP CSA exams':
        'https://www.apcsexamprep.com/pages/ap-csa-practice-exams',
    'Practice test · APCS Exam Prep tests by topic':
        'https://www.apcsexamprep.com/pages/ap-csa-practice-tests-by-topic',
    'Practice questions · APCS Exam Prep custom test builder':
        'https://www.apcsexamprep.com/pages/ap-csa-test-builder',
    'Practice questions · APCS Exam Prep FRQ archive':
        'https://www.apcsexamprep.com/pages/ap-csa-frq-archive',
    'Video · APCS Exam Prep AP CSA course playlist':
        'https://www.youtube.com/playlist?list=PLmwzeqwf733_c11PIESYrCx1X2y6oya1D',
    'Video · APCS Exam Prep AP CSA FRQ walkthroughs':
        'https://www.youtube.com/playlist?list=PLmwzeqwf733-axztyA2X4DfjNxSnsiWMn',
    'Course material · CSAwesome interactive Java course':
        'https://runestone.academy/runestone/books/published/csawesome2/index.html',
    'Course material · Code.org AP Computer Science A':
        'https://code.org/curriculum/csa',
    'Practice questions · CodingBat AP Java problems':
        'https://codingbat.com/java/AP-1',
    'Practice questions · CodingBat Java practice library':
        'https://codingbat.com/java',
  },
  'ap_csp': {
    'Course material · APCS Exam Prep complete AP CSP course':
        'https://www.apcsexamprep.com/pages/ap-csp-course',
    'Course material · APCS Exam Prep AP CSP resource hub':
        'https://www.apcsexamprep.com/pages/ap-computer-science-principles-resources',
    'Practice test · APCS Exam Prep AP CSP exams':
        'https://www.apcsexamprep.com/pages/ap-csp-practice-exams',
    'Practice test · APCS Exam Prep tests by topic':
        'https://www.apcsexamprep.com/pages/ap-csp-practice-tests-by-topic',
    'Practice questions · APCS Exam Prep custom test builder':
        'https://www.apcsexamprep.com/pages/ap-csp-test-builder',
    'Practice questions · APCS Exam Prep Top 100 questions':
        'https://www.apcsexamprep.com/pages/ap-csp-top-100-questions',
    'Video · APCS Exam Prep AP CSP playlist':
        'https://www.youtube.com/playlist?list=PLmwzeqwf733_6nuemUG0OlmhvR6Cdd5k_',
    'Course material · Code.org AP CSP curriculum':
        'https://code.org/cs/curriculum/computer-science-principles',
  },
  'ap_bio': {
    'Course material · AP Bio Penguins review library':
        'https://apbiopenguins.weebly.com/',
    'Video · Bozeman Science AP Biology':
        'https://www.bozemanscience.com/ap-biology',
    'Notes · IITian Academy AP Biology summary notes':
        'https://www.iitianacademy.com/ap-biology-concise-summary-notes/',
    'Notes · Chou AP Biology lecture notes':
        'https://sites.google.com/a/svvsd.org/chou/welcome/ap-biology/ap-biology-lecture-notes',
    'Notes · AP Biology full review guide':
        'https://drive.google.com/file/d/1p5h3hETnFvhbekquJ_xXecPpKOVmp5yp/view',
    'Practice test · High School Test Prep AP Biology':
        'https://highschooltestprep.com/ap/biology/',
    'Practice test · AP Bio Penguins full practice exam':
        'https://apbiopenguins.weebly.com/2025-2026-exam-review.html',
    'Practice questions · AP Biology vocabulary review':
        'https://quizlet.com/22315269/ultimate-ap-biology-vocabulary-review-flash-cards/',
  },
  'ap_chem': {
    'Video · Jeremy Krug complete AP Chemistry course':
        'https://jeremykrug.com/',
    'Course material · Jeremy Krug review packet (paid)':
        'https://jeremykrug.com/',
    'Video · Bozeman Science AP Chemistry':
        'https://www.bozemanscience.com/ap-chemistry',
    'Course material · ScienceGeek AP Chemistry':
        'https://www.sciencegeek.net/APchemistry/Powerpoints.shtml',
    'Notes · Simple Studies AP Chemistry':
        'https://www.simplestudies.org/groups/ap-chemistry',
    'Notes · AP Chemistry quick review':
        'http://smicchem.weebly.com/uploads/1/0/0/2/10026459/apquickreview.pdf',
    'Notes · EBSCO AP Chemistry study guide':
        'https://support.ebsco.com/LEX/AP-Chemistry_Study-Guide.pdf',
    'Practice questions · ScienceGeek interactive review':
        'http://www.sciencegeek.net/APchemistry/APtaters/directory.shtml',
    'Practice questions · Varsity Tutors AP Chemistry':
        'https://www.varsitytutors.com/ap_chemistry-flashcards',
    'Practice test · AP Chemistry midterm exam':
        'https://drive.google.com/file/d/1R0e_YPaSyNxLmOoUHhrg18rYF7oyENaY/view',
  },
  'ap_env_sci': {
    'Video · Bozeman Science AP Environmental Science':
        'https://www.bozemanscience.com/ap-environmental-science',
    'Notes · Mr. Rittner AP Environmental Science notes':
        'https://mrrittnerisapes.weebly.com/class-notes.html',
    'Notes · Kwanga AP Environmental Science notes':
        'http://www.kwanga.net/apes-notes1.html#susfuture',
    'Notes · Lumisource AP Environmental Science reviews':
        'https://www.lumisource.io/ap/environmental-science/unit1/review',
  },
  'ap_physics_1': {
    'Video · Flipping Physics AP Physics 1 playlists':
        'https://www.flippingphysics.com/playlists.html',
    'Video · Bozeman Science AP Physics 1':
        'https://www.bozemanscience.com/ap-physics-1',
    'Notes · Flipping Physics complete Physics 1 notes':
        'https://www.flippingphysics.com/uploads/2/1/1/0/21103672/ap_physics_1_review_lecture_notes_-_all.pdf',
    'Notes · Mr. Bigler AP Physics 1 notes':
        'https://www.mrbigler.com/CP1-Physics-1/Notes-Physics-1.pdf',
    'Notes · IITian Academy AP Physics 1 summaries':
        'https://www.iitianacademy.com/ap-physics-1-concise-summary-notes/',
    'Course material · Campbell AP Physics 1 notes':
        'https://campbellap.weebly.com/notes.html',
  },
  'ap_physics_2': {
    'Video · Flipping Physics AP Physics 2 library':
        'https://www.flippingphysics.com/physics-videos.html',
    'Video · Bozeman Science AP Physics 2':
        'https://www.bozemanscience.com/ap-physics-2',
    'Notes · Mr. Bigler AP Physics 2 notes':
        'https://www.mrbigler.com/AP-Physics-2/Notes-AP-Physics-2.pdf',
    'Course material · Bluhm AP Physics 2 documents':
        'https://sites.google.com/a/jeffcoschools.us/bluhm-ap-physics-2/home/documents',
  },
  'ap_physics_c_em': {
    'Video · Flipping Physics E&M playlist and review':
        'https://www.flippingphysics.com/ap-physics-c-review.html',
    'Course material · Laufer AP Physics C E&M':
        'https://sites.google.com/view/lauferphysics/ap-physics-c-em',
    'Course material · Milligan AP Physics C':
        'https://www.milliganphysics.com/ap_physics_c.html',
    'Practice questions · Varsity Tutors Physics C E&M':
        'https://www.varsitytutors.com/ap_physics_c_electricity-flashcards',
    'Practice test · AP Physics C E&M practice exam':
        'https://www.worldwisetutoring.com/wp-content/uploads/2022/05/AP-Physics-C-EM-Test-1.pdf',
  },
  'ap_physics_c_mech': {
    'Video · Flipping Physics Mechanics playlist and review':
        'https://www.flippingphysics.com/ap-physics-c-review.html',
    'Notes · Flipping Physics complete Mechanics notes':
        'https://www.flippingphysics.com/uploads/2/1/1/0/21103672/ap_physics_c_mechanics_review_lecture_notes_-_all.pdf',
    'Notes · Barlow Academy AP Physics C notes':
        'https://barlowacademy.com/ap-physics-c-notes/',
    'Course material · Milligan AP Physics C':
        'https://www.milliganphysics.com/ap_physics_c.html',
    'Practice test · AP Physics C revision guide':
        'https://www.gonzmosis.com/uploads/7/4/8/4/7484591/ap_physics_c_revision_guide.pdf',
  },
  'ap_chinese': {
    'Course material · Chinese Grammar Wiki':
        'https://resources.allsetlearning.com/chinese/grammar/',
    'Practice questions · Arch Chinese vocabulary and writing tools':
        'https://www.archchinese.com/',
  },
  'ap_french': {
    'Practice questions · Conjuguemos French drills':
        'https://conjuguemos.com/activities/french/verb/1',
    'Course material · Aprelendo authentic French practice':
        'https://www.aprelendo.com/',
    'Course material · Lawless French grammar and listening':
        'https://www.lawlessfrench.com/',
  },
  'ap_german': {
    'Practice questions · Conjuguemos German drills':
        'https://conjuguemos.com/activities/german/verb/1',
    'Course material · Aprelendo authentic German practice':
        'https://www.aprelendo.com/',
    'Course material · Deutsche Welle German learning':
        'https://learngerman.dw.com/',
  },
  'ap_italian': {
    'Practice questions · Conjuguemos Italian drills':
        'https://conjuguemos.com/activities/italian/verb/1',
    'Course material · Aprelendo authentic Italian practice':
        'https://www.aprelendo.com/',
  },
  'ap_japanese': {
    'Course material · Tae Kim Japanese grammar guide':
        'https://guidetojapanese.org/learn/',
    'Course material · NHK Easy Japanese lessons':
        'https://www.nhk.or.jp/lesson/en/',
    'Course material · Marugoto Japanese learning platform':
        'https://minato-jf.jp/',
  },
  'ap_latin': {
    'Course material · Dickinson Latin commentaries':
        'https://dcc.dickinson.edu/',
    'Practice questions · Conjuguemos Latin drills':
        'https://conjuguemos.com/activities/latin/verb/1',
    'Course material · Perseus Latin text collection':
        'https://www.perseus.tufts.edu/hopper/collections',
  },
  'ap_spanish_lang': {
    'Practice questions · Conjuguemos Spanish drills':
        'https://conjuguemos.com/activities/spanish/verb/1',
    'Course material · Aprelendo authentic Spanish practice':
        'https://www.aprelendo.com/',
    'Course material · SpanishDict grammar and vocabulary':
        'https://www.spanishdict.com/guide',
    'Video · Radio Ambulante Spanish stories and transcripts':
        'https://radioambulante.org/',
  },
  'ap_spanish_lit': {
    'Practice questions · Conjuguemos Spanish drills':
        'https://conjuguemos.com/activities/spanish/verb/1',
    'Course material · Biblioteca Virtual Miguel de Cervantes':
        'https://www.cervantesvirtual.com/',
    'Course material · SpanishDict grammar and vocabulary':
        'https://www.spanishdict.com/guide',
  },
  'ap_research': {
    'Course material · Purdue OWL research guidance':
        'https://owl.purdue.edu/owl/research_and_citation/index.html',
    'Course material · Zotero citation and source organizer':
        'https://www.zotero.org/',
  },
  'ap_seminar': {
    'Course material · Purdue OWL research guidance':
        'https://owl.purdue.edu/owl/research_and_citation/index.html',
    'Course material · Zotero citation and source organizer':
        'https://www.zotero.org/',
  },
  'ap_cybersecurity': {
    'Course material · APCS Exam Prep complete AP Cybersecurity course':
        'https://www.apcsexamprep.com/pages/ap-cybersecurity-complete-course-guide',
    'Course material · APCS Exam Prep AP Cybersecurity study guides':
        'https://www.apcsexamprep.com/pages/ap-cybersecurity-study-guides',
    'Practice test · APCS Exam Prep AP Cybersecurity exam':
        'https://www.apcsexamprep.com/pages/ap-cybersecurity-practice-exam',
    'Practice questions · APCS Exam Prep AP Cybersecurity question bank':
        'https://www.apcsexamprep.com/pages/ap-cybersecurity-practice-questions',
    'Practice questions · APCS Exam Prep daily question':
        'https://www.apcsexamprep.com/pages/ap-cybersecurity-question-of-the-day',
    'Video · APCS Exam Prep AP Cybersecurity playlist':
        'https://www.youtube.com/playlist?list=PLmwzeqwf733_hZo-QXj-iwBtx9P6jbnJ-',
    'Course material · Cisco Introduction to Cybersecurity':
        'https://www.cisco.com/site/us/en/learn/training-certifications/training/netacad/index.html',
  },
  'ap_business_finance': {
    'Video · AP Business course introduction by Jacob Clifford':
        'https://www.youtube.com/watch?v=ZgVAN6jCQow',
    'Course material · Khan Academy financial literacy':
        'https://www.khanacademy.org/college-careers-more/financial-literacy',
  },
};

/// Every link displayed for a resource, including verified AP supplements.
List<String> linksForResource(Resource resource) {
  if (resource.category != 'ap') return resource.links;
  bool isOldCommercialBook(String label) {
    final lower = label.toLowerCase();
    return lower.contains('barron') ||
        lower.contains('princeton') ||
        lower.contains('5 steps to a 5') ||
        lower.contains('textbook-calculus');
  }

  return <String>{
    ...resource.links,
    ...?_supplementalApLinks[resource.id]?.keys,
    ...?_driveApFileLinks[resource.id]?.keys.where(
      (label) => !isOldCommercialBook(label),
    ),
    ...?_apBookLinks[resource.id]?.keys,
  }.toList();
}

// ===========================================================================
// ─────────────────────────────────────────────────────────────────────────────

/// All resources matching a category string.
List<Resource> resourcesByCategory(String category) =>
    allResources.where((r) => r.category == category).toList()
      ..sort((a, b) => a.title.compareTo(b.title));

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
  final filtered = subCategory == null || subCategory == 'all'
      ? aps
      : aps.where((r) => r.apSubCategory == subCategory).toList();
  return filtered..sort((a, b) => a.title.compareTo(b.title));
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
  return kLinkUrls[linkLabel] ??
      _commonApLinks[linkLabel] ??
      _supplementalApLinks[resource.id]?[linkLabel] ??
      _driveApFileLinks[resource.id]?[linkLabel] ??
      _apBookLinks[resource.id]?[linkLabel] ??
      resource.url;
}
