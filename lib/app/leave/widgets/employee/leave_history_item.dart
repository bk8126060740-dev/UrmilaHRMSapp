import 'package:flutter/material.dart';
import 'package:hrms_uis/app/leave/screens/employee/leave_history_details_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';

import '../../../../common/utils/constants/decorations.dart';
import '../../model/employee_leave_data_model.dart';

class LeaveHistoryItem extends StatelessWidget {
  final EmpLeaveDataItem? item;

  const LeaveHistoryItem({super.key, required this.item});

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

    /// ---- Final Date Text ----
    String finalDate = (from == to) ? from : "$from → $to";
    final int? status = item?.firstLevelStatus;

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

      default:
        statusColor = Colors.grey;
        statusTxt = "Unknown";
    }

    return InkWell(
      onTap: () {
        NavigationService.navigateTo(
          LeaveHistoryDetailsScreen.route,
          arguments: item,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(AppSizes.padding16),
        decoration: AppDecorations.card().copyWith(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Title (Leave Type) ---
            Row(
              children: [
                Expanded(
                  child: Text(
                    type,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: typeColor,
                    ),
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
                    statusTxt,
                    style: AppTextStyles.w600_12(context, color: statusColor),
                  ),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.space4),

            /// --- Date (Single or Range) ---
            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 14,
                  color: Colors.grey,
                ),
                const SizedBox(width: 6),
                Text(
                  finalDate,
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),

            const SizedBox(height: AppSizes.space4),

            /// --- Duration (Always Shown) ---
            Row(
              children: [
                const Icon(
                  Icons.timelapse_rounded,
                  size: 14,
                  color: Colors.grey,
                ),
                const SizedBox(width: 6),
                Text(
                  "Duration: $durationType day(s)",
                  style: const TextStyle(fontSize: 13, color: Colors.black87),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
