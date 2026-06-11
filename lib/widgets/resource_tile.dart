import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import 'resource_detail_modal.dart';
import '../utils/url_helper.dart';
import 'tappable.dart';
import '../models/personal_deadline.dart';

// import '../widgets/resource_detail_modal.dart';

class ResourceTile extends StatelessWidget {
  final Resource resource;
  const ResourceTile({super.key, required this.resource});

  bool _shouldOpenModal(String category) =>
      ['competition', 'research', 'internship'].contains(category);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final isSeen = provider.isSeen(resource.id);
    final isSaved = provider.isSaved(resource.id);
    final isPinned = provider.isPinned(resource.id);
    final isLoggedIn = provider.isLoggedIn;

    // Wrap the existing Container with Tappable:
    return Tappable(
      onTap: () {
        if (resource.category == 'ap') {
          context.read<AppProvider>().navigateTo(
            'ap_detail',
            detailId: resource.id,
          );
        } else if ([
          'competition',
          'research',
          'internship',
        ].contains(resource.category)) {
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
              color: isPinned ? kGold.withOpacity(0.45) : kBorderLight,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Add before the category icon box:
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
              // Category-colored icon box
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
              // Title + subtitle
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
              // Category badge
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
              // Action buttons (only shown when logged in)
              // Find the section that has the old bookmark/star/seen buttons and replace:
              if (isLoggedIn) ...[
                const SizedBox(width: 6),
                // Mark as seen
                _ActionButton(
                  icon: isSeen ? Icons.visibility : Icons.visibility_outlined,
                  color: isSeen ? kNavy : kTextTertiary,
                  tooltip: isSeen ? 'Mark as unread' : 'Mark as seen',
                  onTap: () =>
                      context.read<AppProvider>().toggleSeen(resource.id),
                ),
                // Save = save to home screen
                _ActionButton(
                  icon: isSaved ? Icons.bookmark : Icons.bookmark_outlined,
                  color: isSaved ? const Color(0xFFD4537E) : kTextTertiary,
                  tooltip: isSaved ? 'Remove from home' : 'Save to home screen',
                  onTap: () =>
                      context.read<AppProvider>().toggleSaved(resource.id),
                ),
                // Pin = save to Board
                _ActionButton(
                  icon: isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                  color: isPinned ? kGold : kTextTertiary,
                  tooltip: isPinned ? 'Unpin from Board' : 'Pin to Board',
                  onTap: () =>
                      context.read<AppProvider>().togglePinned(resource.id),
                ),
                // Add to personal deadlines (only for resources with a deadline)
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
        date: resource.deadline ?? '',
        urgency: resource.urgency,
        resourceId: resource.id, // ← links back so tapping it opens the card
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
