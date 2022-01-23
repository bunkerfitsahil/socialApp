import 'package:intl/intl.dart';

class DateUtilities {
  String getFormattedDateString(DateTime date, {String? formatter}) {
    if (formatter == null) {
      formatter = kMainSourceFormat;
    }
    return DateFormat(formatter).format(date);
  }

  DateTime getDateFromString(String dateString, {String? formatter}) {
    if (formatter == null) {
      formatter = kMainSourceFormat;
    }
    return DateFormat(formatter).parse(dateString).toUtc();
  }

  String convertDateToFormatterString(String dateString, {String? formatter}) {
    return getFormattedDateString(
      getDateFromString(dateString, formatter: formatter),
      formatter: formatter,
    );
  }

  String convertServerDateToFormatterString(String dateString,
      {String? formatter}) {
    if (dateString == "" || dateString == null) return "";
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
            DateTime.parse(dateString).millisecondsSinceEpoch)
        .toLocal();
    return getFormattedDateString(
      getDateFromString(dateTime.toIso8601String(), formatter: kSourceFormat),
      formatter: formatter,
    );
  }

  DateTime convertServerStringToFormatterDate(String dateString) {
    if (dateString == "" || dateString == null) return DateTime.now();
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(
            DateTime.parse(dateString).millisecondsSinceEpoch)
        .toLocal();
    return getDateFromString(dateTime.toIso8601String(),
        formatter: kSourceFormat);
  }

  String dayOfWeek(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  DateTime getStartOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 0, 0, 0);
  }

  DateTime getSpecificTimeOfDate(DateTime date, int hour, int minute, int sec) {
    return DateTime(date.year, date.month, date.day, hour, minute, sec);
  }

  DateTime getEndOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59, 999);
  }

  String getFormattedDay(DateTime date) {
    var dt = getStartOfDay(date);
    var currentDate = getStartOfDay(DateTime.now());

    final diffInDays = currentDate.difference(dt).inDays;
    if (diffInDays == 0) {
      // current day
      return "Today";
    } else if (diffInDays == 1) {
      // 1 day
      return "Yesterday";
    } else if (diffInDays >= 2 && diffInDays <= 6) {
      // same week
      return getFormattedDateString(date, formatter: eeee);
    } else {
      // more than week
      String strDate = getFormattedDateString(date, formatter: eee_dd_mmm_yyyy);
      return strDate + " at ";
    }
  }

  String getNextWeekDay(DateTime date) {
    final nextWeekDay = DateTime(date.year, date.month, date.day + 7);
    return getDayFromWeekDay(nextWeekDay.weekday);
  }

  String getTomorrowDay(DateTime date) {
    final tomorrow = DateTime(date.year, date.month, date.day + 1);
    return (getDayFromWeekDay(tomorrow.weekday));
  }

  String getDayFromWeekDay(int weekDay) {
    if (weekDay == 1) {
      return "Mon";
    } else if (weekDay == 2) {
      return "Tue";
    } else if (weekDay == 3) {
      return "Wed";
    } else if (weekDay == 4) {
      return "Thur";
    } else if (weekDay == 5) {
      return "Fri";
    } else if (weekDay == 6) {
      return "Sat";
    } else {
      return "Sun";
    }
  }

  static const String kMainSourceFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ";

  static const kSourceFormat = "yyyy-MM-dd'T'HH:mm:ssZ";
  static const String dd_mm_yyyy_hh_mm = "dd-MM-yyyy HH:mm";
  static const String dd_mm_yyyy_hh_mm_a = "dd-MM-yyyy hh:mm a";
  static const String h_mm_aaa = "hh:mm a";
  static const String dd_mm_yyyy_hh_mm_ss_a = "dd/MM/yyyy',' hh:mm a";
  static const String dd_mm_yyyy_hh_mm_ss_aa = "dd-MM-yyyy' at 'hh:mm a";
  static const String dd_mm_yyyy_hh_mm_ss = "dd MMM yyyy',' hh:mm a";
  static const String dd_mm_yyyy_n_mm_ss_a = "dd/MM/yyyy'\n' hh:mm a";
  static const String dd_mm_yyyy = "dd MMM yyyy";
  static const String mmm_dd_yyyy = "MMM dd','yyyy";
  static const String dd_eee = "dd\nEE";
  static const String mm_yyyy = "MM/yyyy";
  static const String dd = "d";
  static const String mmm = "MMM";
  static const String yyyy = "yyyy";
  static const String file_name_date = "dd MMM yyyy";
  static const String dd_mm_yyyy_ = "dd-MM-yyyy";
  static const String yyyy_mm_dd = "yyyy-MM-dd";

  static const String ddmmyyyy_ = "dd/MM/yyyy";
  static const String ddmmyywithdash = "dd-MM-yyyy";
  static const String hh_mm_ss = "HH:mm:ss";
  static const String hh_mm_a = "hh:mm a";
  static const String h_mm_a = "h:mm a";
  static const String eeee = "EEEE";
  static const String ee = "EE";
  static const String eee_dd_mmm_yyyy = "EEEE, dd MMM yyyy";

  static const String dd_mmm_yy_h_mm_a = "dd MMM''yy 'at' h:mma";

  static const String mmm_yyyy = "MMMM yyyy";
}
