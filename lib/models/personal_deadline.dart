import 'dart:convert';

class PersonalDeadline {
  final String id;
  final String title;
  final String date;
  final String urgency; // 'urgent' | 'soon' | 'later'

  /// If this deadline is linked to a resource, store its id here.
  /// Tapping the deadline in the panel will open that resource's card.
  final String? resourceId;

  const PersonalDeadline({
    required this.id,
    required this.title,
    required this.date,
    required this.urgency,
    this.resourceId,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'date': date,
    'urgency': urgency,
    'resourceId': resourceId,
  };

  factory PersonalDeadline.fromJson(Map<String, dynamic> j) => PersonalDeadline(
    id: j['id'],
    title: j['title'],
    date: j['date'],
    urgency: j['urgency'],
    resourceId: j['resourceId'],
  );

  static String encodeList(List<PersonalDeadline> list) =>
      jsonEncode(list.map((d) => d.toJson()).toList());

  static List<PersonalDeadline> decodeList(String json) =>
      (jsonDecode(json) as List)
          .map((j) => PersonalDeadline.fromJson(j))
          .toList();
}
