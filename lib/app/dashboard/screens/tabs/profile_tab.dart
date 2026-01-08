import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/global_internet_check/network_observer.dart';
import 'package:hrms_uis/common/widgets/custom/custom_refresh_indicator.dart';
import 'package:hrms_uis/common/widgets/divider/horizontal_divider.dart';

import '../../../../common/networking/api_url.dart';
import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/custom_dialogs/dialogs.dart';
import '../../../../common/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/image/custom_image.dart';
import '../../../../common/widgets/loader/custom_circular_progress.dart';
import '../../widgets/logout_dialog.dart';

class ProfileTab extends StatefulWidget {
  static const route = '/profileScreen';

  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return NetworkObserver(
      onRetry: () {},
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(AppSizes.padding16),
            child: BlocConsumer<DashboardBloc, DashboardState>(
              listener: (context, state) {
                if (state.status == DashboardStatus.profileSuccess) {
                  context.read<AppBloc>().add(
                    AppEvent.updateUserProfileData(state.userProfileDataModel),
                  );
                }
              },
              builder: (context, state) {
                var profileModel = state.userProfileDataModel;

                if (state.status == DashboardStatus.profileLoading) {
                  return const Center(child: CustomCircularProgress());
                }

                return CustomRefreshIndicator(
                  backgroundColor: AppColors.scaffoldBgColor,
                  onRefresh: () async {
                    context.read<DashboardBloc>().add(
                      DashboardEvent.getUserProfileData(),
                    );
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // -----------------------------------------------------
                        // PROFILE HEADER
                        // -----------------------------------------------------
                        Container(
                          padding: const EdgeInsets.all(AppSizes.padding16),
                          decoration: AppDecorations.card(),
                          child: Column(
                            children: [
                              BlocBuilder<AppBloc, AppState>(
                                builder: (context, appState) {
                                  var profilePath =
                                      appState.userProfileModel?.profilePath ??
                                      "";
                                  return CustomImage(
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
                              AppSizes.space16.vGap,

                              _infoField(
                                "Name",
                                "${profileModel?.firstName ?? ""} "
                                    "${profileModel?.midName ?? ""} "
                                    "${profileModel?.lastName ?? ""}",
                              ),
                              AppSizes.space8.vGap,
                              const CustomHorizontalDivider(),
                              AppSizes.space8.vGap,

                              _infoField(
                                "Designation",
                                profileModel?.designationName ?? "--",
                              ),
                              AppSizes.space8.vGap,
                              const CustomHorizontalDivider(),
                              AppSizes.space8.vGap,

                              _infoField(
                                "Employee Code",
                                profileModel?.employeeCode ?? "--",
                                copyable: true,
                              ),
                            ],
                          ),
                        ),

                        AppSizes.space16.vGap,

                        // -----------------------------------------------------
                        // ACCOUNT & SETTINGS
                        // -----------------------------------------------------
                        Container(
                          padding: const EdgeInsets.all(AppSizes.padding16),
                          decoration: AppDecorations.card(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Account & Settings",
                                style: AppTextStyles.w500_16(
                                  context,
                                  color: AppColors.textColor,
                                ),
                              ),
                              AppSizes.space8.vGap,

                              _profileMenuItem(
                                icon: Icons.privacy_tip_outlined,
                                title: "Privacy Policy",
                                onTap: () {
                                  AppHelperFunctions.launchExternal(
                                    ApiUrl.privacyPolicy,
                                  );
                                },
                              ),

                              // _profileMenuItem(
                              //   icon: Icons.description_outlined,
                              //   title: "Terms & Conditions",
                              //   onTap: () {},
                              // ),

                              // _profileMenuItem(
                              //   icon: Icons.delete_outline,
                              //   title: "Delete Account",
                              //   color: Colors.red,
                              //   onTap: () {
                              //     AppHelperFunctions.launchExternal(
                              //       ApiUrl.deleteAccount,
                              //     );
                              //   },
                              // ),

                              _profileMenuItem(
                                icon: Icons.logout,
                                title: "Logout",
                                color: Colors.red,
                                showDivider: false,
                                onTap: () {
                                  CustomDialogs.showCommonAlertDialog(
                                    context: context,
                                    title: context.loc.logout,
                                    message: context.loc.areYouSureYouWant,
                                    child: LogoutDialog(),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // -----------------------------------------------------
  // INFO FIELD
  // -----------------------------------------------------
  Widget _infoField(String title, String value, {bool copyable = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.w400_14(
                  context,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              const SizedBox(height: 4),
              Text(value, style: AppTextStyles.w400_16(context)),
            ],
          ),
        ),
        if (copyable)
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
            },
            child: Icon(Icons.copy, size: 18, color: AppColors.primaryColor),
          ),
      ],
    );
  }

  // -----------------------------------------------------
  // PROFILE MENU ITEM
  // -----------------------------------------------------
  Widget _profileMenuItem({
    required IconData icon,
    required String title,
    Color? color,
    VoidCallback? onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.padding12,
              horizontal: AppSizes.padding8,
            ),
            child: Row(
              children: [
                Icon(icon, color: color ?? AppColors.primaryColor),
                AppSizes.space8.hGap,
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.w400_16(
                      context,
                      color: color ?? AppColors.textColor,
                    ),
                  ),
                ),
                AppSizes.space8.hGap,
                const Icon(Icons.arrow_forward_ios, size: 14),
              ],
            ),
          ),
        ),
        if (showDivider) const CustomHorizontalDivider(),
      ],
    );
  }
}
