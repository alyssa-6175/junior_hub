import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:junior_hub/data/resources_data.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../utils/url_helper.dart';
import '../models/personal_deadline.dart';

/// Call this to open the full-screen detail card for a competition,
/// research program, or internship.
void showResourceDetail(BuildContext context, Resource resource) {
  showDialog(
    context: context,
    builder: (_) => ResourceDetailModal(resource: resource),
  );
}

class ResourceDetailModal extends StatelessWidget {
  final Resource resource;
  const ResourceDetailModal({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final isSaved = provider.isSaved(resource.id);
    final isPinned = provider.isPinned(resource.id);
    final isSeen = provider.isSeen(resource.id);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 560, maxHeight: 640),
        decoration: BoxDecoration(
          color: kSurface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: kBorderLight),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 32,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Color-coded top strip
            Container(height: 3, color: resource.categoryBgColor),
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 16, 14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: resource.categoryBgColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      resource.icon,
                      color: resource.categoryTextColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          resource.title,
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: kTextPrimary,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Wrap(
                          spacing: 5,
                          runSpacing: 4,
                          children: [
                            _Badge(
                              text: resource.categoryLabel,
                              textColor: resource.categoryTextColor,
                              bg: resource.categoryBgColor,
                            ),
                            if (resource.scope != null)
                              _Badge(
                                text: resource.scopeLabel,
                                textColor: resource.scopeColor,
                                bg: resource.scopeBgColor,
                              ),
                            if (resource.format != null)
                              _Badge(
                                text: resource.formatLabel,
                                textColor: const Color(0xFF185FA5),
                                bg: const Color(0xFFE6F1FB),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Close button
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.close,
                      size: 18,
                      color: kTextTertiary,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: kBorderLight),
            // Scrollable body
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Quick-info row
                    Wrap(
                      spacing: 16,
                      runSpacing: 8,
                      children: [
                        if (resource.deadline != null)
                          _InfoChip(
                            icon: Icons.calendar_today_outlined,
                            label: resource.deadline!,
                          ),
                        if (resource.locationNote != null)
                          _InfoChip(
                            icon: Icons.location_on_outlined,
                            label: resource.locationNote!,
                          ),
                        if (resource.timeCommitment != null)
                          _InfoChip(
                            icon: Icons.schedule_outlined,
                            label: resource.timeCommitment!,
                          ),
                        if (resource.urgency.isNotEmpty)
                          _InfoChip(
                            icon: Icons.bookmark_outlined,
                            label: resource.urgencyLabel,
                            color: resource.urgencyTextColor,
                          ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Description
                    Text(
                      'About',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: kTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      resource.description,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: kTextSecondary,
                        height: 1.55,
                      ),
                    ),
                    // Detail note (tip box)
                    if (resource.detailNote != null) ...[
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: kGoldLight,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kGold.withOpacity(0.35)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.lightbulb_outline,
                              size: 14,
                              color: kGold,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                resource.detailNote!,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: kTextPrimary,
                                  height: 1.45,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                    // Application info
                    if (resource.applicationInfo != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        'How to apply',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: kTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        resource.applicationInfo!,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: kTextSecondary,
                          height: 1.5,
                        ),
                      ),
                    ],
                    // Links
                    if (resource.links.isNotEmpty) ...[
                      const SizedBox(height: 16),
                      Text(
                        'Links & resources',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: kTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ...resource.links.map(
                        (link) =>
                            _ModalLinkRow(label: link, resource: resource),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            // Footer: action buttons
            if (provider.isLoggedIn) ...[
              const Divider(height: 1, color: kBorderLight),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    // Save
                    // Find the footer action buttons section and replace:
                    _FooterAction(
                      icon: isSaved ? Icons.bookmark : Icons.bookmark_outlined,
                      label: isSaved ? 'Saved' : 'Save',
                      color: isSaved ? const Color(0xFFD4537E) : kTextSecondary,
                      onTap: () =>
                          context.read<AppProvider>().toggleSaved(resource.id),
                    ),
                    const SizedBox(width: 8),
                    _FooterAction(
                      icon: isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                      label: isPinned ? 'Pinned' : 'Pin to Board',
                      color: isPinned ? kGold : kTextSecondary,
                      onTap: () =>
                          context.read<AppProvider>().togglePinned(resource.id),
                    ),
                    const SizedBox(width: 8),
                    _FooterAction(
                      icon: isSeen
                          ? Icons.visibility
                          : Icons.visibility_outlined,
                      label: isSeen ? 'Seen' : 'Mark seen',
                      color: isSeen ? kNavy : kTextSecondary,
                      onTap: () =>
                          context.read<AppProvider>().toggleSeen(resource.id),
                    ),
                    if (resource.deadline != null) ...[
                      const SizedBox(width: 8),
                      _FooterAction(
                        icon: Icons.alarm_add_outlined,
                        label: 'Add deadline',
                        color: kTextSecondary,
                        onTap: () {
                          context.read<AppProvider>().addPersonalDeadline(
                            PersonalDeadline(
                              id: '${resource.id}_${DateTime.now().millisecondsSinceEpoch}',
                              title: resource.title,
                              date: resource.deadline!,
                              urgency: resource.urgency,
                              resourceId: resource.id,
                            ),
                          );
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added to personal deadlines'),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bg;
  const _Badge({required this.text, required this.textColor, required this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  const _InfoChip({required this.icon, required this.label, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? kTextSecondary;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: c),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 12, color: c)),
      ],
    );
  }
}

class _ModalLinkRow extends StatelessWidget {
  final String label;
  final Resource resource;
  const _ModalLinkRow({required this.label, required this.resource});

  @override
  Widget build(BuildContext context) {
    final url = resolveUrl(label, resource); // ← use the resolver
    return MouseRegion(
      cursor: url != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: url != null ? () => openUrl(context, url) : null,
        child: Container(
          margin: const EdgeInsets.only(bottom: 6),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kBorderLight),
          ),
          child: Row(
            children: [
              const Icon(Icons.link, size: 13, color: kTextTertiary),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: kTextPrimary,
                  ),
                ),
              ),
              Icon(
                Icons.open_in_new,
                size: 13,
                color: url != null ? const Color(0xFF1D9E75) : kTextTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  const _FooterAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: kBorderLight),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: color),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
