// for listview type ui ==============================>>>
import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/widgets/custom/custom_title_value_view.dart';

import '../../../../common/utils/constants/decorations.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../model/leave_type_data_model.dart';

class LeaveSummaryBase extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final LeaveTypeBalanceItem? leaveTypeBalanceItem;

  const LeaveSummaryBase({
    super.key,
    required this.title,
    required this.value,
    this.color = AppColors.primaryColor,
    this.leaveTypeBalanceItem,
  });

  @override
  Widget build(BuildContext context) {
    String type = title;

    /// ---- Leave Type Color ----
    Color typeColor = type == "Paid Leave"
        ? Colors.blue
        : type == "Casual Leave"
        ? Colors.deepPurple
        : type == "Sick Leave"
        ? Colors.deepOrange
        : Colors.indigo;

    return Container(
      padding: EdgeInsets.all(AppSizes.padding16),
      decoration: AppDecorations.card(
        radius: const BorderRadius.only(
          bottomLeft: Radius.circular(AppSizes.borderRadius12),
          bottomRight: Radius.circular(AppSizes.borderRadius12),
          topRight: Radius.circular(AppSizes.borderRadius16),
          topLeft: Radius.circular(AppSizes.borderRadius16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTitleValueView(
            title: "Leave Type : ",
            value: title,
            valueStyle: AppTextStyles.w500_14(context, color: typeColor),
          ),
          Row(
            children: [
              Expanded(
                child: CustomTitleValueView(
                  title: "Opening : ",
                  value: "${leaveTypeBalanceItem?.openingBalance}",
                ),
              ),
              Expanded(
                child: CustomTitleValueView(
                  title: "Remaining : ",
                  value: "${leaveTypeBalanceItem?.remainingBalance}",
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTitleValueView(
                  title: "Carr Forward : ",
                  value: "${leaveTypeBalanceItem?.leaveType?.maxCarryForward}",
                ),
              ),
              Expanded(
                child: CustomTitleValueView(
                  title: "Yearly Limit : ",
                  value: "${leaveTypeBalanceItem?.leaveType?.yearlyLimit}",
                ),
              ),
            ],
          ),
          CustomTitleValueView(
            title: "Used Leave : ",
            value: "${leaveTypeBalanceItem?.usedLeave}",
            valueStyle: AppTextStyles.w500_14(
              context,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

// for gridview type ui ==============================>>>
// import 'package:flutter/material.dart';
// import 'package:hrms_uis/common/utils/constants/colors.dart';
//
// import '../../../../common/utils/constants/decorations.dart';
// import '../../../../common/utils/constants/sizes.dart';
// import '../../../../common/utils/constants/text_styles.dart';
// import '../../model/leave_type_data_model.dart';
//
// class LeaveSummaryBase extends StatelessWidget {
//   final String title;
//   final String value;
//   final Color color;
//   final LeaveTypeBalanceItem? leaveTypeBalanceItem;
//
//   const LeaveSummaryBase({
//     super.key,
//     required this.title,
//     required this.value,
//     this.color = AppColors.primaryColor,
//     this.leaveTypeBalanceItem,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     String type = title;
//
//     /// ---- Leave Type Color ----
//     Color typeColor = type == "Paid Leave"
//         ? Colors.blue
//         : type == "Casual Leave"
//         ? Colors.deepPurple
//         : type == "Sick Leave"
//         ? Colors.deepOrange
//         : Colors.indigo;
//
//     return Container(
//       padding: EdgeInsets.all(AppSizes.padding16),
//       decoration: AppDecorations.card(
//         radius: const BorderRadius.only(
//           bottomLeft: Radius.circular(AppSizes.borderRadius12),
//           bottomRight: Radius.circular(AppSizes.borderRadius12),
//           topRight: Radius.circular(AppSizes.borderRadius16),
//           topLeft: Radius.circular(AppSizes.borderRadius16),
//         ),
//       ),
//       child: Column(
//         children: [
//           Text(title, style: AppTextStyles.w400_14(context)),
//           SizedBox(height: AppSizes.space4),
//           Text(value, style: AppTextStyles.w600_20(context, color: typeColor)),
//         ],
//       ),
//     );
//   }
// }
