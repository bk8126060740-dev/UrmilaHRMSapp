// import 'dart:ui';
//
// class AppColors {
//   //===========>>> App Theme Light Colors <<<=====================
//   static const Color primaryColor = Color(0xFF1976D2); // Purple
//   static const Color secondaryColor = Color(0xffe8effd); // Purple
//   static const Color textColor = Color(0xFF000000); // Primary text (black)
//   static const Color whiteTextColor = Color(0xFFFFFFFF); // Primary text (black)
//   static const Color secondaryTextColor = Color(
//     0xFF888EA8,
//   ); // Slightly lighter for subtitles
//   static const Color hintTextColor = Color(
//     0xFF888EA8,
//   ); // Grey for placeholder/hints
//   static const Color iconColor = Color(0xFF616161); // Medium grey icons
//   static const Color whiteIconColor = Color(0xFFffffff); // Medium grey icons
//   static const Color bgColor = Color(0xFFE4EBF8); // White background
//   static const Color scaffoldBgColor = Color(
//     /*0xFFE4EBF8,*/
//     0XFFFFFFFF,
//   ); // Light grey for background areas
//   static const Color dividerColor = Color(0xFFEDEDED); // Light grey divider
//
//   // Interactive UI states
//   static const Color focusColor = Color(
//     0xFFd1c4e9,
//   ); // Light purple for focus ripple
//   static const Color disabledColor = Color(0xFFBDBDBD); // For disabled elements
//
//   // Borders and outlines
//   static const Color borderColor = Color(0xFFE0E6ED); // Consistent with divider
//   static const Color inputBorderColor = Color(
//     0xFFE0E6ED,
//   ); // For text field borders
//   static const Color shimmerBg = Color(0xFFAFAFAF);
//
//   // Error and validation colors
//   static const Color error = Color(0xFFD32F2F);
//   static const Color success = Color(0xFF388E3C);
//   static const Color warning = Color(0xFFF57C00);
//   static const Color info = Color(0xFF1976D2);
//
//   static const Color statusError = Color(0x80E90A08); // Red
//   static const Color statusSuccess = Color(0x80096C0A); // Green
//   static const Color statusWarning = Color(0x80EF9E0B); // Orange
//   static const Color closed = Color(0xFFE66267);
//   static const Color pending = Color(0xFFEDA94A);
//
//   // Accent Colors (optional for buttons, highlights, etc.)
//   static const Color accentColor = Color(0xFF42A5F5); // Light purple accent
//
//   // shimmer colors
//   static const Color baseColor = Color(0xffEBEBEB);
//   static const Color highlightColor = Color(0xFFede7f6);
// }

import 'dart:ui';

class AppColors {
  //===========>>> App Theme Light Colors <<<=====================

  // Primary Colors
  static const Color primaryColor = Color(0xFF1976D2); // Blue
  static const Color secondaryColor = Color(0xffe8effd);
  static const Color accentColor = Color(0xFF42A5F5);

  // Text Colors
  static const Color textColor = Color(0xFF000000);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static const Color secondaryTextColor = Color(0xFF888EA8);
  static const Color hintTextColor = Color(0xFF888EA8);

  // Icon Colors
  static const Color iconColor = Color(0xFF616161);
  static const Color whiteIconColor = Color(0xFFFFFFFF);

  // Backgrounds
  static const Color bgColor = Color(0xFFE4EBF8);
  static const Color scaffoldBgColor = Color(0xFFFFFFFF);

  //=====================>>> SURFACE COLORS (tinted with primary) <<<=====================
  /// Medium elevation surface
  static const Color surfaceContainer = Color(0xFFDCE9FC);

  /// High elevation (popover, dialog)
  static const Color surfaceContainerHigh = Color(0xFFC9DCFA);

  /// Text/icons on surface
  static const Color surfaceTextColor = Color(0xFF0D47A1); // darker tone from primary

  /// Muted text/icons
  static const Color surfaceTextIconColor = Color(0xFF5C6F92);

  /// Border/divider variant
  static const Color surfaceBorderColor = Color(0xFFD4E0F5);

  //===============================================================

  // Dividers & Borders
  static const Color dividerColor = Color(0xFFE0E6ED);
  static const Color borderColor = Color(0xFFE0E6ED);
  static const Color inputBorderColor = Color(0xFFE0E6ED);

  // Interactive UI states
  static const Color focusColor = Color(0xFFd1c4e9);
  static const Color disabledColor = Color(0xFFBDBDBD);

  // Shimmer
  static const Color shimmerBg = Color(0xFFAFAFAF);
  static const Color baseColor = Color(0xffEBEBEB);
  static const Color highlightColor = Color(0xFFede7f6);

  // Status Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);

  static const Color statusError = Color(0x80E90A08);
  static const Color statusSuccess = Color(0x80096C0A);
  static const Color statusWarning = Color(0x80EF9E0B);
  static const Color closed = Color(0xFFE66267);
  static const Color pending = Color(0xFFEDA94A);
}
