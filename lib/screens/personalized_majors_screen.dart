import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../data/majors_data.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../utils/stack_sorting.dart';
import '../widgets/resource_tile.dart';

class PersonalizedMajorsScreen extends StatefulWidget {
  const PersonalizedMajorsScreen({super.key});

  @override
  State<PersonalizedMajorsScreen> createState() =>
      _PersonalizedMajorsScreenState();
}

class _PersonalizedMajorsScreenState extends State<PersonalizedMajorsScreen> {
  static const _filters = [
    _CategoryFilter('all', 'For you', Icons.school_outlined),
    _CategoryFilter('courses', 'Courses', Icons.menu_book_outlined),
    _CategoryFilter('competition', 'Competitions', Icons.emoji_events_outlined),
    _CategoryFilter('research', 'Research', Icons.science_outlined),
    _CategoryFilter('internship', 'Internships', Icons.work_outline),
  ];

  String _selectedFilter = 'all';

  List<Resource> _matchedResources(
    Set<String> checkedMajors,
    Set<String> pinned,
    Set<String> seen,
  ) {
    const supportedCategories = {
      'ap',
      'dual_credit',
      'competition',
      'research',
      'internship',
    };

    bool matchesFilter(Resource resource) => switch (_selectedFilter) {
      'all' => supportedCategories.contains(resource.category),
      'courses' =>
        resource.category == 'ap' || resource.category == 'dual_credit',
      _ => resource.category == _selectedFilter,
    };

    final items = allResources
        .where(matchesFilter)
        .where(
          (resource) => checkedMajors.any(
            (major) => resourceMatchesMajor(resource, major),
          ),
        )
        .toList();

    int compareResources(Resource a, Resource b) {
      int actionRank(Resource resource) {
        if (resource.hasDeadline) return 0;
        if (const {
          'competition',
          'research',
          'internship',
        }.contains(resource.category)) {
          return 1;
        }
        return 2;
      }

      final rankComparison = actionRank(a).compareTo(actionRank(b));
      if (rankComparison != 0) return rankComparison;
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    }

    return sortStackItems(
      items,
      isStarred: (resource) => pinned.contains(resource.id),
      isSeen: (resource) => seen.contains(resource.id),
      compare: compareResources,
    );
  }

  List<_SelectedMajor> _selectedMajorLabels(Set<String> checked) {
    final selections = <_SelectedMajor>[];
    for (final group in majorGroups) {
      final allSubMajorsChecked =
          group.subcategories.isNotEmpty &&
          group.subcategories.every((sub) => checked.contains(sub.id));
      if (allSubMajorsChecked) {
        selections.add(_SelectedMajor(group.id, group.label, group.color));
        continue;
      }
      for (final sub in group.subcategories) {
        if (checked.contains(sub.id)) {
          selections.add(_SelectedMajor(sub.id, sub.label, group.color));
        }
      }
    }
    return selections;
  }

