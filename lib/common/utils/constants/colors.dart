import 'dart:ui';

class AppColors {
  // Primary Colors
  static const Color primaryColor = Color(0xFF1976D2); // Blue
  static const Color secondaryColor = Color(0xffe8effd);
  static const Color accentColor = Color(0xFF42A5F5);

  // Text Colors
  static const Color textColor = Color(0xFF000000);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static const Color lightWhiteTextColor = Color(0xCCFFFFFF);
  static const Color secondaryTextColor = Color(0xFF888EA8);
  static const Color hintTextColor = Color(0xFF888EA8);

  // Icon Colors
  static const Color iconColor = Color(0xFF616161);
  static const Color whiteIconColor = Color(0xFFFFFFFF);
  static const Color lightWhiteIconColor = Color(0xB3FFFFFF);

  // Backgrounds
  static const Color scaffoldBgColor = Color(0xFFE4EBF8); //0xFFE4EBF8
  static const Color bgColor = Color(0xFFFFFFFF);

  //=====================>>> SURFACE COLORS (tinted with primary) <<<=====================
  /// Medium elevation surface
  static const Color surfaceColor = Color(0xFFDCE9FC);

  /// High elevation (popover, dialog)
  static const Color surfaceAboveColor = Color(0xFFC9DCFA);

  /// Text/icons on surface
  static const Color surfaceTextColor = Color(
    0xFF0D47A1,
  ); // darker tone from primary

  /// Muted text/icons
  static const Color surfaceTextIconColor = Color(0xFF5C6F92);

  /// Border/divider variant
  static const Color surfaceBorderColor = Color(0xFFD4E0F5);

  //===============================================================

  // Dividers & Borders
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


  // attendance colors
  static const Color holidayPresent = Color(0xFFFD7E14); // HP - Orange
  static const Color holiday = Color(0xFF007BFF);        // Blue
  static const Color leave = Color(0xFF90EE90);          // Light Green
  static const Color absent = Color(0xFFDC3545);         // Red
  static const Color present = Color(0xFF28A745);        // Green
  static const Color pendingPresent = Color(0xFFFFC107);// Yellow
  static const Color totalPresent = Color(0xFF6F42C1);   // Purple

  static const Color workingDay = Color(0xFF6C757D);     // Gray
  static const Color weekOff = Color(0xFFADB5FF);        // Soft Indigo
}
