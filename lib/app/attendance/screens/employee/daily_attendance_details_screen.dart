import 'package:flutter/material.dart';
import 'package:hrms_uis/app/attendance/widgets/employee/attendence_details_view.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../models/daily_attendance_model.dart';

class DailyAttendanceDetailsScreen extends StatelessWidget {
  static const route = '/daily_attendance_details_screen';
  final DailyAttendanceData? attendanceData;

  const DailyAttendanceDetailsScreen({super.key, this.attendanceData});

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(
            AppSizes.padding16,
            // left: AppSizes.padding24,
            // left: AppSizes.padding24,
          ),
          child: DailyAttendanceDetailsView(attendanceData: attendanceData),
        ),
      ),
    );
  }
}
