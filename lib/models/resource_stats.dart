enum ResourceStatAction { view, save, pin, seen }

class ResourceStats {
  final String id;
  final String title;
  final String category;
  final int totalViews;
  final List<String> viewerUids;
  final List<String> savedUids;
  final List<String> pinnedUids;
  final List<String> seenUids;

  const ResourceStats({
    required this.id,
    required this.title,
    required this.category,
    required this.totalViews,
    required this.viewerUids,
    required this.savedUids,
    required this.pinnedUids,
    required this.seenUids,
  });

  int get uniqueViewerCount => viewerUids.length;
  int get savedCount => savedUids.length;
  int get pinnedCount => pinnedUids.length;
  int get seenCount => seenUids.length;

  factory ResourceStats.fromMap(String documentId, Map<String, dynamic> data) {
    List<String> uidList(String field) {
      final value = data[field];
      if (value is! List) return const [];
      return value.whereType<String>().toSet().toList()..sort();
    }

    final viewers = uidList('viewerUids');
    final rawViews = data['totalViews'];
    final totalViews = rawViews is int ? rawViews : viewers.length;

    return ResourceStats(
      id: documentId,
      title: data['title'] is String && (data['title'] as String).isNotEmpty
          ? data['title'] as String
          : documentId,
      category: data['category'] is String
          ? data['category'] as String
          : 'unknown',
      totalViews: totalViews < viewers.length ? viewers.length : totalViews,
      viewerUids: viewers,
      savedUids: uidList('savedUids'),
      pinnedUids: uidList('pinnedUids'),
      seenUids: uidList('seenUids'),
    );
  }
}
