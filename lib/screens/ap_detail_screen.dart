import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../models/personal_deadline.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../utils/url_helper.dart';
import '../data/resources_data.dart';

class ApDetailScreen extends StatefulWidget {
  final Resource resource;
  const ApDetailScreen({super.key, required this.resource});

  @override
  State<ApDetailScreen> createState() => _ApDetailScreenState();
}

class _ApDetailScreenState extends State<ApDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(
      length: _isArtPortfolio(widget.resource)
          ? 3
          : _hasReferenceInformation(widget.resource)
          ? 5
          : 4,
      vsync: this,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<AppProvider>().trackResourceOpen(widget.resource.id);
      }
    });
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  List<String> _sortedLinks(List<String> links, AppProvider provider) {
    final id = widget.resource.id;
    const khanPhysicsCMechanics =
        'Course material · Khan Academy AP Physics C: Mechanics';
    final preferred = id == 'ap_physics_c_mech'
        ? links.where((label) => label == khanPhysicsCMechanics).toList()
        : <String>[];
    final remaining = links
        .where((label) => label != khanPhysicsCMechanics)
        .toList();
    List<String> group(bool isSeen, bool isPinned) => links
        .where(
          (label) =>
              provider.isLinkSeen(id, label) == isSeen &&
              provider.isLinkPinned(id, label) == isPinned,
        )
        .where((label) => remaining.contains(label))
        .toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));

    return [
      ...preferred,
      ...group(false, true),
      ...group(false, false),
      ...group(true, true),
      ...group(true, false),
    ];
  }

  List<String> _sortedPracticeTests(List<String> links, AppProvider provider) {
    int year(String label) {
      final matches = RegExp(r'\b(19|20)\d{2}\b').allMatches(label);
      if (matches.isEmpty) return -1;
      return matches
          .map((match) => int.parse(match.group(0)!))
          .reduce((a, b) => a > b ? a : b);
    }

    int compare(String a, String b) {
      final aSeen = provider.isLinkSeen(widget.resource.id, a);
      final bSeen = provider.isLinkSeen(widget.resource.id, b);
      if (aSeen != bSeen) return aSeen ? 1 : -1;
      final byYear = year(b).compareTo(year(a));
      if (byYear != 0) return byYear;
      final aOfficial = a.toLowerCase().contains('official college board');
      final bOfficial = b.toLowerCase().contains('official college board');
      if (aOfficial != bOfficial) return aOfficial ? -1 : 1;
      final aPinned = provider.isLinkPinned(widget.resource.id, a);
      final bPinned = provider.isLinkPinned(widget.resource.id, b);
      if (aPinned != bPinned) return aPinned ? -1 : 1;
      return a.toLowerCase().compareTo(b.toLowerCase());
    }

    return [...links]..sort(compare);
  }

  bool _hasReferenceInformation(Resource resource) => const {
    'ap_stats',
    'ap_chem',
    'ap_csa',
    'ap_csp',
    'ap_precalc',
    'ap_bio',
    'ap_env_sci',
    'ap_physics_1',
    'ap_physics_2',
    'ap_physics_c_em',
    'ap_physics_c_mech',
  }.contains(resource.id);

  bool _isArtPortfolio(Resource resource) =>
      artPortfolioResourceIds.contains(resource.id);

  String? _firstLabelContaining(Resource resource, String needle) {
    return resource.links.cast<String?>().firstWhere(
      (label) => label!.toLowerCase().contains(needle),
      orElse: () => null,
    );
  }

  String? _apCentralCourseUrl(Resource resource) {
    final uri = Uri.tryParse(resource.url ?? '');
    if (uri == null || uri.pathSegments.isEmpty) return null;
    final slug = uri.pathSegments.last;
    return 'https://apcentral.collegeboard.org/courses/$slug';
  }

  bool _isHeaderLink(String label) {
    final lower = label.toLowerCase();
    return lower.contains('official course page') ||
        lower.contains('ap classroom') ||
        lower.contains('official exam page');
  }

  bool _isCommunityNotes(String label) {
    final lower = label.toLowerCase();
    const markers = [
      'teacher',
      'mr.',
      'weebly',
      'lumisource',
      'wikinotes',
      'simple studies',
      'course-notes',
      'social studies help',
      'athens academy',
      'doves library',
      'iitian academy',
      'high school test prep',
      'ap worldipedia',
      'ap bio penguins',
      'sciencegeek',
      'barlow academy',
      'campbell ap',
      'bluhm ap',
      'laufer ap',
      'milligan ap',
      'dan shuster',
      'tom richey',
      'jason welker',
      'jeremy krug',
      'paul',
      'elaine cheong',
      'reviewecon',
      'gonzmosis',
      'worldwise tutoring',
      'ilearnacademy',
      'kwanga',
    ];
    return markers.any(lower.contains);
  }

  DeadlineItem? _examDeadlineFor(String resourceId) {
    for (final deadline in upcomingDeadlines) {
      if (deadline.resourceId == resourceId && !deadline.isTodo) {
        return deadline;
      }
    }
    return null;
  }

  Future<void> _saveExamDate(
    BuildContext context,
    AppProvider provider,
    Resource resource,
    DeadlineItem deadline,
  ) async {
    if (!provider.isLoggedIn) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign in to save exam dates')),
      );
      return;
    }

    await provider.addPersonalDeadline(
      PersonalDeadline(
        id: 'ap_exam_${resource.id}_${deadline.dateIso.substring(0, 10)}',
        title: deadline.title,
        dateIso: deadline.dateIso,
        resourceId: resource.id,
      ),
    );
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${deadline.date} added to your deadlines')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Read the provider at the top of build
    final provider = context.watch<AppProvider>();
    final isSaved = provider.isSaved(widget.resource.id);
    final res = widget.resource;
    final examDeadline = _examDeadlineFor(res.id);
    final isExamDateSaved =
        examDeadline != null &&
        provider.hasPersonalDeadline(res.id, examDeadline.dateIso);
    final officialCourseLabel =
        _firstLabelContaining(res, 'official course page');
    final officialCourseUrl = officialCourseLabel == null
        ? res.url
        : resolveUrl(officialCourseLabel, res);
    final classroomLabel = _firstLabelContaining(res, 'ap classroom');
    final examLabel = _firstLabelContaining(res, 'official exam page');
    final examUrl = examLabel == null ? null : resolveUrl(examLabel, res);
    final headerLinks = <(String, String?)>[
      ('Official course page', officialCourseUrl),
      (
        'AP Classroom',
        classroomLabel == null
            ? 'https://myap.collegeboard.org/'
            : resolveUrl(classroomLabel, res),
      ),
      ('Course & exam description', _apCentralCourseUrl(res)),
      ('Exam information', examUrl),
    ].where((item) => item.$2 != null).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header section
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumb
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () =>
                      context.read<AppProvider>().returnFromResourceDetail(),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        size: 13,
                        color: kTextSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        provider.detailReturnLabel,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: kTextSecondary,
                        ),
                      ),
                      const Icon(
                        Icons.chevron_right,
                        size: 13,
                        color: kTextTertiary,
                      ),
                      Text(
                        res.title,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: kTextPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 9),
              // Subject header row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: res.categoryBgColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      res.icon,
                      color: res.categoryTextColor,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          res.title,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kTextPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          res.displayDescription,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            height: 1.35,
                            color: kTextSecondary,
                          ),
                        ),
                        if (headerLinks.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Wrap(
                            spacing: 6,
                            runSpacing: 5,
                            children: [
                              ...headerLinks.map(
                                (item) => _HeaderLinkChip(
                                  label: item.$1,
                                  onTap: () => openUrl(context, item.$2!),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    alignment: WrapAlignment.end,
                    children: [
                      _HeaderActionButton(
                        label: isSaved ? 'Saved' : 'Save',
                        icon: isSaved
                            ? Icons.bookmark
                            : Icons.bookmark_outlined,
                        active: isSaved,
                        onTap: () =>
                            context.read<AppProvider>().toggleSaved(res.id),
                      ),
                      if (examDeadline != null)
                        _HeaderActionButton(
                          label: isExamDateSaved
                              ? 'Exam date saved'
                              : 'Add exam date',
                          icon: isExamDateSaved
                              ? Icons.event_available
                              : Icons.event_outlined,
                          active: isExamDateSaved,
                          tooltip: examDeadline.date,
                          onTap: isExamDateSaved
                              ? null
                              : () => _saveExamDate(
                                  context,
                                  provider,
                                  res,
                                  examDeadline,
                                ),
                        ),
                    ],
                  ),
                ],
              ),
              // Course-specific note
              if (res.detailNote != null &&
                  !res.detailNote!.contains('not published when checked')) ...[
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kGoldLight,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kGold.withValues(alpha: 0.35)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lightbulb_outline,
                        size: 13,
                        color: kGold,
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          res.detailNote!,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: kTextPrimary,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 8),
        // Tab bar
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: kBorderLight)),
          ),
          child: TabBar(
            controller: _tabs,
            labelStyle: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: GoogleFonts.inter(fontSize: 12),
            labelColor: kNavy,
            unselectedLabelColor: kTextSecondary,
            indicatorColor: kNavy,
            indicatorWeight: 2,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            isScrollable: true,
            tabs: _isArtPortfolio(res)
                ? const [
                    Tab(text: 'Instructions & FAQ'),
                    Tab(text: 'Sample Work'),
                    Tab(text: 'Idea Generator'),
                  ]
                : [
                    const Tab(text: 'Course Material'),
                    if (_hasReferenceInformation(res))
                      const Tab(text: 'Reference Information'),
                    const Tab(text: 'Videos'),
                    const Tab(text: 'Practice Tests'),
                    const Tab(text: 'Practice Questions & Banks'),
                  ],
          ),
        ),
        // Tab content
        Expanded(
          child: TabBarView(
            controller: _tabs,
            children: _isArtPortfolio(res)
                ? [
                    _ArtPortfolioInfoTab(
                      resource: res,
                      title: 'Build, document, and submit your portfolio',
                      intro:
                          'AP Art and Design has no sit-down test. Your score comes from the digital portfolio components you submit as final. Follow your teacher’s earlier deadline whenever they set one.',
                      links: _artPortfolioLinks(res, 'Instructions'),
                      showFaq: true,
                    ),
                    _ArtPortfolioInfoTab(
                      resource: res,
                      title: 'Learn from real, scored portfolios',
                      intro:
                          'Use the official College Board sample pages below to find released Score 5 selected works and read the scoring context. Look at the investigation, sequence, craft, and written evidence. Do not copy another student’s idea or images.',
                      links: _artPortfolioLinks(res, 'Sample work'),
                    ),
                    _ArtIdeaGeneratorTab(resource: res),
                  ]
                : [
                    _ApTab(
                      icon: Icons.menu_book_outlined,
                      items: _sortedLinks(_courseMaterial(res), provider),
                      emptyText: 'No course material added yet.',
                    ),
                    if (_hasReferenceInformation(res))
                      _ApTab(
                        icon: Icons.description_outlined,
                        items: _sortedLinks(_referenceInformation(res), provider),
                        emptyText:
                            'No official reference information added yet.',
                      ),
                    _ApTab(
                      icon: Icons.smart_display_outlined,
                      items: _sortedLinks(_videos(res), provider),
                      emptyText: 'No videos added yet.',
                    ),
                    _ApTab(
                      icon: Icons.assignment_outlined,
                      items: _sortedPracticeTests(_practiceTests(res), provider),
                      emptyText: 'No practice tests added yet.',
                    ),
                    _ApTab(
                      icon: Icons.quiz_outlined,
                      items: _sortedLinks(
                        _practiceQuestionsAndBanks(res),
                        provider,
                      ),
                      emptyText:
                          'No practice questions or question banks added yet.',
                    ),
                  ],
          ),
        ),
      ],
    );
  }

  // ── Smart string filtering to sort your links ─────

  bool _isQuestionBank(String label) => apQuestionBankHubs.containsKey(label);

  List<String> _artPortfolioLinks(Resource resource, String prefix) =>
      artPortfolioLinks[resource.id]?.keys
          .where((label) => label.startsWith(prefix))
          .toList() ??
      const [];

  List<String> _courseMaterial(Resource r) {
    return linksForResource(r)
        .where((l) => !_isHeaderLink(l))
        .where((l) => !_isQuestionBank(l))
        .where((l) => !_isCommunityNotes(l))
        .where(
          (l) =>
              !l.toLowerCase().startsWith('notes ·') &&
              (l.toLowerCase().startsWith('course material ·') ||
                  l.toLowerCase().contains('book') ||
                  l.toLowerCase().contains('barron') ||
                  l.toLowerCase().contains('amsco') ||
                  l.toLowerCase().contains('medic') ||
                  l.toLowerCase().contains('khan') ||
                  l.toLowerCase().contains('review') ||
                  l.toLowerCase().contains('course page') ||
                  l.toLowerCase().contains('classroom') ||
                  l.toLowerCase().contains('study guide')),
        )
        .toList();
  }

  List<String> _videos(Resource r) {
    return linksForResource(r)
        .where((l) => !_isHeaderLink(l))
        .where((l) => !_isQuestionBank(l))
        .where((l) => !_isCommunityNotes(l))
        .where(
          (l) =>
              l.toLowerCase().startsWith('video ·') ||
              l.toLowerCase().contains('video') ||
              l.toLowerCase().contains('youtube'),
        )
        .toList();
  }

  List<String> _referenceInformation(Resource r) {
    return linksForResource(r)
        .where(
          (l) =>
              l.toLowerCase().startsWith('reference information ·') ||
              l.toLowerCase().startsWith('reference sheet ·'),
        )
        .toList();
  }

  List<String> _practiceTests(Resource r) {
    return linksForResource(r)
        .where((l) => !_isHeaderLink(l))
        .where((l) => !_isQuestionBank(l))
        .where((l) => !_isCommunityNotes(l))
        .where((l) {
          final lower = l.toLowerCase();
          if (lower.startsWith('practice test ·')) return true;
          if (lower.startsWith('practice questions ·')) return false;
          return lower.contains('test') ||
              lower.contains('frq') ||
              lower.contains('exam');
        })
        .toList();
  }

  List<String> _practiceQuestions(Resource r) {
    // Anything that didn't get caught by the filters above goes here
    final matched = [
      ..._courseMaterial(r),
      ..._referenceInformation(r),
      ..._videos(r),
      ..._practiceTests(r),
    ];
    return linksForResource(r)
        .where((l) => !_isHeaderLink(l))
        .where((l) => !_isQuestionBank(l))
        .where((l) => !matched.contains(l))
        .toList();
  }

  List<String> _practiceQuestionsAndBanks(Resource r) => <String>{
    ..._practiceQuestions(r),
    ...linksForResource(r).where(_isQuestionBank),
  }.toList();

}

