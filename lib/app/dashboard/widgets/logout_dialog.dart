import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';

import '../../../common/navigation_service/navigation_service.dart';
import '../../auth/screens/login_screen.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            isBorderButton: true,
            onTap: () => Navigator.pop(context),
            text: 'Cancel',
          ),
        ),
        // TextButton(
        //   onPressed: () => Navigator.pop(context),
        //   child: Text(
        //     'Cancel',
        //     style: AppTextStyles.w500_14(context, color: AppColors.accentColor),
        //   ),
        // ),
        const SizedBox(width: AppSizes.space8),
        Expanded(
          child: BlocConsumer<AppBloc, AppState>(
            listener: (BuildContext context, AppState state) {
              if (state.status == AppStatus.logoutSuccess) {
                NavigationService.navigateAndRemoveAll(LoginScreen.route);
              }
            },
            builder: (context, state) {
              return CustomButton(
                onTap: state.status == AppStatus.logoutLoading
                    ? null
                    : () {
                        context.read<AppBloc>().add(AppEvent.logoutUser());
                      },
                text: 'Logout',
                isLoading: state.status == AppStatus.logoutLoading,
              );

              // return TextButton(
              //   onPressed: state.status == AppStatus.logoutLoading
              //       ? null
              //       : () {
              //           context.read<AppBloc>().add(AppEvent.logoutUser());
              //         },
              //   child: state.status == AppStatus.logoutLoading
              //       ? Center(
              //           child: SizedBox(
              //             width: AppSizes.iconSize20,
              //             height: AppSizes.iconSize20,
              //             child: CircularProgressIndicator(strokeWidth: 2),
              //           ),
              //         )
              //       : Text(
              //           'Logout',
              //           style: AppTextStyles.w500_14(
              //             context,
              //             color: AppColors.primaryColor,
              //           ),
              //         ),
              // );
            },
          ),
        ),
      ],
    );
  }
}
