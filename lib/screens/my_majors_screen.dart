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

  /// Maps a sub-major or group id to the old 'field' string.
  static const _subToField = {
    'cs': 'cs',
    'cybersecurity': 'cs',
    'data_sci': 'cs',
    'ai': 'cs',
    'game_design': 'cs',
    'mech_eng': 'physics',
    'biology': 'biology',
    'microbiology': 'biology',
    'neuroscience': 'biology',
    'bio_health': 'biology',
    'micro_health': 'biology',
    'neuro_health': 'biology',
    'chemistry': 'biology',
    'chem_eng': 'physics',
    'physics': 'physics',
    'applied_math': 'math',
    'statistics': 'math',
    'comp_math': 'math',
    'fin_math': 'math',
    'premed': 'biology',
    'nursing': 'biology',
    'economics': 'history',
    'econ_soc': 'history',
    'business': 'history',
    'marketing': 'history',
    'finance': 'history',
    'accounting': 'history',
    'comm_biz': 'history',
    'comm_soc': 'history',
    'intl_rel': 'history',
    'polisci': 'history',
    'pub_policy': 'history',
    'prelaw': 'history',
    'sociology': 'history',
    'english': 'english',
    'humanities': 'english',
    'music': 'english',
    'fine_arts': 'english',
    'game_des_art': 'cs',
  };

  /// Collect all resources for the checked majors, filtered by category, deduplicated.
  List<Resource> _resourcesForCategory(
    Set<String> checkedMajors,
    String category,
    Set<String> seen,
  ) {
    final fieldKeys = <String>{};
    for (final id in checkedMajors) {
      final field = _subToField[id];
      if (field != null) fieldKeys.add(field);
    }
    if (fieldKeys.isEmpty) return [];

    final result = <String, Resource>{};
    for (final field in fieldKeys) {
      for (final r in resourcesByFieldAndCategory(field, category)) {
        result[r.id] = r;
      }
    }
    return sortBySeen(result.values.toList(), seen);
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
