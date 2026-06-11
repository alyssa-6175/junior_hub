import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/majors_data.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/resource_tile.dart';

class ResourceListScreen extends StatefulWidget {
  final String category;
  final String title;
  final IconData icon;

  const ResourceListScreen({
    super.key,
    required this.category,
    required this.title,
    required this.icon,
  });

  @override
  State<ResourceListScreen> createState() => _ResourceListScreenState();
}

class _ResourceListScreenState extends State<ResourceListScreen> {
  int _tab = 1; // Default to 'All'
  String? _majorFilter;

  List<Resource> _sorted(
    List<Resource> items,
    Set<String> pinned,
    Set<String> seen,
  ) {
    final pins = items
        .where((r) => pinned.contains(r.id) && !seen.contains(r.id))
        .toList();
    final normal = items
        .where((r) => !pinned.contains(r.id) && !seen.contains(r.id))
        .toList();
    final seenL = items.where((r) => seen.contains(r.id)).toList();
    return [...pins, ...normal, ...seenL];
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final pinned = provider.pinned;
    final seen = provider.seen;

    var items = resourcesByCategory(widget.category);
    if (_majorFilter != null) {
      items = items
          .where(
            (r) =>
                r.majorTags.contains(_majorFilter) ||
                r.majorTags.any((t) => groupForSubMajor(t)?.id == _majorFilter),
          )
          .toList();
    }
    final allSorted = _sorted(items, pinned, seen);
    final boardItems = allSorted.where((r) => pinned.contains(r.id)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title row + Board/All selector inline on the right
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 18,
                    color: CategoryColors.textFor(widget.category),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kTextPrimary,
                        ),
                      ),
                      Text(
                        '${allSorted.length} resources',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: kTextSecondary,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Inline tab selector (Board | All resources)
                  _InlineTab(
                    icon: Icons.push_pin_outlined,
                    label: 'Board',
                    count: boardItems.length,
                    active: _tab == 0,
                    onTap: () => setState(() => _tab = 0),
                  ),
                  const SizedBox(width: 2),
                  _InlineTab(
                    label: 'All',
                    active: _tab == 1,
                    onTap: () => setState(() => _tab = 1),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Major filter chips (unchanged)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _MajorChip(
                      label: 'All',
                      active: _majorFilter == null,
                      color: kNavy,
                      onTap: () => setState(() => _majorFilter = null),
                    ),
                    ...majorGroups.map(
                      (g) => _MajorChip(
                        label: g.label,
                        active: _majorFilter == g.id,
                        color: g.color,
                        onTap: () => setState(
                          () =>
                              _majorFilter = _majorFilter == g.id ? null : g.id,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: IndexedStack(
            index: _tab,
            children: [
              // Board
              boardItems.isEmpty
                  ? Center(
                      child: Text(
                        'Nothing pinned yet.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: kTextTertiary,
                        ),
                      ),
                    )
                  : _ListView(items: boardItems),
              // All
              _ListView(items: allSorted),
            ],
          ),
        ),
      ],
    );
  }
}

class _ListView extends StatelessWidget {
  final List<Resource> items;
  const _ListView({required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          'No resources match.',
          style: GoogleFonts.inter(fontSize: 13, color: kTextTertiary),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (_, i) => ResourceTile(resource: items[i]),
    );
  }
}

class _MajorChip extends StatelessWidget {
  final String label;
  final bool active;
  final Color color;
  final VoidCallback onTap;

  const _MajorChip({
    required this.label,
    required this.active,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 130),
          margin: const EdgeInsets.only(right: 6, bottom: 4),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: active ? color.withValues(alpha: 0.12) : kSurface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: active ? color : kBorderLight),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              color: active ? color : kTextSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _InlineTab extends StatelessWidget {
  final String label;
  final bool active;
  final IconData? icon;
  final int count;
  final VoidCallback onTap;

  const _InlineTab({
    required this.label,
    required this.active,
    this.icon,
    this.count = 0,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: active ? kNavy : kBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: active ? kNavy : kBorderLight),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 11,
                  color: active ? Colors.white : kTextSecondary,
                ),
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: active ? FontWeight.w500 : FontWeight.normal,
                  color: active ? Colors.white : kTextSecondary,
                ),
              ),
              if (count > 0) ...[
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: active
                        ? Colors.white.withValues(alpha: 0.25)
                        : kGold.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: active ? Colors.white : kGold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
