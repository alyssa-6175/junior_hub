import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import 'resource_detail_modal.dart';
import 'tappable.dart';
import '../models/personal_deadline.dart';

class ResourceTile extends StatelessWidget {
  final Resource resource;
  const ResourceTile({super.key, required this.resource});

  bool _shouldOpenModal(String category) => [
    'competition',
    'research',
    'internship',
    'sat',
    'act',
  ].contains(category);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final isSeen = provider.isSeen(resource.id);
    final isSaved = provider.isSaved(resource.id);
    final isPinned = provider.isPinned(resource.id);
    final isLoggedIn = provider.isLoggedIn;

    return Tappable(
      onTap: () {
        if (resource.category == 'ap') {
          context.read<AppProvider>().navigateTo(
            'ap_detail',
            detailId: resource.id,
          );
        } else if (_shouldOpenModal(resource.category)) {
          showResourceDetail(context, resource);
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: isSeen ? 0.45 : 1.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isPinned
                ? kGoldLight
                : isSeen
                ? kBackground
                : kSurface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isPinned ? kGold.withValues(alpha: 0.45) : kBorderLight,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isPinned) ...[
                Container(
                  width: 3,
                  height: 36,
                  decoration: BoxDecoration(
                    color: kGold,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 7),
              ],
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: resource.categoryBgColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  resource.icon,
                  size: 16,
                  color: resource.categoryTextColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      resource.title,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: kTextPrimary,
                        decoration: isSeen ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    const SizedBox(height: 1),
                    Text(
                      '${resource.categoryLabel} · ${resource.fieldLabel}',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: kTextSecondary,
                      ),
                    ),
                    if (resource.deadline != null) ...[
                      const SizedBox(height: 4),
                      _DeadlineBadge(resource: resource),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                decoration: BoxDecoration(
                  color: resource.categoryBgColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  resource.categoryLabel,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: resource.categoryTextColor,
                  ),
                ),
              ),
              if (isLoggedIn) ...[
                const SizedBox(width: 6),
                _ActionButton(
                  icon: isSeen ? Icons.visibility : Icons.visibility_outlined,
                  color: isSeen ? kNavy : kTextTertiary,
                  tooltip: isSeen ? 'Mark as unread' : 'Mark as seen',
                  onTap: () =>
                      context.read<AppProvider>().toggleSeen(resource.id),
                ),
                _ActionButton(
                  icon: isSaved ? Icons.bookmark : Icons.bookmark_outlined,
                  color: isSaved ? const Color(0xFFD4537E) : kTextTertiary,
                  tooltip: isSaved ? 'Remove from home' : 'Save to home screen',
                  onTap: () =>
                      context.read<AppProvider>().toggleSaved(resource.id),
                ),
                _ActionButton(
                  icon: isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                  color: isPinned ? kGold : kTextTertiary,
                  tooltip: isPinned ? 'Unpin from Board' : 'Pin to Board',
                  onTap: () =>
                      context.read<AppProvider>().togglePinned(resource.id),
                ),
                if (resource.deadline != null)
                  _ActionButton(
                    icon: Icons.alarm_add_outlined,
                    color: kTextTertiary,
                    tooltip: 'Add to my deadlines',
                    onTap: () => _addToPersonalDeadlines(context),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _addToPersonalDeadlines(BuildContext context) {
    context.read<AppProvider>().addPersonalDeadline(
      PersonalDeadline(
        id: '${resource.id}_${DateTime.now().millisecondsSinceEpoch}',
        title: resource.title,
        dateIso: resource.deadlineIso ?? '',
        resourceId: resource.id,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added "${resource.title}" to personal deadlines'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// ─── Deadline badge ───────────────────────────────────────────────────────────

class _DeadlineBadge extends StatelessWidget {
  final Resource resource;
  const _DeadlineBadge({required this.resource});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.calendar_today_outlined,
          size: 10,
          color: resource.urgencyTextColor,
        ),
        const SizedBox(width: 3),
        Text(
          resource.deadline!,
          style: TextStyle(fontSize: 10, color: resource.urgencyTextColor),
        ),
        const SizedBox(width: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
          decoration: BoxDecoration(
            color: resource.urgencyBgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            resource.urgencyLabel,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
              color: resource.urgencyTextColor,
            ),
          ),
        ),
      ],
    );
  }
}

// ─── Action icon button ───────────────────────────────────────────────────────

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String tooltip;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        mouseCursor: SystemMouseCursors.click,
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(icon, size: 17, color: color),
        ),
      ),
    );
  }
}

