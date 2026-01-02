import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

class ReadMoreText extends StatefulWidget {
  final String? text;
  final int trimLength;
  final TextStyle? style;
  final String readMoreText;
  final String readLessText;
  final TextStyle? toggleTextStyle;
  final String emptyText;

  const ReadMoreText({
    super.key,
    required this.text,
    this.trimLength = 100,
    this.style,
    this.readMoreText = "Read more ▼",
    this.readLessText = "Read less ▲",
    this.toggleTextStyle,
    this.emptyText = "-",
  });

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier(false);

  @override
  void dispose() {
    _isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = widget.style ?? AppTextStyles.w400_14(context);
    final text = widget.text?.trim() ?? "";

    /// Empty case
    if (text.isEmpty) {
      return Text(widget.emptyText, style: defaultStyle.copyWith());
    }

    final bool shouldTrim = text.length > widget.trimLength;

    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: ValueListenableBuilder<bool>(
        valueListenable: _isExpanded,
        builder: (_, isExpanded, _) {
          final visibleText = shouldTrim && !isExpanded
              ? text.substring(0, widget.trimLength)
              : text;

          return GestureDetector(
            onTap: shouldTrim ? () => _isExpanded.value = !isExpanded : null,
            child: RichText(
              text: TextSpan(
                style: defaultStyle,
                children: [
                  TextSpan(
                    text: shouldTrim && !isExpanded
                        ? "$visibleText..."
                        : visibleText,
                  ),
                  if (shouldTrim)
                    TextSpan(
                      text: isExpanded
                          ? " ${widget.readLessText}"
                          : " ${widget.readMoreText}",
                      style:
                          widget.toggleTextStyle ??
                          defaultStyle.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
