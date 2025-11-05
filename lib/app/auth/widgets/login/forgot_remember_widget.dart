import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/auth/screens/forgot_password_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/helpers/device_utility.dart';
import '../../../../common/widgets/checkbox/custom_checkbox.dart';
import '../../../../l10n/app_localizations.dart';
import '../../bloc/auth_bloc.dart';

class ForgotRememberWidget extends StatelessWidget {
  const ForgotRememberWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return CustomCheckBox(
              value: state.rememberMe,
              title: context.loc.rememberMe, // <-- handled internally
              onChanged: (value) {
                context.read<AuthBloc>().add(
                  AuthEvent.rememberMe(isRemember: value),
                );
              },
              scale: 0.9,
            );
          },
        ),
        const Spacer(),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () {
              AppDeviceUtils.unFocus();
              NavigationService.navigateTo(ForgotPasswordScreen.route);
            },
            child: Text(
              AppLocalizations.of(context)!.forgotPassQ,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
