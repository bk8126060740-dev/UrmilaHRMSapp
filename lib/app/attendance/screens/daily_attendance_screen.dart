import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/custom/custom_refresh_indicator.dart';
import '../../../common/widgets/placeholder/no_internet.dart';
import '../widgets/date_navigation_view.dart';
import '../widgets/date_wise_attendance_list.dart';
import '../widgets/user_details_card.dart';

class DailyAttendanceScreen extends StatefulWidget {
  static const route = '/daily_Attendance_screen';

  const DailyAttendanceScreen({super.key});

  @override
  State<DailyAttendanceScreen> createState() => _DailyAttendanceScreenState();
}

class _DailyAttendanceScreenState extends State<DailyAttendanceScreen> {
  bool hasInternet = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: context.loc.manageAttendance,
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: hasInternet
          ? _buildMainPage(context)
          : NoInternetUi(context: context),
    );
  }

  // Main Attendance Page
  Widget _buildMainPage(BuildContext context) {
    return CustomRefreshIndicator(
      backgroundColor: AppColors.bgColor,
      onRefresh: () async {
        var attendanceBloc = context.read<AttendanceBloc>();
        attendanceBloc.add(
          AttendanceEvent.getDailyAttendance(
            date: attendanceBloc.state.selectedDate ?? DateTime.now(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.padding24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppSizes.space32.vGap,
            // 👤 Profile Section
            UserDetailsCard(),

            // 📅 Date Navigation Row
            DateNavigationView(),

            SizedBox(height: AppSizes.space12),

            // 📋 Attendance List
            DateWiseAttendanceList(),
          ],
        ),
      ),
    );
  }
}
