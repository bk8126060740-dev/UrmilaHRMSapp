import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/widgets/divider/horizontal_divider.dart';
import 'package:hrms_uis/common/widgets/image/custom_image.dart';
import 'package:intl/intl.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';

class EmployeeSwipeModel {
  final String name;
  final String empCode;
  final String department;
  final DateTime dateTime;
  final String inOut;
  final String remark;
  final String location;
  final String imageUrl;

  const EmployeeSwipeModel({
    required this.name,
    required this.empCode,
    required this.department,
    required this.dateTime,
    required this.inOut,
    required this.remark,
    required this.location,
    required this.imageUrl,
  });

  // Optional: fromJson/toJson if you fetch from API
  factory EmployeeSwipeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeSwipeModel(
      name: json['name'] ?? '',
      empCode: json['empCode'] ?? '',
      department: json['department'] ?? '',
      dateTime: DateTime.parse(json['dateTime']),
      inOut: json['inOut'] ?? '',
      remark: json['remark'] ?? '',
      location: json['location'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'empCode': empCode,
    'department': department,
    'dateTime': dateTime.toIso8601String(),
    'inOut': inOut,
    'remark': remark,
    'location': location,
    'imageUrl': imageUrl,
  };
}

/*
class ApproveAttendEmpDetails extends StatelessWidget {
  static const route = '/approve_attend_emp_details';

  final EmployeeSwipeModel? employee;

  const ApproveAttendEmpDetails({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      "dd-MMM-yyyy hh:mm a",
    ).format(employee?.dateTime ?? DateTime.now());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        elevation: 0,
        title: "Approve Details",
        subtitle: "02-Nov-25 - 08-Nov-25",
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Employee Info
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImage(
                          imageUrl: employee?.imageUrl ?? '',
                          isCircular: false,
                          size: 90,
                          fit: BoxFit.cover,
                          fallbackAsset: AppImages.logo,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${employee?.name} - ${employee?.empCode}",
                                style: AppTextStyles.w400_14(
                                  context,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.apartment,
                                    size: 18,
                                    color: AppColors.iconColor,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    employee?.department ?? '',
                                    style: AppTextStyles.w400_14(
                                      context,
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.access_time,
                                    size: 18,
                                    color: AppColors.iconColor,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    formattedDate,
                                    style: AppTextStyles.w400_14(
                                      context,
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),
                    const CustomHorizontalDivider(),

                    // Shift Details
                    Text(
                      "Shift Details",
                      style: AppTextStyles.w400_14(
                        context,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),

                    _infoRow("I/O", employee?.inOut ?? ''),
                    _infoRow("Emp. Remark", employee?.remark ?? ''),
                    _infoRow("Location", employee?.location ?? ""),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title: ", style: const TextStyle(fontWeight: FontWeight.w600)),
        Expanded(child: Text(value)),
      ],
    );
  }
}
*/

class ApproveAttendEmpDetails extends StatelessWidget {
  static const route = '/approve_attend_emp_details';

  final EmployeeSwipeModel? employee;

  const ApproveAttendEmpDetails({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      "dd-MMM-yyyy hh:mm a",
    ).format(employee?.dateTime ?? DateTime.now());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        elevation: 0,
        title: "Approve Details",
        subtitle: "02-Nov-25 - 08-Nov-25",
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
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ===== EMPLOYEE INFO ROW =====
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomImage(
                          imageUrl: employee?.imageUrl ?? '',
                          isCircular: false,
                          size: 90,
                          fit: BoxFit.cover,
                          fallbackAsset: AppImages.logo,
                        ),
                        // const SizedBox(width: 16),
                        // Expanded(
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       _infoRow(
                        //         context,
                        //         "Name",
                        //         "${employee?.name ?? ''} - ${employee?.empCode ?? ''}",
                        //       ),
                        //       _infoRow(
                        //         context,
                        //         "Department",
                        //         employee?.department ?? '',
                        //       ),
                        //       _infoRow(context, "Date & Time", formattedDate),
                        //       _infoRow(context, "I/O", employee?.inOut ?? ''),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    _infoRow(
                      context,
                      "Name",
                      "${employee?.name ?? ''} - ${employee?.empCode ?? ''}",
                    ),
                    _infoRow(context, "Department", employee?.department ?? ''),
                    _infoRow(context, "Date & Time", formattedDate),
                    _infoRow(context, "I/O", employee?.inOut ?? ''),

                    // const CustomHorizontalDivider(),

                    // ===== SHIFT DETAILS =====
                    Text(
                      "Shift Details",
                      style: AppTextStyles.w400_14(
                        context,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 8),

                    _infoRow(context, "Emp. Remark", employee?.remark ?? ''),
                    _infoRow(context, "Location", employee?.location ?? ""),
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
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title: ",
            style: AppTextStyles.w400_14(
              context,
              color: AppColors.secondaryTextColor,
            ).copyWith(fontWeight: FontWeight.w600),
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
