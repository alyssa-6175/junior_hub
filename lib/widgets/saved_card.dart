import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../utils/url_helper.dart';
import '../data/resources_data.dart';

class SavedCard extends StatelessWidget {
  final Resource resource;
  const SavedCard({super.key, required this.resource});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final isPinned = provider.isPinned(resource.id);
    final isSeen = provider.isSeen(resource.id);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isSeen ? 0.5 : 1.0,
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
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // At the top of the Column, before the gold accent strip:
            if (isPinned)
              Container(
                height: 3,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [kGold, Color(0xFFF5D67A)]),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
              ),
            // Card header
            Container(
              padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: kBorderLight)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category icon
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: resource.categoryBgColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Icon(
                      resource.icon,
                      size: 14,
                      color: resource.categoryTextColor,
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Title + badges
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
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Wrap(
                          spacing: 4,
                          children: [
                            _Badge(
                              text: resource.categoryLabel,
                              textColor: resource.categoryTextColor,
                              bgColor: resource.categoryBgColor,
                            ),
                            // AP Subject Tag
                            if (resource.category == 'ap' &&
                                resource.apSubCategoryLabel.isNotEmpty)
                              _Badge(
                                text: resource.apSubCategoryLabel,
                                textColor: CategoryColors.textFor('ap'),
                                bgColor: CategoryColors.bgFor('ap'),
                              ),
                            // SAT/ACT Section Tag
                            if ((resource.category == 'sat' ||
                                    resource.category == 'act') &&
                                resource.testSection != null)
                              _Badge(
                                text: resource.testSectionLabel,
                                textColor: CategoryColors.textFor(
                                  resource.category,
                                ),
                                bgColor: CategoryColors.bgFor(
                                  resource.category,
                                ),
                              ),
                            _Badge(
                              text: resource.fieldLabel,
                              textColor: kTextSecondary,
                              bgColor: kBackground,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Favorite star + remove button
                  if (provider.isLoggedIn)
                    InkWell(
                      mouseCursor: SystemMouseCursors.click,
                      onTap: () =>
                          context.read<AppProvider>().togglePinned(resource.id),
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          isPinned ? Icons.star : Icons.star_border,
                          size: 16,
                          color: isPinned ? kGold : kTextTertiary,
                        ),
                      ),
                    ),
                  InkWell(
                    mouseCursor: SystemMouseCursors.click,
                    onTap: () =>
                        context.read<AppProvider>().toggleSaved(resource.id),
                    borderRadius: BorderRadius.circular(6),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.close, size: 14, color: kTextTertiary),
                    ),
                  ),
                ],
              ),
            ),
            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                child: Text(
                  resource.description,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: kTextSecondary,
                    height: 1.45,
                  ),
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
            // Deadline row (only if there is one)
            if (resource.deadline != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 6, 12, 0),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 11,
                      color: resource.urgencyTextColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      resource.deadline!,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: resource.urgencyTextColor,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 1,
                      ),
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
                ),
              ),
            // Links row
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 6, 10, 10),
              child: Wrap(
                spacing: 5,
                runSpacing: 4,
                children: resource.links
                    .take(2)
                    .map((l) => _LinkChip(label: l, resource: resource))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color bgColor;

  const _Badge({
    required this.text,
    required this.textColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }
}

class _LinkChip extends StatelessWidget {
  final String label;
  final Resource resource;

  const _LinkChip({required this.label, required this.resource});

  @override
  Widget build(BuildContext context) {
    final url = resolveUrl(label, resource);

    return MouseRegion(
      cursor: url != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: url != null ? () => openUrl(context, url) : null,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
          decoration: BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: kBorderLight),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.open_in_new,
                size: 13,
                color: url != null ? const Color(0xFF1D9E75) : kTextTertiary,
              ),
              const SizedBox(width: 4),
              Text(
                label.length > 20 ? '${label.substring(0, 18)}…' : label,
                style: GoogleFonts.inter(fontSize: 10, color: kTextSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
