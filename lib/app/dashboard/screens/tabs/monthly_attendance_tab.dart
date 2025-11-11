import 'package:flutter/material.dart';
import 'package:hrms_uis/app/attendance/widgets/monthly_attendance_calender_view.dart';
import 'package:hrms_uis/app/attendance/widgets/monthly_attendance_summary.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/navigation_service/navigation_service.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../attendance/screens/daily_attendance_screen.dart';
import '../../widgets/monthly_attendance_top_view.dart';

class MonthlyAttendanceTab extends StatefulWidget {
  const MonthlyAttendanceTab({super.key});

  @override
  State<MonthlyAttendanceTab> createState() => _MonthlyAttendanceTabState();
}

class _MonthlyAttendanceTabState extends State<MonthlyAttendanceTab> {
  bool hasInternet = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgColor,
      appBar: CustomAppBar(
        elevation: 0,
        title: context.loc.monthlyView,
        showAvatar: false,
        showBackButton: false,
        showNavigation: true,
        showCalendarIcon: true,
        onCalendarTap: () {
          NavigationService.navigateTo(DailyAttendanceScreen.route);
        },
        onNavigationTap: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Scroll Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(AppSizes.space24),
                child: Column(
                  children: [
                    AppSizes.space32.vGap,

                    /// -------------------- Profile Card --------------------
                    MonthlyAttendanceTopView(),

                    AppSizes.space20.vGap,

                    /// -------------------- Summary Cards --------------------
                    MonthlyAttendanceSummary(),

                    AppSizes.space20.vGap,

                    /// calender table
                    MonthlyAttendanceCalenderView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
