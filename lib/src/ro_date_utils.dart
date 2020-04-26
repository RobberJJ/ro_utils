/// get DateTime By DateStr.
DateTime roDateTime(String dateStr, {bool isUtc}) =>
    RoDateUtils.dateTime(dateStr, isUtc: isUtc);

/// get DateTime By Milliseconds.
DateTime roDateTimeByMs(int milliseconds, {bool isUtc = false}) =>
    RoDateUtils.dateTimeByMs(milliseconds, isUtc: isUtc);

/// get DateMilliseconds By DateStr.
int roDateMsByTimeStr(String dateStr) => RoDateUtils.dateMsByTimeStr(dateStr);

/// get Now Date Milliseconds.
int roDateNowDateMs() => RoDateUtils.nowDateMs();

/// format date by milli.
/// milliseconds 日期毫秒
String roDateFormatDateMs(int milliseconds,
        {bool isUtc = false, String format}) =>
    RoDateUtils.formatDateMs(milliseconds, isUtc: isUtc, format: format);

/// format date by date str.
/// dateStr 日期字符串
String roDateFormatDateStr(String dateStr, {bool isUtc, String format}) =>
    RoDateUtils.formatDateStr(dateStr, isUtc: isUtc, format: format);

/// format date by DateTime.
/// format 转换格式(已提供常用格式 DataFormats，可以自定义格式："yyyy/MM/dd HH:mm:ss")
/// 格式要求
/// year -> yyyy/yy   month -> MM/M    day -> dd/d
/// hour -> HH/H      minute -> mm/m   second -> ss/s
String roDateFormatDate(DateTime dateTime, {bool isUtc, String format}) =>
    RoDateUtils.formatDate(dateTime, isUtc: isUtc, format: format);

/// get WeekDay By Milliseconds.
String roDateWeekDayByMs(int milliseconds, {bool isUtc = false}) =>
    RoDateUtils.weekDayByMs(milliseconds, isUtc: isUtc);

/// get ZH WeekDay By Milliseconds.
String roDateZhWeekDayByMs(int milliseconds, {bool isUtc = false}) =>
    RoDateUtils.zhWeekDayByMs(milliseconds, isUtc: isUtc);

/// get WeekDay.
String roDateWeekDay(DateTime dateTime) => RoDateUtils.weekDay(dateTime);

/// get ZH WeekDay.
String roDateZhWeekDay(DateTime dateTime) => RoDateUtils.zhWeekDay(dateTime);

/// Return whether it is leap year.
bool roDateIsLeapYearByDateTime(DateTime dateTime) =>
    RoDateUtils.isLeapYearByDateTime(dateTime);

/// Return whether it is leap year.
bool roDateIsLeapYearByYear(int year) => RoDateUtils.isLeapYearByYear(year);

/// is yesterday by millis.
/// 是否是昨天.
bool roDateIsYesterdayByMillis(int millis, int locMillis) =>
    RoDateUtils.isYesterdayByMillis(millis, locMillis);

/// is yesterday by dateTime.
/// 是否是昨天.
bool roDateIsYesterday(DateTime dateTime, DateTime locDateTime) =>
    RoDateUtils.isYesterday(dateTime, locDateTime);

/// get day of year.
/// 在今年的第几天.
int roDateDayOfYearByMillis(int millis, {bool isUtc = false}) =>
    RoDateUtils.dayOfYearByMillis(millis, isUtc: isUtc);

/// get day of year.
/// 在今年的第几天.
int roDateDayOfYear(DateTime dateTime) => RoDateUtils.dayOfYear(dateTime);

/// year is equal.
/// 是否同年.
bool roDateYearIsEqualByMillis(int millis, int locMillis) =>
    RoDateUtils.yearIsEqualByMillis(millis, locMillis);

/// year is equal.
/// 是否同年.
bool roDateYearIsEqual(DateTime dateTime, DateTime locDateTime) =>
    RoDateUtils.yearIsEqual(dateTime, locDateTime);

/// is today.
/// 是否是当天.
bool roDateIsToday(int milliseconds, {bool isUtc = false}) =>
    RoDateUtils.isToday(milliseconds, isUtc: isUtc);

/// is Week.
/// 是否是本周.
bool roDateIsWeek(int milliseconds, {bool isUtc = false}) =>
    RoDateUtils.isWeek(milliseconds, isUtc: isUtc);

