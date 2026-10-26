/// Returns a copy of [items] ordered for a resource stack.
///
/// Starred items are shown first. Within both the starred and unstarred
/// sections, unseen items are shown before seen items. [compare] controls the
/// normal ordering inside each state group; when it considers two items equal,
/// their original order is preserved.
List<T> sortStackItems<T>(
  Iterable<T> items, {
  required bool Function(T item) isStarred,
  required bool Function(T item) isSeen,
  Comparator<T>? compare,
}) {
  final indexed = <_IndexedItem<T>>[];
  var index = 0;
  for (final item in items) {
    indexed.add(_IndexedItem(item, index));
    index += 1;
  }

  indexed.sort((a, b) {
    final starredComparison = _boolRank(
      isStarred(a.item),
    ).compareTo(_boolRank(isStarred(b.item)));
    if (starredComparison != 0) return starredComparison;

    final seenComparison = _boolRank(
      !isSeen(a.item),
    ).compareTo(_boolRank(!isSeen(b.item)));
    if (seenComparison != 0) return seenComparison;

    final itemComparison = compare?.call(a.item, b.item) ?? 0;
    if (itemComparison != 0) return itemComparison;
    return a.index.compareTo(b.index);
  });

  return indexed.map((entry) => entry.item).toList();
}

int _boolRank(bool value) => value ? 0 : 1;

class _IndexedItem<T> {
  final T item;
  final int index;

  const _IndexedItem(this.item, this.index);
}
