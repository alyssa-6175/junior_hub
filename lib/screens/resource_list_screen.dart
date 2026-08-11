import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../data/majors_data.dart';
import '../data/resources_data.dart';
import '../models/resource.dart';
import '../providers/app_provider.dart';
import '../widgets/resource_tile.dart';

class ResourceListScreen extends StatefulWidget {
  final String category;
  final String title;
  final IconData icon;

  const ResourceListScreen({
    super.key,
    required this.category,
    required this.title,
    required this.icon,
  });

  @override
  State<ResourceListScreen> createState() => _ResourceListScreenState();
}

class _ResourceListScreenState extends State<ResourceListScreen> {
  int _tab = 1; // Default to the full list
  String? _majorFilter;
  String _collegeCourseType = 'independent';
  String? _collegeCourseTermFilter;

  static const _collegeCourseTerms = [
    ('summer', 'Summer'),
    ('school_year', 'School Year'),
    ('self_paced', 'Self-Paced'),
  ];

  static const _competitionSubjects = [
    ('cs_eng', 'Computer Science & Engineering'),
    ('math', 'Mathematics'),
    ('science', 'Science'),
    ('business', 'Business & Economics'),
    ('humanities', 'Humanities & Social Sciences'),
  ];

  bool _matchesCompetitionSubject(Resource resource, String subject) {
    switch (subject) {
      case 'cs_eng':
        return resource.field == 'cs' || resource.field == 'engineering';
      case 'math':
        return resource.field == 'math';
      case 'science':
        return const {
          'science',
          'biology',
          'chemistry',
          'physics',
        }.contains(resource.field);
      case 'business':
        return resource.field == 'business';
      case 'humanities':
        return resource.field == 'humanities';
      default:
        return false;
    }
  }

  List<Resource> _sorted(
    List<Resource> items,
    Set<String> pinned,
    Set<String> seen,
  ) {
    int compareResources(Resource a, Resource b) {
      final scopeCompare = _scopeRank(a).compareTo(_scopeRank(b));
      if (scopeCompare != 0) return scopeCompare;
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    }

    final starred = items.where((r) => pinned.contains(r.id)).toList()
      ..sort(compareResources);
    final remaining = items.where((r) => !pinned.contains(r.id)).toList()
      ..sort(compareResources);
    return [...starred, ...remaining];
  }

