import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/saved_card.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});
  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  String _filter = 'all';

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    if (provider.isGuest) {
      return _GuestState();
    }
    if (provider.pinned.isEmpty) {
      return _EmptyState();
    }

    List<Resource> items = allResources
        .where((r) => provider.pinned.contains(r.id))
        .where((r) => _filter == 'all' || r.category == _filter)
        .toList();

    // Seen items sink to bottom
    final notSeen = items.where((r) => !provider.isSeen(r.id)).toList();
    final seenItems = items.where((r) => provider.isSeen(r.id)).toList();
    items = [...notSeen, ...seenItems];

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
                  const Icon(Icons.push_pin, color: kNavy, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    'Board',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: kTextPrimary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                'Your pinned resources — things you\'re actively working on.',
                style: GoogleFonts.inter(fontSize: 12, color: kTextSecondary),
              ),
              const SizedBox(height: 14),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _Chip(
                      label: 'All',
                      value: 'all',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _Chip(
                      label: 'Competitions',
                      value: 'competition',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _Chip(
                      label: 'AP Courses',
                      value: 'ap',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _Chip(
                      label: 'Research',
                      value: 'research',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _Chip(
                      label: 'Internships',
                      value: 'internship',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _Chip(
                      label: 'SAT / ACT',
                      value: 'sat',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Expanded(
          child: items.isEmpty
              ? Center(
                  child: Text(
                    'No pinned items in this category.',
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: kTextTertiary,
                    ),
                  ),
                )
              : GridView.builder(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 340,
                    mainAxisExtent: 220,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: items.length,
                  itemBuilder: (_, i) => SavedCard(resource: items[i]),
                ),
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final String label, value, selected;
  final void Function(String) onTap;
  const _Chip({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isOn = selected == value;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onTap(value),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          margin: const EdgeInsets.only(right: 6),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: isOn ? kNavy : kSurface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: isOn ? kNavy : kBorderLight),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: isOn ? FontWeight.w500 : FontWeight.normal,
              color: isOn ? Colors.white : kTextSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.push_pin_outlined, size: 40, color: kTextTertiary),
        const SizedBox(height: 12),
        Text(
          'Nothing pinned yet',
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: kTextPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Tap the pin icon on any resource to add it here.',
          style: GoogleFonts.inter(fontSize: 13, color: kTextSecondary),
        ),
      ],
    ),
  );
}

class _GuestState extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.lock_outline, size: 40, color: kTextTertiary),
        const SizedBox(height: 12),
        Text(
          'Log in to use the Board',
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: kTextPrimary,
          ),
        ),
        const SizedBox(height: 18),
        FilledButton(
          onPressed: () => context.read<AppProvider>().logout(),
          style: FilledButton.styleFrom(backgroundColor: kNavy),
          child: const Text('Log in'),
        ),
      ],
    ),
  );
}
