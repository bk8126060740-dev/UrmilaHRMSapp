import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/custom/custom_title_value_view.dart';

import '../../../../common/utils/constants/decorations.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/widgets/text/read_more_less.dart';

class MissedPunchItem extends StatelessWidget {
  final Map<String, dynamic> item;

  const MissedPunchItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    String category =
        item["category"]; // Early Coming / Late Going / Missing Punch
    String requestDate = item["requestDate"]; // 12 Jan 2025
    String status = item["status"]; // Approved / Reject / Pending

    /// Status Color
    Color statusColor = status == "Approved"
        ? Colors.green
        : status == "Pending"
        ? Colors.orange
        : Colors.red;

    /// Side strip color based on Category
    Color stripColor = category == "Missing Punch"
        ? Colors.deepOrange
        : category == "New Joinee"
        ? Colors.deepPurple
        : AppColors.primaryColor;

    return Container(
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
                  category,
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
                  borderRadius: BorderRadius.circular(AppSizes.borderRadius16),
                ),
                child: Text(
                  status,
                  style: AppTextStyles.w600_12(context, color: statusColor),
                ),
              ),
            ],
          ),

          const SizedBox(height: AppSizes.space4),

          CustomTitleValueView(title: "Request Date : ", value: requestDate),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Remark : ",
                style: AppTextStyles.w400_14(
                  context,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              Expanded(
                child: ReadMoreText(
                  text:
                      "UHYSBGVUSVBGBCIUWVBCKUWQDUHBCKUWDHBDCKJHWDBCKDWHBDVKUCCDWBKUCBKJUDWBCKUWDDBCKUDWBDCKUHDWBDKUCUHBDWIUHB",
                  trimLines: 1, // show only 1 lines before "Read more"
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
