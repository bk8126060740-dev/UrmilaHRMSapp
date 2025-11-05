import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../loader/custom_circular_progress.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.isLoading = false,
    this.backgroundColor,
    this.borderColor,
    this.fontWeight = FontWeight.w600,
    this.textColor,
    this.width,
    this.height,
    this.image,
    this.imageHeight,
    this.imageWidth,
    this.leftImage,
    this.leftImageHeight,
    this.leftImageWidth,
    this.borderRadius = AppSizes.borderRadius8,
    required this.text,
    required this.onTap,
    this.fontSize = AppSizes.fontSize14,
    this.debounceDuration = const Duration(seconds: 1),
  });

  final double fontSize;
  final FontWeight fontWeight;
  final Color? backgroundColor, borderColor;
  final double borderRadius;
  final String? image;
  final String? leftImage;
  final Color? textColor;
  final String text;
  final double? imageHeight, imageWidth;
  final double? leftImageHeight, leftImageWidth;
  final double? width, height;
  final Function()? onTap;
  final bool isLoading;
  final Duration debounceDuration;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isDisabled = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.isLoading,
      child: ElevatedButton(
        onPressed: isDisabled ? null : widget.onTap,
        style: ElevatedButton.styleFrom(
          fixedSize: widget.width != null
              ? Size(widget.width!, widget.height ?? AppSizes.buttonHeight)
              : null,
          // minimumSize: Size(
          //   widget.width ?? double.infinity,
          //   widget.height ?? AppSizes.buttonHeight,
          // ),
          disabledBackgroundColor:
              widget.backgroundColor ?? AppColors.disabledColor,
          backgroundColor: widget.backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            side: widget.borderColor == null
                ? BorderSide.none
                : BorderSide(color: widget.borderColor!),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
        child: widget.isLoading
            ? CustomCircularProgress()
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
                    SizedBox(width: 6),
                    Text(
                      widget.text,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: /*widget.onTap == null || isDisabled
                      ? Theme.of(context).colorScheme.secondary
                      :*/
                            widget.textColor ?? AppColors.whiteTextColor,
                        fontWeight: widget.fontWeight,
                        fontSize: widget.fontSize,
                      ),
                    ),
                    SizedBox(width: 6),
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
