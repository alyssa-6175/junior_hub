import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/resource_tile.dart';

class TestDetailScreen extends StatefulWidget {
  final String category; // 'sat' | 'act'
  const TestDetailScreen({super.key, required this.category});
  @override
  State<TestDetailScreen> createState() => _TestDetailScreenState();
}

class _TestDetailScreenState extends State<TestDetailScreen> {
  int _tab = 0; // 0=Board 1=Official 2=Videos 3=Books 4=Practice Qs
  String? _section;
  bool _guideExpanded = false;

  // ── Progress tracking for test series ────────────────────────────
  // Bluebook: tests 4–10 (7 tests)
  final Set<int> _bluebookDone = {};
  // Paper: tests 4–11 (8 tests)
  final Set<int> _paperDone = {};

  bool get _isSat => widget.category == 'sat';
  String get _title => _isSat ? 'SAT Prep' : 'ACT Prep';

  List<String> get _sectionOptions => _isSat
      ? ['Math', 'Reading & Writing']
      : ['English', 'Math', 'Reading', 'Science'];

  String _key(String label) =>
      label.toLowerCase().replaceAll(' & ', '_').replaceAll(' ', '_');

  List<Resource> get _all => resourcesByCategory(widget.category);

  List<Resource> _applySection(List<Resource> items) {
    if (_section == null) return items;
    return items
        .where((r) => r.testSection == null || r.testSection == _section)
        .toList();
  }

  List<Resource> _sort(
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

    final board = _all.where((r) => pinned.contains(r.id)).toList();

    // Official tab: specific resource IDs
    final officialIds = {
      'bluebook_tests',
      'paper_practice_tests',
      'cb_question_bank',
      'cb_practice_specific_questions',
      'cb_official_study_guide',
    };
    final official = _sort(
      _applySection(_all.where((r) => officialIds.contains(r.id)).toList()),
      pinned,
      seen,
    );

    final videos = _sort(
      _applySection(_all.where((r) => r.icon == Icons.smart_display).toList()),
      pinned,
      seen,
    );

    // Books tab (renamed from Practice Tests): Princeton Review + Kaplan
    final bookIds = {'princeton_review_sat', 'kaplan_sat'};
    final books = _sort(
      _applySection(_all.where((r) => bookIds.contains(r.id)).toList()),
      pinned,
      seen,
    );

    // Practice Qs tab: Khan Academy + quiz-type resources
    final practiceQIds = {'khan_academy_sat', 'knowt_sat'};
    final qs = _sort(
      _applySection(
        _all
            .where(
              (r) =>
                  practiceQIds.contains(r.id) ||
                  (!officialIds.contains(r.id) &&
                      !bookIds.contains(r.id) &&
                      (r.icon == Icons.quiz ||
                          r.links.any(
                            (l) =>
                                l.toLowerCase().contains('knowt') ||
                                l.toLowerCase().contains('question') ||
                                l.toLowerCase().contains('mcq'),
                          ))),
            )
            .toList(),
      ),
      pinned,
      seen,
    );

    final tabs = ['Board', 'Official', 'Videos', 'Books', 'Practice Qs'];
    final bodies = [board, official, videos, books, qs];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Compact header ──────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: CategoryColors.bgFor(widget.category),
                  borderRadius: BorderRadius.circular(9),
                ),
                child: Icon(
                  Icons.edit,
                  color: CategoryColors.textFor(widget.category),
                  size: 17,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: kTextPrimary,
                    ),
                  ),
                  Text(
                    '${_all.length} resources',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: kTextSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // ── Tab row ─────────────────────────────────────────────────
        Container(
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: kBorderLight)),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _SectionChip(
                  label: 'All',
                  active: _section == null,
                  onTap: () => setState(() => _section = null),
                ),
                ..._sectionOptions.map(
                  (s) => _SectionChip(
                    label: s,
                    active: _section == _key(s),
                    onTap: () => setState(
                      () => _section = _section == _key(s) ? null : _key(s),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 20,
                  color: kBorderLight,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                ),
                ...List.generate(tabs.length, (i) {
                  final isBoard = i == 0;
                  final count = isBoard ? board.length : 0;
                  return _TabBtn(
                    label: tabs[i],
                    active: _tab == i,
                    icon: isBoard ? Icons.push_pin_outlined : null,
                    badge: isBoard && count > 0 ? '$count' : null,
                    onTap: () => setState(() => _tab = i),
                  );
                }),
              ],
            ),
          ),
        ),

        // ── Content ──────────────────────────────────────────────────
        Expanded(
          child: IndexedStack(
            index: _tab,
            children: List.generate(bodies.length, (tabIndex) {
              final items = bodies[tabIndex];

              if (tabIndex == 0 && items.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.push_pin_outlined,
                        size: 30,
                        color: kTextTertiary,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Nothing pinned yet.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: kTextPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pin resources from the other tabs to keep them here.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: kTextSecondary,
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (items.isEmpty) {
                return Center(
                  child: Text(
                    'No resources in this tab.',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: kTextTertiary,
                    ),
                  ),
                );
              }

              // Official tab: inject tracker cards inline
              if (tabIndex == 1 && _isSat) {
                return _OfficialTabContent(
                  items: items,
                  bluebookDone: _bluebookDone,
                  paperDone: _paperDone,
                  onBluebookToggle: (n) => setState(
                    () => _bluebookDone.contains(n)
                        ? _bluebookDone.remove(n)
                        : _bluebookDone.add(n),
                  ),
                  onPaperToggle: (n) => setState(
                    () => _paperDone.contains(n)
                        ? _paperDone.remove(n)
                        : _paperDone.add(n),
                  ),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.all(14),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 6),
                itemBuilder: (_, i) => ResourceTile(resource: items[i]),
              );
            }),
          ),
        ),
      ],
    );
  }
}

