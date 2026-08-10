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
    _tabs = TabController(length: 4, vsync: this); // Starred + 3 content tabs
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  String get _majorKey => widget.subMajorId ?? widget.majorGroupId;

  List<Resource> _forCategory(String category) => resourcesByCategory(
    category,
  ).where((resource) => resourceMatchesMajor(resource, _majorKey)).toList();

  List<Resource> _aps() => _forCategory('ap') + _forCategory('dual_credit');
  List<Resource> _opps() =>
      _forCategory('research') + _forCategory('internship');
  List<Resource> _comps() => _forCategory('competition');

  List<Resource> _allForScreen() {
    final all = {..._aps(), ..._opps(), ..._comps()};
    return all.toList();
  }

  List<Resource> _sortFn(
    List<Resource> items,
    Set<String> pinned,
    Set<String> seen,
  ) {
    int scopeRank(Resource resource) {
      final location = (resource.locationNote ?? '').toLowerCase();
      final isNearby = [
        'seattle',
        'bellevue',
        'kirkland',
        'redmond',
        'bothell',
        'king county',
        'puget sound',
        'tacoma',
        'everett',
      ].any(location.contains);
      if (resource.scope == 'local' && isNearby) return 0;
      if (resource.scope == 'regional' || resource.scope == 'state') return 1;
      return 2;
    }

    int compare(Resource a, Resource b) {
      final scopeCompare = scopeRank(a).compareTo(scopeRank(b));
      if (scopeCompare != 0) return scopeCompare;
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    }

    final starred = items.where((r) => pinned.contains(r.id)).toList()
      ..sort(compare);
    final remaining = items.where((r) => !pinned.contains(r.id)).toList()
      ..sort(compare);
    return [...starred, ...remaining];
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

    final boardItems = _sortFn(
      _allForScreen().where((r) => pinned.contains(r.id)).toList(),
      pinned,
      seen,
    );

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
              // Starred tab with badge count
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star_border, size: 13),
                    const SizedBox(width: 4),
                    const Text('Starred'),
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
              // Starred tab
              boardItems.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_border,
                            size: 32,
                            color: kTextTertiary,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Nothing starred yet',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: kTextPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Star any resource from the other tabs to keep it here.',
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