  void _showMajorPicker() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => Consumer<AppProvider>(
        builder: (context, provider, _) => SafeArea(
          child: FractionallySizedBox(
            heightFactor: 0.82,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Choose intended majors',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: kTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pick one or more interests. Your personalized feed updates immediately.',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: kTextSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: kBorderLight),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: majorGroups.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 18),
                    itemBuilder: (context, index) {
                      final group = majorGroups[index];
                      final allSelected = group.subcategories.every(
                        (sub) => provider.isMajorChecked(sub.id),
                      );
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: group.color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  group.label,
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: kTextPrimary,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    provider.toggleCheckedMajor(group.id),
                                child: Text(
                                  allSelected ? 'Clear group' : 'Select all',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            spacing: 7,
                            runSpacing: 7,
                            children: group.subcategories.map((sub) {
                              final selected = provider.isMajorChecked(sub.id);
                              return FilterChip(
                                selected: selected,
                                showCheckmark: true,
                                label: Text(sub.label),
                                onSelected: (_) =>
                                    provider.toggleCheckedMajor(sub.id),
                                selectedColor: group.color.withValues(
                                  alpha: 0.14,
                                ),
                                checkmarkColor: group.color,
                                side: BorderSide(
                                  color: selected
                                      ? group.color.withValues(alpha: 0.5)
                                      : kBorderLight,
                                ),
                                labelStyle: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: selected
                                      ? group.color
                                      : kTextSecondary,
                                ),
                                visualDensity: VisualDensity.compact,
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 14),
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: kBorderLight)),
                  ),
                  child: FilledButton(
                    onPressed: () => Navigator.of(sheetContext).pop(),
                    style: FilledButton.styleFrom(backgroundColor: kNavy),
                    child: const Text('Done'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final checked = provider.checkedMajors;
    final selections = _selectedMajorLabels(checked);
    final resources = checked.isEmpty
        ? const <Resource>[]
        : _matchedResources(checked, provider.pinned, provider.seen);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.school_outlined, color: kNavy, size: 18),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'My Majors',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kTextPrimary,
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: _showMajorPicker,
                    icon: Icon(
                      checked.isEmpty ? Icons.add : Icons.tune,
                      size: 15,
                    ),
                    label: Text(
                      checked.isEmpty ? 'Choose majors' : 'Edit majors',
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: kNavy,
                      side: const BorderSide(color: kBorderLight),
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                ],
              ),
              if (selections.isNotEmpty) ...[
                const SizedBox(height: 10),
                Wrap(
                  spacing: 16,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: selections
                          .map(
                            (selection) => InputChip(
                              avatar: Icon(
                                Icons.check_circle,
                                size: 14,
                                color: selection.color,
                              ),
                              label: Text(selection.label),
                              onDeleted: () =>
                                  provider.toggleCheckedMajor(selection.id),
                              deleteIcon: const Icon(Icons.close, size: 14),
                              backgroundColor: selection.color.withValues(
                                alpha: 0.08,
                              ),
                              side: BorderSide(
                                color: selection.color.withValues(alpha: 0.24),
                              ),
                              labelStyle: GoogleFonts.inter(
                                fontSize: 11,
                                color: kTextPrimary,
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                          )
                          .toList(),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: _filters.map((filter) {
                          final selected = _selectedFilter == filter.id;
                          return Padding(
                            padding: EdgeInsets.only(
                              right: filter == _filters.last ? 0 : 6,
                            ),
                            child: ChoiceChip(
                              selected: selected,
                              avatar: Icon(
                                filter.icon,
                                size: 14,
                                color: selected ? Colors.white : kTextSecondary,
                              ),
                              label: Text(filter.label),
                              onSelected: (_) =>
                                  setState(() => _selectedFilter = filter.id),
                              selectedColor: kNavy,
                              backgroundColor: kSurface,
                              side: BorderSide(
                                color: selected ? kNavy : kBorderLight,
                              ),
                              labelStyle: GoogleFonts.inter(
                                fontSize: 12,
                                color: selected ? Colors.white : kTextSecondary,
                                fontWeight: selected
                                    ? FontWeight.w500
                                    : FontWeight.normal,
                              ),
                              visualDensity: VisualDensity.compact,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
        if (checked.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 8),
            child: Row(
              children: [
                const Icon(
                  Icons.touch_app_outlined,
                  size: 13,
                  color: kTextTertiary,
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    'Save, star, review, and add deadlines directly from each resource.',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: kTextTertiary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        const Divider(height: 1, color: kBorderLight),
        Expanded(
          child: checked.isEmpty
              ? _EmptyMajorsState(onChooseMajors: _showMajorPicker)
              : resources.isEmpty
              ? Center(
                  child: Text(
                    'No resources match this view yet.',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: kTextTertiary,
                    ),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: resources.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (_, index) =>
                      ResourceTile(resource: resources[index]),
                ),
        ),
      ],
    );
  }
}

class _EmptyMajorsState extends StatelessWidget {
  final VoidCallback onChooseMajors;

  const _EmptyMajorsState({required this.onChooseMajors});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: kGoldLight,
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Icon(Icons.school_outlined, color: kGold),
            ),
            const SizedBox(height: 14),
            Text(
              'Build your personalized workspace',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: kTextPrimary,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Select an intended major once, then browse matching courses, competitions, research, and internships together.',
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 12,
                height: 1.45,
                color: kTextSecondary,
              ),
            ),
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: onChooseMajors,
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Choose majors'),
              style: FilledButton.styleFrom(backgroundColor: kNavy),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryFilter {
  final String id;
  final String label;
  final IconData icon;

  const _CategoryFilter(this.id, this.label, this.icon);
}

class _SelectedMajor {
  final String id;
  final String label;
  final Color color;

  const _SelectedMajor(this.id, this.label, this.color);
}
