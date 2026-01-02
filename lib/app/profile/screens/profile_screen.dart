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
import 'package:hrms_uis/common/utils/helpers/device_utility.dart';
import 'package:hrms_uis/common/widgets/custom/custom_refresh_indicator.dart';
import 'package:hrms_uis/common/widgets/divider/horizontal_divider.dart';

import '../../../common/networking/api_url.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/enums.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/image/custom_image.dart';
import '../../../common/widgets/loader/custom_circular_progress.dart';

class ProfileScreen extends StatefulWidget {
  final EssTabMenuEnum essTabMenuEnum;
  static const route = '/profileScreen';

  const ProfileScreen({
    super.key,
    this.essTabMenuEnum = EssTabMenuEnum.personalInfo,
  });

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
          title: getProfileTitle(),
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
              listener: (context, dashboardState) {
                if (dashboardState.status == DashboardStatus.profileSuccess) {
                  context.read<AppBloc>().add(
                    AppEvent.updateUserProfileData(
                      dashboardState.userProfileDataModel,
                    ),
                  );
                }
              },
              builder: (context, dashboardState) {
                return dashboardState.status == DashboardStatus.profileLoading
                    ? Center(child: CustomCircularProgress())
                    : CustomRefreshIndicator(
                        backgroundColor: AppColors.scaffoldBgColor,
                        onRefresh: () async {
                          var dashboardBloc = context.read<DashboardBloc>();
                          dashboardBloc.add(
                            DashboardEvent.getUserProfileData(),
                          );
                        },
                        child: BlocBuilder<AppBloc, AppState>(
                          builder: (context, state) {
                            var profileModel = state.userProfileModel;

                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  // -------------------------------------------------------------------
                                  // HEADER CARD
                                  // -------------------------------------------------------------------
                                  if (widget.essTabMenuEnum ==
                                      EssTabMenuEnum.userProfile)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: AppSizes.padding16,
                                        horizontal: AppSizes.padding16,
                                      ),
                                      decoration: AppDecorations.card(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                  imageUrl:
                                                      profilePath.isNotEmpty
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
                                          const SizedBox(
                                            height: AppSizes.space16,
                                          ),

                                          // NAME
                                          _infoField(
                                            "Name",
                                            "${profileModel?.firstName ?? ""} "
                                                "${profileModel?.midName ?? ""} "
                                                "${profileModel?.lastName ?? ""}",
                                          ),

                                          const SizedBox(
                                            height: AppSizes.space8,
                                          ),
                                          CustomHorizontalDivider(),
                                          const SizedBox(
                                            height: AppSizes.space8,
                                          ),

                                          // DESIGNATION
                                          _infoField(
                                            "Designation",
                                            profileModel?.designationName ??
                                                "--",
                                          ),

                                          const SizedBox(
                                            height: AppSizes.space8,
                                          ),
                                          CustomHorizontalDivider(),
                                          const SizedBox(
                                            height: AppSizes.space8,
                                          ),

                                          // EMPLOYEE CODE with COPY
                                          _infoField(
                                            "Employee Code",
                                            profileModel?.employeeCode ?? "--",
                                            copyable: true,
                                          ),
                                        ],
                                      ),
                                    ),

                                  if (widget.essTabMenuEnum ==
                                      EssTabMenuEnum.userProfile)
                                    AppSizes.space16.vGap,

                                  // -------------------------------------------------------------------
                                  // PERSONAL INFORMATION
                                  // -------------------------------------------------------------------
                                  if (widget.essTabMenuEnum ==
                                      EssTabMenuEnum.personalInfo)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: AppSizes.padding16,
                                        horizontal: AppSizes.padding16,
                                      ),
                                      decoration: AppDecorations.card(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildSectionTitle(
                                            "Personal Information",
                                          ),

                                          _buildInfoCard([
                                            _infoField(
                                              "Email",
                                              profileModel?.email ?? "--",
                                              copyable: true,
                                            ),
                                            _infoField(
                                              "Mobile Number",
                                              profileModel?.mobileNumber ??
                                                  "--",
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
                                                    format:
                                                        DateFormats.fullMonth,
                                                  ) ??
                                                  "--",
                                            ),
                                            _infoField(
                                              "Marital Status",
                                              profileModel?.maritalStatusName ??
                                                  "--",
                                            ),
                                            _infoField(
                                              "Nationality",
                                              profileModel?.nationalityName ??
                                                  "--",
                                            ),
                                            _infoField(
                                              "Blood Group",
                                              profileModel?.bloodGroup ?? "--",
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),

                                  if (widget.essTabMenuEnum ==
                                      EssTabMenuEnum.userProfile)
                                    AppSizes.space16.vGap,

                                  // -------------------------------------------------------------------
                                  // EMPLOYMENT INFORMATION
                                  // -------------------------------------------------------------------
                                  if (widget.essTabMenuEnum ==
                                      EssTabMenuEnum.employment)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: AppSizes.padding16,
                                        horizontal: AppSizes.padding16,
                                      ),
                                      decoration: AppDecorations.card(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildSectionTitle(
                                            "Employment Information",
                                          ),

                                          _buildInfoCard([
                                            _infoField(
                                              "Designation",
                                              profileModel?.designationName ??
                                                  "--",
                                            ),
                                            _infoField(
                                              "Department",
                                              profileModel?.departmentName ??
                                                  "--",
                                            ),
                                            _infoField(
                                              "Employee Code",
                                              profileModel?.employeeCode ??
                                                  "--",
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
                                                    format:
                                                        DateFormats.fullMonth,
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

                                  if (widget.essTabMenuEnum ==
                                      EssTabMenuEnum.employment)
                                    AppSizes.space16.vGap,

                                  // -------------------------------------------------------------------
                                  // BANK & DOCUMENT DETAILS
                                  // -------------------------------------------------------------------
                                  if (widget.essTabMenuEnum ==
                                      EssTabMenuEnum.bank)
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: AppSizes.padding16,
                                        horizontal: AppSizes.padding16,
                                      ),
                                      decoration: AppDecorations.card(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              profileModel?.accountNumber !=
                                                      null
                                                  ? AppDeviceUtils.maskAccountNumber(
                                                      profileModel!
                                                          .accountNumber!,
                                                    )
                                                  : "--",
                                              copyable: true,
                                              copyValue:
                                                  profileModel?.accountNumber,
                                            ),

                                            _infoField(
                                              "IFSC Code",
                                              profileModel?.ifscCode != null
                                                  ? AppDeviceUtils.maskIfsc(
                                                      profileModel!.ifscCode!,
                                                    )
                                                  : "--",
                                              copyable: true,
                                              copyValue: profileModel?.ifscCode,
                                            ),

                                            _infoField(
                                              "PAN Number",
                                              profileModel?.panNumber != null
                                                  ? AppDeviceUtils.maskPan(
                                                      profileModel!.panNumber!,
                                                    )
                                                  : "--",
                                              copyable: true,
                                              copyValue:
                                                  profileModel?.panNumber,
                                            ),

                                            _infoField(
                                              "Aadhaar Number",
                                              profileModel?.aadharCardNumber !=
                                                      null
                                                  ? AppDeviceUtils.maskAadhaar(
                                                      profileModel!
                                                          .aadharCardNumber!,
                                                    )
                                                  : "--",
                                              copyable: true,
                                              copyValue: profileModel
                                                  ?.aadharCardNumber,
                                            ),
                                          ]),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoField(
    String title,
    String displayValue, {
    String? copyValue,
    bool copyable = false,
  }) {
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
              Text(displayValue, style: AppTextStyles.w400_16(context)),
            ],
          ),
        ),
        if (copyable && copyValue != null)
          GestureDetector(
            onTap: () {
              Clipboard.setData(ClipboardData(text: copyValue));
              // CustomToast.showSuccess(message: "Copied securely");
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

  String getProfileTitle() {
    if (widget.essTabMenuEnum == EssTabMenuEnum.personalInfo) {
      return "Personal Information";
    }
    if (widget.essTabMenuEnum == EssTabMenuEnum.employment) {
      return "Employment";
    }
    if (widget.essTabMenuEnum == EssTabMenuEnum.bank) {
      return "Bank Details";
    }
    if (widget.essTabMenuEnum == EssTabMenuEnum.userProfile) {
      return "Profile";
    }
    return "";
  }
}