// ── Official Tab with inline test trackers ─────────────────────────────────────

class _OfficialTabContent extends StatelessWidget {
  final List<Resource> items;
  final Set<int> bluebookDone;
  final Set<int> paperDone;
  final void Function(int) onBluebookToggle;
  final void Function(int) onPaperToggle;

  const _OfficialTabContent({
    required this.items,
    required this.bluebookDone,
    required this.paperDone,
    required this.onBluebookToggle,
    required this.onPaperToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(14),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (_, i) {
        final r = items[i];

        // Inject tracker after the Bluebook tile
        if (r.id == 'bluebook_tests') {
          return Column(
            children: [
              ResourceTile(resource: r),
              const SizedBox(height: 6),
              _TestTrackerCard(
                label: 'Bluebook Tests',
                tests: List.generate(7, (n) => n + 4), // 4–10
                done: bluebookDone,
                onToggle: onBluebookToggle,
                url: 'https://bluebook.collegeboard.org',
              ),
            ],
          );
        }

        // Inject tracker after the Paper tests tile
        if (r.id == 'paper_practice_tests') {
          return Column(
            children: [
              ResourceTile(resource: r),
              const SizedBox(height: 6),
              _TestTrackerCard(
                label: 'Paper Tests',
                tests: List.generate(8, (n) => n + 4), // 4–11
                done: paperDone,
                onToggle: onPaperToggle,
                url:
                    'https://satsuite.collegeboard.org/practice/practice-tests/paper',
              ),
            ],
          );
        }

        return ResourceTile(resource: r);
      },
    );
  }
}

// ── Test Tracker Card ──────────────────────────────────────────────────────────

class _TestTrackerCard extends StatelessWidget {
  final String label;
  final List<int> tests;
  final Set<int> done;
  final void Function(int) onToggle;
  final String url;

  const _TestTrackerCard({
    required this.label,
    required this.tests,
    required this.done,
    required this.onToggle,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    final completedCount = tests.where((t) => done.contains(t)).length;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBorderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: kTextSecondary,
                  letterSpacing: 0.2,
                ),
              ),
              const Spacer(),
              Text(
                '$completedCount / ${tests.length} done',
                style: GoogleFonts.inter(
                  fontSize: 10,
                  color: completedCount == tests.length
                      ? const Color(0xFF0F6E56)
                      : kTextTertiary,
                  fontWeight: completedCount == tests.length
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Test number chips
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: tests.map((n) {
              final isDone = done.contains(n);
              return GestureDetector(
                onTap: () => onToggle(n),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  width: 36,
                  height: 30,
                  decoration: BoxDecoration(
                    color: isDone
                        ? kNavy.withValues(alpha: 0.10)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: isDone
                          ? kNavy.withValues(alpha: 0.25)
                          : kBorderLight,
                    ),
                  ),
                  child: Center(
                    child: isDone
                        ? Icon(
                            Icons.check,
                            size: 13,
                            color: kNavy.withValues(alpha: 0.75),
                          )
                        : Text(
                            '$n',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: kTextSecondary,
                            ),
                          ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

// ── Shared tab bar widgets (unchanged) ────────────────────────────────────────

class _SectionChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _SectionChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          margin: const EdgeInsets.only(right: 5, bottom: 8, top: 8),
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(
            color: active ? kNavy.withValues(alpha: 0.08) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: active ? kNavy : kBorderLight),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: active ? FontWeight.w500 : FontWeight.normal,
              color: active ? kNavy : kTextSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _TabBtn extends StatelessWidget {
  final String label;
  final bool active;
  final IconData? icon;
  final String? badge;
  final VoidCallback onTap;
  const _TabBtn({
    required this.label,
    required this.active,
    this.icon,
    this.badge,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 0, top: 0),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: active ? kNavy : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 12, color: active ? kNavy : kTextSecondary),
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: active ? FontWeight.w500 : FontWeight.normal,
                  color: active ? kNavy : kTextSecondary,
                ),
              ),
              if (badge != null) ...[
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
                    badge!,
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
      ),
    );
  }
}
