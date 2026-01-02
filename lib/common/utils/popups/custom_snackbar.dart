/*
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class CustomSnackBar {
  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle_outline,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: AppColors.error,
      icon: Icons.error_outline,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: AppColors.warning,
      icon: Icons.warning_amber_rounded,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: AppColors.info,
      icon: Icons.info_outline,
    );
  }

  static void _showSnackBar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Duration duration = const Duration(seconds: 3),
  }) {
    final snackBar = SnackBar(
      duration: duration,
      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
*/

import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../constants/colors.dart';

class CustomSnackBar {
  static void showSuccess({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onActionPressed,
    String? actionLabel,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: AppColors.success,
      icon: Icons.check_circle_outline,
      duration: duration,
      onActionPressed: onActionPressed,
      actionLabel: actionLabel,
    );
  }

  static void showError({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onActionPressed,
    String? actionLabel,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: AppColors.error,
      icon: Icons.error_outline,
      duration: duration,
      onActionPressed: onActionPressed,
      actionLabel: actionLabel,
    );
  }

  static void showWarning({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onActionPressed,
    String? actionLabel,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: AppColors.warning,
      icon: Icons.warning_amber_rounded,
      duration: duration,
      onActionPressed: onActionPressed,
      actionLabel: actionLabel,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onActionPressed,
    String? actionLabel,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: AppColors.info,
      icon: Icons.info_outline,
      duration: duration,
      onActionPressed: onActionPressed,
      actionLabel: actionLabel,
    );
  }

  static void showNormal({
    required BuildContext context,
    required String message,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onActionPressed,
    String? actionLabel,
  }) {
    _showSnackBar(
      context: context,
      message: message,
      backgroundColor: AppColors.bgColor,
      icon: Icons.check_circle_outline,
      duration: duration,
      onActionPressed: onActionPressed,
      actionLabel: actionLabel,
      textColor: AppColors.textColor,
      iconColor: AppColors.textColor,
    );
  }

  static void _showSnackBar({
    required BuildContext context,
    required String message,
    required Color backgroundColor,
    required IconData icon,
    Duration duration = const Duration(seconds: 3),
    VoidCallback? onActionPressed,
    String? actionLabel,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
  }) {
    final snackBar = SnackBar(
      duration: onActionPressed != null ? const Duration(days: 1) : duration,

      backgroundColor: Colors.transparent,
      elevation: 0,
      behavior: SnackBarBehavior.floating,

      content: Container(
        constraints: const BoxConstraints(maxWidth: 600), // web friendly
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withFixedOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ICON
            Icon(icon, color: iconColor.withFixedOpacity(0.9), size: 22),

            const SizedBox(width: 12),

            // MESSAGE
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.3,
                ),
              ),
            ),

            // ACTION BUTTON
            if (onActionPressed != null)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    onActionPressed();
                  },
                  child: Text(
                    actionLabel ?? 'VIEW',
                    style: AppTextStyles.w400_14(context),
                  ),
                ),
              ),

            // CLOSE BUTTON
            if (onActionPressed != null)
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  },
                  child: Icon(
                    Icons.close,
                    color: textColor.withFixedOpacity(0.8),
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
