import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_styles.dart';

enum TitleValueLayout { row, column }

class CustomTitleValueView extends StatelessWidget {
  final String title;
  final String? value;
  final TitleValueLayout layout;
  final bool wrapText;

  // ✨ NEW FLEXIBILITY
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final Color? titleColor;
  final Color? valueColor;
  final CrossAxisAlignment rowAlignment;
  final CrossAxisAlignment columnAlignment;

  const CustomTitleValueView({
    super.key,
    required this.title,
    this.value,
    this.layout = TitleValueLayout.row,
    this.wrapText = true,

    // NEW OPTIONAL PARAMETERS
    this.titleStyle,
    this.valueStyle,
    this.titleColor,
    this.valueColor,
    this.rowAlignment = CrossAxisAlignment.start,
    this.columnAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final titleWidget = Text(
      title,
      style:
          titleStyle ??
          AppTextStyles.w400_14(
            context,
            color: titleColor ?? AppColors.secondaryTextColor,
          ),
    );

    final valueWidget = Text(
      value ?? "N/A",
      style:
          valueStyle ??
          AppTextStyles.w400_14(
            context,
            color: valueColor ?? AppColors.textColor,
          ),
      softWrap: wrapText,
      overflow: wrapText ? TextOverflow.visible : TextOverflow.ellipsis,
      maxLines: wrapText ? null : 1,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.space4),
      child: layout == TitleValueLayout.row
          ? Row(
              crossAxisAlignment: rowAlignment,
              children: [
                titleWidget,
                Expanded(child: valueWidget),
              ],
            )
          : Column(
              crossAxisAlignment: columnAlignment,
              children: [titleWidget, const SizedBox(height: 4), valueWidget],
            ),
    );
  }
}
