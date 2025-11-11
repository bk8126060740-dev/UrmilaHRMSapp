import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import '../../constants/colors.dart';

class AppSnackBarTheme {
  AppSnackBarTheme._();

  static SnackBarThemeData lightSnackBarTheme = SnackBarThemeData(
    backgroundColor: AppColors.scaffoldBgColor,
    contentTextStyle: const TextStyle(color: AppColors.textColor, fontSize: 15),
    behavior: SnackBarBehavior.floating,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius8),
    ),
  );

  static SnackBarThemeData darkSnackBarTheme = SnackBarThemeData(
    backgroundColor: AppColors.scaffoldBgColor,
    contentTextStyle: const TextStyle(color: AppColors.textColor, fontSize: 15),
    behavior: SnackBarBehavior.floating,
    elevation: 8,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius8),
    ),
  );
}
