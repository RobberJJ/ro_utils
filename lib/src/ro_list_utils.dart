///list is empty or not.
bool roListIsEmpty(List list) => RoListUtils.isEmpty(list);

///list is not empty or not.
bool roListIsNotEmpty(List list) => !RoListUtils.isNotEmpty(list);

/// Returns true if [Iterable] Is Equal or false if not.
bool roListIsEqual(Iterable iterableA, Iterable iterableB) => RoListUtils.isEqual(iterableA, iterableB);

/// Groups the elements in [items] by the value returned by [key].
///
/// Returns a map from keys computed by [key] to a list of all values for which
/// [key] returns that key. The values appear in the list in the same relative
/// order as in [items].
Map<T, List<S>> roListGroupBy<S, T>(Iterable<S> items, T Function(S) key) => RoListUtils.groupBy(items, key);

/// [List] utils.
class RoListUtils {
  ///list is empty or not.
  static bool isEmpty(List list) => (list == null || list.isEmpty);

  ///list is not empty or not.
  static bool isNotEmpty(List list) => !isEmpty(list);

  /// Groups the elements in [items] by the value returned by [key].
  ///
  /// Returns a map from keys computed by [key] to a list of all values for which
  /// [key] returns that key. The values appear in the list in the same relative
  /// order as in [items].
  static Map<T, List<S>> groupBy<S, T>(Iterable<S> items, T Function(S) key) {
    Map<T, List<S>> map = {};
    items.forEach((element) {
      (map[key(element)] ??= []).add(element);
    });
    return map;
  }

  /// Returns true if [Iterable] Is Equal or false if not.
  static bool isEqual(Iterable iterableA, Iterable iterableB) {
    if (iterableA == iterableB) return true;
    if (iterableA == null || iterableB == null) return false;
    int length = iterableA.length;
    if (length != iterableB.length) return false;

    for(final element in iterableB) {
      if (!iterableA.contains(element)) {
        return false;
      }
    }
    return true;
  }
}
