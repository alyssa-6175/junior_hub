import 'package:flutter_test/flutter_test.dart';
import 'package:junior_hub/utils/stack_sorting.dart';

void main() {
  test('starred items lead and seen items sink within each star group', () {
    const items = ['plain-seen', 'star-seen', 'plain-new', 'star-new'];

    final sorted = sortStackItems(
      items,
      isStarred: (item) => item.startsWith('star'),
      isSeen: (item) => item.endsWith('seen'),
    );

    expect(sorted, ['star-new', 'star-seen', 'plain-new', 'plain-seen']);
  });

  test('uses the supplied comparison inside matching state groups', () {
    const items = ['charlie', 'alpha', 'bravo'];

    final sorted = sortStackItems(
      items,
      isStarred: (_) => false,
      isSeen: (_) => false,
      compare: (a, b) => a.compareTo(b),
    );

    expect(sorted, ['alpha', 'bravo', 'charlie']);
  });

  test('preserves source order when no comparison is supplied', () {
    const items = ['third', 'first', 'second'];

    final sorted = sortStackItems(
      items,
      isStarred: (_) => false,
      isSeen: (_) => false,
    );

    expect(sorted, items);
  });
}
