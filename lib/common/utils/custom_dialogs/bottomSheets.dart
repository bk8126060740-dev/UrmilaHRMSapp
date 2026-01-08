import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/widgets/dialog/common_bottom_sheet.dart';

import '../constants/sizes.dart';

class CustomBottomSheet {
  static Future<T?> show<T>({
    required BuildContext context,
    String? title,
    Widget? child,
    double topRadius = AppSizes.borderRadius16,
    bool showCloseIcon = true,
    bool isDismissible = true,
    Color? backgroundColor,
    EdgeInsetsGeometry? padding,
    VoidCallback? onClose,
    BorderRadius? borderRadius,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      showDragHandle: false, // ✅ THIS removes the dash
      builder: (ctx) {
        return CommonBottomSheet(
          title: title,
          showCloseIcon: showCloseIcon,
          isDismissible: isDismissible,
          padding: padding,
          borderRadius: borderRadius,
          backgroundColor: backgroundColor ?? AppColors.bgColor,
          onClose: onClose,
          child: child,
        );
      },
    );
  }
}
