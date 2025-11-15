import 'package:flutter/material.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/app/attendance/screens/daily_attendance_details_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/constants/image_strings.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/placeholder/no_data_found.dart';

import '../models/daily_attendance_model.dart';
import 'clock_in_out_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'date_wise_attendance_loading.dart';

class DateWiseAttendanceList extends StatelessWidget {
  const DateWiseAttendanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceBloc, AttendanceState>(
      listener: (context, state) {},
      builder: (context, state) {
        // Loading State
        if (state.status == AttendanceStatus.getAttendanceLoading) {
          return Center(child: DateWiseAttendanceLoading());
        }

        // Data State
        final List<DailyAttendanceData> attendanceList =
            state.dailyAttendanceModel?.list ?? [];

        if (attendanceList.isEmpty ||
            state.status == AttendanceStatus.getAttendanceError) {
          return const Center(child: NoDataFound(message: "Data Not Found!"));
        }

        return ListView.builder(
          itemCount: attendanceList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = attendanceList[index];
            return InkWell(
              onTap: () {
                NavigationService.navigateTo(
                  DailyAttendanceDetailsScreen.route,
                  arguments: item,
                );
              },
              child: ClockInOutCard(
                attendanceData: item,
                duration: item.duration.withDefault("N/A"),
                clockIn: item.inTime.withDefault("N/A"),
                clockOut: item.outTime.withDefault("N/A"),
                location: item.inTimeLocation.withDefault("N/A"),
                checkInImage: item.inTimePicCapture ?? AppImages.profileImage,
                checkOutImage: item.outTimePicCapture ?? AppImages.profileImage,
              ),
            );
          },
        );
      },
    );
  }
}
