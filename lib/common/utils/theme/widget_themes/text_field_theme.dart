import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class AppTextFormFieldTheme {
  AppTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.iconColor,
    suffixIconColor: AppColors.iconColor,
    isDense: false,
    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
    labelStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSize12,
      color: AppColors.textColor,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSize14,
      color: AppColors.hintTextColor,
    ),
    errorStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSize14,
      color: AppColors.error,
    ),
    floatingLabelStyle: const TextStyle().copyWith(color: AppColors.textColor),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.inputBorderColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.inputBorderColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.primaryColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: AppColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: AppColors.iconColor,
    suffixIconColor: AppColors.iconColor,
    isDense: false,
    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
    labelStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSize14,
      color: AppColors.textColor,
    ),
    errorStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSize14,
      color: AppColors.error,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: AppSizes.fontSize14,
      color: AppColors.hintTextColor,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: AppColors.textColor.withAlpha(80),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.inputBorderColor),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.inputBorderColor),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.primaryColor),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(AppSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: AppColors.error),
    ),
  );
}
