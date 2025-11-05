import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_styles.dart';
import '../../utils/helpers/device_utility.dart';

class NoInternetUi extends StatelessWidget {
  const NoInternetUi({super.key, required this.context});

  final BuildContext context;

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
                child: Image.asset(AppImages.noInternet /* height: 300*/),
              ),
            ),
            const SizedBox(height: AppSizes.space20),
            Text(
              context.loc.noInternet,
              style: AppTextStyles.w500_24(context, color: AppColors.textColor),
            ),
            const SizedBox(height: AppSizes.space12),
            Text(
              context.loc.slowOrNoInternet,
              textAlign: TextAlign.center,
              style: AppTextStyles.w400_14(
                context,
                color: AppColors.secondaryTextColor,
              ),
            ),
            const SizedBox(height: AppSizes.space20),

            CustomButton(text: context.loc.tryAgain, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
