import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:lottie/lottie.dart';

class NoDataFound extends StatelessWidget {
  final String message;

  const NoDataFound({super.key, this.message = "No Data Found!"});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          AppImages.noDataAnim,
          width: 150,
          height: 150,
          repeat: true,
        ),
        const SizedBox(height: 5),
        Text(
          message,
          style: AppTextStyles.w400_14(context),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
