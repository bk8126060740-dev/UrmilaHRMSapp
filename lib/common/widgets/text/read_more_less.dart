import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int trimLines;
  final TextStyle? style;
  final String readMoreText;
  final String readLessText;
  final TextStyle? toggleTextStyle;

  const ReadMoreText({
    super.key,
    required this.text,
    this.trimLines = 2,
    this.style,
    this.readMoreText = "Read more ▼",
    this.readLessText = "Read less ▲",
    this.toggleTextStyle,
  });

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;
  late String firstPart;
  late String secondPart;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _processText();
  }

  void _processText() {
    final span = TextSpan(text: widget.text, style: widget.style);
    final tp = TextPainter(
      text: span,
      maxLines: widget.trimLines,
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width);

    if (tp.didExceedMaxLines) {
      // Split text in two parts
      int endIndex = tp
          .getPositionForOffset(Offset(tp.width, tp.height))
          .offset;

      firstPart = widget.text.substring(0, endIndex);
      secondPart = widget.text.substring(endIndex).trim();
    } else {
      firstPart = widget.text;
      secondPart = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final defaultStyle = widget.style ?? AppTextStyles.w400_14(context);

    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: GestureDetector(
        onTap: () => setState(() => isExpanded = !isExpanded),
        child: RichText(
          text: TextSpan(
            style: defaultStyle,
            children: [
              TextSpan(text: isExpanded ? widget.text : "$firstPart..."),
              if (secondPart.isNotEmpty)
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
      ),
    );
  }
}
