import 'dart:convert';

class PersonalDeadline {
  final String id;
  final String title;

  /// Date stored as ISO-8601: "2025-12-15".
  /// Always use this format — it's the only way to do date math reliably.
  final String dateIso;

  /// Optional link back to a Resource so tapping it opens the resource card.
  final String? resourceId;

  const PersonalDeadline({
    required this.id,
    required this.title,
    required this.dateIso,
    this.resourceId,
  });

  // ── Computed properties (recalculated fresh every time they're read) ───────

  DateTime get _parsed {
    try {
      return DateTime.parse(dateIso);
    } catch (_) {
      return DateTime.now().add(const Duration(days: 999));
    }
  }

  /// Days until this deadline from today. Negative if already past.
  int get daysUntil {
    final today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );
    final target = DateTime(_parsed.year, _parsed.month, _parsed.day);
    return target.difference(today).inDays;
  }

  bool get isExpired => daysUntil < 0;

  /// Urgency is auto-calculated — never stored.
  String get urgency {
    final d = daysUntil;
    if (d < 0) return 'past';
    if (d <= 30) return 'urgent';
    if (d <= 90) return 'soon';
    return 'later';
  }

  /// Human-readable date: "Dec 15, 2025"
  String get displayDate {
    const months = [
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
    final d = _parsed;
    return '${months[d.month - 1]} ${d.day}, ${d.year}';
  }

  // ── Serialisation ─────────────────────────────────────────────────────────

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'dateIso': dateIso,
    'resourceId': resourceId,
  };

  factory PersonalDeadline.fromJson(Map<String, dynamic> j) {
    // Handle old format where date was stored as a human-readable string
    // and urgency was a separate field — gracefully fall back.
    final rawDate = j['dateIso'] as String?;
    String iso;
    if (rawDate != null && rawDate.contains('-')) {
      iso = rawDate; // already ISO
    } else {
      // Old format or missing — default 30 days from now
      final fallback = DateTime.now().add(const Duration(days: 30));
      iso =
          '${fallback.year}-${fallback.month.toString().padLeft(2, '0')}-${fallback.day.toString().padLeft(2, '0')}';
    }
    return PersonalDeadline(
      id: j['id'] as String,
      title: j['title'] as String,
      dateIso: iso,
      resourceId: j['resourceId'] as String?,
    );
  }

  static String encodeList(List<PersonalDeadline> list) =>
      jsonEncode(list.map((d) => d.toJson()).toList());

  static List<PersonalDeadline> decodeList(String json) =>
      (jsonDecode(json) as List)
          .map((j) => PersonalDeadline.fromJson(j as Map<String, dynamic>))
          .toList();
}
