import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/duration_formatter.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:hrms_uis/common/widgets/image/custom_image.dart';

import '../../../common/networking/api_url.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../models/approve_attendance_model.dart';

class ApproveAttendEmpDetails extends StatelessWidget {
  static const route = '/approve_attend_emp_details';

  final AttendecList? employeeAttendData;

  const ApproveAttendEmpDetails({super.key, required this.employeeAttendData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        elevation: 0,
        title: "Employee Details",
        subtitle:
            "${AppFormatter.formatDate(employeeAttendData?.attendanceDate, format: DateFormats.fullMonth)}",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSizes.padding16,
            horizontal: AppSizes.padding16,
          ),
          child: SingleChildScrollView(
            child: Container(
              decoration: AppDecorations.card(),
              child: Container(
                padding: const EdgeInsets.all(AppSizes.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== EMPLOYEE INFO ROW =====
                    _infoRow(
                      context,
                      "Employee Name",
                      employeeAttendData?.employeeName ?? '',
                    ),
                    _infoRow(
                      context,
                      "Employee Id",
                      "${employeeAttendData?.employeeId ?? ''}",
                    ),

                    SizedBox(height: AppSizes.space8),

                    // Divider
                    Container(height: 1, color: Colors.grey.shade300),

                    SizedBox(height: AppSizes.space8),

                    // Duration Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "Duration :-",
                            style: AppTextStyles.w500_14(
                              context,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.end,
                            DurationFormatter.formatDuration(
                              employeeAttendData?.duration,
                            ),
                            style: AppTextStyles.w400_14(
                              context,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSizes.space8),

                    // Clock In / Clock Out Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Clock In
                        Expanded(
                          child: Row(
                            children: [
                              CustomImage(
                                imageUrl:
                                    (employeeAttendData != null &&
                                        employeeAttendData?.inTimePicCapture !=
                                            null &&
                                        employeeAttendData!
                                            .inTimePicCapture!
                                            .isNotEmpty)
                                    ? ApiUrl.viewImageBase +
                                          employeeAttendData!.inTimePicCapture!
                                    : AppImages.profileImage,
                                fallbackAsset: AppImages.profileImage,
                                size: 30,
                                borderColor: AppColors.borderColor,
                                borderWidth: 1,
                                useShimmer: true,
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Clock In",
                                      style: AppTextStyles.w400_14(
                                        context,
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: AppSizes.space4),
                                    Text(
                                      AppFormatter.formatTimeString(
                                            employeeAttendData?.inTime,
                                          ) ??
                                          'N/A',
                                      style: AppTextStyles.w400_14(
                                        context,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Clock Out
                        Expanded(
                          child: Row(
                            children: [
                              CustomImage(
                                imageUrl:
                                    (employeeAttendData != null &&
                                        employeeAttendData?.outTimePicCapture !=
                                            null &&
                                        employeeAttendData!
                                            .outTimePicCapture!
                                            .isNotEmpty)
                                    ? ApiUrl.viewImageBase +
                                          employeeAttendData!.outTimePicCapture!
                                    : AppImages.profileImage,
                                fallbackAsset: AppImages.profileImage,
                                size: 30,
                                borderColor: AppColors.borderColor,
                                borderWidth: 1,
                                useShimmer: true,
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Clock Out",
                                      style: AppTextStyles.w400_14(
                                        context,
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                    const SizedBox(height: AppSizes.space4),
                                    Text(
                                      AppFormatter.formatTimeString(
                                            employeeAttendData?.outTime,
                                          ) ??
                                          'N/A',
                                      style: AppTextStyles.w400_14(
                                        context,
                                        color: AppColors.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSizes.space8),

                    // Divider
                    Container(height: 1, color: Colors.grey.shade300),

                    SizedBox(height: AppSizes.space8),

                    // Clock In Location
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Clock In Location",
                          style: AppTextStyles.w400_14(
                            context,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        const SizedBox(height: AppSizes.space4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: AppColors.iconColor,
                            ),
                            const SizedBox(width: AppSizes.space12),
                            Expanded(
                              child: Text(
                                employeeAttendData?.inTimeLocation ?? "N/A",
                                style: AppTextStyles.w400_14(
                                  context,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: AppSizes.space8),

                    // Divider
                    Container(height: 1, color: Colors.grey.shade300),

                    SizedBox(height: AppSizes.space8),

                    // Clock Out Location
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Clock Out Location",
                          style: AppTextStyles.w400_14(
                            context,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        const SizedBox(height: AppSizes.space4),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              size: 20,
                              color: AppColors.iconColor,
                            ),
                            const SizedBox(width: AppSizes.space12),
                            Expanded(
                              child: Text(
                                employeeAttendData?.outTimeLocation ?? "N/A",
                                style: AppTextStyles.w400_14(
                                  context,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(BuildContext context, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSizes.space8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: AppTextStyles.w400_14(
              context,
              color: AppColors.secondaryTextColor,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.w400_14(context, color: AppColors.textColor),
            ),
          ),
        ],
      ),
    );
  }
}
