import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/app/attendance/screens/employee/monthly_attendance_screen.dart';
import 'package:hrms_uis/app/profile/screens/profile_screen.dart';
import 'package:hrms_uis/common/networking/api_url.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/helpers/device_utility.dart';
import 'package:hrms_uis/common/utils/helpers/helper_functions.dart';

import '../../../../common/navigation_service/navigation_service.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/custom_dialogs/dialogs.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/dialog/common_alert_dialog.dart';
import '../../../attendance/screens/employee/daily_attendance_screen.dart';
import '../../widgets/logout_dialog.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppHelperFunctions.defaultStatusBarStyle,
      child: SafeArea(
        child: SizedBox(
          width: AppDeviceUtils.getScreenWidth(context) * 0.75,
          child: Drawer(
            backgroundColor: AppColors.scaffoldBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
            ),
            child: BlocBuilder<AppBloc, AppState>(
              builder: (context, appState) {
                var profilePath = appState.userProfileModel?.profilePath ?? "";
                return Column(
                  children: [
                    CustomAppBar(
                      title: appState.loginResponse?.fullName ?? "",
                      subtitle: appState.loginResponse?.projectName ?? "",
                      avatarImage: profilePath.isNotEmpty
                          ? ApiUrl.viewImageBase + profilePath
                          : AppImages.profileImage,
                      showAvatar: true,
                      showBackButton: false,
                      actions: [
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).closeDrawer();
                          },
                          child: SvgPicture.asset(
                            width: AppSizes.iconSize44,
                            height: AppSizes.iconSize44,
                            AppImages.backButton,
                            colorFilter: ColorFilter.mode(
                              AppColors.whiteIconColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.padding16,
                          vertical: AppSizes.padding16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: [
                                  // profile
                                  _buildNavItemView(
                                    context,
                                    onTap: () {
                                      NavigationService.navigateTo(
                                        ProfileScreen.route,
                                      );
                                    },
                                    navIcon: AppImages.profileIconSN,
                                    navTitle: context.loc.profile,
                                  ),

                                  // Attendance
                                  _buildNavItemView(
                                    context,
                                    onTap: () {
                                      NavigationService.navigateTo(
                                        DailyAttendanceScreen.route,
                                      );
                                    },
                                    navIcon: AppImages.attendanceIconSN,
                                    navTitle: context.loc.attendance,
                                  ),

                                  // Attendance Monthly View
                                  _buildNavItemView(
                                    context,
                                    onTap: () {
                                      NavigationService.navigateTo(
                                        MonthlyAttendanceScreen.route,
                                      );
                                    },
                                    navIcon: AppImages.monthViewIconSN,
                                    navTitle: context.loc.viewAttendance,
                                  ),

                                  // change password
                                  // _buildNavItemView(
                                  //   context,
                                  //   onTap: () {},
                                  //   navIcon: AppImages.changePassIconSN,
                                  //   navTitle: context.loc.changePass,
                                  // ),

                                  // privacyPolicy
                                  _buildNavItemView(
                                    context,
                                    onTap: () {
                                      AppHelperFunctions.launchExternal(
                                        ApiUrl.privacyPolicyUrl,
                                      );
                                    },
                                    navIcon: AppImages.policyIconSN,
                                    navTitle: context.loc.privacyPolicy,
                                  ),

                                  // delete
                                  // _buildNavItemView(
                                  //   context,
                                  //   onTap: () {
                                  //     AppHelperFunctions.launchExternal(
                                  //       ApiUrl.deleteAccountUrl,
                                  //     );
                                  //   },
                                  //   navIcon: AppImages.deleteIconSN,
                                  //   navTitle: context.loc.delete,
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Logout
                    // _buildNavItemView(
                    //   context,
                    //   onTap: () {
                    //     CustomDialogs.showCommonDialog(
                    //       context: context,
                    //       child: CommonDialog(
                    //         title: context.loc.logout,
                    //         message: context.loc.areYouSureYouWant,
                    //         child: LogoutDialog(),
                    //       ),
                    //     );
                    //   },
                    //   navIcon: AppImages.logoutIconSN,
                    //   navTitle: context.loc.logout,
                    //   textColor: AppColors.error,
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    // ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItemView(
    BuildContext context, {
    required Function() onTap,
    required String navIcon,
    required String navTitle,
    Color textColor = AppColors.textColor,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.padding12,
          horizontal: AppSizes.padding12,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            SvgPicture.asset(navIcon),
            AppSizes.space8.hGap,
            Expanded(
              child: Text(
                navTitle,
                style: AppTextStyles.w400_14(context, color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
