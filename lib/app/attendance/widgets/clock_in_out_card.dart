import 'package:flutter/material.dart';
import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/decorations.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/widgets/image/custom_image.dart';
import '../models/daily_attendance_model.dart';

class ClockInOutCard extends StatelessWidget {
  final String duration;
  final String clockIn;
  final String clockOut;
  final String location;
  final String checkInImage;
  final String checkOutImage;
  final Color cardBgColor;
  final DailyAttendanceData? attendanceData;

  const ClockInOutCard({
    super.key,
    required this.duration,
    required this.clockIn,
    required this.clockOut,
    required this.location,
    this.checkInImage = AppImages.profileImage,
    this.checkOutImage = AppImages.profileImage,
    this.cardBgColor = Colors.white,
    this.attendanceData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.card(color: cardBgColor),
      margin: const EdgeInsets.symmetric(vertical: AppSizes.space8),
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
                  duration,
                  style: AppTextStyles.w400_14(
                    context,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),

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
                        imageUrl: checkInImage,
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
                          const SizedBox(height: 5),
                          Text(
                            clockIn,
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
                        imageUrl: checkOutImage,
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
                          const SizedBox(height: 5),
                          Text(
                            clockOut,
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

          // // Divider
          // Container(height: 1, color: Colors.grey.shade300),

          // // Location Row
          // Padding(
          //   padding: const EdgeInsets.all(14),
          //   child: Row(
          //     children: [
          //       const Icon(
          //         Icons.location_on,
          //         size: 20,
          //         color: AppColors.iconColor,
          //       ),
          //       const SizedBox(width: 10),
          //       Expanded(
          //         child: Text(
          //           location,
          //           style: AppTextStyles.w400_14(
          //             context,
          //             color: AppColors.textColor,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
