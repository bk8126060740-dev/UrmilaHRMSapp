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
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:hrms_uis/common/utils/global_internet_check/network_observer.dart';
import 'package:hrms_uis/common/widgets/custom/custom_refresh_indicator.dart';
import 'package:hrms_uis/common/widgets/divider/horizontal_divider.dart';

import '../../../common/networking/api_url.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/image/custom_image.dart';
import '../../../common/widgets/loader/custom_circular_progress.dart';

class ProfileScreen extends StatefulWidget {
  static const route = '/profileScreen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return NetworkObserver(
      onRetry: () {
        // context.read<DashboardBloc>().add(DashboardEvent.getUserProfileData());
      },
      child: Scaffold(
        appBar: CustomAppBar(
          elevation: 0,
          title: context.loc.profile,
          showAvatar: false,
          showBackButton: true,
          showNavigation: false,
          showCalendarIcon: false,
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: AppSizes.padding16,
              horizontal: AppSizes.padding16,
            ),
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

                return state.status == DashboardStatus.profileLoading
                    ? Center(child: CustomCircularProgress())
                    : CustomRefreshIndicator(
                        backgroundColor: AppColors.scaffoldBgColor,
                        onRefresh: () async {
                          var dashboardBloc = context.read<DashboardBloc>();
                          dashboardBloc.add(
                            DashboardEvent.getUserProfileData(),
                          );
                        },
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // -------------------------------------------------------------------
                              // HEADER CARD
                              // -------------------------------------------------------------------
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSizes.padding16,
                                  horizontal: AppSizes.padding16,
                                ),
                                decoration: AppDecorations.card(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BlocBuilder<AppBloc, AppState>(
                                      builder: (context, appState) {
                                        var profilePath =
                                            appState
                                                .userProfileModel
                                                ?.profilePath ??
                                            "";
                                        return Center(
                                          child: CustomImage(
                                            imageUrl: profilePath.isNotEmpty
                                                ? ApiUrl.viewImageBase +
                                                      profilePath
                                                : AppImages.profileImage,
                                            fallbackAsset:
                                                AppImages.profileImage,
                                            size: 100,
                                            borderColor: Colors.white,
                                            borderWidth: 2,
                                            useShimmer: true,
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(height: AppSizes.space16),

                                    // NAME
                                    _infoField(
                                      "Name",
                                      "${profileModel?.firstName ?? ""} "
                                          "${profileModel?.midName ?? ""} "
                                          "${profileModel?.lastName ?? ""}",
                                    ),

                                    const SizedBox(height: AppSizes.space8),
                                    CustomHorizontalDivider(),
                                    const SizedBox(height: AppSizes.space8),

                                    // DESIGNATION
                                    _infoField(
                                      "Designation",
                                      profileModel?.designationName ?? "--",
                                    ),

                                    const SizedBox(height: AppSizes.space8),
                                    CustomHorizontalDivider(),
                                    const SizedBox(height: AppSizes.space8),

                                    // EMPLOYEE CODE with COPY
                                    _infoField(
                                      "Employee Code",
                                      profileModel?.employeeCode ?? "--",
                                      copyable: true,
                                    ),
                                  ],
                                ),
                              ),

                              AppSizes.space16.vGap,

                              // -------------------------------------------------------------------
                              // PERSONAL INFORMATION
                              // -------------------------------------------------------------------
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSizes.padding16,
                                  horizontal: AppSizes.padding16,
                                ),
                                decoration: AppDecorations.card(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildSectionTitle("Personal Information"),

                                    _buildInfoCard([
                                      _infoField(
                                        "Email",
                                        profileModel?.email ?? "--",
                                        copyable: true,
                                      ),
                                      _infoField(
                                        "Mobile Number",
                                        profileModel?.mobileNumber ?? "--",
                                        copyable: true,
                                      ),
                                      _infoField(
                                        "Gender",
                                        profileModel?.genderName ?? "--",
                                      ),
                                      _infoField(
                                        "Date of Birth",
                                        AppFormatter.formatDateString(
                                              "${profileModel?.dateOfBirth ?? ""}",
                                              format: DateFormats.fullMonth,
                                            ) ??
                                            "--",
                                      ),
                                      _infoField(
                                        "Marital Status",
                                        profileModel?.maritalStatusName ?? "--",
                                      ),
                                      _infoField(
                                        "Nationality",
                                        profileModel?.nationalityName ?? "--",
                                      ),
                                      _infoField(
                                        "Blood Group",
                                        profileModel?.bloodGroup ?? "--",
                                      ),
                                    ]),
                                  ],
                                ),
                              ),

