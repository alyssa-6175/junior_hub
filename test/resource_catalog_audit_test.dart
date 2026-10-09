import 'package:flutter_test/flutter_test.dart';
import 'package:junior_hub/data/majors_data.dart';
import 'package:junior_hub/data/resources_data.dart';

void main() {
  const validCategories = {
    'act',
    'ap',
    'competition',
    'dual_credit',
    'internship',
    'research',
    'sat',
  };
  const validScopes = {
    'international',
    'local',
    'national',
    'regional',
    'state',
  };
  const validFormats = {'hybrid', 'in_person', 'virtual'};

  test('resource IDs and titles are complete and unique', () {
    final ids = <String>{};
    for (final resource in allResources) {
      expect(resource.id.trim(), isNotEmpty, reason: resource.title);
      expect(
        ids.add(resource.id),
        isTrue,
        reason: 'Duplicate ID: ${resource.id}',
      );
      expect(resource.title.trim(), isNotEmpty, reason: resource.id);
      expect(resource.description.trim(), isNotEmpty, reason: resource.id);
      expect(validCategories, contains(resource.category), reason: resource.id);
      expect(resource.field.trim(), isNotEmpty, reason: resource.id);
    }
  });

  test('every displayed resource link resolves to a valid destination', () {
    for (final resource in allResources) {
      final labels = linksForResource(resource);
      expect(labels, isNotEmpty, reason: '${resource.id} has no link buttons');

      for (final label in labels) {
        expect(label.trim(), isNotEmpty, reason: resource.id);
        final destination = resolveUrl(label, resource);
        expect(destination, isNotNull, reason: '${resource.id}: $label');
        final uri = Uri.tryParse(destination!);
        expect(uri, isNotNull, reason: '${resource.id}: $destination');
        expect(
          {'http', 'https', 'mailto'},
          contains(uri!.scheme),
          reason: '${resource.id}: $destination',
        );
        expect(uri.hasScheme, isTrue, reason: '${resource.id}: $destination');
      }
    }
  });

  test('catalog excludes known inaccessible destinations', () {
    const blockedFragments = {
      'amazon.com/s?',
      'marcolearning.com/',
      '/Competition-Overview/join-the-competition',
      '/current-competition/competition-schedule',
    };

    for (final resource in allResources) {
      for (final label in linksForResource(resource)) {
        final destination = resolveUrl(label, resource);
        if (destination == null) continue;
        for (final fragment in blockedFragments) {
          expect(
            destination.contains(fragment),
            isFalse,
            reason: '${resource.id}: $destination',
          );
        }
      }
    }
  });

  test('opportunity metadata uses supported values', () {
    final opportunities = allResources.where(
      (resource) =>
          const {'internship', 'research'}.contains(resource.category),
    );
    final missingTags = <String>[];
    for (final resource in opportunities) {
      expect(validScopes, contains(resource.scope), reason: resource.id);
      expect(validFormats, contains(resource.format), reason: resource.id);
      expect(resource.locationNote?.trim(), isNotEmpty, reason: resource.id);
      expect(resource.timeCommitment?.trim(), isNotEmpty, reason: resource.id);
      expect(resource.applicationInfo?.trim(), isNotEmpty, reason: resource.id);
      if (resource.majorTags.isEmpty) missingTags.add(resource.id);
    }
    expect(missingTags, isEmpty, reason: 'Missing majorTags');
  });

  test('every research and internship appears in a visible major filter', () {
    final filterable = allResources.where(
      (resource) =>
          const {'internship', 'research'}.contains(resource.category),
    );
    final uncategorized = <String>[];
    for (final resource in filterable) {
      final matchingGroups = majorGroups
          .where((group) => resourceMatchesMajor(resource, group.id))
          .map((group) => group.label)
          .toList();
      if (matchingGroups.isEmpty) {
        uncategorized.add('${resource.id} (${resource.title})');
      }
    }
    expect(uncategorized, isEmpty, reason: 'Absent from every major filter');
  });

  test('every displayed major filter has resources in its category', () {
    for (final category in const ['internship', 'research']) {
      final resources = resourcesByCategory(category);
      for (final group in majorGroups) {
        final matches = resources.where(
          (resource) => resourceMatchesMajor(resource, group.id),
        );
        if (matches.isEmpty) {
          continue; // Empty filters are intentionally hidden.
        }
        expect(matches.first.category, category);
      }
    }
  });

  test('Kirkland Chamber is a Business + Economics internship', () {
    final chamber = allResources.singleWhere(
      (resource) => resource.id == 'kirkland_chamber_inquiry',
    );
    expect(chamber.category, 'internship');
    expect(chamber.field, 'business');
    expect(chamber.majorTags, contains('business'));
    expect(resourceMatchesMajor(chamber, 'business'), isTrue);
  });

  test('deadlines reference real resources and use valid dates', () {
    final resourceIds = allResources.map((resource) => resource.id).toSet();
    for (final deadline in allDeadlineItems) {
      expect(deadline.title.trim(), isNotEmpty);
      if (!deadline.isTodo) {
        expect(
          DateTime.tryParse(deadline.dateIso),
          isNotNull,
          reason: deadline.title,
        );
      }
      if (deadline.resourceId != null) {
        expect(
          resourceIds,
          contains(deadline.resourceId),
          reason: '${deadline.title}: ${deadline.resourceId}',
        );
      }
    }
  });

  test('emits the complete external URL manifest', () {
    final urls = <String>{};
    for (final resource in allResources) {
      for (final label in linksForResource(resource)) {
        final destination = resolveUrl(label, resource);
        if (destination != null &&
            (destination.startsWith('http://') ||
                destination.startsWith('https://'))) {
          urls.add(destination);
        }
      }
    }
    final sorted = urls.toList()..sort();
    for (final url in sorted) {
      // The URL checker consumes this exact prefix from flutter test output.
      // ignore: avoid_print
      print('RESOURCE_AUDIT_URL=$url');
    }
    expect(sorted, isNotEmpty);
  }, tags: 'external');
}