class _ArtPortfolioInfoTab extends StatelessWidget {
  final Resource resource;
  final String title;
  final String intro;
  final List<String> links;
  final bool showFaq;

  const _ArtPortfolioInfoTab({
    required this.resource,
    required this.title,
    required this.intro,
    required this.links,
    this.showFaq = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: kTextPrimary,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          intro,
          style: GoogleFonts.inter(
            fontSize: 12,
            height: 1.45,
            color: kTextSecondary,
          ),
        ),
        if (showFaq) ...[
          const SizedBox(height: 14),
          const _ArtFaqCard(
            question: 'How do I submit?',
            answer:
                'Take clear photos, upload every required image and written response to the AP Digital Portfolio, then click “Submit as Final.” The 2027 College Board deadline is 05/07/2027 at 11:59 PM ET. Your teacher may set an earlier deadline, so follow that one.',
          ),
          const _ArtFaqCard(
            question: 'What does a strong topic look like?',
            answer:
                'Pick something you want to keep looking at for weeks. A good idea is narrow enough to explore in different pieces, like how your family saves receipts or how a bus route changes through the day. “Identity” by itself is too broad.',
          ),
          const _ArtFaqCard(
            question: 'What should I document?',
            answer:
                'Save photos as you go. Keep rough drafts, material tests, and notes about what you changed. You will be glad you did when it is time to write about your process.',
          ),
          const _ArtFaqCard(
            question: 'Can I use AI tools?',
            answer:
                'Check College Board’s current policy before using AI. You need to be able to explain what you made and how you made it. Do not submit work that is not yours.',
          ),
        ],
        const SizedBox(height: 14),
        Text(
          showFaq ? 'Official instructions' : 'Official examples',
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: kTextPrimary,
          ),
        ),
        const SizedBox(height: 5),
        ...links.map((label) => _LinkItem(label: label, resource: resource)),
      ],
    );
  }
}

