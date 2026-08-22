import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
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
    _tabs = TabController(length: 5, vsync: this);
    // Track this view (runs after the frame is built so context is valid)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<AppProvider>().trackResourceView(widget.resource.id);
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
    final starred = links.where((l) => provider.isLinkPinned(id, l)).toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    final remaining = links.where((l) => !provider.isLinkPinned(id, l)).toList()
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return [...starred, ...remaining];
  }

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
        lower.contains('official ap seminar course page') ||
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

  @override
  Widget build(BuildContext context) {
    // Read the provider at the top of build
    final provider = context.watch<AppProvider>();
    final isSaved = provider.isSaved(widget.resource.id);
    final res = widget.resource;
    final officialCourseLabel =
        _firstLabelContaining(res, 'official course page') ??
        _firstLabelContaining(res, 'official ap seminar course page');
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
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
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
              const SizedBox(height: 14),
              // Subject header row
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: res.categoryBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      res.icon,
                      color: res.categoryTextColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          res.title,
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: kTextPrimary,
                          ),
                        ),
                        Text(
                          res.hasDeadline
                              ? '${res.deadline} · ${res.apSubCategoryLabel}'
                              : res.apSubCategoryLabel,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: kTextSecondary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          res.displayDescription,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            height: 1.35,
                            color: kTextSecondary,
                          ),
                        ),
                        if (headerLinks.isNotEmpty) ...[
                          const SizedBox(height: 5),
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
                  // Bookmark button
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        mouseCursor: SystemMouseCursors.click,
                        onPressed: () =>
                            context.read<AppProvider>().toggleSaved(res.id),
                        tooltip: isSaved
                            ? 'Remove from home'
                            : 'Flag to home screen',
                        icon: Icon(
                          isSaved ? Icons.bookmark : Icons.bookmark_outlined,
                          color: isSaved
                              ? const Color(0xFFD4537E)
                              : kTextTertiary,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Course-specific note
              if (res.detailNote != null &&
                  !res.detailNote!.contains('not published when checked')) ...[
                const SizedBox(height: 12),
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
        const SizedBox(height: 12),
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
            tabs: const [
              Tab(text: 'Course Material'),
              Tab(text: 'Notes'),
              Tab(text: 'Videos'),
              Tab(text: 'Practice Tests'),
              Tab(text: 'Practice Questions'),
            ],
          ),
        ),
        // Tab content
        Expanded(
          child: TabBarView(
            controller: _tabs,
            children: [
              _ApTab(
                icon: Icons.menu_book_outlined,
                // Wrap the filtered items in the sorter
                items: _sortedLinks(_courseMaterial(res), provider),
                emptyText: 'No course material added yet.',
              ),
              _ApTab(
                icon: Icons.description_outlined,
                items: _sortedLinks(_notes(res), provider),
                emptyText: 'No notes added yet.',
              ),
              _ApTab(
                icon: Icons.smart_display_outlined,
                items: _sortedLinks(_videos(res), provider),
                emptyText: 'No videos added yet.',
              ),
              _ApTab(
                icon: Icons.assignment_outlined,
                items: _sortedLinks(_practiceTests(res), provider),
                emptyText: 'No practice tests added yet.',
              ),
              _ApTab(
                icon: Icons.quiz_outlined,
                items: _sortedLinks(_practiceQuestions(res), provider),
                emptyText: 'No practice questions added yet.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Smart string filtering to sort your links ─────

  List<String> _courseMaterial(Resource r) {
    return linksForResource(r)
        .where((l) => !_isHeaderLink(l))
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
        .where((l) => !_isCommunityNotes(l))
        .where(
          (l) =>
              l.toLowerCase().startsWith('video ·') ||
              l.toLowerCase().contains('video') ||
              l.toLowerCase().contains('youtube'),
        )
        .toList();
  }

  List<String> _notes(Resource r) {
    return linksForResource(r)
        .where(
          (l) => l.toLowerCase().startsWith('notes ·') || _isCommunityNotes(l),
        )
        .toList();
  }

  List<String> _practiceTests(Resource r) {
    return linksForResource(r)
        .where((l) => !_isHeaderLink(l))
        .where((l) => !_isCommunityNotes(l))
        .where(
          (l) =>
              l.toLowerCase().startsWith('practice test ·') ||
              l.toLowerCase().contains('test') ||
              l.toLowerCase().contains('frq') ||
              l.toLowerCase().contains('exam'),
        )
        .toList();
  }

  List<String> _practiceQuestions(Resource r) {
    // Anything that didn't get caught by the filters above goes here
    final matched = [
      ..._courseMaterial(r),
      ..._notes(r),
      ..._videos(r),
      ..._practiceTests(r),
    ];
    return linksForResource(r)
        .where((l) => !_isHeaderLink(l))
        .where((l) => !matched.contains(l))
        .toList();
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
