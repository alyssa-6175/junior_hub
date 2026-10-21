import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../app_colors.dart';
import '../models/resource_stats.dart';
import '../providers/app_provider.dart';

class ActivityDashboardScreen extends StatefulWidget {
  const ActivityDashboardScreen({super.key});

  @override
  State<ActivityDashboardScreen> createState() =>
      _ActivityDashboardScreenState();
}

class _ActivityDashboardScreenState extends State<ActivityDashboardScreen> {
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      context.read<AppProvider>().synchronizeResourceStatsCatalog();
    });
  }

  String get _dayKey {
    final month = _selectedDay.month.toString().padLeft(2, '0');
    final day = _selectedDay.day.toString().padLeft(2, '0');
    return '${_selectedDay.year}-$month-$day';
  }

  Future<void> _pickDay() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: _selectedDay,
      firstDate: DateTime(2025),
      lastDate: DateTime.now(),
    );
    if (selected != null) setState(() => _selectedDay = selected);
  }

  @override
  Widget build(BuildContext context) {
    final isAdmin = context.watch<AppProvider>().isAdmin;
    if (!isAdmin) {
      return const _AccessDenied();
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(28, 26, 28, 40),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1040),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity dashboard',
              style: GoogleFonts.inter(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: kNavy,
              ),
            ),
            const SizedBox(height: 7),
            const Text(
              'See who is using Junior Hub, their most recent action, and the students active on a selected day.',
              style: TextStyle(color: kTextSecondary, fontSize: 14),
            ),
            const SizedBox(height: 24),
            _DailyActivityCard(dayKey: _dayKey, onChooseDay: _pickDay),
            const SizedBox(height: 22),
            const _ResourceStatsCard(),
            const SizedBox(height: 22),
            const _RecentActivityCard(),
          ],
        ),
      ),
    );
  }
}

class _ResourceStatsCard extends StatefulWidget {
  const _ResourceStatsCard();

  @override
  State<_ResourceStatsCard> createState() => _ResourceStatsCardState();
}

