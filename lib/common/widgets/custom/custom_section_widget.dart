import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

import '../../utils/constants/decorations.dart';

class CustomSectionWidget extends StatelessWidget {
  final String title;
  final Widget child;

  const CustomSectionWidget({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: AppDecorations.card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.w500_14(context)),
          const SizedBox(height: AppSizes.space12),
          child,
        ],
      ),
    );
  }
}
