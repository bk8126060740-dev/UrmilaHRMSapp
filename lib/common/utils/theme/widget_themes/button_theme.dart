import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import '../../constants/colors.dart'; // Use your app colors

class AppButtonTheme {
  AppButtonTheme._();

  /// 🔘 Elevated Button Theme
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      disabledBackgroundColor: AppColors.secondaryColor,
      disabledForegroundColor: Colors.white,
      minimumSize: const Size(double.infinity, AppSizes.buttonHeight),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  /// ⚪ Outlined Button Theme
  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style:
        OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          side: BorderSide(color: AppColors.primaryColor, width: 1.2),
          minimumSize: const Size(double.infinity, 48),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ).copyWith(
          overlayColor: WidgetStateProperty.all(
            AppColors.primaryColor.withFixedOpacity(0.08),
          ),
        ),
  );

  /// 🩶 Text Button Theme
  static final textButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.primaryColor,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  /// 🟣 Floating Action Button Theme
  static final floatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryColor,
    foregroundColor: Colors.white,
    elevation: 2,
    disabledElevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    splashColor: AppColors.primaryColor.withFixedOpacity(0.12),
    focusColor: AppColors.primaryColor.withFixedOpacity(0.12),
    hoverColor: AppColors.primaryColor.withFixedOpacity(0.10),
  );
}
