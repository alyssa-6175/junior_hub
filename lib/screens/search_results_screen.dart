import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/resource_tile.dart';
import '../widgets/resource_detail_modal.dart';
import '../utils/url_helper.dart';

// ── Search hit model ─────────────────────────────────────────────────────────

class SearchHit {
  final Resource resource;

  /// If non-null, the search matched this specific link label within the resource,
  /// rather than the resource title/description itself.
  final String? matchedLink;

  SearchHit({required this.resource, this.matchedLink});
}

List<SearchHit> buildSearchHits(String query) {
  final q = query.toLowerCase().trim();
  final hits = <SearchHit>[];
  final seen =
      <String>{}; // prevent the same resource appearing twice at top level

  for (final r in allResources) {
    final titleMatch =
        r.title.toLowerCase().contains(q) ||
        r.description.toLowerCase().contains(q) ||
        r.categoryLabel.toLowerCase().contains(q);

    if (titleMatch) {
      hits.add(SearchHit(resource: r));
      seen.add(r.id);
      continue;
    }

    // Check each individual link label
    for (final link in r.links) {
      if (link.toLowerCase().contains(q)) {
        hits.add(SearchHit(resource: r, matchedLink: link));
        // Don't add `seen` — same resource can appear multiple times for diff links
      }
    }
  }

  return hits;
}

// ── Screen ───────────────────────────────────────────────────────────────────

class SearchResultsScreen extends StatelessWidget {
  final String query;
  const SearchResultsScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final seen = context.watch<AppProvider>().seen;
    final hits = buildSearchHits(query);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search results',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kTextPrimary,
                ),
              ),
              Text(
                '${hits.length} result${hits.length == 1 ? '' : 's'} for "$query"',
                style: GoogleFonts.inter(fontSize: 12, color: kTextSecondary),
              ),
            ],
          ),
        ),
        Expanded(
          child: hits.isEmpty
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.search_off,
                        size: 36,
                        color: kTextTertiary,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'No results for "$query"',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: kTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Try a different keyword or browse a category.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: kTextSecondary,
                        ),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  itemCount: hits.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (_, i) {
                    final hit = hits[i];
                    if (hit.matchedLink != null) {
                      return _LinkHitTile(hit: hit);
                    }
                    return ResourceTile(resource: hit.resource);
                  },
                ),
        ),
      ],
    );
  }
}

// ── Tile shown when the match is inside a specific link within a resource ────

class _LinkHitTile extends StatelessWidget {
  final SearchHit hit;
  const _LinkHitTile({required this.hit});

  @override
  Widget build(BuildContext context) {
    final resource = hit.resource;
    final link = hit.matchedLink!;
    final url = resolveUrl(link, resource);
    final provider = context.watch<AppProvider>();
    final isPinned = provider.isPinned(resource.id);
    final isSeen = provider.isLinkSeen(resource.id, link);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: isSeen ? 0.45 : 1.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isPinned ? kGoldLight : kSurface,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isPinned ? kGold.withValues(alpha: 0.45) : kBorderLight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Source label — shows which resource this link belongs to
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
              child: Row(
                children: [
                  Container(
                    width: 22,
                    height: 22,
                    decoration: BoxDecoration(
                      color: resource.categoryBgColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      resource.icon,
                      size: 12,
                      color: resource.categoryTextColor,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    resource.title,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: kTextSecondary,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 1,
                    ),
                    decoration: BoxDecoration(
                      color: resource.categoryBgColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      resource.categoryLabel,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w500,
                        color: resource.categoryTextColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // The actual matching link — tappable, opens the URL
            MouseRegion(
              cursor: url != null
                  ? SystemMouseCursors.click
                  : MouseCursor.defer,
              child: GestureDetector(
                onTap: url != null ? () => openUrl(context, url) : null,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12, 6, 12, 10),
                  child: Row(
                    children: [
                      const Icon(Icons.link, size: 13, color: kTextTertiary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          link,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: kTextPrimary,
                            decoration: isSeen
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                      ),
                      if (url != null)
                        const Icon(
                          Icons.open_in_new,
                          size: 13,
                          color: Color(0xFF1D9E75),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
