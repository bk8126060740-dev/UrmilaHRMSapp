import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';

import '../../../common/utils/constants/text_styles.dart';
import '../models/monthly_attendance_model.dart';

class CalenderTooltipDialog extends StatelessWidget {
  final MonthlyAttendanceData? report;
  final DateTime date;
  final Color statusColor;

  const CalenderTooltipDialog({
    super.key,
    this.report,
    required this.date,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow(
          context,
          label: "Date",
          value: "${date.year}-${date.month}-${date.day}",
        ),
        _infoRow(
          context,
          label: "Status",
          value: report?.status ?? "-",
          statusColor: statusColor,
        ),
        if (report?.tooltip?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _infoRow(
              context,
              label: "Message",
              value: report?.tooltip ?? "N/A",
              // statusColor: statusColor,
            ),
            // child: Text(
            //   report?.tooltip ?? "N/A",
            //   style: AppTextStyles.w400_14(
            //     context,
            //   ).copyWith(color: Colors.black87),
            // ),
          ),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ),
      ],
    );
  }

  Widget _infoRow(
    BuildContext context, {
    required String label,
    required String value,
    Color? statusColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              label,
              style: AppTextStyles.w400_16(context, color: AppColors.textColor),
            ),
          ),
          Expanded(
            child: Text(
              value,
              // overflow: TextOverflow.ellipsis,
              style: AppTextStyles.w400_16(
                context,
                color: statusColor ?? AppColors.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
