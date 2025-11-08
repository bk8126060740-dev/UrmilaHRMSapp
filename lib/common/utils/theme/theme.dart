import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/theme/widget_themes/dialog_theme.dart';

import '../constants/colors.dart';
import '../theme/widget_themes/appbar_theme.dart';
import '../theme/widget_themes/bottom_sheet_theme.dart';
import '../theme/widget_themes/checkbox_theme.dart';
import '../theme/widget_themes/text_field_theme.dart';
import 'widget_themes/button_theme.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData lightTheme = ThemeData(
    // fontFamily: GoogleFonts.mukta().fontFamily,
    useMaterial3: true,
    disabledColor: AppColors.borderColor,
    brightness: Brightness.light,
    dialogTheme: AppDialogTheme.lightDialogTheme,
    primaryColor: AppColors.primaryColor,
    // textTheme: AppTextTheme.lightTextTheme,
    // chipTheme: AppChipTheme.lightChipTheme,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    checkboxTheme: AppCheckboxTheme.lightCheckboxTheme,
    scaffoldBackgroundColor: AppColors.bgColor,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    // elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme,
    // elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
    textButtonTheme: AppButtonTheme.textButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    // fontFamily: GoogleFonts.mukta().fontFamily,
    useMaterial3: true,
    disabledColor: AppColors.borderColor,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    dialogTheme: AppDialogTheme.darkDialogTheme,
    // textTheme: AppTextTheme.darkTextTheme,
    // chipTheme: AppChipTheme.darkChipTheme,
    appBarTheme: AppAppBarTheme.darkAppBarTheme,
    checkboxTheme: AppCheckboxTheme.darkCheckboxTheme,
    scaffoldBackgroundColor: AppColors.bgColor,
    bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
    inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme,
    // elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
    textButtonTheme: AppButtonTheme.textButtonTheme,
  );
}
