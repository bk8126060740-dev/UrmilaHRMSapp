import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';

class CommonDialog extends StatelessWidget {
  final String? title;
  final String? message;
  final Widget? child;
  final bool isDismissible;
  final double borderRadius;

  const CommonDialog({
    super.key,
    this.title,
    this.message,
    this.child,
    this.isDismissible = true,
    this.borderRadius = AppSizes.borderRadius16,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isDismissible,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        title: title != null ? Text(title!, textAlign: TextAlign.center) : null,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message != null) Text(message!, textAlign: TextAlign.center),
            if (child != null) const SizedBox(height: AppSizes.space16),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}
