///print e log;
void roLogE(Object obj, {String tag}) => RoLogUtils.e(obj, tag: tag);

///print v log;
void roLogV(Object obj, {String tag}) => RoLogUtils.v(obj, tag: tag);

class RoLogUtils {
  static const String _tagPrefix = 'RoUtils:';
  //mark is debug mode or not, if true 'v' log will not print out.
  static bool _isDebug = false;
  static int _maxLen = 128;
  static String _tagFlag = '';

  static void e(Object obj, {String tag}) {
    _log(tag, "e:", obj);
  }

  static void v(Object obj, {String tag}) {
    _log(tag, "v:", obj);
  }

  static void _log(String tagPrefix, String tagFlag, Object obj) {
    String log = obj.toString();
    tagPrefix = tagPrefix ?? _tagPrefix;
    if (log.length <= _maxLen) {
      print("$tagPrefix$tagFlag $log");
      return;
    }
    print(
        "$tagPrefix$tagFlag — — — — — — — — — — — — — — — — start — — — — — — — — — — — — — — — — ");

    while (log.isNotEmpty) {
      if (log.length > _maxLen) {
        print("$tagPrefix$tagFlag| ${log.substring(0, _maxLen)}");
        log = log.substring(_maxLen, log.length);
      } else {
        print("$tagPrefix$tagFlag| $log");
        log = "";
      }
    }

    print(
        "$tagPrefix$tagFlag — — — — — — — — — — — — — — — —  end  — — — — — — — — — — — — — — — — ");
  }
}
