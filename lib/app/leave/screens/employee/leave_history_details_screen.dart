import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/leave/bloc/leave_bloc.dart';
import 'package:hrms_uis/app/leave/widgets/employee/cancel_leave_dialog.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/helpers/device_utility.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';
import 'package:hrms_uis/common/widgets/custom/custom_base_screen.dart';
import 'package:hrms_uis/common/widgets/image/custom_image.dart';

import '../../../../common/networking/api_url.dart';
import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/decorations.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/utils/custom_dialogs/dialogs.dart';
import '../../../../common/utils/formatters/date_formats.dart';
import '../../../../common/utils/formatters/formatter.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/custom/custom_title_value_view.dart';
import '../../model/employee_leave_data_model.dart';

class LeaveHistoryDetailsScreen extends StatelessWidget {
  static const route = '/leave_history_details';
  final EmpLeaveDataItem? item;

  const LeaveHistoryDetailsScreen({super.key, this.item});

  @override
  Widget build(BuildContext context) {
    String type = "${item?.leaveTypeName}";
    String from =
        AppFormatter.formatDate(
          item?.startDate,
          format: DateFormats.fullMonth,
        ) ??
        "";
    String to =
        AppFormatter.formatDate(item?.endDate, format: DateFormats.fullMonth) ??
        "";

    String durationType = '${item?.noOfDays}';

    /// ---- Leave Type Color ----
    Color typeColor = type == "Paid Leave"
        ? Colors.blue
        : type == "Casual Leave"
        ? Colors.deepPurple
        : type == "Sick Leave"
        ? Colors.deepOrange
        : Colors.indigo;
    final int? status = item?.status;

    late final Color statusColor;
    late final String statusTxt;

    switch (status) {
      case 0:
        statusColor = Colors.orange;
        statusTxt = "Pending";
        break;

      case 1:
        statusColor = Colors.green;
        statusTxt = "Approved";
        break;

      case 2:
        statusColor = Colors.red;
        statusTxt = "Rejected";
        break;

      case 3:
        statusColor = Colors.red;
        statusTxt = "Canceled";
        break;

      default:
        statusColor = Colors.grey;
        statusTxt = "Unknown";
    }

    return CustomBaseScreen(
      appBar: CustomAppBar(
        elevation: 0,
        title: "Leave Details",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding20),
        child: Container(
          width: AppDeviceUtils.getScreenWidth(context),
          decoration: AppDecorations.card(),
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.padding12,
            horizontal: AppSizes.padding16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTitleValueView(
                      layout: TitleValueLayout.column,
                      title: "Leave Type",
                      value: item?.leaveTypeName.withFallback("N/A"),
                      valueColor: typeColor,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.padding8,
                      vertical: AppSizes.padding4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withFixedOpacity(0.15),
                      borderRadius: BorderRadius.circular(
                        AppSizes.borderRadius16,
                      ),
                    ),
                    child: Text(
                      statusTxt,
                      style: AppTextStyles.w600_12(context, color: statusColor),
                    ),
                  ),
                ],
              ),
              CustomTitleValueView(
                layout: TitleValueLayout.column,
                title: "From",
                value: from,
              ),
              CustomTitleValueView(
                layout: TitleValueLayout.column,
                title: "To",
                value: to,
              ),
              CustomTitleValueView(
                layout: TitleValueLayout.column,
                title: "Duration",
                value: durationType,
              ),
              CustomTitleValueView(
                layout: TitleValueLayout.column,
                title: "Leave Reason",
                value: item?.leaveReason.withFallback("N/A"),
              ),
              CustomTitleValueView(
                layout: TitleValueLayout.column,
                title: "Manager Remark",
                value: item?.firstLevelRemark.withFallback("N/A"),
              ),
              if (item?.attachmentPath != null)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CustomTitleValueView(
                        layout: TitleValueLayout.column,
                        title: "Attachment",
                        value: item?.attachmentPath?.split("/").last ?? "N/A",
                      ),
                    ),
                    CustomImage(
                      isCircular: false,
                      imageUrl:
                          (item != null &&
                              item?.attachmentPath != null &&
                              item!.attachmentPath!.isNotEmpty)
                          ? ApiUrl.viewImageBase + item!.attachmentPath!
                          : AppImages.profileImage,
                      fallbackAsset: AppImages.profileImage,
                      size: AppSizes.iconSize32,
                      borderColor: AppColors.borderColor,
                      borderWidth: 1,
                      useShimmer: true,
                    ),
                    // BlocConsumer<DownloadBloc, DownloadState>(
                    //   listener: (context, state) {
                    //     log(
                    //       "download update status===>> ${state.downloadStatus}",
                    //     );
                    //     if (state.downloadStatus ==
                    //         DownloadStatus.downloadFailed) {
                    //       CustomToast.showError(message: "Download Failed");
                    //     }
                    //     if (state.downloadStatus ==
                    //         DownloadStatus.downloadCompleted) {
                    //       CustomToast.showSuccess(
                    //         message: "Download Completed",
                    //       );
                    //     }
                    //   },
                    //   builder: (context, state) {
                    //     final isDownloading =
                    //         state.downloadStatus ==
                    //         DownloadStatus.downloadInProgress;
                    //     return isDownloading
                    //         ? const CustomCircularProgress()
                    //         : InkWell(
                    //             onTap: () async {
                    //               String attachmentUrl =
                    //                   ApiUrl.viewImageBase +
                    //                   (item?.attachmentPath ?? "");
                    //               String timestamp = DateTime.now()
                    //                   .millisecondsSinceEpoch
                    //                   .toString();
                    //               context.read<DownloadBloc>().add(
                    //                 DownloadEvent.startDownload(
                    //                   url: attachmentUrl,
                    //                   fileName: "leave_attachment$timestamp",
                    //                 ),
                    //               );
                    //             },
                    //             child: SvgPicture.asset(
                    //               AppImages.downloadIcon,
                    //               height: AppSizes.iconSize20,
                    //               width: AppSizes.iconSize20,
                    //             ),
                    //           );
                    //   },
                    // ),
                  ],
                ),

              if (status == 0) ...[
                SizedBox(height: AppSizes.space4),
                CustomButton(
                  text: "Cancel Leave",
                  onTap: () {
                    CustomDialogs.showCommonAlertDialog(
                      context: context,
                      title: "Cancel Leave",
                      message: "Are you sure you want to cancel your leave?",
                      child: BlocProvider.value(
                        value: context.read<LeaveBloc>(),
                        child: CancelLeaveDialog(leaveId: item?.id),
                      ),
                    );
                  },
                  backgroundColor: AppColors.error,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