                              AppSizes.space16.vGap,

                              // -------------------------------------------------------------------
                              // EMPLOYMENT INFORMATION
                              // -------------------------------------------------------------------
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSizes.padding16,
                                  horizontal: AppSizes.padding16,
                                ),
                                decoration: AppDecorations.card(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildSectionTitle(
                                      "Employment Information",
                                    ),

                                    _buildInfoCard([
                                      _infoField(
                                        "Designation",
                                        profileModel?.designationName ?? "--",
                                      ),
                                      _infoField(
                                        "Department",
                                        profileModel?.departmentName ?? "--",
                                      ),
                                      _infoField(
                                        "Employee Code",
                                        profileModel?.employeeCode ?? "--",
                                        copyable: true,
                                      ),
                                      _infoField(
                                        "Status",
                                        profileModel?.statusName ?? "--",
                                      ),

                                      // JOIN DATE (ONLY HERE)
                                      _infoField(
                                        "Join Date",
                                        AppFormatter.formatDateString(
                                              "${profileModel?.doj ?? ""}",
                                              format: DateFormats.fullMonth,
                                            ) ??
                                            "--",
                                      ),

                                      _infoField(
                                        "Current Project",
                                        profileModel?.projectName ?? "--",
                                      ),
                                    ]),
                                  ],
                                ),
                              ),

                              AppSizes.space16.vGap,

                              // -------------------------------------------------------------------
                              // BANK & DOCUMENT DETAILS
                              // -------------------------------------------------------------------
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: AppSizes.padding16,
                                  horizontal: AppSizes.padding16,
                                ),
                                decoration: AppDecorations.card(),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildSectionTitle(
                                      "Bank & Document Details",
                                    ),

                                    _buildInfoCard([
                                      _infoField(
                                        "Bank Name",
                                        profileModel?.bankName ?? "--",
                                      ),
                                      _infoField(
                                        "Account Number",
                                        profileModel?.accountNumber ?? "--",
                                        copyable: true,
                                      ),
                                      _infoField(
                                        "IFSC Code",
                                        profileModel?.ifscCode ?? "--",
                                        copyable: true,
                                      ),
                                      _infoField(
                                        "PAN Number",
                                        profileModel?.panNumber ?? "--",
                                        copyable: true,
                                      ),
                                      _infoField(
                                        "Aadhar Number",
                                        profileModel?.aadharCardNumber ?? "--",
                                        copyable: true,
                                      ),
                                    ]),
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
              SizedBox(height: 4),
              Text(value, style: AppTextStyles.w400_16(context)),
            ],
          ),
        ),
        if (copyable)
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: value));
              // CustomToast.showSuccess(message: "Copied!");
            },
            child: Icon(Icons.copy, size: 18, color: AppColors.primaryColor),
          ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppTextStyles.w500_16(context, color: AppColors.textColor),
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> children) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: AppSizes.space8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (int i = 0; i < children.length; i++) ...[
            children[i],
            if (i != children.length - 1) ...[
              const SizedBox(height: AppSizes.space8),
              CustomHorizontalDivider(),
              const SizedBox(height: AppSizes.space8),
            ],
          ],
        ],
      ),
    );
  }
}
