import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/app/attendance/screens/monthly_attendance_screen.dart';
import 'package:hrms_uis/app/dashboard/widgets/logout_dialog.dart';
import 'package:hrms_uis/app/profile/screens/profile_screen.dart';
import 'package:hrms_uis/common/networking/api_url.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/custom_dialogs/dialogs.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/helpers/helper_functions.dart';

import '../../../../common/navigation_service/navigation_service.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/dialog/common_dialog.dart';
import '../../../attendance/screens/daily_attendance_screen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: SafeArea(
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, appState) {
            return Column(
              children: [
                SizedBox(height: AppSizes.space16),
                CustomAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: 'John Doe',
                  subtitle: 'Software Engineer',
                  avatarImage: appState.userProfileModel?.profilePath ?? "",
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
                        // Logout
                        _buildNavItemView(
                          context,
                          onTap: () {
                            CustomDialogs.showCommonDialog(
                              context: context,
                              child: CommonDialog(
                                title: context.loc.logout,
                                message: context.loc.areYouSureYouWant,
                                child: LogoutDialog(),
                              ),
                            );
                          },
                          navIcon: AppImages.logoutIconSN,
                          navTitle: context.loc.logout,
                          textColor: AppColors.error,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
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
            Text(
              navTitle,
              style: AppTextStyles.w400_14(context, color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
