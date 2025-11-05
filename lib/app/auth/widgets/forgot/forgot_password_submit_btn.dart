import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/dashboard/screens/dashboard_screen.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/navigation_service/navigation_service.dart';
import '../../../../common/utils/app_bloc/app_bloc.dart';
import '../../../../common/utils/popups/custom_snackbar.dart';
import '../../../../common/widgets/button/custom_button.dart';
import '../../bloc/auth_bloc.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key, required GlobalKey<FormState> formKey})
    : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        // if (state.status == AuthStatus.loginError) {
        //   CustomSnackBar.showError(context: context, message: state.message);
        // }
        //
        // if (state.status == AuthStatus.loginSuccess) {
        //   // CustomSnackBar.showSuccess(context: context, message: state.message);
        //   context.read<AppBloc>().add(
        //     AppEvent.updateLoginResponse(state.loginResponseModel),
        //   );
        //   context.read<AuthBloc>().add(AuthEvent.getUserData());
        // }
        // if (state.status == AuthStatus.userSuccess) {
        //   CustomSnackBar.showSuccess(
        //     context: context,
        //     message: "Login Successful.",
        //   );
        //
        //   context.read<AppBloc>().add(
        //     AppEvent.updateUserResponse(state.userResponseModel),
        //   );
        //   final result = await NavigationService.navigateAndRemoveAll(
        //     DashboardScreen.route,
        //   );
        //   debugPrint('HQ result: $result');
        // }
      },
      buildWhen: (prev, current) {
        return prev.status != current.status;
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state.loginLoading,
          onTap: () async {
            // if (_formKey.currentState!.validate()) {
            //   context.read<AuthBloc>().add(const AuthEvent.login());
            // }
          },
          width: double.infinity,
          text: context.loc.submit,
          fontWeight: FontWeight.w500,
        );
      },
    );
  }
}
