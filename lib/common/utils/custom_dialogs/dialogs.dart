import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/widgets/loader/custom_circular_progress.dart';

import 'base_center_dialog.dart';

class CustomDialogs {
  static Future<T?> showCenterDialog<T>({
    required BuildContext context,
    required Widget child,
    required String title,
  }) {
    return showDialog<T>(
      context: context,
      builder: (context) => BaseCenterDialog(content: child, title: title),
    );
  }

  static Future<void> showAlertDialog({
    required BuildContext context,
    String? title,
    String? content,
    String confirmText = 'OK',
    String? cancelText, // null = no cancel button
    bool isDismissible = true,
    VoidCallback? onConfirm,
    bool isLoading = false,
    VoidCallback? onCancel, // if null, auto pop
  }) {
    return showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (ctx) => WillPopScope(
        // prevent back button if dismissible = false
        onWillPop: () async => isDismissible,
        child: Center(
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: title != null ? Text(title) : null,
            content: content != null ? Text(content) : null,
            actions: [
              if (cancelText != null)
                TextButton(
                  onPressed: () {
                    if (onCancel != null) {
                      onCancel();
                    } else {
                      Navigator.pop(ctx);
                    }
                  },
                  child: Text(
                    cancelText,
                    style: AppTextStyles.w500_14(
                      context,
                      color: AppColors.accentColor,
                    ),
                  ),
                ),
              if (onConfirm != null)
                TextButton(
                  onPressed: () {
                    onConfirm();
                  },
                  child: isLoading
                      ? CustomCircularProgress()
                      : Text(
                          confirmText,
                          style: AppTextStyles.w500_14(
                            context,
                            color: AppColors.primaryColor,
                          ),
                        ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  static Future<void> showCommonDialog({
    required BuildContext context,
    bool isDismissible = true,
    required Widget child,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (ctx) => Center(
        // Ensure dialog is centered on large screens
        child: child,
      ),
    );
  }
}
