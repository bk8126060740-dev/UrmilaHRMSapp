import 'package:flutter/material.dart';
import 'package:hrms_uis/app/holiday/models/holiday_list_model.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';

class HolidayItem extends StatelessWidget {
  final HolidayData holiday;

  const HolidayItem({super.key, required this.holiday});

  @override
  Widget build(BuildContext context) {
    final Color statusColor = _getStatusColor();
    final String statusText = _getStatusText();

    return Container(
      margin: const EdgeInsets.only(bottom: AppSizes.padding16),
      child: Stack(
        children: [
          /// Main card
          Container(
            decoration: AppDecorations.card(),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.padding16),
              child: Row(
                children: [
                  /// Date box
                  Container(
                    width: 60,
                    padding: const EdgeInsets.symmetric(
                      vertical: AppSizes.padding8,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withFixedOpacity(0.12),
                      borderRadius: BorderRadius.circular(AppSizes.padding8),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Day
                        Text(
                          holiday.day,
                          style: AppTextStyles.w600_12(
                            context,
                            color: statusColor,
                          ),
                        ),

                        /// Month
                        Text(
                          holiday.month,
                          style: AppTextStyles.w600_12(
                            context,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: AppSizes.space16),

                  /// Holiday details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          holiday.dayName,
                          style: AppTextStyles.w400_12(
                            context,
                            color: AppColors.textColor,
                          ),
                        ),
                        Text(
                          holiday.name ?? '-',
                          style: AppTextStyles.w600_12(
                            context,
                            color: statusColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// 🔖 Status badge (Top Right)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSizes.borderRadius16),
                  topRight: Radius.circular(AppSizes.borderRadius16),
                ),
              ),
              child: Text(
                statusText,
                style: AppTextStyles.w400_12(
                  context,
                  color: Colors.white,
                ).copyWith(fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Status helpers
  Color _getStatusColor() {
    if (holiday.isToday) {
      return AppColors.holidayPresent;
    } else if (holiday.isPast) {
      return AppColors.secondaryTextColor;
    } else {
      return AppColors.holiday;
    }
  }

  String _getStatusText() {
    if (holiday.isToday) {
      return "Today";
    } else if (holiday.isPast) {
      return "Past";
    } else {
      return "Upcoming";
    }
  }
}
