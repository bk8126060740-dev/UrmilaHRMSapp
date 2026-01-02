import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/dropdown/dropdown_model.dart';
import '../constants/colors.dart';

class AppHelperFunctions {
  /// Default status bar style used throughout the app
  static const SystemUiOverlayStyle defaultStatusBarStyle =
      SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      );

  /// Customizable style — supply only what you want to change
  static SystemUiOverlayStyle customStatusBarStyle({
    Color? statusBarColor,
    Brightness? statusBarIconBrightness,
    Brightness? statusBarBrightness,
  }) {
    return SystemUiOverlayStyle(
      statusBarColor: statusBarColor ?? defaultStatusBarStyle.statusBarColor,
      statusBarIconBrightness:
          statusBarIconBrightness ??
          defaultStatusBarStyle.statusBarIconBrightness,
      statusBarBrightness:
          statusBarBrightness ?? defaultStatusBarStyle.statusBarBrightness,
    );
  }

  static DateTime getStartOfWeek(DateTime date) {
    final int daysUntilMonday = date.weekday - 1;
    final DateTime startOfWeek = date.subtract(Duration(days: daysUntilMonday));
    return DateTime(
      startOfWeek.year,
      startOfWeek.month,
      startOfWeek.day,
      0,
      0,
      0,
      0,
      0,
    );
  }

  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static String getFormattedDate(
    DateTime date, {
    String format = 'dd MMM yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
        i,
        i + rowSize > widgets.length ? widgets.length : i + rowSize,
      );
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }

  static String generateRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();

    String getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => chars.codeUnitAt(rnd.nextInt(chars.length)),
      ),
    );

    return getRandomString(length);
  }

  static String generateUniqueRandomString(
    Set<String> existingStrings, {
    int length = 10,
  }) {
    const String chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    Random random = Random();
    String newString;
    do {
      newString = List.generate(
        length,
        (index) => chars[random.nextInt(chars.length)],
      ).join();
    } while (existingStrings.contains(newString)); // Ensure uniqueness
    existingStrings.add(newString); // Store generated string
    return newString;
  }

  static Future<void> launchExternal(String url) async {
    print("url is =====> $url");
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  // get month list
  static List<DropdownModel> getMonthList() {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    return List.generate(
      12,
      (index) => DropdownModel(
        id: (index + 1).toString(), // 1–12 to send in API
        title: monthNames[index], // Month name for UI
      ),
    );
  }

  // get year list
  static List<DropdownModel> getYearList({int startYear = 2020}) {
    final currentYear = DateTime.now().year;

    return [
      for (int year = currentYear; year >= startYear; year--)
        DropdownModel(id: year.toString(), title: year.toString()),
    ];
  }

  // match equal or ignore
  static bool equalsIgnoreCase(String? a, String b) {
    return (a ?? '').toLowerCase() == b.toLowerCase();
  }

  static int calculateDays({DateTime? fromDate, DateTime? toDate}) {
    if (fromDate == null || toDate == null) return 0;

    // If dates are reversed, return 0 (optional)
    if (toDate.isBefore(fromDate)) return 0;

    return toDate.difference(fromDate).inDays + 1;
  }

  static String extensionFromContentType(String contentType) {
    contentType = contentType.toLowerCase();

    if (contentType.contains('pdf')) return '.pdf';
    if (contentType.contains('jpeg')) return '.jpg';
    if (contentType.contains('jpg')) return '.jpg';
    if (contentType.contains('png')) return '.png';
    if (contentType.contains('gif')) return '.gif';
    if (contentType.contains('mp4')) return '.mp4';
    if (contentType.contains('msword')) return '.doc';
    if (contentType.contains('wordprocessingml')) return '.docx';
    if (contentType.contains('excel')) return '.xls';
    if (contentType.contains('spreadsheetml')) return '.xlsx';

    return '';
  }
}
