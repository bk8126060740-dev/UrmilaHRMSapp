import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/helpers/device_utility.dart';
import 'package:hrms_uis/common/widgets/custom/custom_base_screen.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../widgets/forgot/forgot_pass_top_img.dart';
import '../widgets/forgot/forgot_password_input.dart';
import '../widgets/forgot/forgot_password_submit_btn.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const route = '/forgotPassword';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return CustomBaseScreen(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: AppDeviceUtils.getScreenWidth(context),
              height: AppDeviceUtils.getScreenHeight(context) * 0.45,
              child: ForgotPasswordTopImg(),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: AppDeviceUtils.getScreenHeight(context) * 0.55,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.padding20,
                    vertical: 0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${context.loc.forgotPassQ}!",
                          style: AppTextStyles.w500_20(
                            context,
                          ).copyWith(fontSize: AppSizes.fontSize24),
                        ),
                        SizedBox(height: AppSizes.space4),
                        Text(
                          context.loc.dontWorryItHappens,
                          style: AppTextStyles.w400_14(
                            context,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        const SizedBox(height: AppSizes.space20),
                        ForgotPasswordInput(formKey: _formKey),
                        const SizedBox(height: AppSizes.space20),
                        ForgotPasswordButton(formKey: _formKey),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
