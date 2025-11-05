import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/widgets/image/custom_image.dart';
import '../models/daily_attendance_model.dart';

class AttendanceDetailsView extends StatelessWidget {
  final DailyAttendanceData? attendanceData;

  const AttendanceDetailsView({super.key, this.attendanceData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.card(),
      padding: const EdgeInsets.symmetric(
        vertical: AppSizes.padding16,
        horizontal: AppSizes.padding12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Duration Row
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Duration :-",
                  style: AppTextStyles.w500_14(
                    context,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Text(
                  attendanceData?.duration ?? "",
                  style: AppTextStyles.w400_14(
                    context,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Container(height: 1, color: Colors.grey.shade300),

          // Clock In / Clock Out Section
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Clock In
                Expanded(
                  child: Row(
                    children: [
                      CustomImage(
                        imageUrl:
                            attendanceData?.inTimePicCapture ??
                            AppImages.profileImage,
                        fallbackAsset: AppImages.profileImage,
                        size: 30,
                        borderColor: AppColors.borderColor,
                        borderWidth: 1,
                        useShimmer: true,
                      ),
                      const SizedBox(width: 14),
                      Column(
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
                            attendanceData?.inTime ?? "--",
                            style: AppTextStyles.w400_14(
                              context,
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
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
                            attendanceData?.outTimePicCapture ??
                            AppImages.profileImage,
                        fallbackAsset: AppImages.profileImage,
                        size: 30,
                        borderColor: AppColors.borderColor,
                        borderWidth: 1,
                        useShimmer: true,
                      ),
                      const SizedBox(width: 14),
                      Column(
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
                            attendanceData?.outTime ?? "--",
                            style: AppTextStyles.w400_14(
                              context,
                              color: AppColors.textColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Divider
          Container(height: 1, color: Colors.grey.shade300),

          // Clock In Location
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
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
                        attendanceData?.inTimeLocation ?? "--",
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
          ),

          // Divider
          Container(height: 1, color: Colors.grey.shade300),

          // Clock Out Location
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
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
                        attendanceData?.outTimeLocation ?? "--",
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
          ),
        ],
      ),
    );
  }
}
