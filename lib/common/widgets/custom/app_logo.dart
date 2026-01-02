import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/image_strings.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_styles.dart';

class AppLogo extends StatelessWidget {
  final double height;
  final double width;
  final String? title;
  final bool showTxt;

  const AppLogo({
    super.key,
    this.height = AppSizes.imageSize100,
    this.width = AppSizes.imageSize100,
    this.title,
    this.showTxt = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            height: height,
            width: width,
            // fit: BoxFit.fill,
            AppImages.logo,
          ),
          if (showTxt)
            Text(
              style: AppTextStyles.w500_20(
                context,
                color: AppColors.primaryColor,
              ),
              title ?? "",
            ),
        ],
      ),
    );
  }
}
