// Curated YouTube playlists for each AP course.
// Channels with several playlists render as an expandable group in the
// AP course Videos tab; single-playlist channels render as one link.
// Collected from YouTube in October 2026.

class ApVideoPlaylist {
  final String title;
  final String playlistId;
  const ApVideoPlaylist(this.title, this.playlistId);
  String get url => 'https://www.youtube.com/playlist?list=$playlistId';
}

class ApVideoChannel {
  final String name;
  final String? channelUrl;
  final List<ApVideoPlaylist> playlists;
  const ApVideoChannel({required this.name, this.channelUrl, required this.playlists});
}

const Map<String, List<ApVideoChannel>> apVideoChannels = {
  'ap_calc_bc': [
    ApVideoChannel(
      name: 'Khan Academy',
      channelUrl: 'https://www.youtube.com/@khanacademy',
      playlists: [
        ApVideoPlaylist('Limits and continuity', 'PLSQl0a2vh4HBReS9_V4QYOnqP2aguahxS'),
        ApVideoPlaylist('Advanced derivatives', 'PLSQl0a2vh4HC7bLF725m1zVhr4Wc61Qcn'),
        ApVideoPlaylist('Applications of derivatives', 'PLSQl0a2vh4HAjRrIJ95UZ7KRUygIioqQY'),
        ApVideoPlaylist('Antiderivatives and the fundamental theorem of calculus', 'PLSQl0a2vh4HDK8YxxqCvRVpl10aISqXeL'),
        ApVideoPlaylist('Integration and accumulation of change', 'PLSQl0a2vh4HCF6n9DhNVgQsYpCyNiwI41'),
        ApVideoPlaylist('Differential equations', 'PLSQl0a2vh4HA3rBfCvZPsEREvCkSSalfg'),
        ApVideoPlaylist('Applications of definite integrals', 'PLSQl0a2vh4HASC0hzF_lPzX9_QMQJ-zxx'),
        ApVideoPlaylist('Series', 'PLSQl0a2vh4HDe1hn9KwPKKhzVOXeR_SeO'),
        ApVideoPlaylist('AP Calculus BC solved exams', 'PLSQl0a2vh4HD3ptvg4rRVjEAPbd-IY2iS'),
      ],
    ),
    ApVideoChannel(
      name: 'The Algebros',
      channelUrl: 'https://www.youtube.com/@TheAlgebros',
      playlists: [
        ApVideoPlaylist('Unit 1 · Limits and Continuity', 'PLxRSX8UqzWceAGi1vKuXTXlc_GkIW7OIO'),
        ApVideoPlaylist('Unit 2 · Differentiation: Definition and Fundamental Properties', 'PLxRSX8UqzWcfglyGBZU8QK3e_4XkGiqY-'),
        ApVideoPlaylist('Unit 3 · Differentiation: Composite, Implicit, and Inverse Functions', 'PLxRSX8UqzWcdKHyJZAyKEEud_-G-rDyjW'),
        ApVideoPlaylist('Unit 4 · Contextual Applications of Differentiation', 'PLxRSX8UqzWcdLw5vOJOeNwa2PxsWUkICd'),
        ApVideoPlaylist('Unit 5 · Analytical Applications of Differentiation', 'PLxRSX8UqzWccPUnMBBYdxe2v55eOgQxuj'),
        ApVideoPlaylist('Unit 6 · Integration and Accumulation of Change', 'PLxRSX8UqzWcegddqpyKxPAzoHvk5pgldg'),
        ApVideoPlaylist('Unit 7 · Differential Equations', 'PLxRSX8UqzWcfPBOfC_I1rWVN87eoPp6Ta'),
        ApVideoPlaylist('Unit 8 · Applications of Integration', 'PLxRSX8UqzWccSg2Y2U0E2-xvLPQaXfbK-'),
        ApVideoPlaylist('Unit 9 · Parametric Equations, Polar Coordinates, and Vector-Valued Functions', 'PLxRSX8UqzWcdl-SdkB2e5naj78cQDJ2uZ'),
        ApVideoPlaylist('Unit 10 · Infinite Sequences and Series', 'PLxRSX8UqzWcfHZ4kGyvTYrdEFw-RhcWJI'),
        ApVideoPlaylist('AP Calc FRQ walkthroughs', 'PLxRSX8UqzWceMn-NChM73Uas6cuIE9d_C'),
      ],
    ),
    ApVideoChannel(
      name: 'Emma Slonaker',
      playlists: [
        ApVideoPlaylist('Unit 1 · Limits and Continuity', 'PLTEBkBE3HYK_7rxhmzl2hgJB8CQZ3bNe1'),
        ApVideoPlaylist('Unit 2 · Differentiation: Definition and Fundamental Properties', 'PLTEBkBE3HYK8hI3ZU5sMoYtvJ8RqFto9u'),
        ApVideoPlaylist('Unit 3 · Differentiation: Composite, Implicit, and Inverse Functions', 'PLTEBkBE3HYK84Fu9gb6mka_QEFj6hIZK1'),
        ApVideoPlaylist('Unit 4 · Contextual Applications of Differentiation', 'PLTEBkBE3HYK_21mUOz5rEP-CLmIoySgIG'),
        ApVideoPlaylist('Unit 5 · Analytical Applications of Differentiation', 'PLTEBkBE3HYK_qDqx-Kvo8q0MJREZ_SfDV'),
        ApVideoPlaylist('Unit 6 · Integration and Accumulation of Change', 'PLTEBkBE3HYK9wKj5EQgX9AMzvBlYZ30mX'),
        ApVideoPlaylist('Unit 7 · Differential Equations', 'PLTEBkBE3HYK_0qae35LAVYDQSE6hC1uIJ'),
        ApVideoPlaylist('Unit 9 · Parametric, Polar, and Vector-Valued Functions (BC only)', 'PLTEBkBE3HYK_oHOWrxlA4VEfbawMHs5GT'),
        ApVideoPlaylist('Unit 10 · Infinite Sequences and Series (BC only)', 'PLTEBkBE3HYK8ui1S9IiPHcsOTRIXkynWt'),
      ],
    ),
    ApVideoChannel(
      name: 'Bao Le Math',
      playlists: [
        ApVideoPlaylist('AP Calculus BC full course', 'PL-18AcX_OfK2Nrmu9Zyt6BXeUF7ZZON7V'),
      ],
    ),
    ApVideoChannel(
      name: 'RH Mathematics',
      playlists: [
        ApVideoPlaylist('Calculus BC full course', 'PL00CCm_434gHmObik13oqAUq0foEGOdIw'),
      ],
    ),
    ApVideoChannel(
      name: 'turksvids',
      playlists: [
        ApVideoPlaylist('AP Calculus BC review videos', 'PL6iwkLfBjZiyOprILurQRNoI1M0ACE0ab'),
      ],
    ),
    ApVideoChannel(
      name: 'Meek Extra Help',
      playlists: [
        ApVideoPlaylist('AP Calculus BC full course walkthrough by unit', 'PLI3_KPCoxoPhjl2sG-4OQRbJV9iXiPrxJ'),
      ],
    ),
    ApVideoChannel(
      name: 'Elizabeth Fein',
      playlists: [
        ApVideoPlaylist('AP Calculus: BC-only topics', 'PL5LKYWMRlz9KetnsttpgM2eFp3Eebuy06'),
      ],
    ),
    ApVideoChannel(
      name: 'Krista King',
      playlists: [
        ApVideoPlaylist('AP Calculus BC', 'PLJ8OrXpbC-BMJLds9rB4V6w4va9p1swkT'),
      ],
    ),
  ],
  'ap_calc_ab': [
    ApVideoChannel(
      name: 'Khan Academy',
      channelUrl: 'https://www.youtube.com/@khanacademy',
      playlists: [
        ApVideoPlaylist('Limits and continuity', 'PLSQl0a2vh4HBxF5ogRo056-5Ef6duqh7n'),
        ApVideoPlaylist('Derivative rules', 'PLSQl0a2vh4HBY0-BZOePhgg46abJ9iVYS'),
        ApVideoPlaylist('Differentiation: composite, implicit, and inverse functions', 'PLSQl0a2vh4HC-Fe6iDWn_eEHvW54E6SiM'),
        ApVideoPlaylist('Contextual applications of differentiation', 'PLSQl0a2vh4HDV4laENr1vNSfieh9JM2X6'),
        ApVideoPlaylist('Existence theorems', 'PLSQl0a2vh4HCtyDCGGa8-ds6b5ZRDP-Q7'),
        ApVideoPlaylist('Using derivatives to analyze functions', 'PLSQl0a2vh4HD912PzvD-6F-vUl4MH1CLE'),
        ApVideoPlaylist('Accumulation and Riemann sums', 'PLSQl0a2vh4HAT3WMejcb8SdWNeFC8rn6w'),
        ApVideoPlaylist('Differential equations', 'PLSQl0a2vh4HDACpg7HiuCiiVoB3CZs1lq'),
        ApVideoPlaylist('Applications of integration', 'PLSQl0a2vh4HBi4W3BcQ1VT9CbFEFcy0BI'),
        ApVideoPlaylist('Applications of definite integrals', 'PLSQl0a2vh4HDi52jSWjkqskCtXyL09gk1'),
      ],
    ),
    ApVideoChannel(
      name: 'The Algebros',
      channelUrl: 'https://www.youtube.com/@TheAlgebros',
      playlists: [
        ApVideoPlaylist('Unit 1 · Limits and Continuity', 'PLxRSX8UqzWceAGi1vKuXTXlc_GkIW7OIO'),
        ApVideoPlaylist('Unit 2 · Differentiation: Definition and Fundamental Properties', 'PLxRSX8UqzWcfglyGBZU8QK3e_4XkGiqY-'),
        ApVideoPlaylist('Unit 3 · Differentiation: Composite, Implicit, and Inverse Functions', 'PLxRSX8UqzWcdKHyJZAyKEEud_-G-rDyjW'),
        ApVideoPlaylist('Unit 4 · Contextual Applications of Differentiation', 'PLxRSX8UqzWcdLw5vOJOeNwa2PxsWUkICd'),
        ApVideoPlaylist('Unit 5 · Analytical Applications of Differentiation', 'PLxRSX8UqzWccPUnMBBYdxe2v55eOgQxuj'),
        ApVideoPlaylist('Unit 6 · Integration and Accumulation of Change', 'PLxRSX8UqzWcegddqpyKxPAzoHvk5pgldg'),
        ApVideoPlaylist('Unit 7 · Differential Equations', 'PLxRSX8UqzWcfPBOfC_I1rWVN87eoPp6Ta'),
        ApVideoPlaylist('Unit 8 · Applications of Integration', 'PLxRSX8UqzWccSg2Y2U0E2-xvLPQaXfbK-'),
        ApVideoPlaylist('AP Calc FRQ walkthroughs', 'PLxRSX8UqzWceMn-NChM73Uas6cuIE9d_C'),
      ],
    ),
    ApVideoChannel(
      name: 'Daniel Bortnick',
      playlists: [
        ApVideoPlaylist('Unit 1 · Limits and Continuity', 'PLs6noPJIno5QcH94LFHysjI0vUXVwJ-Hd'),
        ApVideoPlaylist('Unit 2 · Differentiation: Definition and Basic Derivative Rules', 'PLs6noPJIno5QAPdzQmEeLWydnPE_-yXap'),
        ApVideoPlaylist('Unit 3 · Differentiation: Composite, Implicit, and Inverse Functions', 'PLs6noPJIno5TKsKwyPaJ_diuxiPDb8qAP'),
        ApVideoPlaylist('Unit 4 · Contextual Applications of Differentiation', 'PLs6noPJIno5SJXdyxojj0GZ1_LqEDOt9G'),
        ApVideoPlaylist('Unit 5 · Analytical Applications of Differentiation', 'PLs6noPJIno5Srzfq-5FCmBpukeMn49x78'),
        ApVideoPlaylist('Unit 6 · Integration and Accumulation of Change', 'PLs6noPJIno5SZwmCAXUDPjKcb13ArF5-y'),
        ApVideoPlaylist('Unit 7 · Differential Equations', 'PLs6noPJIno5QvKnrWOJJIxO-lEOKS5VeY'),
        ApVideoPlaylist('Unit 8 · Applications of Integration', 'PLs6noPJIno5RMiyblHjWgRKy1Z5digv8z'),
        ApVideoPlaylist('AP Calculus AB review', 'PLs6noPJIno5SBhfGKHILu1ndeLDf76ooz'),
      ],
    ),
    ApVideoChannel(
      name: 'Emma Slonaker',
      playlists: [
        ApVideoPlaylist('Unit 1 · Limits and Continuity', 'PLTEBkBE3HYK_7rxhmzl2hgJB8CQZ3bNe1'),
        ApVideoPlaylist('Unit 2 · Differentiation: Definition and Fundamental Properties', 'PLTEBkBE3HYK8hI3ZU5sMoYtvJ8RqFto9u'),
        ApVideoPlaylist('Unit 3 · Differentiation: Composite, Implicit, and Inverse Functions', 'PLTEBkBE3HYK84Fu9gb6mka_QEFj6hIZK1'),
        ApVideoPlaylist('Unit 4 · Contextual Applications of Differentiation', 'PLTEBkBE3HYK_21mUOz5rEP-CLmIoySgIG'),
        ApVideoPlaylist('Unit 5 · Analytical Applications of Differentiation', 'PLTEBkBE3HYK_qDqx-Kvo8q0MJREZ_SfDV'),
        ApVideoPlaylist('Unit 6 · Integration and Accumulation of Change', 'PLTEBkBE3HYK9wKj5EQgX9AMzvBlYZ30mX'),
        ApVideoPlaylist('Unit 7 · Differential Equations', 'PLTEBkBE3HYK_0qae35LAVYDQSE6hC1uIJ'),
      ],
    ),
    ApVideoChannel(
      name: 'Meek Extra Help',
      playlists: [
        ApVideoPlaylist('AP Calculus AB full course walkthrough', 'PLI3_KPCoxoPhlX-eaH1SbKWyKy_7PNHfm'),
      ],
    ),
    ApVideoChannel(
      name: 'Krista King',
      playlists: [
        ApVideoPlaylist('AP Calculus AB', 'PLJ8OrXpbC-BObjoWYaU-OYRsrmdZV2nyF'),
      ],
    ),
  ],
  'ap_precalc': [
    ApVideoChannel(
      name: 'The Algebros',
      channelUrl: 'https://www.youtube.com/@TheAlgebros',
      playlists: [
        ApVideoPlaylist('Units 1–4 complete playlist', 'PLxRSX8UqzWcfASP6lj-kniRso40eLHtd-'),
        ApVideoPlaylist('Unit 1A', 'PLxRSX8UqzWcd3z7l8yBNgrOgUroFEjDkW'),
        ApVideoPlaylist('Unit 1B', 'PLxRSX8UqzWcc5Syr9c3G7MEXOyehvlQ47'),
        ApVideoPlaylist('Unit 2A · Exponential and Logarithmic Functions', 'PLxRSX8UqzWcdx6TJgvX0r6ON9r67Xa5mb'),
        ApVideoPlaylist('Unit 2B', 'PLxRSX8UqzWcfefgttH3srn3yIOjc0Nlj6'),
        ApVideoPlaylist('Unit 3A', 'PLxRSX8UqzWcdYHq6FB5HzPDaDWkzeRRA2'),
        ApVideoPlaylist('Unit 3B', 'PLxRSX8UqzWcdO4WS6xsl9s2UpNeIynSKz'),
        ApVideoPlaylist('Unit 4A', 'PLxRSX8UqzWcerBkmJbAGFRMXyG4HYPqUY'),
        ApVideoPlaylist('Unit 4B', 'PLxRSX8UqzWcdVcGetUHriMIKpb5vf_6TF'),
        ApVideoPlaylist('AP Precalc exam review', 'PLxRSX8UqzWcfAgKVU_7MtAMZqfLXabQW_'),
      ],
    ),
    ApVideoChannel(
      name: 'MrHelpfulNotHurtful',
      playlists: [
        ApVideoPlaylist('Unit 1 · Polynomial and Rational Functions', 'PLUq8yM4tK_aVVgW-t6Jm_2zh2noSQ6gVe'),
        ApVideoPlaylist('Unit 3 · Trigonometric and Polar Functions', 'PLUq8yM4tK_aXrBoaWPO-I1dRFfXl5p7_3'),
        ApVideoPlaylist('Unit 4 · Parameters, Vectors, and Matrices', 'PLUq8yM4tK_aWf3AiIMMP-mwf3n1I3MW_p'),
        ApVideoPlaylist('Exam review (multiple choice)', 'PLUq8yM4tK_aU7wkdj-iV-hbZVqlrslX-t'),
      ],
    ),
    ApVideoChannel(
      name: 'Maximum Insight',
      playlists: [
        ApVideoPlaylist('Full review playlist', 'PLwZ7hsYXWkb5JkVNBveNKYGlu-cckDkcX'),
        ApVideoPlaylist('Unit 1 review', 'PLwZ7hsYXWkb6fXZYycQuAsJScsyD3pNL0'),
        ApVideoPlaylist('Unit 2 review', 'PLwZ7hsYXWkb4b3HwfJTmlvI30ddF5NPgu'),
        ApVideoPlaylist('Unit 3 review', 'PLwZ7hsYXWkb6h56ttpzxr9168vRr0Qpj5'),
      ],
    ),
    ApVideoChannel(
      name: 'Michael Porinchak',
      playlists: [
        ApVideoPlaylist('AP Precalculus full course (all units)', 'PL6334s8hsQG0M_I5RhCoIJiZWy5IF_pC4'),
        ApVideoPlaylist('Unit 2 · Exponential and Logarithmic Functions', 'PL6334s8hsQG0nDIBCC37DAPwMkZq9VShr'),
        ApVideoPlaylist('AP Precalculus exam review', 'PL6334s8hsQG3eM5DYD_fJTyP87WYmU3ud'),
      ],
    ),
    ApVideoChannel(
      name: 'Mr. Sindel',
      playlists: [
        ApVideoPlaylist('AP Precalculus lessons (Bryan Passwater curriculum)', 'PLWUoaJ7dGCqUYMlxrSBqBJYgeugY_B4bP'),
        ApVideoPlaylist('AP Precalculus review for the AP test', 'PLWUoaJ7dGCqXwDm2dnK341TkEmByg1LKr'),
      ],
    ),
    ApVideoChannel(
      name: 'Bao Le Math',
      playlists: [
        ApVideoPlaylist('AP Precalculus tutorial videos', 'PL-18AcX_OfK0AGAYicqmdCjzTXJJSbbuD'),
      ],
    ),
  ],
  'ap_stats': [
    ApVideoChannel(
      name: 'Michael Porinchak',
      playlists: [
        ApVideoPlaylist('Complete course (2026 CED, all 5 units)', 'PL6334s8hsQG0xrOsjAXk8v8l7xTf8ZFUb'),
        ApVideoPlaylist('Unit 1 · Exploring One-Variable Data and Collecting Data', 'PL6334s8hsQG0nFMzTw6wSZS5XVnfOGFdT'),
        ApVideoPlaylist('Unit summary videos', 'PL6334s8hsQG1kfcpZefVrRb_twFlhOcWM'),
        ApVideoPlaylist('Final review: everything for the AP exam', 'PL6334s8hsQG1JGYHVoULyFM-URr0Bg-ng'),
        ApVideoPlaylist('Older CED · Unit 1 Exploring One-Variable Data', 'PL6334s8hsQG3aghzvu-1IOnDJKZxugjxi'),
        ApVideoPlaylist('Older CED · Unit 2 Exploring Two-Variable Data', 'PL6334s8hsQG2IUH6FSqoUw-bFgHpoxTzQ'),
        ApVideoPlaylist('Older CED · Unit 4 Probability and Random Variables', 'PL6334s8hsQG32Nkcmlnyam7pzyCWcEqeR'),
        ApVideoPlaylist('Older CED · Unit 5 Sampling Distributions', 'PL6334s8hsQG3uT6WvuSBqbMRGNMjbuB13'),
        ApVideoPlaylist('Older CED · Unit 6 Inference for Proportions', 'PL6334s8hsQG2D-UMz-XSkMusc_pANgAAL'),
      ],
    ),
    ApVideoChannel(
      name: 'Khan Academy',
      channelUrl: 'https://www.youtube.com/@khanacademy',
      playlists: [
        ApVideoPlaylist('Analyzing categorical data', 'PLSQl0a2vh4HBklDDmyvFqK7LlLIbLl8JQ'),
        ApVideoPlaylist('Summarizing quantitative data', 'PLSQl0a2vh4HAe6mF7lbA6GA-5R4-IPAmM'),
        ApVideoPlaylist('Sampling distributions', 'PLSQl0a2vh4HBrMFHsJOEQLOKpfEAyYOAJ'),
        ApVideoPlaylist('Confidence intervals', 'PLSQl0a2vh4HBNxqWanMyJobind_frsqzC'),
        ApVideoPlaylist('Significance tests (hypothesis testing)', 'PLSQl0a2vh4HDkZ6uqdJnOtFICy5_jX-0C'),
      ],
    ),
    ApVideoChannel(
      name: 'Skew The Script',
      playlists: [
        ApVideoPlaylist('AP Statistics lessons', 'PLsfM4B38vlQcl6t3mg70X-Ip4Df2Fy7N8'),
      ],
    ),
    ApVideoChannel(
      name: 'The Algebros',
      channelUrl: 'https://www.youtube.com/@TheAlgebros',
      playlists: [
        ApVideoPlaylist('AP Stats FRQ walkthroughs', 'PLxRSX8UqzWccUF0H5ssIi7HqIeS-1HQLB'),
        ApVideoPlaylist('Desmos review for AP Statistics', 'PLxRSX8UqzWcclEXyzazQk4eIkny8TWon3'),
      ],
    ),
    ApVideoChannel(
      name: 'Goldie\'s Math Emporium',
      playlists: [
        ApVideoPlaylist('Unit 1 · Exploring One Variable Data', 'PLvMBYjeokPj9nIyq7pX22YLfpePPc5Tkb'),
      ],
    ),
    ApVideoChannel(
      name: 'Prepworks Education',
      playlists: [
        ApVideoPlaylist('AP Statistics full exam review', 'PLfCCnEv2UFBHL7VO81jkm2GjGfc4WMa9G'),
      ],
    ),
    ApVideoChannel(
      name: 'CrashCourse',
      channelUrl: 'https://www.youtube.com/@crashcourse',
      playlists: [
        ApVideoPlaylist('Statistics', 'PL8dPuuaLjXtNM_Y-bUAhblSAdWRnmBUcr'),
      ],
    ),
  ],
  'ap_us_history': [
    ApVideoChannel(
      name: 'Heimler\'s History',
      channelUrl: 'https://www.youtube.com/@heimlershistory',
      playlists: [
        ApVideoPlaylist('Unit 1', 'PLEHRHjICEfDUkwlhx0SFi4-dgPI82_Wn3'),
        ApVideoPlaylist('Unit 2', 'PLEHRHjICEfDV5niFEbLmBnMkJ6r90Z9JS'),
        ApVideoPlaylist('Unit 3', 'PLEHRHjICEfDV2MWqLB3pCm1vly8V3QV8x'),
        ApVideoPlaylist('Unit 4', 'PLEHRHjICEfDXSqIKXbu6FJOfh3Wpqjf4S'),
        ApVideoPlaylist('Unit 5', 'PLEHRHjICEfDWmb7bduiSCHYnUmYx6r36N'),
        ApVideoPlaylist('Unit 6', 'PLEHRHjICEfDWvmaCOVrEIh30TbHTuuLMf'),
        ApVideoPlaylist('Unit 7', 'PLEHRHjICEfDUzWKsrESFVjdwKSi-DHG5A'),
        ApVideoPlaylist('Unit 8', 'PLEHRHjICEfDWhNFWxbvPY_FihVyhZEtR7'),
        ApVideoPlaylist('Unit 9', 'PLEHRHjICEfDWQesJdnjON-QxZWVCEKoiO'),
        ApVideoPlaylist('How to write DBQs and LEQs', 'PLEHRHjICEfDUil2GBYRfRk_vzsJyAI450'),
        ApVideoPlaylist('AP History exam prep 2025', 'PLEHRHjICEfDX4QumIqGj60QbN59nJ9Umc'),
      ],
    ),
    ApVideoChannel(
      name: 'Khan Academy',
      channelUrl: 'https://www.youtube.com/@khanacademy',
      playlists: [
        ApVideoPlaylist('Period 1 · 1491–1607', 'PLSQl0a2vh4HByymLVKvji8m8Kxa47GP4L'),
        ApVideoPlaylist('Period 2 · 1607–1754', 'PLSQl0a2vh4HCFC-9uz5fvDcuphzHLXFhe'),
        ApVideoPlaylist('Period 3 · 1754–1800', 'PLSQl0a2vh4HDwfYX6-oPL_XAFjYSogsYV'),
        ApVideoPlaylist('Period 5 · 1844–1877', 'PLSQl0a2vh4HDmaK_t6yKCXxp1cH2VTgKP'),
        ApVideoPlaylist('Period 6 · 1865–1898', 'PLSQl0a2vh4HAItTNisaPVGSYo7-BZ1Tqo'),
        ApVideoPlaylist('Period 8 · 1945–1980', 'PLSQl0a2vh4HCr65cK9k8vM_QgV9iEX50s'),
      ],
    ),
    ApVideoChannel(
      name: 'CrashCourse',
      channelUrl: 'https://www.youtube.com/@crashcourse',
      playlists: [
        ApVideoPlaylist('US History', 'PL8dPuuaLjXtMwmepBjTSG593eG7ObzO7s'),
      ],
    ),
  ],
  'ap_world': [
    ApVideoChannel(
      name: 'Heimler\'s History',
      channelUrl: 'https://www.youtube.com/@heimlershistory',
      playlists: [
        ApVideoPlaylist('Unit 0 · Intro', 'PLEHRHjICEfDVLBpD1Rkc04M8G5Pn4bSVH'),
        ApVideoPlaylist('Unit 1', 'PLEHRHjICEfDUKsY0KFUEvmFCs8aCj0RO5'),
        ApVideoPlaylist('Unit 2', 'PLEHRHjICEfDVlP4J7Zn1_LFTm_-8bkxpN'),
        ApVideoPlaylist('Unit 3', 'PLEHRHjICEfDXd8x9722rSfw5go8MX2R7z'),
        ApVideoPlaylist('Unit 4', 'PLEHRHjICEfDVG6osVMx-168RjRmHv7eby'),
        ApVideoPlaylist('Unit 5', 'PLEHRHjICEfDVqlm9W8s3LiDUJDF_M7eBv'),
        ApVideoPlaylist('Unit 6', 'PLEHRHjICEfDUcEYepeOH1x30epqrxfHoW'),
        ApVideoPlaylist('Unit 7', 'PLEHRHjICEfDXpIjArszCIqDxXGHApX6WY'),
        ApVideoPlaylist('Unit 8', 'PLEHRHjICEfDVHumyadDXNRYm_SDYmilbi'),
        ApVideoPlaylist('Unit 9', 'PLEHRHjICEfDXnx-yOpgjNqEHQISXjk4at'),
        ApVideoPlaylist('How to write DBQs and LEQs', 'PLEHRHjICEfDUil2GBYRfRk_vzsJyAI450'),
        ApVideoPlaylist('AP History exam prep 2025', 'PLEHRHjICEfDX4QumIqGj60QbN59nJ9Umc'),
      ],
    ),
    ApVideoChannel(
      name: 'CrashCourse',
      channelUrl: 'https://www.youtube.com/@crashcourse',
      playlists: [
        ApVideoPlaylist('World History', 'PLBDA2E52FB1EF80C9'),
        ApVideoPlaylist('World History 2', 'PL8dPuuaLjXtNjasccl-WajpONGX3zoY4M'),
      ],
    ),
  ],
  'ap_euro': [
    ApVideoChannel(
      name: 'Heimler\'s History',
      channelUrl: 'https://www.youtube.com/@heimlershistory',
      playlists: [
        ApVideoPlaylist('Unit 1', 'PLEHRHjICEfDWDNjJgvnNTHfUFv3Sgjgb6'),
        ApVideoPlaylist('Unit 2', 'PLEHRHjICEfDWqxqKS0uueDgZh-_SL_Bqa'),
        ApVideoPlaylist('Unit 3', 'PLEHRHjICEfDU_fHGEiqMN4jW3tJBxG6s8'),
        ApVideoPlaylist('Unit 4', 'PLEHRHjICEfDU4aswMllbZXOjHXD-4QZ0j'),
        ApVideoPlaylist('Unit 5', 'PLEHRHjICEfDXx_FPKCdJF0LObAaWkWaGQ'),
        ApVideoPlaylist('Unit 6', 'PLEHRHjICEfDUWYubKHxBqxmt_zRvaWfHY'),
        ApVideoPlaylist('Unit 7', 'PLEHRHjICEfDX6IlivvRvJFSvSI5Irq-Tu'),
        ApVideoPlaylist('Unit 8', 'PLEHRHjICEfDXs6TmlZthhHW5hMuVjrPSE'),
        ApVideoPlaylist('Unit 9', 'PLEHRHjICEfDVbWQquigPWRxske9xu359u'),
        ApVideoPlaylist('How to write DBQs and LEQs', 'PLEHRHjICEfDUil2GBYRfRk_vzsJyAI450'),
      ],
    ),
    ApVideoChannel(
      name: 'Tom Richey',
      channelUrl: 'https://www.youtube.com/@tomrichey',
      playlists: [
        ApVideoPlaylist('AP European History review videos', 'PLfzs_X6OQBOxudw-bxvxBuTWvh6bwaVhQ'),
        ApVideoPlaylist('Renaissance and Age of Exploration', 'PLfzs_X6OQBOy_5XpZoGhaN5UD8hkUZDhA'),
        ApVideoPlaylist('Absolutism and Constitutionalism', 'PLfzs_X6OQBOwo6oOqQbz2d55MPIES5ft1'),
        ApVideoPlaylist('Scientific Revolution and Enlightenment', 'PLfzs_X6OQBOxWktWof2wK3aC_dkbTKlZh'),
        ApVideoPlaylist('French Revolution and Napoleon', 'PLfzs_X6OQBOw3X9AteC7RjzsS1qUWdQCn'),
        ApVideoPlaylist('Industry and Isms (Unit 6)', 'PLfzs_X6OQBOx_JViqz7ECrehHKxU0auvj'),
      ],
    ),
    ApVideoChannel(
      name: 'CrashCourse',
      channelUrl: 'https://www.youtube.com/@crashcourse',
      playlists: [
        ApVideoPlaylist('European History', 'PL8dPuuaLjXtMsMTfmRomkVQG8AqrAmJFX'),
      ],
    ),
  ],
  'ap_us_gov': [
    ApVideoChannel(
      name: 'Heimler\'s History',
      channelUrl: 'https://www.youtube.com/@heimlershistory',
      playlists: [
        ApVideoPlaylist('Unit 1', 'PLEHRHjICEfDWfGrAY61tu5pdA7oZNQlkl'),
        ApVideoPlaylist('Unit 2', 'PLEHRHjICEfDV9C4DkO3ma8bjeGBlr8mMz'),
        ApVideoPlaylist('Unit 3', 'PLEHRHjICEfDUuUGjXakQSIC2kMzRQPvOJ'),
        ApVideoPlaylist('Unit 4', 'PLEHRHjICEfDVOKk-KBKtBYnXEQr5AWL2t'),
        ApVideoPlaylist('Unit 5', 'PLEHRHjICEfDWpUBYzpujtgqPlMYo0-SGw'),
        ApVideoPlaylist('Required Supreme Court cases', 'PLEHRHjICEfDXe-ATV2N0WoTmon1upLDBK'),
        ApVideoPlaylist('Foundational documents', 'PLEHRHjICEfDVfJn47DODrkcvdRGvAAeFq'),
        ApVideoPlaylist('FRQ tutorials', 'PLEHRHjICEfDUcvOdwCsPZ1N2cfjOVZ9i0'),
        ApVideoPlaylist('AP Gov exam prep 2025', 'PLEHRHjICEfDVlOpKJg8NbhPa40rKnRshk'),
      ],
    ),
    ApVideoChannel(
      name: 'Khan Academy',
      channelUrl: 'https://www.youtube.com/@khanacademy',
      playlists: [
        ApVideoPlaylist('Foundations of American democracy', 'PLSQl0a2vh4HCiaYVxvsl6CNtNu6NxF3qL'),
        ApVideoPlaylist('Interactions among branches of government', 'PLSQl0a2vh4HByQTEIdo8RTNyJ61NUnsL5'),
        ApVideoPlaylist('Civil liberties and civil rights', 'PLSQl0a2vh4HBV_Yg4scoWR6Oj2Yxcn-me'),
        ApVideoPlaylist('Political participation', 'PLSQl0a2vh4HD89VYGYdHoMpAvCI0sbUMc'),
      ],
    ),
    ApVideoChannel(
      name: 'CrashCourse',
      channelUrl: 'https://www.youtube.com/@crashcourse',
      playlists: [
        ApVideoPlaylist('U.S. Government and Politics', 'PL8dPuuaLjXtOfse2ncvffeelTrqvhrz8H'),
      ],
    ),
  ],
  'ap_human_geo': [
    ApVideoChannel(
      name: 'Heimler\'s History',
      channelUrl: 'https://www.youtube.com/@heimlershistory',
      playlists: [
        ApVideoPlaylist('Unit 1', 'PLEHRHjICEfDV4G64624gvG3Y2dTDaunFJ'),
        ApVideoPlaylist('Unit 2', 'PLEHRHjICEfDVo-MQWda81RnX4rWK7IrQK'),
        ApVideoPlaylist('Unit 3', 'PLEHRHjICEfDWbLWDrePmIPJGlqY213FmV'),
        ApVideoPlaylist('Unit 4', 'PLEHRHjICEfDWG2ANRVsKn8ue4yp8-lEux'),
        ApVideoPlaylist('Unit 5', 'PLEHRHjICEfDUhq8fm4U0JBjbJiubAmIU8'),
        ApVideoPlaylist('Unit 6', 'PLEHRHjICEfDUitxnVBAtmJXkkLgBTicCx'),
        ApVideoPlaylist('Unit 7', 'PLEHRHjICEfDXBmOAidgR4L5jiCyr34XZD'),
      ],
    ),
    ApVideoChannel(
      name: 'Mr. Sinn',
      channelUrl: 'https://www.youtube.com/@MrSinn',
      playlists: [
        ApVideoPlaylist('Entire course', 'PL-R0qM-A09uy3T23FMyLu6CjxMu-QtAsC'),
        ApVideoPlaylist('Unit 1 review', 'PL-R0qM-A09uy6reUsYIrhse27D0HkxjAA'),
        ApVideoPlaylist('Unit 2 review', 'PL-R0qM-A09uwKv7UuZ2RaYzx_FkrjAZJO'),
        ApVideoPlaylist('Unit 3 review', 'PL-R0qM-A09uyLUI1Cb1bXG8qIpTqoMfvK'),
        ApVideoPlaylist('Unit 4 review', 'PL-R0qM-A09uwe0tTBR20jq27Owj0NBQtM'),
        ApVideoPlaylist('Unit 5 review', 'PL-R0qM-A09uwM5ecDmzFLhr0JtVzRsg9o'),
        ApVideoPlaylist('Unit 6 review', 'PL-R0qM-A09uy0yxaXp_6xgyOaJPOCVs4Q'),
        ApVideoPlaylist('Unit 7 review', 'PL-R0qM-A09uyLIyF0EUGb42f3XY_QlivE'),
        ApVideoPlaylist('FRQs, MC tests, tips and tricks', 'PL-R0qM-A09uzV5iNwRPNmPpoO_NEIF1dU'),
        ApVideoPlaylist('APHG 2026 exam prep', 'PL-R0qM-A09uzTwRLJDx7x9NgiFhzS7tI2'),
      ],
    ),
  ],
  'ap_macro': [
    ApVideoChannel(
      name: 'Heimler\'s History',
      channelUrl: 'https://www.youtube.com/@heimlershistory',
      playlists: [
        ApVideoPlaylist('AP Macroeconomics', 'PLEHRHjICEfDXVqY7YLPfRvBjGZT7SaZks'),
      ],
    ),
    ApVideoChannel(
      name: 'Jacob Clifford (ACDC Econ)',
      channelUrl: 'https://www.youtube.com/@ACDCLeadership',
      playlists: [
        ApVideoPlaylist('Unit 1 · Basic Economic Concepts', 'PLD5BC727C84E254E5'),
        ApVideoPlaylist('Unit 2 · Economic Indicators and the Business Cycle', 'PL11ADD17785C9C9A4'),
        ApVideoPlaylist('Unit 3 · AD-AS, National Income, and Price Determination', 'PLBC35DEA1D1A98034'),
        ApVideoPlaylist('Unit 4 · The Financial Sector', 'PLD7C33AB80B405B9A'),
        ApVideoPlaylist('Unit 5 · Long-Run Consequences of Stabilization Policies', 'PL04578C46EDAB7734'),
        ApVideoPlaylist('Unit 6 · Open Economy: International Trade and Finance', 'PL1oDmcs0xTD-nSGgGIsmFDN-2O8PLHCs1'),
        ApVideoPlaylist('Crash Course Economics', 'PL1oDmcs0xTD-dJN1PL2N1urX0EKupBJCQ'),
      ],
    ),
    ApVideoChannel(
      name: 'Khan Academy',
      channelUrl: 'https://www.youtube.com/@khanacademy',
      playlists: [
        ApVideoPlaylist('Basic economics concepts', 'PLSQl0a2vh4HAc8iB3btIAOK3Km8GsUoI6'),
        ApVideoPlaylist('Economic indicators and the business cycle', 'PLSQl0a2vh4HA1meLNbPMeWeOBkFo9N51W'),
        ApVideoPlaylist('Financial sector', 'PLSQl0a2vh4HDx-n41Xnl0F16177-c7wBY'),
        ApVideoPlaylist('Long-run consequences of stabilization policies', 'PLSQl0a2vh4HBZ8DwJst0lP-9IrnBOezRR'),
        ApVideoPlaylist('Aggregate demand and aggregate supply', 'PLSQl0a2vh4HCceYG_5n82916321qqHs_v'),
        ApVideoPlaylist('GDP: measuring national income', 'PLSQl0a2vh4HB-eppLyKiTFRfPXBMQ76OZ'),
      ],
    ),
  ],
  'ap_micro': [
    ApVideoChannel(
      name: 'Jacob Clifford (ACDC Econ)',
      channelUrl: 'https://www.youtube.com/@ACDCLeadership',
      playlists: [
        ApVideoPlaylist('Unit 1 · Basic Economic Concepts', 'PLA46DB4506062B62B'),
        ApVideoPlaylist('Unit 2 · Supply and Demand', 'PL6B2DBE4C2FC8F845'),
        ApVideoPlaylist('Unit 3 · Production, Cost, and Perfect Competition', 'PLE70CA726102FB294'),
        ApVideoPlaylist('Unit 4 · Imperfect Competition', 'PL6EB232876EAB5521'),
        ApVideoPlaylist('Unit 5 · Factor (Resource) Markets', 'PL50F9C4FD0BE8FE28'),
        ApVideoPlaylist('Unit 6 · Market Failure and the Government', 'PL71234D006E682C13'),
        ApVideoPlaylist('Crash Course Economics', 'PL1oDmcs0xTD-dJN1PL2N1urX0EKupBJCQ'),
      ],
    ),
    ApVideoChannel(
      name: 'Khan Academy',
      channelUrl: 'https://www.youtube.com/@khanacademy',
      playlists: [
        ApVideoPlaylist('Basic economic concepts', 'PLSQl0a2vh4HBEuNYvU8OrPW5qN0A4D7p4'),
        ApVideoPlaylist('Supply, demand, and market equilibrium', 'PLSQl0a2vh4HAdWBHe3mblDiDRAUNEyC-F'),
        ApVideoPlaylist('Elasticity', 'PLSQl0a2vh4HB3fr3Xd205GnTAX9CQ334r'),
        ApVideoPlaylist('Theory of consumer choice', 'PLSQl0a2vh4HAEZB93ksEwQHLmujmPQ23s'),
        ApVideoPlaylist('Production and costs', 'PLSQl0a2vh4HAEe-RzmkglsTRhHww52Wyb'),
      ],
    ),
  ],
  'ap_business_finance': [
    ApVideoChannel(
      name: 'Jacob Clifford (ACDC Econ)',
      channelUrl: 'https://www.youtube.com/@ACDCLeadership',
      playlists: [
        ApVideoPlaylist('Unit 1 · Businesses, Competition, and New Ideas', 'PL1oDmcs0xTD-1ouNHzGg-psuGrkU3yiQs'),
      ],
    ),
    ApVideoChannel(
      name: 'Michael Consiglio',
      playlists: [
        ApVideoPlaylist('AP Business and Personal Finance', 'PLRzPDp-tn-NMaD6jivWdfBkobGg8oYJr6'),
      ],
    ),
  ],
  'ap_psych': [
    ApVideoChannel(
      name: 'Mr. Sinn',
      channelUrl: 'https://www.youtube.com/@MrSinn',
      playlists: [
        ApVideoPlaylist('Unit 1 review · Biological Bases of Behavior', 'PL-R0qM-A09uxUxT9bzheaKGvBpnGHWYxT'),
        ApVideoPlaylist('Unit 2 review · Cognition', 'PL-R0qM-A09uwQeKc_z31ELYRXPlXLTHy5'),
        ApVideoPlaylist('Unit 3 · Development and Learning', 'PL-R0qM-A09uzKhJttgWsvIrltAJoFTyWO'),
        ApVideoPlaylist('Unit 3 review', 'PL-R0qM-A09uycJ5oYn-8FN2w3tbGsVGj4'),
        ApVideoPlaylist('Unit 4 · Social Psychology and Personality', 'PL-R0qM-A09uzZVUlR0f510L9dAdFGPaX0'),
        ApVideoPlaylist('Unit 4 review', 'PL-R0qM-A09uyhEsf3RtZKZgRLSXh2zAVO'),
        ApVideoPlaylist('Unit 5 · Health Psychology', 'PL-R0qM-A09uyoQQwZSTAu84sRIkK_Wpti'),
        ApVideoPlaylist('Unit 5 review', 'PL-R0qM-A09uwcoQkhuI5v4sAeGsNFk5pj'),
        ApVideoPlaylist('Scientific inquiry and research methods', 'PL-R0qM-A09uyq0WZOpTlv-dIxMzYG58qp'),
        ApVideoPlaylist('AP Psychology 2026 exam prep', 'PL-R0qM-A09uxhu2X1bMbyohy23hAYCRrd'),
      ],
    ),
    ApVideoChannel(
      name: 'Get Psyched with Tim Steadman',
      playlists: [
        ApVideoPlaylist('Updated review videos (2024 CED)', 'PLkLK-qwBh2WNcEDyzQu0PA7wPJU2J7Jqm'),
      ],
    ),
    ApVideoChannel(
      name: 'CrashCourse',
      channelUrl: 'https://www.youtube.com/@crashcourse',
      playlists: [
        ApVideoPlaylist('Psychology', 'PL8dPuuaLjXtOPRKzVLY0jJY-uHOH9KVU6'),
      ],
    ),
  ],
  'ap_bio': [
    ApVideoChannel(
      name: 'Gabe Poser (PoseKnows Biology)',
      channelUrl: 'https://www.youtube.com/@poseknowsbio',
      playlists: [
        ApVideoPlaylist('Unit 1 · Chemistry of Life', 'PLrQji7zW6lY-7GYYz4OikSvTWWoXQM1ix'),
        ApVideoPlaylist('Unit 2 · Cell Structure and Function', 'PLrQji7zW6lY-ysl-JQwC-9T2GuAFi6xam'),
        ApVideoPlaylist('Unit 3 · Cellular Energetics', 'PLrQji7zW6lY-CmA0gFpHfLIt2iikhDpPt'),
        ApVideoPlaylist('Unit 4 · Cell Communication and Cell Cycle', 'PLrQji7zW6lY_jfkJi6e-9PeDqALgdY9Ra'),
        ApVideoPlaylist('Unit 5 · Heredity', 'PLrQji7zW6lY-UBmBuepoXy02gqq4Acec0'),
        ApVideoPlaylist('Unit 6 · Gene Expression and Regulation', 'PLrQji7zW6lY9QfOwVxfl9rrzYmTc6DULR'),
        ApVideoPlaylist('Unit 7 · Natural Selection', 'PLrQji7zW6lY8TumqP4zc3Br91CbXld-Ky'),
        ApVideoPlaylist('Unit 8 · Ecology', 'PLrQji7zW6lY8ZU8oAZc3zSvAYNDROmZXc'),
        ApVideoPlaylist('Science practices', 'PLrQji7zW6lY9qTHSnMh0Y4OZmHxmTAZH9'),
      ],
    ),
    ApVideoChannel(
      name: 'HeyNowScience',
      channelUrl: 'https://www.youtube.com/@HeyNow1003',
      playlists: [
        ApVideoPlaylist('Unit 1 · Chemistry of Life', 'PL5wFpCHszzmC48TncuxoKgD4j1i8WZeCs'),
        ApVideoPlaylist('Unit 2 · Cell Structure and Function', 'PL5wFpCHszzmAYJTuiz0GyIYH-NpIO6p53'),
        ApVideoPlaylist('Unit 3 · Cellular Energetics', 'PL5wFpCHszzmCxwU0rIW-kbSnaBpJjD9fb'),
        ApVideoPlaylist('Unit 4 · Cell Communication and Cell Cycle', 'PL5wFpCHszzmAC6Y-zDPDCVzHP7336gOZv'),
        ApVideoPlaylist('Unit 5 · Heredity', 'PL5wFpCHszzmDmBBt5TB0Jjzn7jhQvnsvJ'),
        ApVideoPlaylist('Unit 6 · Gene Expression and Regulation', 'PL5wFpCHszzmCKyItAiKMA4b3-MOQBxgiu'),
        ApVideoPlaylist('Unit 7 · Natural Selection', 'PL5wFpCHszzmD6uzCl75T-NVY_qiwisIrZ'),
        ApVideoPlaylist('Unit 8 · Ecology', 'PL5wFpCHszzmABJgt3miHBNrqbQTG33vaA'),
        ApVideoPlaylist('Unit reviews', 'PL5wFpCHszzmBaqUXlanVKJoM6wOaamKj0'),
      ],
    ),
    ApVideoChannel(
      name: 'AP Bio Penguins Insta-Review',
      playlists: [
        ApVideoPlaylist('Unit reviews (updated for 2026 CED)', 'PLAgP0hE_9sPgZwJYeD-VSfIaxLB0xmy0r'),
      ],
    ),
    ApVideoChannel(
      name: 'sciencemusicvideos',
      playlists: [
        ApVideoPlaylist('AP Bio unit reviews', 'PLn0DCiMMuRy-8WVdBsmoNisFBPfD3usuU'),
        ApVideoPlaylist('AP Biology exam review', 'PLn0DCiMMuRy_iCAdcwJcAFyGPfBbQszna'),
      ],
    ),
    ApVideoChannel(
      name: 'Amoeba Sisters',
      channelUrl: 'https://www.youtube.com/@AmoebaSisters',
      playlists: [
        ApVideoPlaylist('AP Biology topics', 'PLwL0Myd7Dk1HTts6LRSSGwt_YfSHVEP76'),
      ],
    ),
    ApVideoChannel(
      name: 'Bozeman Science',
      channelUrl: 'https://www.youtube.com/@bozemanscience',
      playlists: [
        ApVideoPlaylist('AP Biology video essentials', 'PLFCE4D99C4124A27A'),
      ],
    ),
    ApVideoChannel(
      name: 'CrashCourse',
      channelUrl: 'https://www.youtube.com/@crashcourse',
      playlists: [
        ApVideoPlaylist('Biology', 'PL8dPuuaLjXtPW_ofbxdHNciuLoTRLPMgB'),
      ],
    ),
    ApVideoChannel(
      name: 'Marco Learning',
      playlists: [
        ApVideoPlaylist('AP Biology unit reviews', 'PLCEja84uspXsN8Cxx-p-RK6pMpwghiJ4d'),
      ],
    ),
  ],
  'ap_chem': [
    ApVideoChannel(
      name: 'Jeremy Krug',
      channelUrl: 'https://www.youtube.com/@JeremyKrug',
      playlists: [
        ApVideoPlaylist('Unit 0 · Getting ready for AP Chemistry', 'PLp8P489qkBoboHxgD26iZeQhDBVb8tzYs'),
        ApVideoPlaylist('Full video course', 'PLp8P489qkBoZb_b4_FOgGGPWGxrVV6Al9'),
        ApVideoPlaylist('Unit review videos', 'PLp8P489qkBoY7MWFiZ5gIBjr2qpG7TavY'),
        ApVideoPlaylist('Top 10 things to know for each unit', 'PLp8P489qkBobF6OwLSIhtn08yfU8hc_gD'),
        ApVideoPlaylist('FRQ walkthroughs', 'PLp8P489qkBoY5uMjRtsvkwG8VhFmHZy_l'),
        ApVideoPlaylist('Review strategies', 'PLp8P489qkBoZM-cKRJmaNuodjJnwrjutD'),
      ],
    ),
    ApVideoChannel(
      name: 'Crowdedbeaker',
      channelUrl: 'https://www.youtube.com/@crowdedbeaker7980',
      playlists: [
        ApVideoPlaylist('Unit 1 · Atomic Structure and Properties', 'PLEUGGrpwVXaopOeiwNpyTIBLgTAE3kRjV'),
        ApVideoPlaylist('Unit 2 · Chemical Bonding and Properties', 'PLEUGGrpwVXapunlpHX-xQaqXpKR_CGRNW'),
        ApVideoPlaylist('Unit 3 · Intermolecular Forces and Properties', 'PLEUGGrpwVXaqWM6p3LcICVom5JTVDgy34'),
        ApVideoPlaylist('Unit 4 · Chemical Reactions', 'PLEUGGrpwVXaoaV9rBSepuz-ZQTaDnKuuI'),
        ApVideoPlaylist('Unit 5 · Chemical Kinetics', 'PLEUGGrpwVXaqU9p-arX6BbwfM-p4VzJmG'),
        ApVideoPlaylist('Unit 6 · Thermodynamics', 'PLEUGGrpwVXaq670XbgSfwlYK8Vzp0srN5'),
        ApVideoPlaylist('Unit 7 · Chemical Equilibrium', 'PLEUGGrpwVXaqVQQaGpgGrvWIzH7ql0_Pi'),
        ApVideoPlaylist('Unit 8 · Acids, Bases, and Buffers', 'PLEUGGrpwVXaoyEAjiZXPZdM1dhRJcshAz'),
        ApVideoPlaylist('Unit 9 · Applications of Thermodynamics', 'PLEUGGrpwVXaqFSFLM94InHlMrn_RA-amp'),
        ApVideoPlaylist('AP Chemistry exam FRQs', 'PLEUGGrpwVXaoobb1yrGPMcPsiGoI7IeXY'),
      ],
    ),
    ApVideoChannel(
      name: 'Chemistry with Christine',
      channelUrl: 'https://www.youtube.com/@ChemistryWithChristine',
      playlists: [
        ApVideoPlaylist('Unit 1', 'PLiKLV5c7dPsMMVx4HiEK9e3M1a09b4IVB'),
        ApVideoPlaylist('Unit 2', 'PLiKLV5c7dPsPZ-h0w1V6LNv0z0ipRGBlf'),
        ApVideoPlaylist('Unit 3', 'PLiKLV5c7dPsPva0Zvnvby3G70c5jzI4mc'),
        ApVideoPlaylist('Unit 4', 'PLiKLV5c7dPsM8hVUYyIP7_qAZnkLiBRNg'),
        ApVideoPlaylist('Unit 5', 'PLiKLV5c7dPsO0pqFHoH5yS12cvY8FAHkN'),
        ApVideoPlaylist('Unit 6', 'PLiKLV5c7dPsM76pJgDOb1EG1LlSxTIy1a'),
        ApVideoPlaylist('Unit 7', 'PLiKLV5c7dPsPyhA3rO1AlIcpcZFVrp9V0'),
        ApVideoPlaylist('Unit 8', 'PLiKLV5c7dPsMlSsLaKU_074uiPyeUE02u'),
        ApVideoPlaylist('Unit 9', 'PLiKLV5c7dPsOPUJVoZbZ85XDSpxGJFCFk'),
        ApVideoPlaylist('All practice problems', 'PLiKLV5c7dPsOQDzbR16SLb8mtSxG4RZIH'),
      ],
    ),
    ApVideoChannel(
      name: 'Michael Farabaugh',
      playlists: [
        ApVideoPlaylist('AP Chemistry CED units', 'PLmtMZsGcmFlsGaBrpjdEWW55Vc84XA1Jc'),
        ApVideoPlaylist('AP Chemistry review and practice', 'PLmtMZsGcmFls7de9_hWWO1uG_uvhpeR_n'),
      ],
    ),
    ApVideoChannel(
      name: 'Professor Dave Explains',
      channelUrl: 'https://www.youtube.com/@ProfessorDaveExplains',
      playlists: [
        ApVideoPlaylist('AP Chemistry review', 'PLybg94GvOJ9EWw6ZBXAQuLPDJeiFNmqkg'),
      ],
    ),
    ApVideoChannel(
      name: 'Bozeman Science',
      channelUrl: 'https://www.youtube.com/@bozemanscience',
      playlists: [
        ApVideoPlaylist('AP Chemistry video essentials', 'PLllVwaZQkS2op2kDuFifhStNsS49LAxkZ'),
      ],
    ),
    ApVideoChannel(
      name: 'Chemistry Student',
      playlists: [
        ApVideoPlaylist('AP Chemistry full course revision', 'PLpS2OkAipxixS4W8X_9KWAd6ZzDrYT_Da'),
      ],
    ),
    ApVideoChannel(
      name: 'CrashCourse',
      channelUrl: 'https://www.youtube.com/@crashcourse',
      playlists: [
        ApVideoPlaylist('Chemistry', 'PL8dPuuaLjXtPHzzYuWy6fYEaX9mQQ8oGr'),
      ],
    ),
  ],
  'ap_physics_1': [
    ApVideoChannel(
      name: 'Flipping Physics',
      channelUrl: 'https://www.youtube.com/@FlippingPhysics',
      playlists: [
        ApVideoPlaylist('Everything in AP Physics 1', 'PLPyapQSxH6mZ5THBh2XBo4TG-t_bCtY_p'),
        ApVideoPlaylist('Introductory concepts', 'PLPyapQSxH6maR-JEosZJ9rxW2cw3ACczG'),
        ApVideoPlaylist('Motion in one dimension', 'PLPyapQSxH6mbXWoeU5ZqSwQiJmn6NqRGN'),
        ApVideoPlaylist('Motion in two dimensions', 'PLPyapQSxH6mY_hbPFnqgb_Ru_gKos6mab'),
        ApVideoPlaylist('Forces and Newton’s laws of motion', 'PLPyapQSxH6mYHT7hajhUASgJ0gINiDLsk'),
        ApVideoPlaylist('Work, energy, power, and spring force', 'PLPyapQSxH6mbiFl7LXnJqmSuP_MrAXfny'),
        ApVideoPlaylist('Momentum and impulse', 'PLPyapQSxH6mazCDW3WkNPggRy47m0NERs'),
        ApVideoPlaylist('Center of mass', 'PLPyapQSxH6maQx2TRewrKk7iRq_BvSTHY'),
        ApVideoPlaylist('Rotational kinematics', 'PLPyapQSxH6mZdMBSO-_YWHYJ9DpWBxiFG'),
        ApVideoPlaylist('Rotational dynamics', 'PLPyapQSxH6mbFL-xjwjaSfwYBFhQoLddZ'),
        ApVideoPlaylist('Universal gravitation', 'PLPyapQSxH6mZlb_U88S7nLLSCNW87FTHo'),
        ApVideoPlaylist('Simple harmonic motion', 'PLPyapQSxH6mb97NRknjYihwQw7vK90uy4'),
        ApVideoPlaylist('Fluids', 'PLPyapQSxH6mYAQRC6fDkQr_u0cc5X74lp'),
        ApVideoPlaylist('AP Physics 1 review', 'PLPyapQSxH6mb62DDbqhnHrXlriWlUjLdY'),
        ApVideoPlaylist('AP Physics 1 FRQ solutions', 'PLPyapQSxH6mbzoDniL5dZ5MSSkvhrPuGt'),
      ],
    ),
    ApVideoChannel(
      name: 'Dan Fullerton (APlusPhysics)',
      channelUrl: 'https://www.youtube.com/@DanFullerton',
      playlists: [
        ApVideoPlaylist('All AP Physics 1 videos', 'PLd2HWlWc-MsysWuL9ksneEM8cl5bk3bHH'),
        ApVideoPlaylist('Kinematics', 'PLd2HWlWc-MsyF2HDiAFo9TrFqOC68u8eI'),
        ApVideoPlaylist('Dynamics', 'PLd2HWlWc-Msw8GfdaErSbm7G2mnrrmOoS'),
        ApVideoPlaylist('Work, energy, and power', 'PLd2HWlWc-MsyiCw5iwXyeAxAffP-R8VVE'),
        ApVideoPlaylist('Linear momentum', 'PLd2HWlWc-MsyHV4RXy2Pk5zNeJA12SUJG'),
        ApVideoPlaylist('Circular motion and rotation', 'PLd2HWlWc-MsxoCk89YOk9LkpxJv4gVCzg'),
        ApVideoPlaylist('Rotational motion', 'PLd2HWlWc-MszFKKacHbUgvBz9Gym231AE'),
        ApVideoPlaylist('Gravity', 'PLd2HWlWc-Msx0sf-vEIg6IFk5VXLmU3TB'),
        ApVideoPlaylist('Oscillations', 'PLd2HWlWc-MsyGi48o9FJT6NqT111d2Ebq'),
        ApVideoPlaylist('Math review', 'PLd2HWlWc-MszaGkW7BunOM5RarknI0JW3'),
      ],
    ),
  ],
  'ap_physics_2': [
    ApVideoChannel(
      name: 'Flipping Physics',
      channelUrl: 'https://www.youtube.com/@FlippingPhysics',
      playlists: [
        ApVideoPlaylist('Unit 10 · Electric Force, Field, and Potential', 'PLPyapQSxH6maJU11PA3VxRHWFCeALPtrb'),
        ApVideoPlaylist('Unit 11 · Electric Circuits', 'PLPyapQSxH6ma98zWiEW4htvGm4hscoCf1'),
        ApVideoPlaylist('Unit 14 · Waves, Sound, and Physical Optics', 'PLPyapQSxH6mbaJZSsh26bCQ4uX25UswyT'),
        ApVideoPlaylist('Electrostatics', 'PLPyapQSxH6mYKdGEFyHrhTXZ5u8GZFspG'),
        ApVideoPlaylist('Electricity', 'PLPyapQSxH6maFA-sNYuqPnMdqfmO5j4RJ'),
      ],
    ),
    ApVideoChannel(
      name: 'Dan Fullerton (APlusPhysics)',
      channelUrl: 'https://www.youtube.com/@DanFullerton',
      playlists: [
        ApVideoPlaylist('All AP Physics 2 videos', 'PLd2HWlWc-Msz2SZsCBcTJ0eoHcQHD9u9d'),
        ApVideoPlaylist('Thermodynamics', 'PLd2HWlWc-MszbDrNL_JeceXmPJbanZWrS'),
        ApVideoPlaylist('Fluids', 'PLd2HWlWc-MsxVVPzexgBlpEZz6oXoo1nl'),
        ApVideoPlaylist('Electrostatics', 'PLd2HWlWc-MszOmF4oICTvdnOiTAeyQwwE'),
        ApVideoPlaylist('Current electricity', 'PLd2HWlWc-MszmgWIKnYCtN_3Heo1qroBi'),
        ApVideoPlaylist('Optics', 'PLd2HWlWc-MswH3BrI9Msd_C8bgTON156D'),
      ],
    ),
  ],
  'ap_physics_c_mech': [
    ApVideoChannel(
      name: 'Flipping Physics',
      channelUrl: 'https://www.youtube.com/@FlippingPhysics',
      playlists: [
        ApVideoPlaylist('Everything in AP Physics C: Mechanics', 'PLPyapQSxH6maBEwkQ-s33aB3MBwJo24IL'),
        ApVideoPlaylist('Kinematics', 'PLPyapQSxH6mYgEsJsLZoMwNbppG5Y7j4v'),
        ApVideoPlaylist('Dynamics (Newton’s laws and forces)', 'PLPyapQSxH6macL2j9AtbqtE_5m50UBfxB'),
        ApVideoPlaylist('Work, energy, power, spring force', 'PLPyapQSxH6mZTsMQsn7Lx0b9-HPKLGhnx'),
        ApVideoPlaylist('Momentum and impulse', 'PLPyapQSxH6mZH9lVsfxN92jQEyobDH0Jn'),
        ApVideoPlaylist('Center of mass', 'PLPyapQSxH6mbsY2g78ZaMfZx-3EEAxLia'),
        ApVideoPlaylist('Rotational kinematics', 'PLPyapQSxH6mZSdL_ebdIgT36gCNS-iEFC'),
        ApVideoPlaylist('Rotational dynamics', 'PLPyapQSxH6mY2ciOI9f9F0XECd0vxU-W6'),
        ApVideoPlaylist('Universal gravitation', 'PLPyapQSxH6mYjCmJSl0w8_dAs6FTS3LgZ'),
        ApVideoPlaylist('Simple harmonic motion', 'PLPyapQSxH6makjnsDdd8_T76IMh17a7kO'),
        ApVideoPlaylist('AP Physics C: Mechanics review', 'PLPyapQSxH6mb0S-Mr97pCB_LF2rZbyZ8L'),
      ],
    ),
    ApVideoChannel(
      name: 'Dan Fullerton (APlusPhysics)',
      channelUrl: 'https://www.youtube.com/@DanFullerton',
      playlists: [
        ApVideoPlaylist('AP Physics C: Mechanics', 'PLd2HWlWc-Msxs4BV0vlEJUiv9NZnbHODf'),
      ],
    ),
  ],
  'ap_physics_c_em': [
    ApVideoChannel(
      name: 'Flipping Physics',
      channelUrl: 'https://www.youtube.com/@FlippingPhysics',
      playlists: [
        ApVideoPlaylist('All of AP Physics C: E&M', 'PLPyapQSxH6mbZsSbda5nrvEQpps6lyTr2'),
        ApVideoPlaylist('Unit 8 · Electric Charges, Fields, and Gauss’s Law', 'PLPyapQSxH6mZFiJKd56yv34CFdxzbCDUk'),
        ApVideoPlaylist('Unit 9 · Electric Potential', 'PLPyapQSxH6mYWteQc53iThbG6KX4HjbuK'),
        ApVideoPlaylist('Unit 10 · Conductors and Capacitors', 'PLPyapQSxH6maYXBXm-_hFOYfCvxbGgClw'),
        ApVideoPlaylist('Unit 11 · Electric Circuits', 'PLPyapQSxH6mZabWn6tCgB0Wy7UiC9A4T9'),
        ApVideoPlaylist('Unit 12 · Magnetic Fields and Electromagnetism', 'PLPyapQSxH6mbBlprnT1Dpn5fv6sjk9ukk'),
        ApVideoPlaylist('Unit 13 · Electromagnetic Induction', 'PLPyapQSxH6ma8k6pjs1PGVN-ZqY4hSyth'),
        ApVideoPlaylist('AP Physics C: E&M review', 'PLPyapQSxH6mbGfGEK7fq0t02Cg-wT16y_'),
      ],
    ),
    ApVideoChannel(
      name: 'Dan Fullerton (APlusPhysics)',
      channelUrl: 'https://www.youtube.com/@DanFullerton',
      playlists: [
        ApVideoPlaylist('AP Physics C: Electricity and Magnetism', 'PLd2HWlWc-MswIOwpFIAkoPgmWXQichduW'),
        ApVideoPlaylist('Electromagnetism', 'PLd2HWlWc-MszTNNJAkd82SjVAMN5DN62z'),
      ],
    ),
  ],
  'ap_env_sci': [
    ApVideoChannel(
      name: 'Jordan Dischinger-Smedes',
      channelUrl: 'https://www.youtube.com/@Mr.Smedes',
      playlists: [
        ApVideoPlaylist('Unit 1 · Ecosystems', 'PLlk-I8-VuM_tdOB1ttMZ2BnK4mp04ntAZ'),
        ApVideoPlaylist('Unit 2 · Biodiversity', 'PLlk-I8-VuM_uT-Ev9qXlojRQ04NSfoY-m'),
        ApVideoPlaylist('Unit 3 · Populations', 'PLlk-I8-VuM_ufxiwJJrsOxIHj826OgPbn'),
        ApVideoPlaylist('Unit 4 · Earth Systems', 'PLlk-I8-VuM_sri22va3OXgdzjTd755eMS'),
        ApVideoPlaylist('Unit 5 · Land Use', 'PLlk-I8-VuM_snxCKto2KpL_76zqDEJ8TW'),
        ApVideoPlaylist('Unit 6 · Energy', 'PLlk-I8-VuM_sBr-J1qm56W131KyaW5GVg'),
        ApVideoPlaylist('Unit 7 · Atmospheric Pollution', 'PLlk-I8-VuM_tgCQiA7W7f1nOYB5N-zjPi'),
        ApVideoPlaylist('Unit 8 · Aquatic and Terrestrial Pollution', 'PLlk-I8-VuM_tTqo1ewqo0AJD5hqtgJEYd'),
        ApVideoPlaylist('Unit 9 · Global Change', 'PLlk-I8-VuM_vdjYO5EamZCxsOxJA_b3Zo'),
        ApVideoPlaylist('AP Environmental Science exam review', 'PLlk-I8-VuM_sCjhVv7_eBmr5OtOka_6dW'),
        ApVideoPlaylist('How to write APES FRQs', 'PLlk-I8-VuM_u96_2ztFZBND2s1Agn3A5q'),
        ApVideoPlaylist('Practice FRQs', 'PLlk-I8-VuM_t2Wb9ZpcgElhLBdDQmgtFZ'),
      ],
    ),
    ApVideoChannel(
      name: 'Bozeman Science',
      channelUrl: 'https://www.youtube.com/@bozemanscience',
      playlists: [
        ApVideoPlaylist('AP Environmental Science', 'PLllVwaZQkS2qK4Z6xBVDRak8an1-kqsgm'),
      ],
    ),
    ApVideoChannel(
      name: 'Marco Learning',
      playlists: [
        ApVideoPlaylist('AP Environmental Science', 'PLCEja84uspXv6ru4hovCYvaAxSSxvvExv'),
      ],
    ),
  ],
  'ap_csa': [
    ApVideoChannel(
      name: 'Bill Barnum',
      channelUrl: 'https://www.youtube.com/@BillBarnum',
      playlists: [
        ApVideoPlaylist('AP Computer Science A units', 'PLmpmyPywZ440vPqpAPeUkE-TeKifbS45W'),
        ApVideoPlaylist('Java tutorial for beginners (AP CSA)', 'PLmpmyPywZ443PFI8YF3ZMmoEcRfxXckdH'),
      ],
    ),
    ApVideoChannel(
      name: 'Tim Gallagher Computer Science',
      channelUrl: 'https://www.youtube.com/@TimGallagherComputerScience',
      playlists: [
        ApVideoPlaylist('Unit 3 · Class Creation', 'PLBVLDmuxVxEEm9Yl6CwaY2BRKsmeqLTGK'),
        ApVideoPlaylist('Unit 4 · Data Collections', 'PLBVLDmuxVxEHKt4ygbFffginegAKI69Bd'),
        ApVideoPlaylist('2026 AP CSA exam review', 'PLBVLDmuxVxEGvx-Sir1Qkz84vmRUaNd5I'),
      ],
    ),
    ApVideoChannel(
      name: 'LearnJava',
      playlists: [
        ApVideoPlaylist('AP CSA updated 2025 version', 'PLSar45mVw7KcVJKHhHP91OIpvZFfgksdu'),
        ApVideoPlaylist('AP CSA exam review', 'PLSar45mVw7KeuhX4gIy9QwKKysQybOx7R'),
      ],
    ),
    ApVideoChannel(
      name: 'Goldie\'s Math Emporium',
      playlists: [
        ApVideoPlaylist('Unit 1 · Using Objects and Methods (new CED)', 'PLvMBYjeokPj9y6szHxaYUhH6_iRbyoVB6'),
      ],
    ),
    ApVideoChannel(
      name: 'Meek Extra Help',
      playlists: [
        ApVideoPlaylist('AP CSA full course walkthrough', 'PLI3_KPCoxoPhLFejQJwDgNlijUt_JCmBP'),
      ],
    ),
  ],
  'ap_csp': [
    ApVideoChannel(
      name: 'Dr. Wu',
      playlists: [
        ApVideoPlaylist('AP CSP lessons, 1,100+ MCQs, and Create task help', 'PL9YOvPKwvPUIe9aNqwU1kLi0Oek-ysA4A'),
      ],
    ),
    ApVideoChannel(
      name: 'Professor Cunningham',
      playlists: [
        ApVideoPlaylist('AP Computer Science Principles', 'PLmtG5GOIMlY9BhDS4XdCe-GmtNLha7DOK'),
      ],
    ),
    ApVideoChannel(
      name: 'Computer Science Coach',
      playlists: [
        ApVideoPlaylist('AP CSP exam review', 'PLIIF7YxVmfHf3w_m-_c6WeIEXL3sF8Na4'),
      ],
    ),
    ApVideoChannel(
      name: 'Calm Energy Bytes',
      playlists: [
        ApVideoPlaylist('Unit 2', 'PL5QYOqmT-UCiCpwqYJZfglZxzuWAtWm2k'),
        ApVideoPlaylist('Unit 3', 'PL5QYOqmT-UCgUIvnwoRCVX5AJsIHAEQ27'),
      ],
    ),
  ],
  'ap_comp_gov': [
    ApVideoChannel(
      name: 'The Eason',
      playlists: [
        ApVideoPlaylist('Unit 1', 'PLGI6vR1g5YTYW7n39_TCZj4ytFYpQcp8L'),
        ApVideoPlaylist('Unit 2', 'PLGI6vR1g5YTa-fstmEq1ZjgOoTnHfFnjf'),
        ApVideoPlaylist('Unit 3', 'PLGI6vR1g5YTa3jVqYvL2LpNtee5Cp1sU-'),
        ApVideoPlaylist('Unit 4', 'PLGI6vR1g5YTZ9_7VFL9aXwZ2g15Xl29M6'),
        ApVideoPlaylist('Unit 5', 'PLGI6vR1g5YTbOV8VBZLgG8bUsDuMm802U'),
      ],
    ),
    ApVideoChannel(
      name: 'Mrs. DeLong-Moorefield',
      playlists: [
        ApVideoPlaylist('AP Comparative GOPO review', 'PL0TCFkN2cK4fcWo525oG4z2Rb7o7JnxEw'),
        ApVideoPlaylist('Complete AP Comp Gov review (COGO)', 'PL0TCFkN2cK4eLzdttDpcCcjealYzf8LuG'),
      ],
    ),
    ApVideoChannel(
      name: 'Mr. Hutchings History',
      playlists: [
        ApVideoPlaylist('AP Comparative Government and Politics', 'PLEqKyPQH7BQ_uNVcNN1d2zgrhYIZmQjvt'),
      ],
    ),
  ],
  'ap_english_lang': [
    ApVideoChannel(
      name: 'Coach Hall Writes',
      channelUrl: 'https://www.youtube.com/@CoachHallWrites',
      playlists: [
        ApVideoPlaylist('Intro to AP Lang', 'PLRC2dgq_mKP99C5BBzMGTwcMPlJHiUQJp'),
        ApVideoPlaylist('Synthesis essay (Q1)', 'PLRC2dgq_mKP_w8BOD36490jsfbzYat4EW'),
        ApVideoPlaylist('Rhetorical analysis (Q2)', 'PLRC2dgq_mKP81-YSwCYYypDlslGZ5U_8O'),
        ApVideoPlaylist('Argument essay (Q3)', 'PLRC2dgq_mKP9R-vHpdEi2-23BwGZJODPY'),
        ApVideoPlaylist('Cram for the AP Lang exam', 'PLRC2dgq_mKP_qnXq0KC_XORwTzvzYO27N'),
        ApVideoPlaylist('AP Lang quick tips', 'PLRC2dgq_mKP8hidzJxJtVrwPbwr2fdCbx'),
      ],
    ),
    ApVideoChannel(
      name: 'Garden of English',
      playlists: [
        ApVideoPlaylist('Rhetorical analysis essays (Q2)', 'PLTvXxamMBjxULaaZFThLqxVRasvuxxq4p'),
        ApVideoPlaylist('AP English exam review', 'PLTvXxamMBjxX5rokVi2rX4nWPftXurIjd'),
      ],
    ),
    ApVideoChannel(
      name: 'Marco Learning',
      playlists: [
        ApVideoPlaylist('AP English Language and Composition', 'PLCEja84uspXuBecyr-ijQ8pl6UHkih-17'),
      ],
    ),
  ],
  'ap_english_lit': [
    ApVideoChannel(
      name: 'Marco Learning',
      playlists: [
        ApVideoPlaylist('AP English Literature and Composition', 'PLCEja84uspXt_pvx_RHMAsrSATBeCy-h5'),
        ApVideoPlaylist('Poetry analysis essay', 'PLCEja84uspXsXoO7mmaLA3ZmVFsuuE0sX'),
      ],
    ),
    ApVideoChannel(
      name: 'Garden of English',
      playlists: [
        ApVideoPlaylist('Poetry essay (Q1)', 'PLTvXxamMBjxVAgWekLsw4PtezC2EGTn3k'),
        ApVideoPlaylist('AP English exam review', 'PLTvXxamMBjxX5rokVi2rX4nWPftXurIjd'),
      ],
    ),
    ApVideoChannel(
      name: 'Coach Hall Writes',
      channelUrl: 'https://www.youtube.com/@CoachHallWrites',
      playlists: [
        ApVideoPlaylist('AP Lit tips', 'PLRC2dgq_mKP-Wh2jbeWU7i2D0ssxEt2hl'),
      ],
    ),
    ApVideoChannel(
      name: 'English Nerd',
      playlists: [
        ApVideoPlaylist('Ace the AP English Literature exam', 'PLxX6GTn5kcIOl96jly9WDU9CYxF4HrprC'),
      ],
    ),
  ],
  'ap_art_history': [
    ApVideoChannel(
      name: 'Fleet\'s AP Art History',
      channelUrl: 'https://www.youtube.com/@FleetsAPArtHistory',
      playlists: [
        ApVideoPlaylist('Unit 1 · Global Prehistory', 'PLPT9W2EGQYZmeg1bciH3QF2Fkwc7eYr74'),
        ApVideoPlaylist('Unit 2 · Ancient Mediterranean', 'PLPT9W2EGQYZmd6w2YjLRnjxjyFL0xbzaI'),
        ApVideoPlaylist('Unit 3 · Early Europe and the Colonial Americas', 'PLPT9W2EGQYZnjeM1Xw-x9Su4NDNyz5Lf8'),
        ApVideoPlaylist('Unit 4 · Later Europe and the Americas', 'PLPT9W2EGQYZni3K1Es1fgglo0QkHmKjlA'),
        ApVideoPlaylist('Units 5–6 · Indigenous Americas and Africa', 'PLPT9W2EGQYZmjSiewxop_OzDCsHnvTfX9'),
        ApVideoPlaylist('Units 7–8 · West, Central, South, East, and Southeast Asia', 'PLPT9W2EGQYZkeG29NTUppl-VJHaVmTjlZ'),
        ApVideoPlaylist('Units 9–10 · The Pacific and Global Contemporary', 'PLPT9W2EGQYZmhWUF5UnBc5503PUyg_hoS'),
        ApVideoPlaylist('Essay help', 'PLPT9W2EGQYZm3E1ZV-K6mMim9zupANVsz'),
      ],
    ),
    ApVideoChannel(
      name: 'Smarthistory',
      channelUrl: 'https://www.youtube.com/@smarthistory',
      playlists: [
        ApVideoPlaylist('AP Art History', 'PLugP0T-YRCWLI2A4mL6c9j6RmEju0anDe'),
      ],
    ),
    ApVideoChannel(
      name: 'Jason Dalton',
      playlists: [
        ApVideoPlaylist('Unit 1 · Prehistoric', 'PL6HfIB0mXZDyMjJMGh_8QpxHTWnNOYrhJ'),
        ApVideoPlaylist('Unit 2 · Ancient Mediterranean', 'PL6HfIB0mXZDwwyirrzLWDeQcqhE5gJa0I'),
      ],
    ),
  ],
  'ap_music_theory': [
    ApVideoChannel(
      name: 'Dr. Fromm\'s Music Lab',
      playlists: [
        ApVideoPlaylist('AP Music Theory prep', 'PLF5qs3aOpXD_eXQBNC3e5QJpeMRPeWC73'),
      ],
    ),
    ApVideoChannel(
      name: 'Jesse Strickland',
      playlists: [
        ApVideoPlaylist('AP Music Theory', 'PLdW0onEGGcNkOWd_lpiSH2gTHcXJuiNw4'),
      ],
    ),
    ApVideoChannel(
      name: 'Churchill Musicians Club',
      playlists: [
        ApVideoPlaylist('AP Music Theory curriculum', 'PLPGU2PuDYF8GtODK1x5rj9yckvqcv4teX'),
      ],
    ),
    ApVideoChannel(
      name: 'Mr. DelBello\'s Music Theory',
      playlists: [
        ApVideoPlaylist('Unit 1 · Fundamentals', 'PLmcioFBMhstJOFE4BYg-4w_UCtE_FOnTP'),
      ],
    ),
  ],
  'ap_african_american': [
    ApVideoChannel(
      name: 'Mr. G-History',
      channelUrl: 'https://www.youtube.com/@mr.g-history',
      playlists: [
        ApVideoPlaylist('Unit 1 · Origins of the African Diaspora', 'PL_-cBDnVQca888ePmw9Fif_DJ9z_HkX-K'),
        ApVideoPlaylist('Unit 2 · Freedom, Enslavement, and Resistance', 'PL_-cBDnVQca_goIm63H7YtUd8NFF2K_rZ'),
        ApVideoPlaylist('Case studies', 'PL_-cBDnVQca9l9R5BLRPRepxpVudRhvdd'),
      ],
    ),
    ApVideoChannel(
      name: 'APUSH Slides',
      playlists: [
        ApVideoPlaylist('Unit 1', 'PLd28_-fZzSnCqYe1nYmUU35cjh2MUAffl'),
        ApVideoPlaylist('Unit 2', 'PLd28_-fZzSnDNsGp8MRYCj_W7oqt60DwA'),
        ApVideoPlaylist('Unit 3', 'PLd28_-fZzSnDAmNPlCNZa0MZX0wpTziLG'),
      ],
    ),
    ApVideoChannel(
      name: 'Gilder Lehrman Institute',
      playlists: [
        ApVideoPlaylist('AP African American Studies guide', 'PLVggCKD8Pzez1yDuVD4mlhQ1K3s2yJtw0'),
      ],
    ),
    ApVideoChannel(
      name: 'A Griot\'s History Channel',
      playlists: [
        ApVideoPlaylist('Unit 1', 'PLmN9v3bWZJ9xhMbUqNA95z81PMf2AHP1I'),
        ApVideoPlaylist('Unit 3', 'PLmN9v3bWZJ9xD2Icps3krTs1Ywxf_rbDN'),
        ApVideoPlaylist('Unit 4', 'PLmN9v3bWZJ9wQ-mMbwbCF9k8bz6_Tp9Oi'),
        ApVideoPlaylist('AP test prep and skills', 'PLmN9v3bWZJ9xjzERZ65hp0crgK3MpVYI9'),
      ],
    ),
    ApVideoChannel(
      name: 'CrashCourse',
      channelUrl: 'https://www.youtube.com/@crashcourse',
      playlists: [
        ApVideoPlaylist('Black American History', 'PL8dPuuaLjXtNYJO8JWpXO2JP0ezgxsrJJ'),
      ],
    ),
  ],
  'ap_spanish_lang': [
    ApVideoChannel(
      name: 'Marco Learning',
      playlists: [
        ApVideoPlaylist('AP Spanish Language', 'PLCEja84uspXslPFUjfY5fp7Hw62HmUbay'),
      ],
    ),
    ApVideoChannel(
      name: 'Learning Spanish with Dr. L.',
      playlists: [
        ApVideoPlaylist('AP Spanish Language', 'PLjD2u-Hna-A8D6Bko3wP4Td_JihUzA4mP'),
      ],
    ),
    ApVideoChannel(
      name: 'Jorge Llopiz',
      playlists: [
        ApVideoPlaylist('AP Spanish Language and Culture', 'PLsAyOk6jFEhqf5BedvIg1yYdzoJFWVQmb'),
      ],
    ),
  ],
  'ap_spanish_lit': [
    ApVideoChannel(
      name: 'Cultura Literaria con Alberto Sánchez Argüello',
      playlists: [
        ApVideoPlaylist('AP Spanish Literature master class series', 'PL2t9RVYwLMmSA50JXefFYKBFXpNZpn4Pq'),
      ],
    ),
  ],
  'ap_french': [
    ApVideoChannel(
      name: 'AP French with Anissa',
      playlists: [
        ApVideoPlaylist('AP French Language and Culture prep', 'PLnQciFRFt_ABA3dGLV1bw7CbKK1_QgeI_'),
      ],
    ),
    ApVideoChannel(
      name: 'madameaustin',
      playlists: [
        ApVideoPlaylist('AP French Language and Culture', 'PLtkJo8cAlC7Hgcx9VFQ1V5U9D_uC4MfNi'),
      ],
    ),
  ],
  'ap_chinese': [
    ApVideoChannel(
      name: '北美中学生学中文',
      playlists: [
        ApVideoPlaylist('AP Chinese 90-day complete prep course', 'PLcxUxIL5gTpW6OpA95fYu01nWNTUvXh8B'),
        ApVideoPlaylist('AP Chinese speaking practice (24 culture topics)', 'PLcxUxIL5gTpXY3MAL0jPneoS3sdg5MxEC'),
        ApVideoPlaylist('AP Chinese core vocabulary training', 'PLcxUxIL5gTpXfhjINbubfBFYQLLcypvJk'),
      ],
    ),
    ApVideoChannel(
      name: 'Mr. Qiu\'s Chinese Class',
      playlists: [
        ApVideoPlaylist('Tips and tricks for the AP Chinese exam', 'PL7rxmcRfqc1rRy1lS4v0KF51dXTxQ1TE4'),
      ],
    ),
  ],
  'ap_japanese': [
    ApVideoChannel(
      name: 'Keane Misawa',
      playlists: [
        ApVideoPlaylist('AP Japanese College Board study guide', 'PLVEa5_DTjAHdPua0gP9_Qiego0RRf8tU2'),
      ],
    ),
  ],
  'ap_german': [
    ApVideoChannel(
      name: 'Tanja Cutler',
      playlists: [
        ApVideoPlaylist('AP German', 'PL5v4Ks2M10W0J6LDKEZ79l97-GJQyD9Mp'),
      ],
    ),
  ],
  'ap_latin': [
    ApVideoChannel(
      name: 'Magister Jones',
      playlists: [
        ApVideoPlaylist('AP Latin screencasts', 'PLst-gIFyjI030ZKDwaOV3K90B13kmN6TZ'),
      ],
    ),
    ApVideoChannel(
      name: 'Magistra Solomon',
      playlists: [
        ApVideoPlaylist('AP Latin', 'PLtxlYY8xgygMKmKsboiZrsKTq1scSEU_A'),
      ],
    ),
  ],
  'ap_italian': [
    ApVideoChannel(
      name: 'Italy Made Easy',
      playlists: [
        ApVideoPlaylist('Italian course (grammar foundations)', 'PLUcDBadaP5IUJYW6qn2jTH0Ik2EMvAPze'),
      ],
    ),
  ],
  'ap_cybersecurity': [
    ApVideoChannel(
      name: 'The 0x Feed!',
      playlists: [
        ApVideoPlaylist('AP Cybersecurity for students', 'PLAT-0rr2wqig8cXLyLXJDdfw_fK6g7BrA'),
      ],
    ),
  ],
};

int apVideoPlaylistCount(String resourceId) =>
    (apVideoChannels[resourceId] ?? const <ApVideoChannel>[]).fold<int>(
      0,
      (sum, channel) => sum + channel.playlists.length,
    );