class _ArtFaqCard extends StatelessWidget {
  final String question;
  final String answer;

  const _ArtFaqCard({required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7FB),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kBorderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: GoogleFonts.inter(
              fontSize: 11.5,
              fontWeight: FontWeight.w600,
              color: kTextPrimary,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            answer,
            style: GoogleFonts.inter(
              fontSize: 11,
              height: 1.4,
              color: kTextSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ArtIdeaGeneratorTab extends StatelessWidget {
  final Resource resource;
  const _ArtIdeaGeneratorTab({required this.resource});

  String _mediumPrompt(String drawing, String twoD, String threeD) {
    if (resource.id == 'ap_drawing') return drawing;
    if (resource.id == 'ap_2d_art') return twoD;
    if (resource.id == 'ap_3d_art') return threeD;
    return 'Drawing: $drawing\n2-D: $twoD\n3-D: $threeD';
  }

  @override
  Widget build(BuildContext context) {
    final ideas = <(String, String)>[
      (
        'Memory and family archives',
        _mediumPrompt(
          'Layer portraits, handwriting, or inherited objects to ask how memory changes with retelling.',
          'Build a photo-and-collage series from receipts, letters, maps, or family snapshots.',
          'Create cast, stitched, or assembled objects that preserve and distort a family artifact.',
        ),
      ),
      (
        'Place, home, and belonging',
        _mediumPrompt(
          'Use shifting viewpoints, windows, thresholds, or repeated routes to explore where you feel seen.',
          'Make a zine, map series, poster system, or photo essay about a neighborhood and who shapes it.',
          'Model a room, shelter, or site-specific form that changes as viewers move around it.',
        ),
      ),
      (
        'Body, motion, and care',
        _mediumPrompt(
          'Study hands, posture, or athletic/repetitive movement through sequence and close observation.',
          'Combine diagrams, textiles, typography, and self-portraiture to visualize care or recovery.',
          'Use wearable sculpture, ceramics, or kinetic forms to make movement or limitation physical.',
        ),
      ),
      (
        'Environment and consumption',
        _mediumPrompt(
          'Observe a local watershed, discarded packaging, or seasonal change through repeated field sketches.',
          'Create an infographic, print series, or photo-collage tracking one material from use to waste.',
          'Transform collected materials into an object that reveals its environmental footprint.',
        ),
      ),
      (
        'Systems, rules, and routines',
        _mediumPrompt(
          'Turn calendars, school schedules, game rules, or data into a visual score and then disrupt it.',
          'Design a sequence of posters, interfaces, or book pages that exposes an invisible system.',
          'Build modular forms that viewers can reorganize to test who has control.',
        ),
      ),
      (
        'Identity, language, and code-switching',
        _mediumPrompt(
          'Explore gesture, costume, and facial expression across contexts without reducing identity to a symbol.',
          'Pair bilingual text, found imagery, and pattern to show how meaning shifts between audiences.',
          'Use materials, scale, and interaction to make a viewer negotiate public versus private selves.',
        ),
      ),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        Text(
          'Turn a broad theme into an investigation',
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: kTextPrimary,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Pick a prompt that matters to you, then write a question, try two materials, and make a small first study. Your strongest direction is the one that creates new questions after each piece.',
          style: GoogleFonts.inter(
            fontSize: 12,
            height: 1.45,
            color: kTextSecondary,
          ),
        ),
        const SizedBox(height: 14),
        ...ideas.map(
          (idea) => Container(
            margin: const EdgeInsets.only(bottom: 9),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kSurface,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: kBorderLight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  idea.$1,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kTextPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  idea.$2,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    height: 1.42,
                    color: kTextSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool active;
  final String? tooltip;
  final VoidCallback? onTap;

  const _HeaderActionButton({
    required this.label,
    required this.icon,
    required this.active,
    required this.onTap,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final button = OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 14),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(0, 30),
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
        visualDensity: VisualDensity.compact,
        foregroundColor: active ? kNavy : kTextSecondary,
        backgroundColor: active ? kGoldLight : kSurface,
        side: BorderSide(color: active ? kGold : kBorderLight),
        textStyle: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
    return tooltip == null ? button : Tooltip(message: tooltip!, child: button);
  }
}

class _HeaderLinkChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _HeaderLinkChip({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: const Icon(Icons.open_in_new, size: 12, color: Color(0xFF1D9E75)),
      label: Text(label),
      labelStyle: GoogleFonts.inter(
        fontSize: 10.5,
        fontWeight: FontWeight.w500,
        color: const Color(0xFF1D9E75),
      ),
      side: BorderSide(color: const Color(0xFF1D9E75).withValues(alpha: 0.25)),
      backgroundColor: const Color(0xFFEAF7F2),
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      onPressed: onTap,
    );
  }
}

class _ApTab extends StatelessWidget {
  final IconData icon;
  final List<String> items;
  final String emptyText;

  const _ApTab({
    required this.icon,
    required this.items,
    required this.emptyText,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 28, color: kTextTertiary),
            const SizedBox(height: 8),
            Text(
              emptyText,
              style: GoogleFonts.inter(fontSize: 13, color: kTextTertiary),
            ),
          ],
        ),
      );
    }

    // We grab the parent screen's resource to pass down to the LinkItem
    final res = context
        .findAncestorWidgetOfExactType<ApDetailScreen>()
        ?.resource;

    if (res == null) return const SizedBox.shrink();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: items
          .map((label) => _LinkItem(label: label, resource: res))
          .toList(),
    );
  }
}

class _LinkItem extends StatelessWidget {
  final String label;
  final Resource resource;
  const _LinkItem({required this.label, required this.resource});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final isPinned = provider.isLinkPinned(resource.id, label);
    final isSeen = provider.isLinkSeen(resource.id, label);
    final url = resolveUrl(label, resource);
    final rawDisplayLabel = label.contains(' · ')
        ? label.substring(label.indexOf(' · ') + 3)
        : label;
    final displayLabel = rawDisplayLabel.contains('2027 (Amazon)')
        ? rawDisplayLabel.replaceFirst(
            '2027 (Amazon)',
            '2027, with 2026 fallback (Amazon)',
          )
        : rawDisplayLabel;

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isSeen ? 0.42 : 1.0,
      child: AnimatedContainer(
        // 1. Change Container to AnimatedContainer
        duration: const Duration(milliseconds: 200), // 2. Add a duration here
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: isPinned
              ? kGoldLight
              : isSeen
              ? kBackground
              : kSurface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isPinned ? kGold.withValues(alpha: 0.45) : kBorderLight,
          ),
        ),
        child: Row(
          children: [
            // Tappable label area (opens URL)
            Expanded(
              child: MouseRegion(
                cursor: url != null
                    ? SystemMouseCursors.click
                    : MouseCursor.defer,
                child: GestureDetector(
                  onTap: url != null ? () => openUrl(context, url) : null,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 11, 6, 11),
                    child: Row(
                      children: [
                        if (isPinned) ...[
                          const Icon(Icons.star, size: 11, color: kGold),
                          const SizedBox(width: 5),
                        ],
                        const Icon(Icons.link, size: 13, color: kTextTertiary),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Text(
                            displayLabel,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kTextPrimary,
                              decoration: isSeen
                                  ? TextDecoration.lineThrough
                                  : null,
                              decorationColor: kTextTertiary,
                            ),
                          ),
                        ),
                        if (url != null) ...[
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.open_in_new,
                            size: 12,
                            color: Color(0xFF1D9E75),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Divider
            Container(width: 1, height: 36, color: kBorderLight),
            // Star and move to the top
            _MiniAction(
              icon: isPinned ? Icons.star : Icons.star_border,
              color: isPinned ? kGold : kTextTertiary,
              tooltip: isPinned ? 'Unstar' : 'Star and move to top',
              onTap: () => context.read<AppProvider>().toggleLinkPinned(
                resource.id,
                label,
              ),
            ),
            // Mark as seen
            _MiniAction(
              icon: isSeen ? Icons.visibility : Icons.visibility_outlined,
              color: isSeen ? kNavy : kTextTertiary,
              tooltip: isSeen ? 'Mark as unread' : 'Mark as seen',
              onTap: () => context.read<AppProvider>().toggleLinkSeen(
                resource.id,
                label,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniAction extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String tooltip;
  final VoidCallback onTap;

  const _MiniAction({
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: onTap,
          mouseCursor: SystemMouseCursors.click,
          borderRadius: BorderRadius.circular(4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
            child: Icon(icon, size: 15, color: color),
          ),
        ),
      ),
    );
  }
}
