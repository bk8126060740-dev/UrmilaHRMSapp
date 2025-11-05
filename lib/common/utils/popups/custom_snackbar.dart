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
