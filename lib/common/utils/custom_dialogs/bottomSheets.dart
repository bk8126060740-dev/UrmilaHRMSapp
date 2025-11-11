import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';

class CustomBottomSheet {
  static Future<T?> showCommonBottomSheet<T>({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      showDragHandle: false,
      backgroundColor: AppColors.bgColor,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: child,
      ),
    );
  }
}