class RoDateFormats {
  static String roDFFull = "yyyy-MM-dd HH:mm:ss";
  static String roDFYMoDHM = "yyyy-MM-dd HH:mm";
  static String roDFYMoD = "yyyy-MM-dd";
  static String roDFYMo = "yyyy-MM";
  static String roDFMoD = "MM-dd";
  static String roDFMoDHM = "MM-dd HH:mm";
  static String roDFHMS = "HH:mm:ss";
  static String roDFHM = "HH:mm";

  static String roDFZFull = "yyyy年MM月dd日 HH时mm分ss秒";
  static String roDFZYMoDHM = "yyyy年MM月dd日 HH时mm分";
  static String roDFZYMoD = "yyyy年MM月dd日";
  static String roDFZYMo = "yyyy年MM月";
  static String roDFZMoD = "MM月dd日";
  static String roDFZMoDHM = "MM月dd日 HH时mm分";
  static String roDFZHMS = "HH时mm分ss秒";
  static String roDFZHM = "HH时mm分";
}

/// month->days.
Map<int, int> roMonthDays = {
  1: 31,
  2: 28,
  3: 31,
  4: 30,
  5: 31,
  6: 30,
  7: 31,
  8: 31,
  9: 30,
  10: 31,
  11: 30,
  12: 31,
};

/// Date utils.
class RoDateUtils {
  /// get DateTime By DateStr.
  static DateTime dateTime(String dateStr, {bool isUtc}) {
    DateTime dateTime = DateTime.tryParse(dateStr);
    if (isUtc != null) {
      if (isUtc) {
        dateTime = dateTime.toUtc();
      } else {
        dateTime = dateTime.toLocal();
      }
    }
    return dateTime;
  }

  /// get DateTime By Milliseconds.
  static DateTime dateTimeByMs(int milliseconds, {bool isUtc = false}) {
    return milliseconds == null
        ? null
        : DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
  }

  /// get DateMilliseconds By DateStr.
  static int dateMsByTimeStr(String dateStr) {
    DateTime dateTime = DateTime.tryParse(dateStr);
    return dateTime == null ? null : dateTime.millisecondsSinceEpoch;
  }

  /// get Now Date Milliseconds.
  static int nowDateMs() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// get Now Date Str.(yyyy-MM-dd HH:mm:ss)
//  static String nowDateStr() {
//    return dateStrByDateTime(DateTime.now());
//  }

  /// format date by milliseconds.
  /// milliseconds 日期毫秒
  static String formatDateMs(int milliseconds,
      {bool isUtc = false, String format}) {
    return formatDate(dateTimeByMs(milliseconds, isUtc: isUtc), format: format);
  }

  /// format date by date str.
  /// dateStr 日期字符串
  static String formatDateStr(String dateStr, {bool isUtc, String format}) {
    return formatDate(dateTime(dateStr, isUtc: isUtc), format: format);
  }

  /// format date by DateTime.
  /// format 转换格式(已提供常用格式 DataFormats，可以自定义格式："yyyy/MM/dd HH:mm:ss")
  /// 格式要求
  /// year -> yyyy/yy   month -> MM/M    day -> dd/d
  /// hour -> HH/H      minute -> mm/m   second -> ss/s
  static String formatDate(DateTime dateTime, {bool isUtc, String format}) {
    if (dateTime == null) return "";
    format = format ?? RoDateFormats.roDFFull;
    if (format.contains("yy")) {
      String year = dateTime.year.toString();
      if (format.contains("yyyy")) {
        format = format.replaceAll("yyyy", year);
      } else {
        format = format.replaceAll(
            "yy", year.substring(year.length - 2, year.length));
      }
    }

    format = _comFormat(dateTime.month, format, 'M', 'MM');
    format = _comFormat(dateTime.day, format, 'd', 'dd');
    format = _comFormat(dateTime.hour, format, 'H', 'HH');
    format = _comFormat(dateTime.minute, format, 'm', 'mm');
    format = _comFormat(dateTime.second, format, 's', 'ss');
    format = _comFormat(dateTime.millisecond, format, 'S', 'SSS');

    return format;
  }

  /// com format.
  static String _comFormat(
      int value, String format, String single, String full) {
    if (format.contains(single)) {
      if (format.contains(full)) {
        format =
            format.replaceAll(full, value < 10 ? '0$value' : value.toString());
      } else {
        format = format.replaceAll(single, value.toString());
      }
    }
    return format;
  }

  /// get WeekDay By Milliseconds.
  static String weekDayByMs(int milliseconds, {bool isUtc = false}) {
    DateTime dateTime = dateTimeByMs(milliseconds, isUtc: isUtc);
    return weekDay(dateTime);
  }

