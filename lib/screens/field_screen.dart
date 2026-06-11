import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/majors_data.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/resource_tile.dart';

class FieldScreen extends StatefulWidget {
  final String majorGroupId;
  final String? subMajorId;
  const FieldScreen({super.key, required this.majorGroupId, this.subMajorId});

  @override
  State<FieldScreen> createState() => _FieldScreenState();
}

class _FieldScreenState extends State<FieldScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 4, vsync: this); // Board + 3 content tabs
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

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

  String get _fieldKey {
    const groupToField = {
      'cs_eng': 'cs',
      'sciences': 'biology',
      'math': 'math',
      'health': 'biology',
      'business': 'history',
      'social': 'history',
      'arts': 'english',
    };
    if (widget.subMajorId != null) {
      return _subToField[widget.subMajorId] ?? 'all';
    }
    return groupToField[widget.majorGroupId] ?? 'all';
  }

  List<Resource> _aps() => resourcesByFieldAndCategory(_fieldKey, 'ap');
  List<Resource> _opps() =>
      resourcesByFieldAndCategory(_fieldKey, 'research') +
      resourcesByFieldAndCategory(_fieldKey, 'internship');
  List<Resource> _comps() =>
      resourcesByFieldAndCategory(_fieldKey, 'competition');

  List<Resource> _allForScreen() {
    final all = {..._aps(), ..._opps(), ..._comps()};
    return all.toList();
  }

  List<Resource> _sortFn(
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

    final MajorGroup group = majorGroups.firstWhere(
      (g) => g.id == widget.majorGroupId,
      orElse: () => majorGroups.first,
    );
    SubMajor? subMajor;
    if (widget.subMajorId != null) {
      for (final s in group.subcategories) {
        if (s.id == widget.subMajorId) {
          subMajor = s;
          break;
        }
      }
    }
    final displayName = subMajor?.label ?? group.label;
    final color = group.color;

    final boardItems = _allForScreen()
        .where((r) => pinned.contains(r.id))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kTextPrimary,
                    ),
                  ),
                ],
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            tabs: [
              // Board tab with pin icon + badge count if any pinned
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.push_pin_outlined, size: 13),
                    const SizedBox(width: 4),
                    const Text('Board'),
                    if (boardItems.isNotEmpty) ...[
                      const SizedBox(width: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: kGold.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${boardItems.length}',
                          style: const TextStyle(
                            fontSize: 9,
                            color: kGold,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const Tab(text: 'APs & Courses'),
              const Tab(text: 'Opportunities'),
              const Tab(text: 'Competitions'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabs,
            children: [
              // Board tab
              boardItems.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.push_pin_outlined,
                            size: 32,
                            color: kTextTertiary,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Nothing pinned yet',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: kTextPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Pin any resource from the other tabs to keep it here.',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: kTextSecondary,
                            ),
                          ),
                        ],
                      ),
                    )
                  : _ResourceTab(resources: boardItems),
              // Content tabs
              _ResourceTab(resources: _sortFn(_aps(), pinned, seen)),
              _ResourceTab(resources: _sortFn(_opps(), pinned, seen)),
              _ResourceTab(resources: _sortFn(_comps(), pinned, seen)),
            ],
          ),
        ),
      ],
    );
  }
}

class _ResourceTab extends StatelessWidget {
  final List<Resource> resources;
  const _ResourceTab({required this.resources});

  @override
  Widget build(BuildContext context) {
    if (resources.isEmpty) {
      return Center(
        child: Text(
          'No resources yet.',
          style: GoogleFonts.inter(fontSize: 13, color: kTextTertiary),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: resources.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (_, i) => ResourceTile(resource: resources[i]),
    );
  }
}