// ─── Public test tracker widget — used by resource_detail_modal.dart ──────────
//
// This is PUBLIC (no underscore) so it can be imported and called from
// resource_detail_modal.dart inside the modal's expanded content section.

class ResourceTestTracker extends StatelessWidget {
  final Resource resource;
  const ResourceTestTracker({super.key, required this.resource});

  /// Returns null if this resource has no tracker.
  static TrackerConfig? configFor(Resource resource) {
    switch (resource.id) {
      case 'bluebook_tests':
        return TrackerConfig(
          tests: List.generate(7, (n) => n + 4), // Tests 4–10
          label: 'Track your progress',
          testPrefix: 'Test',
        );
      case 'paper_practice_tests':
        return TrackerConfig(
          tests: List.generate(8, (n) => n + 4), // Tests 4–11
          label: 'Track your progress',
          testPrefix: 'Test',
        );
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final config = configFor(resource);
    if (config == null) return const SizedBox.shrink();

    final provider = context.watch<AppProvider>();
    final done = provider.completedTestsFor(resource.id);
    final completedCount = config.tests.where((t) => done.contains(t)).length;
    final allDone = completedCount == config.tests.length;
    final noneYet = completedCount == 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section divider ────────────────────────────────────────────
        Container(
          height: 1,
          color: kBorderLight,
          margin: const EdgeInsets.symmetric(vertical: 14),
        ),

        // ── Header row ─────────────────────────────────────────────────
        Row(
          children: [
            Icon(
              allDone ? Icons.check_circle : Icons.check_circle_outline,
              size: 13,
              color: allDone
                  ? const Color(0xFF0F6E56)
                  : kNavy.withValues(alpha: 0.45),
            ),
            const SizedBox(width: 5),
            Text(
              config.label,
              style: GoogleFonts.inter(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: kTextSecondary,
              ),
            ),
            const Spacer(),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                allDone
                    ? 'All done ✓'
                    : '$completedCount / ${config.tests.length} completed',
                key: ValueKey(completedCount),
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: allDone ? FontWeight.w600 : FontWeight.normal,
                  color: allDone ? const Color(0xFF0F6E56) : kTextTertiary,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // ── Progress bar ───────────────────────────────────────────────
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: completedCount / config.tests.length,
            minHeight: 3,
            backgroundColor: kBorderLight,
            valueColor: AlwaysStoppedAnimation<Color>(
              allDone ? const Color(0xFF0F6E56) : kNavy.withValues(alpha: 0.5),
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ── First-time hint ────────────────────────────────────────────
        if (noneYet)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                const Icon(
                  Icons.touch_app_outlined,
                  size: 11,
                  color: kTextTertiary,
                ),
                const SizedBox(width: 4),
                Text(
                  'Tap a test to mark it as completed',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: kTextTertiary,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),

        // ── Test chips ─────────────────────────────────────────────────
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: config.tests.map((n) {
            final isDone = done.contains(n);
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () =>
                    context.read<AppProvider>().toggleTest(resource.id, n),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isDone
                        ? kNavy.withValues(alpha: 0.09)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isDone
                          ? kNavy.withValues(alpha: 0.30)
                          : kBorderLight,
                      width: isDone ? 1.5 : 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: isDone
                            ? Icon(
                                Icons.check,
                                key: const ValueKey('check'),
                                size: 11,
                                color: kNavy.withValues(alpha: 0.75),
                              )
                            : const SizedBox.shrink(key: ValueKey('empty')),
                      ),
                      if (isDone) const SizedBox(width: 4),
                      Text(
                        '${config.testPrefix} $n',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: isDone
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isDone
                              ? kNavy.withValues(alpha: 0.80)
                              : kTextSecondary,
                          decoration: isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          decorationColor: kNavy.withValues(alpha: 0.4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class TrackerConfig {
  final List<int> tests;
  final String label;
  final String testPrefix;
  const TrackerConfig({
    required this.tests,
    required this.label,
    required this.testPrefix,
  });
}
