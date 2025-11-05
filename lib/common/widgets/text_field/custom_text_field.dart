import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField.outlineBorder({
    super.key,
    this.borderRadius = 8,
    this.textDirection,
    this.textStyle,
    this.controller,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.hintTextSize,
    this.contentPadding,
    this.enabled,
    this.readOnly = false,
    this.focusNode,
    this.labelText,
    this.labelTextStyle,
    this.maxLength,
    this.maxLines,
    this.errorMaxLines,
    this.minLines,
    this.textInputType,
    this.borderColor,
    this.suffixIconConstraints,
    this.validator,
    this.onChanged,
    this.counterText = false,
    this.counterStyle,
    this.initialValue,
    this.hintColor,
    this.errorTextStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.isCollapsed = false,
    this.setMaxLineNull = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.onFieldSubmitted,
    this.inputFormatters,
  });

  const CustomTextField.underlineBorder({
    super.key,
    this.borderRadius = 8,
    this.textDirection,
    this.textStyle,
    this.controller,
    this.counterText = false,
    this.counterStyle,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.hintTextSize,
    this.contentPadding,
    this.enabled,
    this.readOnly = false,
    this.labelText,
    this.focusNode,
    this.labelTextStyle,
    this.maxLength,
    this.maxLines,
    // this.errorMaxLine,
    this.textInputType,
    this.borderColor,
    this.suffixIconConstraints,
    this.validator,
    this.onChanged,
    this.initialValue,
    this.hintColor,
    this.errorTextStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.isCollapsed = false,
    this.setMaxLineNull = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.onFieldSubmitted,
    this.minLines,
    this.errorMaxLines,
    this.inputFormatters,
  });

  final bool isCollapsed;
  final bool setMaxLineNull;
  final int? minLines;

  // ===============================
  final TextDirection? textDirection;
  final double? hintTextSize;
  final String? hintText;
  final double borderRadius;
  final Widget? suffixIcon, prefixIcon;
  final EdgeInsets? contentPadding;
  final String? labelText;
  final TextStyle? labelTextStyle, textStyle, errorTextStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final bool counterText;
  final TextStyle? counterStyle;
  final bool? enabled;
  final bool? readOnly;
  final FocusNode? focusNode;
  final int? maxLines, maxLength;
  final int? errorMaxLines; // New parameter for max error lines
  final TextEditingController? controller;
  final Color? borderColor, hintColor;
  final BoxConstraints? suffixIconConstraints, prefixIconConstraints;
  final String? Function(String?)? validator;
  final String? initialValue;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      minLines: widget.minLines,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly!,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      textAlign: widget.textAlign,
      textAlignVertical: widget.textAlignVertical,
      controller: widget.controller,
      onChanged: widget.onChanged,
      keyboardType: widget.textInputType,
      textInputAction: widget.textInputAction,
      initialValue: widget.initialValue,
      validator: widget.validator,
      obscureText: widget.obscureText ?? false,
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      maxLines: widget.setMaxLineNull ? null : widget.maxLines ?? 1,
      style:
          widget.textStyle ??
          Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppColors.textColor),
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        isCollapsed: widget.isCollapsed,
        prefixIcon: widget.prefixIcon,
        prefixIconConstraints: widget.prefixIconConstraints,
        suffixIcon: widget.suffixIcon,
        suffixIconConstraints: widget.suffixIconConstraints,
        hintText: widget.hintText,
        counterText: "",
      ),
    );
  }
}
