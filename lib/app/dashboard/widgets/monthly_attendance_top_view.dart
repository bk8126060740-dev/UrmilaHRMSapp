import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/screens/employee/daily_attendance_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../common/networking/api_url.dart';
import '../../../common/utils/app_bloc/app_bloc.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/decorations.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/utils/helpers/device_utility.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../../../common/widgets/image/custom_image.dart';

class MonthlyAttendanceTopView extends StatelessWidget {
  const MonthlyAttendanceTopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: AppDecorations.card(),
          padding: const EdgeInsets.only(top: 40, bottom: 20),
          width: AppDeviceUtils.getScreenWidth(context),
          child: BlocBuilder<AppBloc, AppState>(
            builder: (context, appState) {
              return Column(
                children: [
                  AppSizes.space20.vGap,
                  Text(
                    // "${appState.userProfileModel?.firstName?.withDefault("__")} ${appState.userProfileModel?.lastName.withDefault("")}",
                    "${appState.loginResponse?.fullName?.withDefault("__")}",
                    style: AppTextStyles.w500_24(context),
                  ),
                  const SizedBox(height: AppSizes.space4),
                  Text(
                    "${appState.loginResponse?.projectName.withDefault("__")}",
                    style: AppTextStyles.w400_16(
                      context,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: AppSizes.space4),
                  Text(
                    // "Emp ID: ${appState.userProfileModel?.id}",
                    "Emp ID: ${appState.loginResponse?.employeeId}",
                    style: AppTextStyles.w400_12(
                      context,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  // const SizedBox(height: AppSizes.space16),
                  // CustomButton(
                  //   width: AppSizes.buttonWidth,
                  //   height: AppSizes.buttonHeight45,
                  //   text: "Mark Attendance",
                  //   onTap: () {
                  //     NavigationService.navigateTo(MarkAttendanceScreen.route);
                  //   },
                  // ),
                ],
              );
            },
          ),
        ),
        Positioned(
          top: -40,
          child: BlocBuilder<AppBloc, AppState>(
            builder: (context, appState) {
              var profilePath = appState.userProfileModel?.profilePath ?? "";

              return CustomImage(
                // imageUrl: appState.userProfileModel?.profilePath ?? "",
                imageUrl: profilePath.isNotEmpty
                    ? ApiUrl.viewImageBase + profilePath
                    : AppImages.profileImage,
                fallbackAsset: AppImages.profileImage,
                size: 100,
                borderColor: Colors.white,
                borderWidth: 2,
                useShimmer: true,
              );
            },
          ),
        ),
      ],
    );
  }
}
