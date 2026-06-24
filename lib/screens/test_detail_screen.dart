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

    final bookIds = {'princeton_review_sat', 'kaplan_sat'};
    final books = _sort(
      _applySection(_all.where((r) => bookIds.contains(r.id)).toList()),
      pinned,
      seen,
    );

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
        // ── Compact header ──────────────────────────────────────────────
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

        // ── Study guide banner (SAT only) ───────────────────────────────
        if (_isSat)
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 6),
            child: _StudyGuideCard(
              expanded: _guideExpanded,
              onToggle: () => setState(() => _guideExpanded = !_guideExpanded),
            ),
          ),

        // ── Tab row ─────────────────────────────────────────────────────
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

        // ── Content — all tabs are now identical plain ListViews ─────────
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

              // ── All tabs: plain ListView, tracker lives in the modal ──
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

// ── Study guide card (unchanged from before) ──────────────────────────────────

class _StudyGuideCard extends StatelessWidget {
  final bool expanded;
  final VoidCallback onToggle;
  const _StudyGuideCard({required this.expanded, required this.onToggle});

  static const _steps = [
    (
      icon: Icons.assignment_outlined,
      label: '1. Baseline test',
      detail:
          'Take a full Bluebook or paper test cold. Don\'t study first — you need an honest baseline score.',
    ),
    (
      icon: Icons.search,
      label: '2. Diagnose',
      detail:
          'Review your score report. Which skill categories cost you the most points? Write them down — those are your targets.',
    ),
    (
      icon: Icons.track_changes_outlined,
      label: '3. Targeted practice',
      detail:
          'Use the Question Bank and Khan Academy to drill your weak skills. Don\'t practice what you already know.',
    ),
    (
      icon: Icons.repeat,
      label: '4. Test again',
      detail:
          'Take another full-length test. Compare score reports — are your weak areas improving? Repeat steps 2–4.',
    ),
    (
      icon: Icons.done_all,
      label: '5. Final polish',
      detail:
          '2–3 weeks out: focus on timing, pacing, and test-day routines. Stop learning new material and consolidate.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: kNavy.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kNavy.withValues(alpha: 0.10)),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: onToggle,
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              child: Row(
                children: [
                  Icon(
                    Icons.route_outlined,
                    size: 14,
                    color: kNavy.withValues(alpha: 0.7),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'How to study for the SAT',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: kNavy.withValues(alpha: 0.85),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 16,
                    color: kNavy.withValues(alpha: 0.5),
                  ),
                ],
              ),
            ),
          ),
          if (expanded) ...[
            Divider(height: 1, color: kNavy.withValues(alpha: 0.08)),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                children: _steps.map((step) {
                  final isLast = step == _steps.last;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 26,
                            height: 26,
                            decoration: BoxDecoration(
                              color: kNavy.withValues(alpha: 0.08),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              step.icon,
                              size: 13,
                              color: kNavy.withValues(alpha: 0.7),
                            ),
                          ),
                          if (!isLast)
                            Container(
                              width: 1,
                              height: 36,
                              color: kNavy.withValues(alpha: 0.10),
                              margin: const EdgeInsets.symmetric(vertical: 2),
                            ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 4,
                            bottom: isLast ? 0 : 14,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                step.label,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: kTextPrimary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                step.detail,
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  color: kTextSecondary,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Shared tab bar widgets ────────────────────────────────────────────────────

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
