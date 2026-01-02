import 'package:flutter/material.dart';
import 'package:hrms_uis/app/missed_punch/screens/employee/view_missed_punch_details_screen.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:hrms_uis/common/widgets/custom/custom_title_value_view.dart';

import '../../../../common/navigation_service/navigation_service.dart';
import '../../../../common/utils/constants/decorations.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/widgets/text/read_more_less.dart';
import '../../models/employees_missed_punch_model.dart';

class MissedPunchItem extends StatelessWidget {
  final EmployeesMissedPunchData? employeesMissedPunchData;

  const MissedPunchItem({super.key, required this.employeesMissedPunchData});

  @override
  Widget build(BuildContext context) {
    String status =
        employeesMissedPunchData?.requestStatus ??
        "Pending"; // Approved / Reject / Pending

    /// Status Color
    Color statusColor = status == "Approved"
        ? Colors.green
        : status == "Rejected"
        ? Colors.red
        : Colors.orange;

    /// Side strip color based on Category
    var missingPunchType = employeesMissedPunchData?.swipeTypeName ?? "-";
    Color stripColor = missingPunchType == "Missing Punch"
        ? Colors.deepOrange
        : missingPunchType == "New Joinee"
        ? Colors.deepPurple
        : AppColors.primaryColor;

    return InkWell(
      onTap: () {
        NavigationService.navigateTo(
          ViewMissedPunchDetails.route,
          arguments: employeesMissedPunchData,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(16),
        decoration: AppDecorations.card().copyWith(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    employeesMissedPunchData?.swipeTypeName ?? "-",
                    style: AppTextStyles.w600_14(context, color: stripColor),
                  ),
                ),

                const SizedBox(width: AppSizes.space8),

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
                    style: AppTextStyles.w600_12(context, color: statusColor),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.space4),

            CustomTitleValueView(
              title: "Request Date : ",
              value: AppFormatter.formatDate(
                employeesMissedPunchData?.swipeDate,
                format: DateFormats.fullMonth,
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reason : ",
                  style: AppTextStyles.w400_14(
                    context,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Expanded(
                  child: ReadMoreText(
                    text: employeesMissedPunchData?.employeeRemarks ?? "-",
                    trimLength: 50, // show only 1 lines before "Read more"
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.space4),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Manager Remark : ",
                  style: AppTextStyles.w400_14(
                    context,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Expanded(
                  child: ReadMoreText(
                    text: employeesMissedPunchData?.managerRemarks ?? "",
                    trimLength: 50, // show only 1 lines before "Read more"
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
