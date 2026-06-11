import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/saved_card.dart';
import '../widgets/tappable.dart';
import '../widgets/resource_detail_modal.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  String _filter =
      'all'; // 'all' | 'competition' | 'ap' | 'research' | 'internship' | 'sat'

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    // Guests can't save anything — show a prompt.
    if (provider.isGuest) {
      return _GuestEmptyState();
    }

    // Build the list of saved resources.
    final savedIds = provider.saved;
    if (savedIds.isEmpty) {
      return _EmptyState();
    }

    // Filter by category chip selection.
    List<Resource> items = allResources
        .where((r) => savedIds.contains(r.id))
        .where((r) => _filter == 'all' || r.category == _filter)
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saved resources',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: kTextPrimary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'Tap the bookmark on any resource to save it here.',
                style: GoogleFonts.inter(fontSize: 12, color: kTextSecondary),
              ),
              const SizedBox(height: 14),
              // Filter chips
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FilterChip(
                      label: 'All',
                      value: 'all',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _FilterChip(
                      label: 'Competitions',
                      value: 'competition',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _FilterChip(
                      label: 'AP Courses',
                      value: 'ap',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _FilterChip(
                      label: 'Research',
                      value: 'research',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _FilterChip(
                      label: 'Internships',
                      value: 'internship',
                      selected: _filter,
                      onTap: (v) => setState(() => _filter = v),
                    ),
                    _FilterChip(
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
        // Card grid
        Expanded(
          child: items.isEmpty
              ? Center(
                  child: Text(
                    'No saved items in this category.',
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
                  itemBuilder: (_, i) {
                    final resource = items[i];
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          if (resource.category == 'ap') {
                            context.read<AppProvider>().navigateTo(
                              'ap_detail',
                              detailId: resource.id,
                            );
                          } else {
                            showResourceDetail(context, resource);
                          }
                        },
                        child: SavedCard(resource: resource),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

// ─── Filter chip ──────────────────────────────────────────────────────────────

class _FilterChip extends StatelessWidget {
  final String label;
  final String value;
  final String selected;
  final void Function(String) onTap;

  const _FilterChip({
    required this.label,
    required this.value,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isOn = selected == value;
    return Tappable(
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
    );
  }
}

// ─── Empty states ─────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.bookmark_border, size: 40, color: kTextTertiary),
          const SizedBox(height: 12),
          Text(
            'Nothing saved yet',
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: kTextPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Browse any section and tap the bookmark icon\nto save resources here.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 13, color: kTextSecondary),
          ),
        ],
      ),
    );
  }
}

class _GuestEmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.lock_outline, size: 40, color: kTextTertiary),
          const SizedBox(height: 12),
          Text(
            'Browsing as guest',
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: kTextPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Log in to save resources, mark favorites,\nand track what you\'ve reviewed.',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(fontSize: 13, color: kTextSecondary),
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
}
