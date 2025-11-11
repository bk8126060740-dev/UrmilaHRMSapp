import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../loader/custom_circular_progress.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.isBorderButton = false, // 👈 NEW
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.fontWeight = FontWeight.w600,
    this.fontSize = AppSizes.fontSize14,
    this.borderRadius = AppSizes.borderRadius8,
    this.width,
    this.height,
    this.image,
    this.imageHeight,
    this.imageWidth,
    this.leftImage,
    this.leftImageHeight,
    this.leftImageWidth,
    this.debounceDuration = const Duration(seconds: 1),
  });

  final bool isLoading;
  final bool isBorderButton; // 👈 new flag
  final Color? backgroundColor, borderColor, textColor;
  final double borderRadius, fontSize;
  final FontWeight fontWeight;
  final double? width, height;
  final String text;
  final String? image, leftImage;
  final double? imageHeight, imageWidth;
  final double? leftImageHeight, leftImageWidth;
  final Function()? onTap;
  final Duration debounceDuration;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isDisabled = false;

  @override
  Widget build(BuildContext context) {
    // 🎨 Define defaults depending on button type
    final bool isBorder = widget.isBorderButton;

    final Color bgColor =
        widget.backgroundColor ??
        (isBorder ? AppColors.surfaceColor : AppColors.primaryColor);

    final Color txtColor =
        widget.textColor ??
        (isBorder ? AppColors.textColor : AppColors.whiteTextColor);

    final Color borderClr =
        widget.borderColor ??
        (isBorder ? AppColors.inputBorderColor : Colors.transparent);

    return AbsorbPointer(
      absorbing: widget.isLoading,
      child: ElevatedButton(
        onPressed: isDisabled ? null : widget.onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: widget.width != null
              ? Size(widget.width!, widget.height ?? AppSizes.buttonHeight)
              : null,
          backgroundColor: bgColor,
          disabledBackgroundColor: AppColors.disabledColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            side: BorderSide(color: borderClr),
          ),
          elevation: isBorder ? 0 : 2,
        ),
        child: widget.isLoading
            ? const CustomCircularProgress()
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.leftImage != null)
                      Image.asset(
                        widget.leftImage!,
                        width: widget.leftImageWidth ?? 14,
                        height: widget.leftImageHeight ?? 14,
                      ),
                    const SizedBox(width: 6),
                    Text(
                      widget.text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: txtColor,
                        fontWeight: widget.fontWeight,
                        fontSize: widget.fontSize,
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (widget.image != null)
                      Image.asset(
                        widget.image!,
                        width: widget.imageWidth ?? 30,
                        height: widget.imageHeight ?? 30,
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
