import 'package:intl/intl.dart';

class AttendanceHelper {
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  static String convertCurrentDate(DateTime date) {
    final formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    return formatter.format(date.toUtc());
  }

  static String convertCurrentTime(DateTime date) {
    final formatter = DateFormat.Hms(); // "HH:mm:ss"
    return formatter.format(date);
  }
}
