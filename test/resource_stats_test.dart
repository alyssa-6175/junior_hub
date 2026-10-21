import 'package:flutter_test/flutter_test.dart';
import 'package:junior_hub/data/resources_data.dart';
import 'package:junior_hub/models/resource_stats.dart';

void main() {
  group('ResourceStats', () {
    test('derives every unique count from its UID list', () {
      final stats = ResourceStats.fromMap('resource-1', {
        'title': 'Example resource',
        'category': 'internship',
        'totalViews': 9,
        'viewerUids': ['viewer-b', 'viewer-a', 'viewer-a'],
        'savedUids': ['saved-a'],
        'pinnedUids': ['pinned-a', 'pinned-b'],
        'seenUids': ['seen-a'],
      });

      expect(stats.totalViews, 9);
      expect(stats.viewerUids, ['viewer-a', 'viewer-b']);
      expect(stats.uniqueViewerCount, 2);
      expect(stats.savedCount, 1);
      expect(stats.pinnedCount, 2);
      expect(stats.seenCount, 1);
    });

    test('safely upgrades a legacy view-only record', () {
      final stats = ResourceStats.fromMap('legacy-resource', {
        'totalViews': 1,
        'uniqueViewerCount': 99,
        'viewerUids': ['viewer-a', 'viewer-b'],
        'viewerEmails': ['legacy@example.com'],
      });

      expect(stats.title, 'legacy-resource');
      expect(stats.totalViews, 2);
      expect(stats.uniqueViewerCount, 2);
      expect(stats.savedUids, isEmpty);
      expect(stats.pinnedUids, isEmpty);
      expect(stats.seenUids, isEmpty);
    });
  });

  test('every catalog resource can be represented by the stats schema', () {
    const allowedCategories = {
      'act',
      'ap',
      'competition',
      'dual_credit',
      'internship',
      'research',
      'sat',
    };
    final ids = <String>{};

    for (final resource in allResources) {
      expect(resource.id, isNotEmpty);
      expect(resource.id.length, lessThanOrEqualTo(120));
      expect(resource.id.contains('/'), isFalse);
      expect(ids.add(resource.id), isTrue, reason: 'Duplicate ${resource.id}');
      expect(resource.title, isNotEmpty);
      expect(resource.title.length, lessThanOrEqualTo(300));
      expect(allowedCategories, contains(resource.category));
    }
  });
}
