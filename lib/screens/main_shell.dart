import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/resources_data.dart';
import '../providers/app_provider.dart';
import '../widgets/deadline_panel.dart';
import 'saved_screen.dart';
import 'ap_screen.dart';
import 'ap_detail_screen.dart';
import 'field_screen.dart';
import 'resource_list_screen.dart';
import '../widgets/tappable.dart';
import '../data/majors_data.dart';
import 'test_detail_screen.dart';
import 'board_screen.dart';
import 'my_majors_screen.dart';
import 'search_results_screen.dart';
import '../widgets/feedback_form.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        children: [
          // Gold accent strip at the top
          Container(
            height: 3,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [kGold, kGold, kGold]),
            ),
          ),
          // Main layout row: sidebar | content | deadline panel
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _AppSidebar(),
                Container(width: 1, color: kBorderLight),
                const Expanded(child: _ContentAreaWithSearch()),
                Container(width: 1, color: kBorderLight),
                const DeadlinePanel(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Content area ─────────────────────────────────────────────────────────────
// Switches the main view based on provider.currentView.

class _ContentArea extends StatelessWidget {
  const _ContentArea();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 180),
      child: KeyedSubtree(
        key: ValueKey('${provider.currentView}__${provider.detailResourceId}'),
        child: _buildView(provider),
      ),
    );
  }

  Widget _buildView(AppProvider provider) {
    switch (provider.currentView) {
      case 'ap':
        return const ApScreen();
      case 'ap_detail':
        final res = allResources.firstWhere(
          (r) => r.id == provider.detailResourceId,
          orElse: () => allResources.first,
        );
        return ApDetailScreen(resource: res);
      // Removed const modifiers below to prevent constructor errors
      case 'sat':
        return TestDetailScreen(category: 'sat');
      case 'act':
        return TestDetailScreen(category: 'act');
      case 'competition':
        return ResourceListScreen(
          category: 'competition',
          title: 'Competitions',
          icon: Icons.emoji_events,
        );
      case 'research':
        return ResourceListScreen(
          category: 'research',
          title: 'Research',
          icon: Icons.science,
        );
      case 'internship':
        return ResourceListScreen(
          category: 'internship',
          title: 'Internships',
          icon: Icons.work,
        );
      case 'major':
        return FieldScreen(
          majorGroupId: provider.currentMajorGroup ?? 'cs_eng',
          subMajorId: provider.currentSubMajor,
        );
      case 'home':
        return const SavedScreen();
      case 'my_majors':
        return MyMajorsScreen();
      case 'board': // ← Restored missing Board case
        return const BoardScreen();
      default:
        return const SavedScreen();
    }
  }
}

// ─── Sidebar ──────────────────────────────────────────────────────────────────

class _AppSidebar extends StatelessWidget {
  const _AppSidebar();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    return Container(
      width: 200,
      color: kNavy,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SidebarLogo(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _NavItem(
                    icon: Icons.bookmark_outline,
                    label: 'Home',
                    view: 'home',
                    current: provider.currentView,
                  ),
                  _NavItem(
                    icon: Icons.check_box_outlined,
                    label: 'My Majors',
                    view: 'my_majors',
                    current: provider.currentView,
                  ),
                  const _SectionLabel('By category'),
                  _NavItem(
                    icon: Icons.menu_book_outlined,
                    label: 'AP Courses',
                    view: 'ap',
                    current: provider.currentView,
                  ),
                  _NavItem(
                    icon: Icons.edit_outlined,
                    label: 'SAT',
                    view: 'sat',
                    current: provider.currentView,
                  ),
                  _NavItem(
                    icon: Icons.edit_note_outlined,
                    label: 'ACT',
                    view: 'act',
                    current: provider.currentView,
                  ),
                  _NavItem(
                    icon: Icons.emoji_events_outlined,
                    label: 'Competitions',
                    view: 'competition',
                    current: provider.currentView,
                  ),
                  _NavItem(
                    icon: Icons.science_outlined,
                    label: 'Research',
                    view: 'research',
                    current: provider.currentView,
                  ),
                  _NavItem(
                    icon: Icons.work_outline,
                    label: 'Internships',
                    view: 'internship',
                    current: provider.currentView,
                  ),
                  const _SectionLabel('By major'),
                  ...majorGroups.map(
                    (group) => _ExpandableMajorGroup(
                      group: group,
                      provider: provider,
                      currentGroup: provider.currentMajorGroup,
                      currentSubMajor: provider.currentSubMajor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _SidebarFooter(provider: provider),
        ],
      ),
    );
  }
}

// ─── Sidebar: logo block ──────────────────────────────────────────────────────

class _SidebarLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.08)),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              'assets/logo.png',
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'JuniorHub',
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Sidebar: section label ───────────────────────────────────────────────────

class _SectionLabel extends StatelessWidget {
  final String text;
  const _SectionLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 4),
      child: Text(
        text.toUpperCase(),
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8,
          color: kGold.withOpacity(0.65),
        ),
      ),
    );
  }
}