  int _scopeRank(Resource resource) {
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
      'shoreline',
      'lynnwood',
      'edmonds',
      'auburn',
      'des moines',
    ].any(location.contains);
    if (resource.scope == 'local' && isNearby) return 0;
    if (resource.scope == 'regional' || resource.scope == 'state') return 1;
    return 2;
  }

  void _showOutreachTemplates() {
    final isResearch = widget.category == 'research';
    final templates = isResearch
        ? const [
            (
              'Professor or lab introduction',
              '''Subject: High school student interested in [specific research area]

Hello Professor [Last Name],

My name is [Name], and I am a [grade] student at [school]. I found your work on [specific topic] while learning more about [field], and I was especially interested in [one real detail from their work].

I have experience with [two relevant skills, classes, or projects], and I can commit [honest weekly availability] from [start date] through [end date]. Would you be open to a short conversation about whether I could help with literature review, data cleanup, coding, lab preparation, or another age-appropriate task?

I attached a one-page resume for context. Thank you for considering it, and I completely understand if your lab cannot take on a high school student right now

Best,
[Name]
[Email] | [Phone, optional]''',
            ),
            (
              'Research follow-up',
              '''Subject: Following up on my research inquiry

Hello Professor [Last Name],

I wanted to follow up on the note I sent on [date] about possibly helping with your work on [topic]. I am still very interested and would be glad to start with a small, clearly defined task.

If there is someone else in your lab or department I should contact, I would really appreciate a referral. Thank you again for your time

Best,
[Name]''',
            ),
            (
              'Gentle follow-up',
              '''Subject: Following up on [research topic or request]

Hi [Name],

I hope you’re doing well. I wanted to follow up on my previous message regarding [briefly restate your research topic or request]. I understand you may have a busy schedule, but I’d really appreciate any insight or guidance you might be able to share.

If it’s easier, I’d be happy to work around your availability or connect briefly at a time that’s convenient for you.

Thank you again for your time and consideration. I look forward to hearing from you!

Best regards,
Alyssa''',
            ),
          ]
        : const [
            (
              'Local organization internship pitch',
              '''Subject: Student internship or project inquiry for [season]

Hello [Name or Organization Team],

My name is [Name], and I am a [grade] student at [school]. I admire your work on [specific program, event, or community goal], and I would love to contribute during [dates].

I can help with [two or three useful tasks, such as event support, social media, research, spreadsheets, outreach, translation, or basic coding]. I am available [schedule] and can commit for [number] weeks. Would your team be open to a student internship, job shadow, or small project built around a current need?

I attached a one-page resume and would be happy to speak for 15 minutes. Thank you for considering it

Best,
[Name]
[Email] | [Phone, optional]''',
            ),
            (
              'Internship follow-up',
              '''Subject: Following up on my student internship inquiry

Hello [Name],

I wanted to follow up on the message I sent on [date] about helping with [organization or project]. I remain interested and can be flexible about the role, schedule, and whether the opportunity is paid, volunteer, or project-based.

Please let me know if there is a better person to contact. Thank you again for your time

Best,
[Name]''',
            ),
            (
              'Gentle follow-up',
              '''Subject: Following up on [internship or request]

Hi [Name],

I hope you’re doing well. I wanted to follow up on my previous message regarding [briefly restate your research topic or request]. I understand you may have a busy schedule, but I’d really appreciate any insight or guidance you might be able to share.

If it’s easier, I’d be happy to work around your availability or connect briefly at a time that’s convenient for you.

Thank you again for your time and consideration. I look forward to hearing from you!

Best regards,
Alyssa''',
            ),
          ];

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.78,
        maxChildSize: 0.92,
        minChildSize: 0.5,
        builder: (_, controller) => ListView(
          controller: controller,
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 24),
          children: [
            Text(
              isResearch
                  ? 'Research cold email templates'
                  : 'Internship cold email templates',
              style: GoogleFonts.inter(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: kTextPrimary,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Personalize every bracketed section. A short specific email is much stronger than sending the same message everywhere',
              style: GoogleFonts.inter(
                fontSize: 11,
                height: 1.4,
                color: kTextSecondary,
              ),
            ),
            const SizedBox(height: 12),
            ...templates.map(
              (template) =>
                  _EmailTemplateCard(title: template.$1, body: template.$2),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final pinned = provider.pinned;
    final seen = provider.seen;

    var items = resourcesByCategory(widget.category);
    if (widget.category == 'dual_credit') {
      items = items
          .where((r) => r.collegeCourseType == _collegeCourseType)
          .toList();
      if (_collegeCourseTermFilter != null) {
        items = items
            .where((r) => r.courseTermTags.contains(_collegeCourseTermFilter))
            .toList();
      }
    }
    if (_majorFilter != null && widget.category == 'competition') {
      items = items
          .where((r) => _matchesCompetitionSubject(r, _majorFilter!))
          .toList();
    } else if (_majorFilter != null && widget.category != 'dual_credit') {
      items = items
          .where((r) => resourceMatchesMajor(r, _majorFilter!))
          .toList();
    }
    final allSorted = _sorted(items, pinned, seen);
    final boardItems = allSorted.where((r) => pinned.contains(r.id)).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title row + Starred/All selector inline on the right
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    widget.icon,
                    size: 18,
                    color: CategoryColors.textFor(widget.category),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kTextPrimary,
                        ),
                      ),
                      Text(
                        '${allSorted.length} resources',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: kTextSecondary,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (widget.category == 'dual_credit') ...[
                    _InlineTab(
                      label: 'Independent',
                      active: _collegeCourseType == 'independent',
                      onTap: () => setState(() {
                        _collegeCourseType = 'independent';
                        _collegeCourseTermFilter = null;
                      }),
                    ),
                    const SizedBox(width: 2),
                    _InlineTab(
                      label: 'Counselor',
                      active: _collegeCourseType == 'counselor',
                      onTap: () => setState(() {
                        _collegeCourseType = 'counselor';
                        _collegeCourseTermFilter = null;
                      }),
                    ),
                    const SizedBox(width: 8),
                  ],
                  // Inline tab selector (Starred | All resources)
                  _InlineTab(
                    icon: Icons.star_border,
                    label: 'Starred',
                    count: boardItems.length,
                    active: _tab == 0,
                    onTap: () => setState(() => _tab = 0),
                  ),
                  const SizedBox(width: 2),
                  _InlineTab(
                    label: 'All',
                    active: _tab == 1,
                    onTap: () => setState(() => _tab = 1),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _MajorChip(
                      label: 'All',
                      active: widget.category == 'dual_credit'
                          ? _collegeCourseTermFilter == null
                          : _majorFilter == null,
                      color: kNavy,
                      onTap: () => setState(() {
                        if (widget.category == 'dual_credit') {
                          _collegeCourseTermFilter = null;
                        } else {
                          _majorFilter = null;
                        }
                      }),
                    ),
                    ...(widget.category == 'dual_credit'
                            ? _collegeCourseTerms.map(
                                (term) => MajorGroup(
                                  id: term.$1,
                                  label: term.$2,
                                  color: CategoryColors.textFor('dual_credit'),
                                  subcategories: const [],
                                ),
                              )
                            : widget.category == 'competition'
                            ? _competitionSubjects.map(
                                (subject) => MajorGroup(
                                  id: subject.$1,
                                  label: subject.$2,
                                  color: subject.$1 == 'science'
                                      ? const Color(0xFF1D9E75)
                                      : subject.$1 == 'cs_eng'
                                      ? const Color(0xFF534AB7)
                                      : kNavy,
                                  subcategories: const [],
                                ),
                              )
                            : majorGroups)
                        .map(
                          (g) => _MajorChip(
                            label: g.label,
                            active: widget.category == 'dual_credit'
                                ? _collegeCourseTermFilter == g.id
                                : _majorFilter == g.id,
                            color: g.color,
                            onTap: () => setState(() {
                              if (widget.category == 'dual_credit') {
                                _collegeCourseTermFilter =
                                    _collegeCourseTermFilter == g.id
                                    ? null
                                    : g.id;
                              } else {
                                _majorFilter = _majorFilter == g.id
                                    ? null
                                    : g.id;
                              }
                            }),
                          ),
                        ),
                  ],
                ),
              ),
              if (widget.category == 'research' ||
                  widget.category == 'internship') ...[
                const SizedBox(height: 3),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: _showOutreachTemplates,
                    icon: const Icon(Icons.mail_outline, size: 14),
                    label: const Text('Cold email templates'),
                    style: TextButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 4),
        Expanded(
          child: IndexedStack(
            index: _tab,
            children: [
              // Starred
              boardItems.isEmpty
                  ? Center(
                      child: Text(
                        'Nothing starred yet.',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          color: kTextTertiary,
                        ),
                      ),
                    )
                  : _ListView(items: boardItems),
              // All
              _ListView(items: allSorted),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmailTemplateCard extends StatelessWidget {
  final String title;
  final String body;

  const _EmailTemplateCard({required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: kBorderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: kTextPrimary,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: body));
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Template copied')),
                  );
                },
                icon: const Icon(Icons.copy_outlined, size: 13),
                label: const Text('Copy'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          SelectableText(
            body,
            style: GoogleFonts.inter(
              fontSize: 11,
              height: 1.45,
              color: kTextSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListView extends StatelessWidget {
  final List<Resource> items;
  const _ListView({required this.items});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Center(
        child: Text(
          'No resources match.',
          style: GoogleFonts.inter(fontSize: 13, color: kTextTertiary),
        ),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 6),
      itemBuilder: (_, i) => ResourceTile(resource: items[i]),
    );
  }
}

class _MajorChip extends StatelessWidget {
  final String label;
  final bool active;
  final Color color;
  final VoidCallback onTap;

  const _MajorChip({
    required this.label,
    required this.active,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 130),
          margin: const EdgeInsets.only(right: 6, bottom: 4),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: active ? color.withValues(alpha: 0.12) : kSurface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: active ? color : kBorderLight),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              color: active ? color : kTextSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _InlineTab extends StatelessWidget {
  final String label;
  final bool active;
  final IconData? icon;
  final int count;
  final VoidCallback onTap;

  const _InlineTab({
    required this.label,
    required this.active,
    this.icon,
    this.count = 0,
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: active ? kNavy : kBackground,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: active ? kNavy : kBorderLight),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  size: 11,
                  color: active ? Colors.white : kTextSecondary,
                ),
                const SizedBox(width: 4),
              ],
              Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: active ? FontWeight.w500 : FontWeight.normal,
                  color: active ? Colors.white : kTextSecondary,
                ),
              ),
              if (count > 0) ...[
                const SizedBox(width: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 1,
                  ),
                  decoration: BoxDecoration(
                    color: active
                        ? Colors.white.withValues(alpha: 0.25)
                        : kGold.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w600,
                      color: active ? Colors.white : kGold,
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
