import 'package:intl/intl.dart';

import 'date_formats.dart';

class AppFormatter {
  static String? formatTime(DateTime? date) {
    if (date == null) return null;
    return DateFormat('hh:mm a').format(date);
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
