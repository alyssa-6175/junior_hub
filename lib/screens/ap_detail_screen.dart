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
    _tabs = TabController(
      length: 4,
      vsync: this,
    ); // Fixed length to 4 based on tabs below
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  List<String> _sortedLinks(List<String> links, AppProvider provider) {
    final id = widget.resource.id;
    final pinned = links.where((l) => provider.isLinkPinned(id, l)).toList();
    final normal = links
        .where(
          (l) => !provider.isLinkPinned(id, l) && !provider.isLinkSeen(id, l),
        )
        .toList();
    final seen = links.where((l) => provider.isLinkSeen(id, l)).toList();
    return [...pinned, ...normal, ...seen];
  }

  @override
  Widget build(BuildContext context) {
    // Read the provider at the top of build
    final provider = context.watch<AppProvider>();
    final isSaved = provider.isSaved(widget.resource.id);
    final res = widget.resource;

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
                  onTap: () => context.read<AppProvider>().navigateTo('ap'),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        size: 13,
                        color: kTextSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'AP Courses',
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
                          '${res.deadline ?? "No exam date set"} · ${res.apSubCategoryLabel}',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: kTextSecondary,
                          ),
                        ),
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
              // Tip box
              if (res.detailNote != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kGoldLight,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kGold.withOpacity(0.35)),
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
    return r.links
        .where(
          (l) =>
              l.toLowerCase().contains('book') ||
              l.toLowerCase().contains('barron') ||
              l.toLowerCase().contains('amsco') ||
              l.toLowerCase().contains('medic') ||
              l.toLowerCase().contains('review'),
        )
        .toList();
  }

  List<String> _videos(Resource r) {
    return r.links
        .where(
          (l) =>
              l.toLowerCase().contains('video') ||
              l.toLowerCase().contains('youtube') ||
              l.toLowerCase().contains('khan'),
        )
        .toList();
  }

  List<String> _practiceTests(Resource r) {
    return r.links
        .where(
          (l) =>
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
      ..._videos(r),
      ..._practiceTests(r),
    ];
    return r.links.where((l) => !matched.contains(l)).toList();
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
            color: isPinned ? kGold.withOpacity(0.45) : kBorderLight,
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
                          const Icon(Icons.push_pin, size: 11, color: kGold),
                          const SizedBox(width: 5),
                        ],
                        const Icon(Icons.link, size: 13, color: kTextTertiary),
                        const SizedBox(width: 9),
                        Expanded(
                          child: Text(
                            label,
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
            // Pin to top
            _MiniAction(
              icon: isPinned ? Icons.push_pin : Icons.push_pin_outlined,
              color: isPinned ? kGold : kTextTertiary,
              tooltip: isPinned ? 'Unpin' : 'Pin to top',
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
