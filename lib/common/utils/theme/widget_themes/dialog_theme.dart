import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppDialogTheme {
  AppDialogTheme._();

  static DialogThemeData lightDialogTheme = DialogThemeData(
    backgroundColor: AppColors.bgColor,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius8),
    ),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),
    contentTextStyle: const TextStyle(fontSize: 16, color: AppColors.textColor),
  );

  static DialogThemeData darkDialogTheme = DialogThemeData(
    backgroundColor: AppColors.bgColor,
    elevation: 10,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius8),
    ),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.textColor,
    ),
    contentTextStyle: const TextStyle(fontSize: 16, color: AppColors.textColor),
  );
}
