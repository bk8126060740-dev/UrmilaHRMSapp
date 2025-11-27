import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';

class CommonCentreDialog extends StatelessWidget {
  final Widget? child;
  final bool isDismissible;
  final double borderRadius;

  const CommonCentreDialog({
    super.key,
    this.child,
    this.isDismissible = true,
    this.borderRadius = AppSizes.borderRadius16,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isDismissible,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}
