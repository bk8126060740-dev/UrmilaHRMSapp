import 'package:intl/intl.dart';

import 'date_formats.dart';
import 'time_formats.dart';

class AppFormatter {
  /// 🕒 Format a DateTime object to time string
  static String? formatTime(
    DateTime? date, {
    String format = TimeFormats.time12h,
  }) {
    if (date == null) return null;
    return DateFormat(format).format(date);
  }

  /// 🕒 Format a string (time-only or ISO date-time) to time string
  static String? formatTimeString(
    String? timeString, {
    String format = TimeFormats.time12h,
  }) {
    if (timeString == null || timeString.isEmpty) return null;

    try {
      DateTime date;
      if (timeString.contains('T')) {
        // ISO 8601 e.g., "2025-11-11T06:43:51.348454Z"
        date = DateTime.parse(timeString).toLocal();
      } else {
        // Raw time e.g., "06:43:51.3484540"
        final now = DateTime.now();
        final parts = timeString.split(':');
        final hour = int.tryParse(parts[0]) ?? 0;
        final minute = int.tryParse(parts[1]) ?? 0;
        final second = (parts.length > 2)
            ? int.tryParse(parts[2].split('.').first) ?? 0
            : 0;
        date = DateTime(now.year, now.month, now.day, hour, minute, second);
      }

      return DateFormat(format).format(date);
    } catch (e) {
      return timeString; // fallback for invalid strings
    }
  }

  static String? formatDate(
    DateTime? date, {
    String format = DateFormats.dmyDash,
  }) {
    if (date == null) return null;
    return DateFormat(format).format(date);
  }

  /// Format an ISO date string (e.g., "2024-12-31T18:30:00Z")
  static String? formatDateString(
    String? dateString, {
    String format = DateFormats.dmyDash,
  }) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      final date = DateTime.parse(dateString).toLocal();
      return DateFormat(format).format(date);
    } catch (e) {
      return null;
    }
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
    ).format(amount); // Customize the currency locale and symbol as needed
  }
}
