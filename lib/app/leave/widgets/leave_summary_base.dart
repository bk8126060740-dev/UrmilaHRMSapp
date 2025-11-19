import 'package:flutter/material.dart';

import '../../../common/utils/constants/decorations.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/constants/text_styles.dart';

class LeaveSummaryBase extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const LeaveSummaryBase({
    super.key,
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.padding16),
      decoration: AppDecorations.card(
        radius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.borderRadius12),
          bottomRight: Radius.circular(AppSizes.borderRadius12),
          topRight: Radius.circular(AppSizes.borderRadius16),
          topLeft: Radius.circular(AppSizes.borderRadius16),
        ),
      ),
      child: Column(
        children: [
          Text(title, style: AppTextStyles.w400_14(context)),
          SizedBox(height: AppSizes.space4),
          Text(value, style: AppTextStyles.w600_20(context, color: color)),
        ],
      ),
    );
  }
}
