import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../l10n/app_localizations.dart';

/// Extension on Color to fix opacity values
extension ColorOpacityFix on Color {
  Color withFixedOpacity(double opacity) =>
      withAlpha((opacity.clamp(0.0, 1.0) * 255).round());

  // 🔹 Usage:
  // Colors.red.withFixedOpacity(0.5)  // Red with 50% opacity
  // Colors.blue.withFixedOpacity(1.0) // Fully opaque blue
}

/// Extension for localization
extension LocalizationExtension on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;

  // 🔹 Usage:
  // Text(context.loc.hello)   // Access "hello" string from localization
}

/// Extension for adding vertical/horizontal gaps easily
extension GapExtension on num {
  /// Creates a vertical space using [SizedBox] with height = this
  Widget get vGap => SizedBox(height: toDouble());

  /// Creates a horizontal space using [SizedBox] with width = this
  Widget get hGap => SizedBox(width: toDouble());

  // 🔹 Usage:
  // Column(
  //   children: [
  //     Text("Above"),
  //     16.vGap, // Adds 16px vertical space
  //     Text("Below"),
  //   ],
  // )
  //
  // Row(
  //   children: [
  //     Icon(Icons.star),
  //     8.hGap, // Adds 8px horizontal space
  //     Text("Starred"),
  //   ],
  // )
}

/// Extension for adding padding directly to widgets
extension PaddingExtension on Widget {
  /// Adds symmetric vertical padding
  Widget vPad(double value) => Padding(
    padding: EdgeInsets.symmetric(vertical: value),
    child: this,
  );

  /// Adds symmetric horizontal padding
  Widget hPad(double value) => Padding(
    padding: EdgeInsets.symmetric(horizontal: value),
    child: this,
  );

  /// Adds uniform padding on all sides
  Widget padAll(double value) =>
      Padding(padding: EdgeInsets.all(value), child: this);

  /// Adds custom padding using EdgeInsets
  Widget padOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) => Padding(
    padding: EdgeInsets.only(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    ),
    child: this,
  );

  /// Adds symmetric padding
  Widget padSymmetric({double vertical = 0, double horizontal = 0}) => Padding(
    padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
    child: this,
  );

  // 🔹 Usage:
  // Text("Hello").vPad(8)            // Adds vertical padding of 8
  // Icon(Icons.star).hPad(12)        // Adds horizontal padding of 12
  // Container(color: Colors.red).padAll(16) // Padding all around = 16
  // Text("Custom").padOnly(left: 10, top: 5)
  // Text("Symmetric").padSymmetric(horizontal: 20, vertical: 10)
}

/// Extension for validating strings
extension StringValidation on String? {
  String withDefault(String fallback) => isNullOrBlank ? fallback : this!;

  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNullOrBlank => this == null || this!.trim().isEmpty;

  bool get isValid => this != null && this!.trim().isNotEmpty;

  // 🔹 Usage:
  // String? name;
  // print(name.withDefault("Guest"));   // "Guest" if null or blank
  // print(name.isNullOrEmpty);          // true if null or ""
  // print(name.isNullOrBlank);          // true if null or "   "
  // print("Flutter".isValid);           // true
}

extension StringExtension on String {
  String capitalize() {
    return isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : this;
  }
}

extension StringNullOrEmpty on String? {
  String withFallback([String defaultValue = "--"]) {
    final value = this;
    if (value == null || value.trim().isEmpty) {
      return defaultValue;
    }
    return value;
  }
}

extension DateFormatter on DateTime {
  String formatToReadable() {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return "${day.toString().padLeft(2, '0')} ${months[month - 1]}, $year";
  }
}

extension DateFormatExtension on DateTime {
  String formatTo(String pattern) => DateFormat(pattern).format(this);
}
