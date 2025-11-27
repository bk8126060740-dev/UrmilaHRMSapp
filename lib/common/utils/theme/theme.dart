import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/theme/widget_themes/dialog_theme.dart';

import '../constants/colors.dart';
import '../theme/widget_themes/appbar_theme.dart';
import '../theme/widget_themes/bottom_sheet_theme.dart';
import '../theme/widget_themes/checkbox_theme.dart';
import '../theme/widget_themes/text_field_theme.dart';
import 'widget_themes/button_theme.dart';
import 'widget_themes/radio_theme.dart' show AppRadioTheme;

class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    disabledColor: AppColors.borderColor,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    dialogTheme: AppDialogTheme.lightDialogTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
    textButtonTheme: AppButtonTheme.textButtonTheme,
    floatingActionButtonTheme: AppButtonTheme.floatingActionButtonTheme,
    radioTheme: AppRadioTheme.lightRadioTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    disabledColor: AppColors.borderColor,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    dialogTheme: AppDialogTheme.darkDialogTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    scaffoldBackgroundColor: AppColors.scaffoldBgColor,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
    textButtonTheme: AppButtonTheme.textButtonTheme,
    floatingActionButtonTheme: AppButtonTheme.floatingActionButtonTheme,
    radioTheme: AppRadioTheme.darkRadioTheme,
  );
}