// ─── Sidebar: nav item (icon + label) ────────────────────────────────────────

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String view;
  final String current;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.view,
    required this.current,
  });

  bool get isActive =>
      current == view || (view == 'board' && current == 'ap_detail');

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: () => context.read<AppProvider>().navigateTo(view),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? kGold.withOpacity(0.18) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isActive
              ? const Border(left: BorderSide(color: kGold, width: 2))
              : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isActive ? kGold : Colors.white.withOpacity(0.6),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
                color: isActive ? kGold : Colors.white.withOpacity(0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Sidebar: field nav item (colored dot + label) ───────────────────────────

class _FieldNavItem extends StatelessWidget {
  final String field;
  final String current;

  const _FieldNavItem({required this.field, required this.current});

  bool get isActive => current == field;

  @override
  Widget build(BuildContext context) {
    return Tappable(
      onTap: () => context.read<AppProvider>().navigateTo(field),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? kGold.withOpacity(0.18) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: isActive
              ? const Border(left: BorderSide(color: kGold, width: 2))
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: FieldColors.dotFor(field),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              FieldColors.labelFor(field),
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
                color: isActive ? kGold : Colors.white.withOpacity(0.75),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Sidebar: footer (user info + logout) ────────────────────────────────────

class _SidebarFooter extends StatelessWidget {
  final AppProvider provider;
  const _SidebarFooter({required this.provider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.white.withOpacity(0.08))),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: kGold.withOpacity(0.2),
            child: Text(
              provider.isGuest ? 'G' : provider.displayName[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: kGold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  provider.isGuest ? 'Guest' : provider.displayName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                if (provider.isGuest)
                  Text(
                    'Browsing only',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white.withOpacity(0.45),
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => provider.logout(),
            tooltip: 'Log out',
            icon: Icon(
              Icons.logout,
              size: 16,
              color: Colors.white.withOpacity(0.45),
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}

// ─── Sidebar: expandable major group ─────────────────────────────────────────

class _ExpandableMajorGroup extends StatefulWidget {
  final MajorGroup group;
  final String? currentGroup;
  final String? currentSubMajor;
  final AppProvider provider;

  const _ExpandableMajorGroup({
    required this.group,
    required this.provider,
    this.currentGroup,
    this.currentSubMajor,
  });

  @override
  State<_ExpandableMajorGroup> createState() => _ExpandableMajorGroupState();
}

class _ExpandableMajorGroupState extends State<_ExpandableMajorGroup> {
  bool _open = false;

  bool get isGroupActive => widget.currentGroup == widget.group.id;

  @override
  void didUpdateWidget(_ExpandableMajorGroup old) {
    super.didUpdateWidget(old);
    if (isGroupActive && !_open) setState(() => _open = true);
  }

  @override
  Widget build(BuildContext context) {
    final provider = widget.provider;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              if (_open) {
                setState(() => _open = false);
              } else {
                setState(() => _open = true);
                context.read<AppProvider>().navigateToMajor(widget.group.id);
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                color: isGroupActive && widget.currentSubMajor == null
                    ? kGold.withOpacity(0.18)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: isGroupActive && widget.currentSubMajor == null
                    ? const Border(left: BorderSide(color: kGold, width: 2))
                    : null,
              ),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: widget.group.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.group.label,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: isGroupActive
                            ? FontWeight.w500
                            : FontWeight.normal,
                        color: isGroupActive
                            ? kGold
                            : Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => context
                          .read<AppProvider>()
                          .toggleCheckedMajor(widget.group.id),
                      child: Icon(
                        provider.isMajorChecked(widget.group.id)
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        size: 14,
                        color: provider.isMajorChecked(widget.group.id)
                            ? kGold
                            : Colors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                  Icon(
                    _open ? Icons.expand_less : Icons.expand_more,
                    size: 14,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_open)
          ...widget.group.subcategories.map((sub) {
            final isActive = widget.currentSubMajor == sub.id;
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.read<AppProvider>().navigateToMajor(
                  widget.group.id,
                  subMajorId: sub.id,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 120),
                  margin: const EdgeInsets.only(
                    left: 24,
                    right: 8,
                    top: 1,
                    bottom: 1,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: isActive
                        ? kGold.withOpacity(0.15)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          sub.label,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: isActive
                                ? FontWeight.w500
                                : FontWeight.normal,
                            color: isActive
                                ? kGold
                                : Colors.white.withOpacity(0.55),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => context
                            .read<AppProvider>()
                            .toggleCheckedMajor(sub.id),
                        child: Icon(
                          provider.isMajorChecked(sub.id)
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          size: 12,
                          color: provider.isMajorChecked(sub.id)
                              ? kGold
                              : Colors.white.withOpacity(0.2),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      ],
    );
  }
}

class _ContentAreaWithSearch extends StatelessWidget {
  const _ContentAreaWithSearch();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    return Column(
      children: [
        // Search bar
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: const BoxDecoration(
            color: kSurface,
            border: Border(bottom: BorderSide(color: kBorderLight)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 34,
                  decoration: BoxDecoration(
                    color: kBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kBorderLight),
                  ),
                  child: TextField(
                    onChanged: (q) =>
                        context.read<AppProvider>().setSearchQuery(q),
                    style: const TextStyle(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Search resources, APs, competitions…',
                      hintStyle: const TextStyle(
                        color: kTextTertiary,
                        fontSize: 13,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 16,
                        color: kTextTertiary,
                      ),
                      suffixIcon: provider.isSearching
                          ? MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () =>
                                    context.read<AppProvider>().clearSearch(),
                                child: const Icon(
                                  Icons.close,
                                  size: 14,
                                  color: kTextTertiary,
                                ),
                              ),
                            )
                          : null,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Content (or search results if searching)
        Expanded(
          child: provider.isSearching
              ? SearchResultsScreen(query: provider.searchQuery)
              : const _ContentArea(),
        ),
        // Feedback bar at the very bottom
        const FeedbackBar(),
      ],
    );
  }
}
