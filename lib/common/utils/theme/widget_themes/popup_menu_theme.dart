import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppPopupMenuTheme {
  AppPopupMenuTheme._();

  static PopupMenuThemeData lightPopupMenuTheme = PopupMenuThemeData(
    color: AppColors.scaffoldBgColor,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius8),
    ),
    textStyle: const TextStyle(color: AppColors.primaryColor, fontSize: 16),
  );

  static PopupMenuThemeData darkPopupMenuTheme = PopupMenuThemeData(
    color: AppColors.scaffoldBgColor,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius8),
    ),
    textStyle: const TextStyle(color: Colors.white, fontSize: 16),
  );
}
