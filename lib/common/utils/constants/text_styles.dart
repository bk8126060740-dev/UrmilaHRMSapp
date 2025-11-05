import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  // Core base builder with full flexibility
  static TextStyle _base({
    required double fontSize,
    required FontWeight fontWeight,
    required Color color,
    double? height,
    double? letterSpacing,
    double? wordSpacing,
    FontStyle? fontStyle,
    TextBaseline? textBaseline,
    TextDecoration? decoration,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
  }) {
    return GoogleFonts.outfit(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      fontStyle: fontStyle,
      textBaseline: textBaseline,
      decoration: decoration,
      foreground: foreground,
      background: background,
      shadows: shadows,
    );
  }

  /// Custom utility with full override capability from UI
  static TextStyle custom(
    BuildContext context, {
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    Color? color,
    double? height,
    double? letterSpacing,
    double? wordSpacing,
    FontStyle? fontStyle,
    TextBaseline? textBaseline,
    TextDecoration? decoration,
    Paint? foreground,
    Paint? background,
    List<Shadow>? shadows,
  }) {
    return _base(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? AppColors.textColor,
      height: height,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      fontStyle: fontStyle,
      textBaseline: textBaseline,
      decoration: decoration,
      foreground: foreground,
      background: background,
      shadows: shadows,
    );
  }

  // Predefined tokens for convenience and consistency

  // --- Size 12 ---
  static TextStyle w400_12(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 12, fontWeight: FontWeight.w400, color: color);

  static TextStyle w500_12(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 12, fontWeight: FontWeight.w500, color: color);

  static TextStyle w600_12(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 12, fontWeight: FontWeight.w600, color: color);

  // --- Size 14 ---
  static TextStyle w400_14(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 14, fontWeight: FontWeight.w400, color: color);

  static TextStyle w500_14(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 14, fontWeight: FontWeight.w500, color: color);

  static TextStyle w600_14(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 14, fontWeight: FontWeight.w600, color: color);

  // --- Size 15 ---
  static TextStyle w400_15(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 15, fontWeight: FontWeight.w400, color: color);

  static TextStyle w500_15(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 15, fontWeight: FontWeight.w500, color: color);

  static TextStyle w600_15(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 15, fontWeight: FontWeight.w600, color: color);

  // --- Size 16 ---
  static TextStyle w400_16(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 16, fontWeight: FontWeight.w400, color: color);

  static TextStyle w500_16(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 16, fontWeight: FontWeight.w500, color: color);

  static TextStyle w600_16(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 16, fontWeight: FontWeight.w600, color: color);

  // --- Size 18 ---
  static TextStyle w400_18(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 18, fontWeight: FontWeight.w400, color: color);

  static TextStyle w500_18(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 18, fontWeight: FontWeight.w500, color: color);

  static TextStyle w600_18(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 18, fontWeight: FontWeight.w600, color: color);

  // --- Size 20 ---
  static TextStyle w500_20(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 20, fontWeight: FontWeight.w500, color: color);

  static TextStyle w600_20(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 20, fontWeight: FontWeight.w600, color: color);

  // --- Size 24 ---
  static TextStyle w500_24(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 24, fontWeight: FontWeight.w500, color: color);

  static TextStyle w600_24(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 24, fontWeight: FontWeight.w600, color: color);

  static TextStyle w700_24(BuildContext context, {Color? color}) =>
      custom(context, fontSize: 24, fontWeight: FontWeight.w700, color: color);
}
