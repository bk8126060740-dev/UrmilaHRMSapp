import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_styles.dart';
import '../../utils/helpers/device_utility.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding24),
        child: Column(
          children: [
            SizedBox(
              width: AppDeviceUtils.getScreenWidth(context),
              height: AppDeviceUtils.getScreenHeight(context) * 0.45,
              child: Center(
                child: Lottie.asset(AppImages.comingSoon, repeat: true),
              ),
            ),
            const SizedBox(height: AppSizes.space20),
            Text(
              "We’re creating something great! Thank you for your patience and continued support.",
              textAlign: TextAlign.center,
              style: AppTextStyles.w400_18(
                context,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