  /// get ZH WeekDay By Milliseconds.
  static String zhWeekDayByMs(int milliseconds, {bool isUtc = false}) {
    DateTime dateTime = dateTimeByMs(milliseconds, isUtc: isUtc);
    return zhWeekDay(dateTime);
  }

  /// get WeekDay.
  static String weekDay(DateTime dateTime) {
    if (dateTime == null) return null;
    String weekday;
    switch (dateTime.weekday) {
      case 1:
        weekday = "Monday";
        break;
      case 2:
        weekday = "Tuesday";
        break;
      case 3:
        weekday = "Wednesday";
        break;
      case 4:
        weekday = "Thursday";
        break;
      case 5:
        weekday = "Friday";
        break;
      case 6:
        weekday = "Saturday";
        break;
      case 7:
        weekday = "Sunday";
        break;
      default:
        break;
    }
    return weekday;
  }

  /// get ZH WeekDay.
  static String zhWeekDay(DateTime dateTime) {
    if (dateTime == null) return null;
    String weekday;
    switch (dateTime.weekday) {
      case 1:
        weekday = "星期一";
        break;
      case 2:
        weekday = "星期二";
        break;
      case 3:
        weekday = "星期三";
        break;
      case 4:
        weekday = "星期四";
        break;
      case 5:
        weekday = "星期五";
        break;
      case 6:
        weekday = "星期六";
        break;
      case 7:
        weekday = "星期日";
        break;
      default:
        break;
    }
    return weekday;
  }

  /// Return whether it is leap year.
  static bool isLeapYearByDateTime(DateTime dateTime) {
    return isLeapYearByYear(dateTime.year);
  }

  /// Return whether it is leap year.
  static bool isLeapYearByYear(int year) {
    return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
  }

  /// is yesterday by millis.
  /// 是否是昨天.
  static bool isYesterdayByMillis(int millis, int locMillis) {
    return isYesterday(DateTime.fromMillisecondsSinceEpoch(millis),
        DateTime.fromMillisecondsSinceEpoch(locMillis));
  }

  /// is yesterday by dateTime.
  /// 是否是昨天.
  static bool isYesterday(DateTime dateTime, DateTime locDateTime) {
    if (yearIsEqual(dateTime, locDateTime)) {
      int spDay = dayOfYear(locDateTime) - dayOfYear(dateTime);
      return spDay == 1;
    } else {
      return ((locDateTime.year - dateTime.year == 1) &&
          dateTime.month == 12 &&
          locDateTime.month == 1 &&
          dateTime.day == 31 &&
          locDateTime.day == 1);
    }
  }

  /// get day of year.
  /// 在今年的第几天.
  static int dayOfYearByMillis(int millis, {bool isUtc = false}) {
    return dayOfYear(DateTime.fromMillisecondsSinceEpoch(millis, isUtc: isUtc));
  }

  /// get day of year.
  /// 在今年的第几天.
  static int dayOfYear(DateTime dateTime) {
    int year = dateTime.year;
    int month = dateTime.month;
    int days = dateTime.day;
    for (int i = 1; i < month; i++) {
      days = days + roMonthDays[i];
    }
    if (isLeapYearByYear(year) && month > 2) {
      days = days + 1;
    }
    return days;
  }

  /// year is equal.
  /// 是否同年.
  static bool yearIsEqualByMillis(int millis, int locMillis) {
    return yearIsEqual(DateTime.fromMillisecondsSinceEpoch(millis),
        DateTime.fromMillisecondsSinceEpoch(locMillis));
  }

  /// year is equal.
  /// 是否同年.
  static bool yearIsEqual(DateTime dateTime, DateTime locDateTime) {
    return dateTime.year == locDateTime.year;
  }

  /// is today.
  /// 是否是当天.
  static bool isToday(int milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds == 0) return false;
    DateTime old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  /// is Week.
  /// 是否是本周.
  static bool isWeek(int milliseconds, {bool isUtc = false}) {
    if (milliseconds == null || milliseconds <= 0) {
      return false;
    }
    DateTime _old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime _now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    DateTime old =
        _now.millisecondsSinceEpoch > _old.millisecondsSinceEpoch ? _old : _now;
    DateTime now =
        _now.millisecondsSinceEpoch > _old.millisecondsSinceEpoch ? _now : _old;
    return (now.weekday >= old.weekday) &&
        (now.millisecondsSinceEpoch - old.millisecondsSinceEpoch <=
            7 * 24 * 60 * 60 * 1000);
  }
}
