import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_styles.dart';

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final TextStyle? textStyle;
  final ValueChanged<T?> onChanged;
  final double? scale;

  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    super.key,
    required this.title,
    this.textStyle,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: scale ?? 0.9,
          child: Radio<T>(
            value: value,
            groupValue: groupValue,
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: AppSizes.space4),
        Text(title, style: textStyle ?? AppTextStyles.w400_14(context)),
      ],
    );
  }
}
