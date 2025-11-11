import 'package:flutter/material.dart';
import 'package:hrms_uis/app/attendance/screens/approve_attend_emp_list_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../common/widgets/appbar/custom_appbar.dart';

class ApproveAttendanceScreen extends StatefulWidget {
  static const route = '/approve_attendance';

  const ApproveAttendanceScreen({super.key});

  @override
  State<ApproveAttendanceScreen> createState() =>
      _ApproveAttendanceScreenState();
}

class _ApproveAttendanceScreenState extends State<ApproveAttendanceScreen> {
  final List<Map<String, String>> weeks = [
    {"title": "WK 1", "range": "(02-Nov-25 - 08-Nov-25)", "count": "3"},
    {"title": "WK 2", "range": "(26-Oct-25 - 01-Nov-25)", "count": "2"},
    {"title": "WK 3", "range": "(19-Oct-25 - 25-Oct-25)", "count": "1"},
    {"title": "WK 4", "range": "(12-Oct-25 - 18-Oct-25)", "count": "0"},
    {"title": "WK 5", "range": "(05-Oct-25 - 11-Oct-25)", "count": "0"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: context.loc.approveAttendance,
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSizes.padding16,
            vertical: AppSizes.padding16,
          ),
          itemCount: weeks.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSizes.space16),
          itemBuilder: (context, index) {
            final week = weeks[index];
            return InkWell(
              borderRadius: BorderRadius.circular(AppSizes.borderRadius16),
              onTap: () {
                // NavigationService.navigateTo(ApproveAttendEmpListScreen.route);
              },
              child: Container(
                decoration: AppDecorations.card(elevation: 0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 16,
                      ),
                      decoration: AppDecorations.card(
                        elevation: 0,
                        color: AppColors.primaryColor,
                        radius: BorderRadius.only(
                          topLeft: Radius.circular(AppSizes.borderRadius16),
                          bottomLeft: Radius.circular(AppSizes.borderRadius16),
                        ),
                      ),
                      child: Text(
                        week["title"]!,
                        style: AppTextStyles.w400_14(
                          context,
                          color: AppColors.whiteTextColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              week["range"]!,
                              style: AppTextStyles.w400_14(
                                context,
                                color: AppColors.textColor,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "(${week["count"]})",
                                  style: AppTextStyles.w400_14(
                                    context,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                const Icon(
                                  Icons.chevron_right,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
