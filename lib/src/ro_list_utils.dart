
///list is empty or not.
bool roListIsEmpty(List list) => RoListUtils.isEmpty(list);

///list is not empty or not.
bool roListIsNotEmpty(List list) => !RoListUtils.isNotEmpty(list);

/// [List] utils.
class RoListUtils {
  ///list is empty or not.
  static bool isEmpty(List list) => (list == null || list.isEmpty);

  ///list is not empty or not.
  static bool isNotEmpty(List list) => !isEmpty(list);
}