import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

class MaterialSquareIcon extends StatelessWidget {
  const MaterialSquareIcon({
    super.key,
    this.icon,
    this.title,
    this.onTap,
    this.squareColor,
    this.squareHeight,
    this.squareWidth,
    this.innerPadding,
    this.borderRadius,
    this.iconColor,
    this.borderColor = AppColors.inputBorderColor,
    required this.child,
    this.textStyle,
    this.iconTextGap = 4,
  });

  final EdgeInsetsGeometry? innerPadding;
  final IconData? icon;
  final String? title;
  final VoidCallback? onTap;
  final double? squareHeight, squareWidth;
  final Color? squareColor;
  final Color? iconColor;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final Widget child;
  final TextStyle? textStyle;
  final double? iconTextGap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:
          borderRadius ?? BorderRadius.circular(AppSizes.borderRadius12),
      child: SizedBox(
        width: squareWidth ?? 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: innerPadding ?? EdgeInsets.zero,
              width: squareWidth ?? 55,
              height: squareHeight ?? 55,
              alignment: Alignment.center,
              decoration: AppDecorations.card(
                radius: BorderRadiusGeometry.circular(AppSizes.borderRadius12),
                color: AppColors.surfaceContainer,
              ),
              child: child,
            ),
            if (title != null) ...[
              SizedBox(height: iconTextGap),
              Flexible(
                child: Text(
                  title!,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textStyle ?? AppTextStyles.w400_12(context),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
