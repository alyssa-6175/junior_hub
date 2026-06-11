import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/resource_tile.dart';

class SearchResultsScreen extends StatelessWidget {
  final String query;
  const SearchResultsScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    final seen = context.watch<AppProvider>().seen;
    final q = query.toLowerCase().trim();

    final results = allResources
        .where(
          (r) =>
              r.title.toLowerCase().contains(q) ||
              r.description.toLowerCase().contains(q) ||
              r.categoryLabel.toLowerCase().contains(q) ||
              r.fieldLabel.toLowerCase().contains(q) ||
              r.links.any((l) => l.toLowerCase().contains(q)),
        )
        .toList();

    final sorted = sortBySeen(results, seen);

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
                '${sorted.length} result${sorted.length == 1 ? '' : 's'} for "$query"',
                style: GoogleFonts.inter(fontSize: 12, color: kTextSecondary),
              ),
            ],
          ),
        ),
        Expanded(
          child: sorted.isEmpty
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
                  itemCount: sorted.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (_, i) => ResourceTile(resource: sorted[i]),
                ),
        ),
      ],
    );
  }
}
