import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppCheckboxTheme {
  AppCheckboxTheme._(); // prevent instantiation

  /// Light Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(AppSizes.borderRadius8),
    // ),
    side: const BorderSide(
      width: 1,
      color: AppColors.inputBorderColor, // <-- use your input border color
    ),
    checkColor: WidgetStateProperty.resolveWith<Color>((states) {
      // color of the check icon
      return AppColors.whiteIconColor;
    }),
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        // when selected, fill primary color
        return AppColors.primaryColor;
      } else {
        // unselected = transparent
        return Colors.transparent;
      }
    }),
  );

  /// Dark Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    // shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.circular(AppSizes.borderRadius8),
    // ),
    side: const BorderSide(
      width: 1.5,
      color: AppColors.inputBorderColor, // same border logic
    ),
    checkColor: WidgetStateProperty.resolveWith<Color>((states) {
      return AppColors.whiteIconColor;
    }),
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
