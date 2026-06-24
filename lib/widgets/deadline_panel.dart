import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/majors_data.dart';
import '../data/resources_data.dart';
import '../models/personal_deadline.dart';
import '../providers/app_provider.dart';
import '../widgets/resource_detail_modal.dart';

class DeadlinePanel extends StatefulWidget {
  const DeadlinePanel({super.key});
  @override
  State<DeadlinePanel> createState() => _DeadlinePanelState();
}

class _DeadlinePanelState extends State<DeadlinePanel> {
  bool _showPersonal = false; // false = all deadlines, true = personal only
  String _filterMode = 'none'; // 'none' | 'time' | 'major'
  String? _timeFilter;
  String? _majorFilter;

  List<DeadlineItem> get _allFiltered {
    // Filter out past deadlines first — they should never show.
    var items = upcomingDeadlines
        .where((d) => !d.isExpired) // ← this is the only new line
        .toList();

    if (_timeFilter != null) {
      items = items.where((d) {
        switch (_timeFilter) {
          case 'month':
            return d.urgency == 'urgent';
          case 'quarter':
            return d.urgency == 'soon';
          case 'later':
            return d.urgency == 'later';
          default:
            return true;
        }
      }).toList();
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    return Container(
      width: 210,
      color: kSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Header ───────────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 10, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      size: 13,
                      color: kTextSecondary,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        'Deadlines',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kTextPrimary,
                        ),
                      ),
                    ),
                    // Filter icon
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          _filterMode = _filterMode == 'none' ? 'time' : 'none';
                          if (_filterMode == 'none') {
                            _timeFilter = null;
                            _majorFilter = null;
                          }
                        }),
                        child: Icon(
                          Icons.tune,
                          size: 14,
                          color: _filterMode != 'none' ? kNavy : kTextTertiary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // All / Personal toggle
                Row(
                  children: [
                    _Toggle(
                      label: 'All',
                      active: !_showPersonal,
                      onTap: () => setState(() => _showPersonal = false),
                    ),
                    const SizedBox(width: 6),
                    _Toggle(
                      label: 'Personal',
                      active: _showPersonal,
                      onTap: () => setState(() => _showPersonal = true),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // ── Filter panel ──────────────────────────────────────────────
          if (_filterMode != 'none' && !_showPersonal) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _SmallToggle(
                        label: 'By time',
                        active: _filterMode == 'time',
                        onTap: () => setState(() => _filterMode = 'time'),
                      ),
                      const SizedBox(width: 6),
                      _SmallToggle(
                        label: 'By major',
                        active: _filterMode == 'major',
                        onTap: () => setState(() => _filterMode = 'major'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  if (_filterMode == 'time')
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: [
                        _SmallChip(
                          label: 'All',
                          active: _timeFilter == null,
                          onTap: () => setState(() => _timeFilter = null),
                        ),
                        _SmallChip(
                          label: '< 1 month',
                          active: _timeFilter == 'month',
                          onTap: () => setState(() => _timeFilter = 'month'),
                        ),
                        _SmallChip(
                          label: '1–3 months',
                          active: _timeFilter == 'quarter',
                          onTap: () => setState(() => _timeFilter = 'quarter'),
                        ),
                        _SmallChip(
                          label: '3+ months',
                          active: _timeFilter == 'later',
                          onTap: () => setState(() => _timeFilter = 'later'),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            Container(height: 1, color: kBorderLight),
          ],
          Container(height: 1, color: kBorderLight),
          // ── List ──────────────────────────────────────────────────────
          Expanded(
            child: _showPersonal
                ? _PersonalList(deadlines: provider.personalDeadlines)
                : _AllList(items: _allFiltered),
          ),
          // ── Footer ───────────────────────────────────────────────────
          Container(height: 1, color: kBorderLight),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _showAddDeadlineDialog(context),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add, size: 13, color: kTextTertiary),
                    const SizedBox(width: 4),
                    Text(
                      'Add personal deadline',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        color: kTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddDeadlineDialog(BuildContext context) {
    showDialog(context: context, builder: (_) => const _AddDeadlineDialog());
  }
}

// ── All deadlines list ────────────────────────────────────────────────────────

class _AllList extends StatelessWidget {
  final List<DeadlineItem> items;
  const _AllList({required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          'No deadlines match.',
          style: GoogleFonts.inter(fontSize: 11, color: kTextTertiary),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: items.length,
      itemBuilder: (_, i) =>
          _DeadlineRow(item: items[i], showLine: i < items.length - 1),
    );
  }
}

// ── Personal deadlines list ───────────────────────────────────────────────────

class _PersonalList extends StatelessWidget {
  final List<PersonalDeadline> deadlines;
  const _PersonalList({required this.deadlines});

  @override
  Widget build(BuildContext context) {
    if (deadlines.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'No personal deadlines yet.\nTap "Add to my deadlines" on any resource.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 11, color: kTextTertiary),
          ),
        ),
      );
    }
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      itemCount: deadlines.length,
      itemBuilder: (_, i) => _PersonalDeadlineRow(
        deadline: deadlines[i],
        showLine: i < deadlines.length - 1,
      ),
    );
  }
}

// ── All-deadline row ──────────────────────────────────────────────────────────

class _DeadlineRow extends StatelessWidget {
  final DeadlineItem item;
  final bool showLine;
  const _DeadlineRow({required this.item, required this.showLine});

  void _handleTap(BuildContext context) {
    if (item.resourceId == null) return;
    final resource = allResources
        .where((r) => r.id == item.resourceId)
        .firstOrNull;
    if (resource == null) return;
    if (resource.category == 'ap') {
      context.read<AppProvider>().navigateTo(
        'ap_detail',
        detailId: resource.id,
      );
    } else {
      showResourceDetail(context, resource);
    }
  }

  Color get dotColor {
    switch (item.urgency) {
      case 'urgent':
        return const Color(0xFFE24B4A);
      case 'soon':
        return const Color(0xFFEF9F27);
      default:
        return const Color(0xFF639922);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tappable = item.resourceId != null;

    return MouseRegion(
      cursor: tappable ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: tappable ? () => _handleTap(context) : null,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 16,
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: dotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (showLine)
                      Expanded(
                        child: Center(
                          child: Container(width: 1, color: kBorderLight),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: kTextPrimary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.date,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          color: kTextSecondary,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: UrgencyColors.bgFor(item.urgency),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          UrgencyColors.labelFor(item.urgency),
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.w500,
                            color: UrgencyColors.textFor(item.urgency),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Personal deadline row (tappable → opens resource card) ────────────────────

class _PersonalDeadlineRow extends StatelessWidget {
  final PersonalDeadline deadline;
  final bool showLine;
  const _PersonalDeadlineRow({required this.deadline, required this.showLine});

  Color get dotColor {
    switch (deadline.urgency) {
      case 'urgent':
        return const Color(0xFFE24B4A);
      case 'soon':
        return const Color(0xFFEF9F27);
      default:
        return const Color(0xFF639922);
    }
  }

  void _handleTap(BuildContext context) {
    if (deadline.resourceId == null) return;
    final resource = allResources
        .where((r) => r.id == deadline.resourceId)
        .firstOrNull;
    if (resource == null) return;
    if (resource.category == 'ap') {
      context.read<AppProvider>().navigateTo(
        'ap_detail',
        detailId: resource.id,
      );
    } else {
      showResourceDetail(context, resource);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasLink = deadline.resourceId != null;
    return MouseRegion(
      cursor: hasLink ? SystemMouseCursors.click : MouseCursor.defer,
      child: GestureDetector(
        onTap: hasLink ? () => _handleTap(context) : null,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 16,
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: dotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    if (showLine)
                      Expanded(
                        child: Center(
                          child: Container(width: 1, color: kBorderLight),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              deadline.title,
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: kTextPrimary,
                              ),
                            ),
                          ),
                          // Remove button
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => context
                                  .read<AppProvider>()
                                  .removePersonalDeadline(deadline.id),
                              child: const Icon(
                                Icons.close,
                                size: 11,
                                color: kTextTertiary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        deadline.dateIso,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          color: kTextSecondary,
                        ),
                      ),
                      if (hasLink)
                        Text(
                          'Tap to view resource',
                          style: GoogleFonts.inter(fontSize: 9, color: kGold),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Helper chips/toggles ──────────────────────────────────────────────────────

class _Toggle extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _Toggle({
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: active ? kNavy : kBackground,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: active ? kNavy : kBorderLight),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: active ? Colors.white : kTextSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _SmallToggle extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _SmallToggle({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: active ? kNavy : kBackground,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: active ? kNavy : kBorderLight),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: active ? Colors.white : kTextSecondary,
          ),
        ),
      ),
    ),
  );
}

class _SmallChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _SmallChip({
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: active ? kNavy.withValues(alpha: 0.1) : kBackground,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: active ? kNavy : kBorderLight),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: active ? FontWeight.w500 : FontWeight.normal,
            color: active ? kNavy : kTextSecondary,
          ),
        ),
      ),
    ),
  );
}

// ── Add personal deadline dialog ──────────────────────────────────────────────

class _AddDeadlineDialog extends StatefulWidget {
  const _AddDeadlineDialog();
  @override
  State<_AddDeadlineDialog> createState() => _AddDeadlineDialogState();
}

class _AddDeadlineDialogState extends State<_AddDeadlineDialog> {
  final _titleCtrl = TextEditingController();
  DateTime? _selectedDate;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    // Clear out any deadlines that expired since last session
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<AppProvider>().removeExpiredDeadlines();
    });
  }

  @override
  void dispose() {
    _titleCtrl.dispose();
    super.dispose();
  }

  String _formatDate(DateTime d) {
    const m = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${m[d.month - 1]} ${d.day}, ${d.year}';
  }

  String _toIso(DateTime d) =>
      '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 4)),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: kNavy,
            onPrimary: Colors.white,
            onSurface: kTextPrimary,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: kNavy),
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  void _save() async {
    if (_titleCtrl.text.trim().isEmpty || _selectedDate == null) return;
    setState(() => _saving = true);

    // Compute the ISO date string for storage
    final iso = _toIso(_selectedDate!);

    // Urgency is NOT stored — it's calculated fresh every read from the date.
    context.read<AppProvider>().addPersonalDeadline(
      PersonalDeadline(
        id: '${DateTime.now().millisecondsSinceEpoch}',
        title: _titleCtrl.text.trim(),
        dateIso: iso,
      ),
    );
    if (mounted) Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: kSurface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add personal deadline',
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: kTextPrimary,
              ),
            ),
            const SizedBox(height: 16),

            // Title field
            const Text(
              'Title',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: kTextPrimary,
              ),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: _titleCtrl,
              style: const TextStyle(fontSize: 13),
              decoration: InputDecoration(
                hintText: 'e.g. USACO registration',
                hintStyle: const TextStyle(color: kTextTertiary, fontSize: 13),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 9,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kBorderLight),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kBorderLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: kNavy, width: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Date picker
            const Text(
              'Deadline date',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: kTextPrimary,
              ),
            ),
            const SizedBox(height: 5),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _pickDate,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 11,
                  ),
                  decoration: BoxDecoration(
                    color: kBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _selectedDate != null ? kNavy : kBorderLight,
                      width: _selectedDate != null ? 1.5 : 1.0,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 14,
                        color: _selectedDate != null ? kNavy : kTextTertiary,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _selectedDate != null
                              ? _formatDate(_selectedDate!)
                              : 'Tap to pick a date',
                          style: TextStyle(
                            fontSize: 13,
                            color: _selectedDate != null
                                ? kTextPrimary
                                : kTextTertiary,
                          ),
                        ),
                      ),
                      if (_selectedDate != null)
                        const Icon(Icons.check_circle, size: 14, color: kNavy),
                    ],
                  ),
                ),
              ),
            ),

            // Show auto-calculated urgency preview once a date is chosen
            if (_selectedDate != null) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 12,
                    color: kTextTertiary,
                  ),
                  const SizedBox(width: 4),
                  Builder(
                    builder: (_) {
                      final tmp = PersonalDeadline(
                        id: '',
                        title: '',
                        dateIso: _toIso(_selectedDate!),
                      );
                      return Text(
                        'Will be marked as: ${UrgencyColors.labelFor(tmp.urgency)}',
                        style: TextStyle(
                          fontSize: 11,
                          color: UrgencyColors.textFor(tmp.urgency),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed:
                      (_saving ||
                          _selectedDate == null ||
                          _titleCtrl.text.trim().isEmpty)
                      ? null
                      : _save,
                  style: FilledButton.styleFrom(backgroundColor: kNavy),
                  child: const Text('Add'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _dialogField(String label, TextEditingController ctrl, String hint) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: kTextPrimary,
        ),
      ),
      const SizedBox(height: 5),
      TextField(
        controller: ctrl,
        style: const TextStyle(fontSize: 13),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: kTextTertiary, fontSize: 13),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 9,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kBorderLight),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kBorderLight),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: kNavy, width: 1.5),
          ),
        ),
      ),
    ],
  );
}
