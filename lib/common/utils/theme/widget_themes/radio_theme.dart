import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../constants/colors.dart';

class AppRadioTheme {
  AppRadioTheme._();

  /// Light Theme
  static RadioThemeData lightRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor; // selected circle fill
      }
      return AppColors.iconColor;
    }),
    overlayColor: WidgetStateProperty.all<Color>(
      AppColors.primaryColor.withFixedOpacity(0.1),
    ),
    splashRadius: 20,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );

  /// Dark Theme
  static RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color>((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primaryColor;
      }
      return AppColors.iconColor;
    }),
    overlayColor: WidgetStateProperty.all<Color>(
      AppColors.primaryColor.withFixedOpacity(0.1),
    ),
    splashRadius: 20,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}
