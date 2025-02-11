import 'package:intl/intl.dart';

class MonthUtil {
  static final List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  static String getMonthNameFromNumber(int monthNumber) {
    if (monthNumber < 1 || monthNumber > 12) {
      throw ArgumentError("Month number must be between 1 and 12.");
    }

    return _months[monthNumber - 1];
  }

  static String getMonthNameFromDate(DateTime date) {
    return getMonthNameFromNumber(date.month);
  }
}

String durationToHHmm(DateTime duration) =>
    DateFormat('HH:mm').format(duration);
