import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:hrms_uis/common/utils/popups/custom_toast.dart';
import 'package:hrms_uis/common/widgets/custom/custom_refresh_indicator.dart';
import 'package:hrms_uis/common/widgets/divider/horizontal_divider.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/download_feature/bloc/download_bloc.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/image/custom_image.dart';
import '../../../common/widgets/loader/custom_circular_progress.dart';
import '../widgets/salary_slip_download_card.dart';

class ProfileScreen extends StatefulWidget {
  static const route = '/profileScreen';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: context.loc.profile,
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: Container(
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
                    backgroundColor: AppColors.bgColor,
                    onRefresh: () async {
                      var dashboardBloc = context.read<DashboardBloc>();
                      dashboardBloc.add(DashboardEvent.getUserProfileData());
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
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
                                    return Center(
                                      child: CustomImage(
                                        imageUrl:
                                            appState
                                                .userProfileModel
                                                ?.profilePath ??
                                            "",
                                        fallbackAsset: AppImages.profileImage,
                                        size: 100,
                                        borderColor: Colors.white,
                                        borderWidth: 2,
                                        useShimmer: true,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(height: AppSizes.space16),
                                _infoField(
                                  "Name",
                                  "${profileModel?.firstName ?? ""} ${profileModel?.midName ?? ""} ${profileModel?.lastName ?? ""}",
                                ),
                                const SizedBox(height: AppSizes.space8),
                                CustomHorizontalDivider(),
                                const SizedBox(height: AppSizes.space8),
                                _infoField(
                                  "Designation",
                                  profileModel?.designationName ?? "",
                                ),
                                const SizedBox(height: AppSizes.space8),
                                CustomHorizontalDivider(),
                                const SizedBox(height: AppSizes.space8),
                                _infoField(
                                  "Join Date",
                                  AppFormatter.formatDateString(
                                        "${profileModel?.doj ?? ""}",
                                        format: DateFormats.fullMonth,
                                      ) ??
                                      "--",
                                ),
                                const SizedBox(height: AppSizes.space8),
                                CustomHorizontalDivider(),
                                const SizedBox(height: AppSizes.space8),
                                _offerLetterView(
                                  title: "Offer Letter",
                                  offerLetter: profileModel?.offerLetter ?? "",
                                ),
                              ],
                            ),
                          ),
                          // AppSizes.space16.vGap,
                          // Container(
                          //   width: AppDeviceUtils.getScreenWidth(context),
                          //   padding: EdgeInsets.symmetric(
                          //     vertical: AppSizes.padding16,
                          //     horizontal: AppSizes.padding16,
                          //   ),
                          //   decoration: AppDecorations.card(),
                          //   child: _salarySlipView(
                          //     title: "Salary Slip Download",
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }

