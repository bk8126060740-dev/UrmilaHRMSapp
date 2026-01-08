import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

class CommonBottomSheet extends StatelessWidget {
  final String? title;
  final bool showCloseIcon;
  final bool isDismissible;
  final Widget? child;
  final double? maxHeight;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final VoidCallback? onClose;
  final BorderRadius? borderRadius;

  const CommonBottomSheet({
    super.key,
    this.title,
    this.showCloseIcon = true,
    this.isDismissible = true,
    this.child,
    this.maxHeight,
    this.padding,
    this.backgroundColor,
    this.onClose,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isDismissible,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        padding: MediaQuery.of(context).viewInsets, // 🔹 keyboard-safe + smooth
        child: Container(
          decoration: AppDecorations.card(
            color: backgroundColor ?? AppColors.bgColor,
            radius:
                borderRadius ??
                BorderRadius.only(
                  topLeft: Radius.circular(AppSizes.borderRadius16),
                  topRight: Radius.circular(AppSizes.borderRadius16),
                ),
          ),
          constraints: BoxConstraints(
            maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9,
          ),
          padding: padding ?? const EdgeInsets.all(AppSizes.space16),
          child: SafeArea(
            top: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 🔹 Header
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

                // 🔹 Content
                if (child != null)
                  Flexible(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: child!,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  /*  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => isDismissible,
      child: Container(
        decoration: AppDecorations.card(
          color: AppColors.bgColor,
          radius:
              borderRadius ??
              BorderRadius.only(
                topLeft: Radius.circular(AppSizes.borderRadius16),
                topRight: Radius.circular(AppSizes.borderRadius16),
              ),
        ),
        constraints: BoxConstraints(
          maxHeight: maxHeight ?? MediaQuery.of(context).size.height * 0.9,
        ),
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
  }*/
}