class _ResourceStatsCardState extends State<_ResourceStatsCard> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('resourceStats')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const _DataError();
          if (!snapshot.hasData) return const _LoadingCard();

          final allStats =
              snapshot.data!.docs
                  .map((doc) => ResourceStats.fromMap(doc.id, doc.data()))
                  .toList()
                ..sort((a, b) {
                  final byViews = b.uniqueViewerCount.compareTo(
                    a.uniqueViewerCount,
                  );
                  return byViews != 0
                      ? byViews
                      : a.title.toLowerCase().compareTo(b.title.toLowerCase());
                });
          final normalizedQuery = _query.trim().toLowerCase();
          final stats = normalizedQuery.isEmpty
              ? allStats
              : allStats
                    .where(
                      (item) =>
                          item.title.toLowerCase().contains(normalizedQuery) ||
                          item.id.toLowerCase().contains(normalizedQuery) ||
                          item.category.toLowerCase().contains(normalizedQuery),
                    )
                    .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.insights_outlined, color: kNavy),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Resource stats',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: kNavy,
                      ),
                    ),
                  ),
                  Text(
                    '${allStats.length} resources',
                    style: const TextStyle(color: kTextSecondary),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'Unique viewers and the accounts currently saving, pinning, or marking each resource as seen.',
                style: TextStyle(color: kTextSecondary),
              ),
              const SizedBox(height: 14),
              TextField(
                onChanged: (value) => setState(() => _query = value),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, size: 20),
                  hintText: 'Find a resource or category',
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              if (allStats.isEmpty)
                const _EmptyState(
                  'No resource stats are available yet. The catalog sync may still be running.',
                )
              else if (stats.isEmpty)
                const _EmptyState('No resources match that search.')
              else
                Container(
                  height: 560,
                  decoration: BoxDecoration(
                    border: Border.all(color: kBorderLight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.separated(
                    itemCount: stats.length,
                    separatorBuilder: (_, _) =>
                        const Divider(height: 1, color: kBorderLight),
                    itemBuilder: (context, index) =>
                        _ResourceStatsRow(stats: stats[index]),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _ResourceStatsRow extends StatelessWidget {
  final ResourceStats stats;

  const _ResourceStatsRow({required this.stats});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      dense: true,
      title: Text(
        stats.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text('${stats.category} · ${stats.id}'),
      trailing: Wrap(
        spacing: 12,
        children: [
          _StatCount(label: 'Viewed', value: stats.uniqueViewerCount),
          _StatCount(label: 'Saved', value: stats.savedCount),
          _StatCount(label: 'Pinned', value: stats.pinnedCount),
          _StatCount(label: 'Seen', value: stats.seenCount),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total opens: ${stats.totalViews}'),
              const SizedBox(height: 8),
              _UidList(label: 'Viewer user IDs', values: stats.viewerUids),
              _UidList(label: 'Saved by user IDs', values: stats.savedUids),
              _UidList(label: 'Pinned by user IDs', values: stats.pinnedUids),
              _UidList(label: 'Seen by user IDs', values: stats.seenUids),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatCount extends StatelessWidget {
  final String label;
  final int value;

  const _StatCount({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('$value', style: const TextStyle(fontWeight: FontWeight.w700)),
        Text(label, style: const TextStyle(fontSize: 10, color: kTextTertiary)),
      ],
    );
  }
}

class _UidList extends StatelessWidget {
  final String label;
  final List<String> values;

  const _UidList({required this.label, required this.values});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: SelectableText(
        '$label: ${values.isEmpty ? 'None' : values.join(', ')}',
        style: const TextStyle(fontSize: 12, color: kTextSecondary),
      ),
    );
  }
}

class _DailyActivityCard extends StatelessWidget {
  final String dayKey;
  final VoidCallback onChooseDay;

  const _DailyActivityCard({required this.dayKey, required this.onChooseDay});

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('dailyActivity')
            .where('day', isEqualTo: dayKey)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const _DataError();
          if (!snapshot.hasData) return const _LoadingCard();

          final entries = snapshot.data!.docs.toList()
            ..sort(
              (a, b) => _compareTimestamps(
                b.data()['lastActionAt'],
                a.data()['lastActionAt'],
              ),
            );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.today_outlined, color: kNavy),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'Daily active users',
                      style: GoogleFonts.inter(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: kNavy,
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: onChooseDay,
                    icon: const Icon(Icons.calendar_month_outlined, size: 17),
                    label: Text(_readableDay(dayKey)),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                '${entries.length} ${entries.length == 1 ? 'person' : 'people'} performed an action.',
                style: const TextStyle(color: kTextSecondary),
              ),
              const SizedBox(height: 14),
              if (entries.isEmpty)
                const _EmptyState('No recorded activity for this day yet.')
              else
                ...entries.map(
                  (entry) => _ActivityRow(
                    email: _email(entry.data(), entry.id),
                    action:
                        entry.data()['lastAction'] as String? ??
                        'Used Junior Hub',
                    timestamp: _timestamp(entry.data()['lastActionAt']),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _RecentActivityCard extends StatelessWidget {
  const _RecentActivityCard();

  @override
  Widget build(BuildContext context) {
    return _DashboardCard(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const _DataError();
          if (!snapshot.hasData) return const _LoadingCard();

          final users = snapshot.data!.docs.toList()
            ..sort(
              (a, b) => _compareTimestamps(
                b.data()['lastActiveAt'],
                a.data()['lastActiveAt'],
              ),
            );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.history_outlined, color: kNavy),
                  const SizedBox(width: 10),
                  Text(
                    'Most recent activity',
                    style: GoogleFonts.inter(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: kNavy,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Students who used Junior Hub most recently. Older accounts show an email after their next action.',
                style: TextStyle(color: kTextSecondary),
              ),
              const SizedBox(height: 14),
              if (users.isEmpty)
                const _EmptyState('No user activity has been recorded yet.')
              else
                ...users
                    .take(100)
                    .map(
                      (user) => _ActivityRow(
                        email: _email(user.data(), user.id),
                        action:
                            user.data()['lastAction'] as String? ??
                            'No activity recorded yet',
                        timestamp: _timestamp(user.data()['lastActiveAt']),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final Widget child;

  const _DashboardCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: kBorderLight),
      ),
      child: child,
    );
  }
}

class _ActivityRow extends StatelessWidget {
  final String email;
  final String action;
  final DateTime? timestamp;

  const _ActivityRow({
    required this.email,
    required this.action,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: kBorderLight)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: kGoldLight,
            child: Icon(Icons.person_outline, size: 18, color: kNavy),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  email,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kTextPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(action, style: const TextStyle(color: kTextSecondary)),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text(
            _readableTimestamp(timestamp),
            textAlign: TextAlign.right,
            style: const TextStyle(color: kTextTertiary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) => const SizedBox(
    height: 96,
    child: Center(child: CircularProgressIndicator()),
  );
}

class _DataError extends StatelessWidget {
  const _DataError();

  @override
  Widget build(BuildContext context) => const _EmptyState(
    'Activity data could not load. Confirm this account has the administrator claim.',
  );
}

class _EmptyState extends StatelessWidget {
  final String text;

  const _EmptyState(this.text);

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Text(text, style: const TextStyle(color: kTextSecondary)),
  );
}

class _AccessDenied extends StatelessWidget {
  const _AccessDenied();

  @override
  Widget build(BuildContext context) => const Center(
    child: Text('This page is only available to Junior Hub administrators.'),
  );
}

DateTime? _timestamp(dynamic value) =>
    value is Timestamp ? value.toDate().toLocal() : null;

int _compareTimestamps(dynamic first, dynamic second) {
  final epoch = DateTime.fromMillisecondsSinceEpoch(0);
  return (_timestamp(first) ?? epoch).compareTo(_timestamp(second) ?? epoch);
}

String _email(Map<String, dynamic> data, String fallbackId) {
  final email = data['email'] as String?;
  return email == null || email.isEmpty ? 'Email pending · $fallbackId' : email;
}

String _readableDay(String day) {
  final parsed = DateTime.tryParse(day);
  if (parsed == null) return day;
  return '${parsed.month.toString().padLeft(2, '0')}/${parsed.day.toString().padLeft(2, '0')}/${parsed.year}';
}

String _readableTimestamp(DateTime? timestamp) {
  if (timestamp == null) return 'Not recorded';
  final hour = timestamp.hour % 12 == 0 ? 12 : timestamp.hour % 12;
  final minute = timestamp.minute.toString().padLeft(2, '0');
  final suffix = timestamp.hour >= 12 ? 'PM' : 'AM';
  return '${timestamp.month.toString().padLeft(2, '0')}/${timestamp.day.toString().padLeft(2, '0')}/${timestamp.year}\n$hour:$minute $suffix';
}
