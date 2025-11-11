import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

class CommonBottomSheet extends StatelessWidget {
  final String? title;
  final bool showCloseIcon;
  final bool isDismissible;
  final Widget? child;
  final double borderRadius;
  final double? maxHeight;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final VoidCallback? onClose;

  const CommonBottomSheet({
    super.key,
    this.title,
    this.showCloseIcon = true,
    this.isDismissible = true,
    this.child,
    this.borderRadius = AppSizes.borderRadius16,
    this.maxHeight,
    this.padding,
    this.backgroundColor,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WillPopScope(
      onWillPop: () async => isDismissible,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9,
        ),
        // decoration: BoxDecoration(
        //   color: backgroundColor ?? AppColors.bgColor,
        //   borderRadius: BorderRadius.vertical(
        //     top: Radius.circular(borderRadius),
        //   ),
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black.withFixedOpacity(0.25),
        //       offset: const Offset(0, -2),
        //       blurRadius: 8,
        //     ),
        //   ],
        // ),
        padding: padding ?? const EdgeInsets.all(AppSizes.space16),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 Header (Title + Close Button)
                if (title != null || showCloseIcon)
                  Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.space12),
                    child: Row(
                      children: [
                        if (title != null)
                          Expanded(
                            child: Text(
                              title!,
                              style: AppTextStyles.w400_16(context),
                            ),
                          ),
                        if (showCloseIcon)
                          GestureDetector(
                            onTap: onClose ?? () => Navigator.pop(context),
                            child: Icon(
                              Icons.close,
                              size: AppSizes.iconSize24,
                              color: AppColors.iconColor,
                            ),
                          ),
                      ],
                    ),
                  ),

                // 🔹 Flexible Child Area
                if (child != null) Flexible(child: child!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
