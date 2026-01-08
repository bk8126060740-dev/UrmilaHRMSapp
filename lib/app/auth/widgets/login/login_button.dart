import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/dashboard/screens/dashboard_screen.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/helpers/device_utility.dart';

import '../../../../common/navigation_service/navigation_service.dart';
import '../../../../common/utils/app_bloc/app_bloc.dart';
import '../../../../common/utils/popups/custom_snackbar.dart';
import '../../../../common/widgets/button/custom_button.dart';
import '../../bloc/auth_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required GlobalKey<FormState> formKey})
    : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state.status == AuthStatus.loginError) {
          CustomSnackBar.showError(context: context, message: state.message);
        }

        if (state.status == AuthStatus.loginSuccess) {
          // context.read<AppBloc>().add(
          //   AppEvent.updateLoginResponse(state.loginResponseModel),
          // );
          // context.read<AuthBloc>().add(AuthEvent.getUserData());

          CustomSnackBar.showSuccess(context: context, message: state.message);

          context.read<AppBloc>().add(
            AppEvent.updateLoginResponse(state.loginResponseModel),
          );

          final result = await NavigationService.navigateAndRemoveAll(
            DashboardScreen.route,
          );
        }

        if (state.status == AuthStatus.userSuccess) {
          // CustomSnackBar.showSuccess(
          //   context: context,
          //   message: "Login Successfully",
          // );
          //
          // context.read<AppBloc>().add(
          //   AppEvent.updateUserResponse(state.userResponseModel),
          // );
          //
          // final result = await NavigationService.navigateAndRemoveAll(
          //   DashboardScreen.route,
          // );
          // debugPrint('HQ result: $result');
        }
      },
      buildWhen: (prev, current) {
        return prev.status != current.status;
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state.loginLoading || state.userResponseLoading,
          onTap: () async {
            if (_formKey.currentState!.validate()) {
              AppDeviceUtils.unFocus();
              context.read<AuthBloc>().add(const AuthEvent.login());
            }
          },
          width: AppDeviceUtils.getScreenWidth(context),
          text: context.loc.login,
          fontWeight: FontWeight.w500,
        );
      },
    );
  }
}
