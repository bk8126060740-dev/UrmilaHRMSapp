import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../common/networking/api_url.dart';
import '../../../common/utils/app_bloc/app_bloc.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/decorations.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/utils/download_feature/bloc/download_bloc.dart';
import '../../../common/utils/global_internet_check/network_observer.dart';
import '../../../common/utils/popups/custom_toast.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/divider/horizontal_divider.dart';
import '../../../common/widgets/loader/custom_circular_progress.dart';
import '../../../common/widgets/placeholder/no_data_found.dart';
import '../../dashboard/bloc/dashboard_bloc.dart';
import '../../dashboard/model/user_profile_data_model.dart';

class SalarySlipScreen extends StatefulWidget {
  static const route = '/salary_slip';

  const SalarySlipScreen({super.key});

  @override
  State<SalarySlipScreen> createState() => _SalarySlipScreenState();
}

class _SalarySlipScreenState extends State<SalarySlipScreen> {
  @override
  Widget build(BuildContext context) {
    return NetworkObserver(
      onRetry: () {
        context.read<DashboardBloc>().add(DashboardEvent.getUserProfileData());
      },
      child: Scaffold(
        appBar: CustomAppBar(
          elevation: 0,
          title: context.loc.salarySlip,
          showAvatar: false,
          showBackButton: true,
          showNavigation: false,
          showCalendarIcon: false,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            vertical: AppSizes.padding20,
            horizontal: AppSizes.padding20,
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
              var salarySlipList =
                  state.userProfileDataModel?.salarySlips ?? [];
              return state.status == DashboardStatus.profileLoading
                  ? Center(child: CustomCircularProgress())
                  : salarySlipList.isEmpty
                  ? Center(child: NoDataFound())
                  : _salarySlipView(
                      title: "Salary Slip Download",
                      salarySlipList: salarySlipList,
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _salarySlipView({
    required String title,
    required List<SalarySlip> salarySlipList,
  }) {
    return ListView.separated(
      itemCount: salarySlipList.length,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        var salaryData = salarySlipList[index];
        return Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.padding16,
            horizontal: AppSizes.padding8,
          ),
          decoration: AppDecorations.card(
            radius: BorderRadius.circular(AppSizes.borderRadius8),
          ),
          margin: EdgeInsets.only(bottom: AppSizes.space16),
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
                  // "Salary Slip of jan 2025",
                  style: AppTextStyles.w400_14(context),
                ),
              ),
              const SizedBox(height: AppSizes.space8),
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
                  final isDownloading =
                      state.activeDownloadId == index &&
                      state.downloadStatus == DownloadStatus.downloadInProgress;

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
    );
  }

  /*return MasonryGridView.count(
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
            );*/
}
