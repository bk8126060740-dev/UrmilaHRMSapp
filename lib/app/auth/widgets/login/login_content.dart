import 'package:flutter/material.dart';
import 'package:hrms_uis/app/auth/widgets/login/forgot_remember_widget.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/utils/helpers/device_utility.dart';
import '../../../../common/widgets/custom/app_logo.dart';
import 'login_button.dart';
import 'login_input.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key, required GlobalKey<FormState> formKey})
    : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // app logo
            SizedBox(
              height: AppDeviceUtils.getScreenHeight(context) * 0.30,
              width: AppDeviceUtils.getScreenWidth(context),
              child: Center(child: AppLogo()),
            ),

            // input fields and buttons
            SizedBox(
              height: AppDeviceUtils.getScreenHeight(context) * 0.70,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.padding24,
                    vertical: 0,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${context.loc.loginTitle}!",
                          style: AppTextStyles.w500_20(
                            context,
                          ).copyWith(fontSize: AppSizes.fontSize24),
                        ),
                        SizedBox(height: AppSizes.space4),
                        Text(
                          context.loc.loginDesc,
                          style: AppTextStyles.w400_14(
                            context,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        const SizedBox(height: AppSizes.space20),
                        LoginInput(formKey: _formKey),
                        const SizedBox(height: AppSizes.space12),
                        ForgotRememberWidget(),
                        const SizedBox(height: AppSizes.space20),
                        LoginButton(formKey: _formKey),
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