  Widget _infoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.w400_14(
            context,
            color: AppColors.secondaryTextColor,
          ),
        ),
        const SizedBox(height: AppSizes.space4),
        Text(value, style: AppTextStyles.w400_16(context)),
      ],
    );
  }

  Widget _offerLetterView({
    required String title,
    required String offerLetter,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: "OutfitMedium",
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            if (offerLetter.isNotEmpty)
              BlocConsumer<DownloadBloc, DownloadState>(
                listener: (context, state) {
                  log("download update status===>> ${state.downloadStatus}");
                  if (state.downloadStatus == DownloadStatus.downloadFailed) {
                    CustomToast.showError(message: "Download Failed");
                  }
                  if (state.downloadStatus ==
                      DownloadStatus.downloadCompleted) {
                    CustomToast.showSuccess(message: "Download Completed");
                  }
                },
                builder: (context, state) {
                  return state.downloadStatus ==
                          DownloadStatus.downloadInProgress
                      ? const CustomCircularProgress()
                      : InkWell(
                          onTap: () async {
                            String timestamp = DateTime.now()
                                .millisecondsSinceEpoch
                                .toString();
                            context.read<DownloadBloc>().add(
                              DownloadEvent.startDownload(
                                url: offerLetter,
                                fileName: "offer_letter$timestamp",
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            AppImages.downloadIcon,
                            width: AppSizes.iconSize24,
                            height: AppSizes.iconSize24,
                            colorFilter: ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        );
                },
              ),
          ],
        ),
        const SizedBox(height: AppSizes.space4),

        if (offerLetter.isEmpty)
          Text(
            "No Data Found!",
            style: AppTextStyles.w400_14(
              context,
              color: AppColors.secondaryTextColor,
            ),
          ),
      ],
    );
  }

  Widget _salarySlipView({required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.w500_16(context)),
        SizedBox(height: AppSizes.space12),
        BlocBuilder<AppBloc, AppState>(
          builder: (context, state) {
            var salarySlipList = state.userProfileModel?.salarySlips ?? [];
            /* return salarySlipList.isEmpty
                ? Center(child: NoDataFound())
                : ListView.separated(
                    itemCount: salarySlipList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      var salaryData = salarySlipList[index];
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: AppSizes.space12,
                          top: AppSizes.space12,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              AppImages.pdfIcon,
                              width: AppSizes.iconSize20,
                              height: AppSizes.iconSize20,
                            ),
                            const SizedBox(width: AppSizes.space8),
                            Expanded(
                              child: Text(
                                "Salary Slip of ${salaryData.month} ${salaryData.year} ",
                                style: AppTextStyles.w400_14(context),
                              ),
                            ),
                            const SizedBox(height: AppSizes.space8),
                            BlocConsumer<DownloadBloc, DownloadState>(
                              listener: (context, state) {
                                log(
                                  "download update status===>> ${state.downloadStatus}",
                                );
                                if (state.downloadStatus ==
                                    DownloadStatus.downloadFailed) {
                                  CustomToast.showError(
                                    message: "Download Failed",
                                  );
                                }
                                if (state.downloadStatus ==
                                    DownloadStatus.downloadCompleted) {
                                  CustomToast.showSuccess(
                                    message: "Download Completed",
                                  );
                                }
                              },
                              builder: (context, state) {
                                final isDownloading =
                                    state.activeDownloadId == index &&
                                    state.downloadStatus ==
                                        DownloadStatus.downloadInProgress;

                                return isDownloading
                                    ? const CustomCircularProgress()
                                    : InkWell(
                                        onTap: () async {
                                          var empId = context
                                              .read<AppBloc>()
                                              .state
                                              .userProfileModel
                                              ?.id;
                                          String params =
                                              "EmployeeId=$empId&Month=${salaryData.month}&Year=${salaryData.year}";
                                          String salarySlipUrl =
                                              ApiUrl.getSalarySlip + params;

                                          String timestamp = DateTime.now()
                                              .millisecondsSinceEpoch
                                              .toString();
                                          context.read<DownloadBloc>().add(
                                            DownloadEvent.startDownload(
                                              downloadIndex: index,
                                              url: salarySlipUrl,
                                              fileName:
                                                  "salary_slip${salaryData.month}${salaryData.year}$timestamp",
                                            ),
                                          );
                                        },
                                        child: SvgPicture.asset(
                                          AppImages.downloadIcon,
                                          width: AppSizes.iconSize20,
                                          height: AppSizes.iconSize20,
                                          colorFilter: ColorFilter.mode(
                                            AppColors.primaryColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return CustomHorizontalDivider();
                    },
                  );*/
            return MasonryGridView.count(
              itemCount: 5,
              crossAxisCount: 3,
              mainAxisSpacing: AppSizes.padding16,
              crossAxisSpacing: AppSizes.padding16,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // var salaryData = salarySlipList[i];
                return SalarySlipCard(
                  // month: salaryData.month,
                  // year: "${salaryData.year}",
                  month: "MAY",
                  year: "2025",
                );
              },
            );
          },
        ),
      ],
    );
  }
}
