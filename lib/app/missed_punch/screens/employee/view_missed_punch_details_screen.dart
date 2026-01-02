import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:hrms_uis/common/widgets/appbar/custom_appbar.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/utils/helpers/device_utility.dart';
import '../../../../common/widgets/custom/custom_title_value_view.dart';
import '../../models/employees_missed_punch_model.dart';

class ViewMissedPunchDetails extends StatelessWidget {
  static const route = '/view_missing_punch_details';

  final EmployeesMissedPunchData? empMissingPunchData; // <- your model type

  const ViewMissedPunchDetails({super.key, required this.empMissingPunchData});

  @override
  Widget build(BuildContext context) {
    String requestDate =
        AppFormatter.formatDate(
          empMissingPunchData?.swipeDate,
          format: DateFormats.fullMonth,
        ) ??
        ""; // 12 Jan 2025

    var missingPunchType = empMissingPunchData?.swipeTypeName ?? "-";
    Color stripColor = missingPunchType == "Missing Punch"
        ? Colors.deepOrange
        : missingPunchType == "New Joinee"
        ? Colors.deepPurple
        : AppColors.primaryColor;

    String status =
        empMissingPunchData?.requestStatus ??
        "Pending"; // Approved / Reject / Pending

    /// Status Color
    Color statusColor = status == "Approved"
        ? Colors.green
        : status == "Rejected"
        ? Colors.red
        : Colors.orange;

    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "Missed Punch Details",
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
                        title: "Missing Punch Type",
                        value: missingPunchType,
                        valueColor: stripColor,
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
                        status,
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
                  title: "Request Date",
                  value: requestDate.withFallback("N/A"),
                ),
                CustomTitleValueView(
                  layout: TitleValueLayout.column,
                  title: "Reason",
                  value: empMissingPunchData?.employeeRemarks.withFallback(
                    "N/A",
                  ),
                ),
                CustomTitleValueView(
                  layout: TitleValueLayout.column,
                  title: "Manager Remark",
                  value: empMissingPunchData?.managerRemarks.withFallback(
                    "N/A",
                  ),
                ),
                if (empMissingPunchData?.approverName != null)
                  CustomTitleValueView(
                    layout: TitleValueLayout.column,
                    title: "Approved By",
                    value: empMissingPunchData?.approverName.withFallback(
                      "N/A",
                    ),
                  ),
                if (empMissingPunchData?.approvedDate != null)
                  CustomTitleValueView(
                    layout: TitleValueLayout.column,
                    title: "Approved Date",
                    value: AppFormatter.formatDate(
                      empMissingPunchData?.approvedDate,
                      format: DateFormats.fullMonth,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
