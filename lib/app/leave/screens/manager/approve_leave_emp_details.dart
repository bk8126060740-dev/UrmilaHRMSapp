import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:hrms_uis/common/widgets/appbar/custom_appbar.dart';

import '../../../../common/networking/api_url.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/helpers/device_utility.dart';
import '../../../../common/widgets/custom/custom_title_value_view.dart';
import '../../../../common/widgets/image/custom_image.dart';
import '../../model/approval_leave_list_model.dart';

class ApproveLeaveEmpDetails extends StatelessWidget {
  static const route = '/approve_leave_emp_details';

  final ApprovalLeaveListItem? leaveData; // <- your model type

  const ApproveLeaveEmpDetails({super.key, required this.leaveData});

  @override
  Widget build(BuildContext context) {
    String type = "${leaveData?.leaveTypeName}";
    String from =
        AppFormatter.formatDate(
          leaveData?.startDate,
          format: DateFormats.fullMonth,
        ) ??
        "";
    String to =
        AppFormatter.formatDate(
          leaveData?.endDate,
          format: DateFormats.fullMonth,
        ) ??
        "";

    String durationType = '${leaveData?.noOfDays}';

    /// ---- Leave Type Color ----
    Color typeColor = type == "Paid Leave"
        ? Colors.blue
        : type == "Casual Leave"
        ? Colors.deepPurple
        : type == "Sick Leave"
        ? Colors.deepOrange
        : Colors.indigo;

    final int? status = leaveData?.status;

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

    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "Leave Details",
        subtitle:
            "${AppFormatter.formatDate(leaveData?.startDate, format: DateFormats.fullMonth)}"
            " - "
            "${AppFormatter.formatDate(leaveData?.endDate, format: DateFormats.fullMonth)}",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: SafeArea(
        child: Padding(
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
                        value: type,
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
                        style: AppTextStyles.w600_12(
                          context,
                          color: statusColor,
                        ),
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
                  value: leaveData?.leaveReason.withFallback("N/A"),
                ),
                if (leaveData?.attachmentPath != null)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: CustomTitleValueView(
                          layout: TitleValueLayout.column,
                          title: "Attachment",
                          value:
                              leaveData?.attachmentPath?.split("/").last ??
                              "N/A",
                        ),
                      ),
                      CustomImage(
                        isCircular: false,
                        imageUrl:
                            (leaveData != null &&
                                leaveData?.attachmentPath != null &&
                                leaveData!.attachmentPath!.isNotEmpty)
                            ? ApiUrl.viewImageBase + leaveData!.attachmentPath!
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
                      //                   (leaveData?.attachmentPath ?? "");
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
