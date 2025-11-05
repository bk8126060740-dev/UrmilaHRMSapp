import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';

class SalarySlipCard extends StatelessWidget {
  final String month;
  final String year;
  final VoidCallback? onTap;

  const SalarySlipCard({
    super.key,
    required this.month,
    required this.year,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.borderRadius16),
      child: Container(
        decoration: AppDecorations.card(),
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.padding12,
          horizontal: AppSizes.padding16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppImages.pdfIcon, width: 40, height: 40),
            const SizedBox(height: AppSizes.space8),
            Text(
              month,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'Outfit-Medium',
                fontSize: 16,
              ),
            ),
            const SizedBox(height: AppSizes.space4),
            Text(
              year,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontFamily: 'Outfit-Medium',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
