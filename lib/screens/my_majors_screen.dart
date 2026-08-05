import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/majors_data.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/resource_tile.dart';

class MyMajorsScreen extends StatefulWidget {
  const MyMajorsScreen({super.key});
  @override
  State<MyMajorsScreen> createState() => _MyMajorsScreenState();
}

class _MyMajorsScreenState extends State<MyMajorsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;
  static const _categories = ['ap', 'competition', 'research', 'internship'];

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  /// Collect all resources for the checked majors, filtered by category, deduplicated.
  List<Resource> _resourcesForCategory(
    Set<String> checkedMajors,
    String category,
    Set<String> seen,
  ) {
    final items = resourcesByCategory(category)
        .where(
          (resource) => checkedMajors.any(
            (major) => resourceMatchesMajor(resource, major),
          ),
        )
        .toList();
    return sortBySeen(items, seen);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final checked = provider.checkedMajors;
    final seen = provider.seen;

    if (checked.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_box_outline_blank,
              size: 40,
              color: kTextTertiary,
            ),
            const SizedBox(height: 12),
            Text(
              'No majors selected yet',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: kTextPrimary,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Check your intended majors in the sidebar to see\nall relevant resources here in one place.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(fontSize: 13, color: kTextSecondary),
            ),
          ],
        ),
      );
    }

    // Labels for checked groups
    final checkedSubLabels = majorGroups
        .expand((g) => g.subcategories)
        .where((s) => checked.contains(s.id))
        .map((s) => s.label)
        .join(', ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.check_box, color: kNavy, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'My Majors',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kTextPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 3),
              Text(
                checkedSubLabels.isEmpty
                    ? 'No majors checked'
                    : checkedSubLabels,
                style: GoogleFonts.inter(fontSize: 12, color: kTextSecondary),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: kBorderLight)),
          ),
          child: TabBar(
            controller: _tabs,
            labelStyle: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            unselectedLabelStyle: GoogleFonts.inter(fontSize: 13),
            labelColor: kNavy,
            unselectedLabelColor: kTextSecondary,
            indicatorColor: kNavy,
            indicatorWeight: 2,
            isScrollable: true,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            tabs: const [
              Tab(text: 'APs & Courses'),
              Tab(text: 'Competitions'),
              Tab(text: 'Research'),
              Tab(text: 'Internships'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabs,
            children: _categories.map((cat) {
              final items = _resourcesForCategory(checked, cat, seen);
              if (items.isEmpty) {
                return Center(
                  child: Text(
                    'No $cat resources for your majors.',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: kTextTertiary,
                    ),
                  ),
                );
              }
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 6),
                itemBuilder: (_, i) => ResourceTile(resource: items[i]),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
