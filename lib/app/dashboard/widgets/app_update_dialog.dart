import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/dashboard/model/app_version_model.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/helpers/device_utility.dart';
import 'package:hrms_uis/common/utils/helpers/helper_functions.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';
import 'package:lottie/lottie.dart';

class AppUpdateDialog extends StatelessWidget {
  final AppVersionModel? appVersionModel;

  const AppUpdateDialog({super.key, this.appVersionModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🔥 Lottie Animation
        Lottie.asset(AppImages.appUpdateAnim, height: 120, repeat: true),

        const SizedBox(height: AppSizes.space16),

        Text("Update Required", style: Theme.of(context).textTheme.titleLarge),

        const SizedBox(height: AppSizes.space8),

        Text(
          appVersionModel?.updateMessage ?? "New update available",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

        const SizedBox(height: AppSizes.space24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: BlocConsumer<AppBloc, AppState>(
                listener: (BuildContext context, AppState state) {
                  // log("logout loading listener :-> ${state.status}");
                  // if (state.status == AppStatus.logoutSuccess) {
                  //   NavigationService.navigateAndRemoveAll(LoginScreen.route);
                  // }
                },
                builder: (context, state) {
                  log("logout loading builder :-> ${state.status}");

                  return CustomButton(
                    onTap: state.status == AppStatus.logoutLoading
                        ? null
                        : () async {
                            var packageName =
                                await AppDeviceUtils.getPackageName();
                            log("package name = $packageName");
                            AppHelperFunctions.launchExternal(
                              appVersionModel?.storeUrl ??
                                  "https://play.google.com/store/apps/details?id=$packageName",
                            );
                          },
                    text: 'UPDATE',
                    isLoading: state.status == AppStatus.logoutLoading,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
