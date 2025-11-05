import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_styles.dart';

class CustomFieldHeading extends StatelessWidget {
  final String title;
  final bool isRequired;
  final Widget? trailing;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisAlignment? mainAxisAlignment;

  const CustomFieldHeading({
    super.key,
    required this.title,
    this.isRequired = false,
    this.trailing,
    this.padding,
    this.crossAxisAlignment,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(bottom: AppSizes.padding8),
      child: Row(
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: title,
              style: AppTextStyles.w400_14(context),
              children: [
                if (isRequired)
                  TextSpan(text: ' *', style: AppTextStyles.w500_14(context)),
              ],
            ),
          ),
          const SizedBox(width: AppSizes.space8),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
