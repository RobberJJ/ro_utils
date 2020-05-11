/// get length for null or Iterable & String & List & Map.
int roLength(Object obj) => RoUtils.length(obj);
///Common utils
class RoUtils {
  /// get length for null or Iterable & String & List & Map & Iterable.
  static int length(Object obj) {
    if (obj == null) return 0;
    if (obj is String){
      return obj.length;
    } else if (obj is Iterable){
      return obj.length;
    } else if (obj is Map){
      return obj.length;
    } else if (obj is Set){
      return obj.length;
    } else {
      return 0;
    }

  }
}