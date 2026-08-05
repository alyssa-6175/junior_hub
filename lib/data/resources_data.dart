import 'package:flutter/material.dart';
import '../models/resource.dart';

// mapping url links
const Map<String, String> kLinkUrls = {
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
      'AP Computer Science A AP CS Exam Prep: Test and Course Content',
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
      'AP Computer Science Principles AP CS Exam Prep: Test and Course Content',
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
    id: 'ap_2d_art_design',
    title: 'AP 2-D Art and Design',
    category: 'ap',
    field: 'art_history',
    description:
        'Portfolio-based study in two-dimensional visual art and design.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-2-d-art-and-design',
    links: ['Official AP 2-D Art and Design course page'],
    apSubCategory: 'arts',
  ),
  const Resource(
    id: 'ap_3d_art_design',
    title: 'AP 3-D Art and Design',
    category: 'ap',
    field: 'art_history',
    description:
        'Portfolio-based study in three-dimensional visual art and design.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-3-d-art-and-design',
    links: ['Official AP 3-D Art and Design course page'],
    apSubCategory: 'arts',
  ),
  const Resource(
    id: 'ap_drawing',
    title: 'AP Drawing',
    category: 'ap',
    field: 'art_history',
    description:
        'Portfolio-based study in drawing, mark-making, and visual expression.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-drawing',
    links: ['Official AP Drawing course page'],
    apSubCategory: 'arts',
  ),
  const Resource(
    id: 'ap_research',
    title: 'AP Research',
    category: 'ap',
    field: 'english',
    description:
        'Yearlong independent research, academic writing, and presentation.',
    deadline: 'TODO',
    deadlineIso: '',
    icon: Icons.school,
    url: 'https://apstudents.collegeboard.org/courses/ap-research',
    links: ['Official AP Research course page'],
    apSubCategory: 'capstone',
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
      'AP Cybersecurity Official Course Page',
      'AP Cybersecurity AP Classroom',
      'AP Cybersecurity Official Exam Page',
      'AP Cybersecurity AP CS Exam Prep: Test and Course Content',
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
  return kLinkUrls[linkLabel] ?? resource.url;
}
