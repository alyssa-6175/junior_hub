import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../models/personal_deadline.dart';
import '../providers/app_provider.dart';
import '../widgets/resource_detail_modal.dart';
import '../data/resources_data.dart';

class DeadlinePanel extends StatefulWidget {
  const DeadlinePanel({super.key});
  @override
  State<DeadlinePanel> createState() => _DeadlinePanelState();
}

class _DeadlinePanelState extends State<DeadlinePanel> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    // Clear expired deadlines on every build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) context.read<AppProvider>().removeExpiredDeadlines();
    });

    return Container(
      width: 210,
      color: kSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 10, 10),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  size: 13,
                  color: kTextSecondary,
                ),
                const SizedBox(width: 5),
                Text(
                  'My Deadlines',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kTextPrimary,
                  ),
                ),
              ],
            ),
          ),
          Container(height: 1, color: kBorderLight),
          // Personal deadlines list
          Expanded(child: _PersonalList(deadlines: provider.personalDeadlines)),
          // Footer
          Container(height: 1, color: kBorderLight),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => showDialog(
                context: context,
                builder: (_) => const _AddDeadlineDialog(),
              ),
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
                      'Add deadline',
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

    final iso = _toIso(_selectedDate!);

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
