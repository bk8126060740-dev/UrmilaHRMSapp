import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/widgets/custom/custom_base_screen.dart';

import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/device_utility.dart';
import '../button/custom_button.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return CustomBaseScreen(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: AppDeviceUtils.getScreenWidth(context),
                  height: AppDeviceUtils.getScreenHeight(context) * 0.45,
                  child: Image.asset(
                    AppImages.noInternet, // <- replace
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(
                  height: AppDeviceUtils.getScreenHeight(context) * 0.55,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.padding20,
                      vertical: 0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Title text (No Internet...)
                        Text(
                          'No Internet...',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.w600_24(
                            context,
                          ).copyWith(fontSize: AppSizes.fontSize24),
                        ),

                        const SizedBox(height: AppSizes.space12),

                        // Description text
                        Text(
                          'Slow or no internet connection.\nPlease check your internet connection.',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.w400_16(
                            context,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),

                        const SizedBox(height: AppSizes.space24),

                        // Try Again button styled similar to a card with shadow and background tint
                        CustomButton(
                          width: AppDeviceUtils.getScreenWidth(context),
                          onTap: onRetry,
                          text: 'Try Again',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
