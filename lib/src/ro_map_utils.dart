///map is empty or not.
bool roMapIsEmpty(Map map) => RoMapUtils.isEmpty(map);

///map is not empty or not.
bool roMapIsNotEmpty(Map map) => !RoMapUtils.isNotEmpty(map);

/// [Map] utils.
class RoMapUtils {
  ///map is empty or not.
  static bool isEmpty(Map map) => (map == null || map.isEmpty);

  ///map is not empty or not.
  static bool isNotEmpty(Map map) => !isEmpty(map);
}
