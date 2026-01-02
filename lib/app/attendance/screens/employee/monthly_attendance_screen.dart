import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/custom/custom_refresh_indicator.dart';
import 'package:hrms_uis/common/widgets/text/custom_field_heading.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../widgets/employee/monthly_attendance_calender_view.dart';
import '../../widgets/employee/monthly_attendance_summary.dart';

class MonthlyAttendanceScreen extends StatefulWidget {
  static const route = '/monthly_Attendance_screen';

  const MonthlyAttendanceScreen({super.key});

  @override
  State<MonthlyAttendanceScreen> createState() =>
      _MonthlyAttendanceScreenState();
}

class _MonthlyAttendanceScreenState extends State<MonthlyAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: context.loc.viewAttendance,
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            /// Scroll Content
            Expanded(
              child: BlocBuilder<AttendanceBloc, AttendanceState>(
                builder: (context, state) {
                  return CustomRefreshIndicator(
                    onRefresh: () async {
                      final bloc = context.read<AttendanceBloc>();
                      final current = bloc.state.focusedDay;
                      bloc.add(
                        AttendanceEvent.getMonthlyAttendance(
                          month: current.month,
                          year: current.year,
                        ),
                      );
                    },
                    physics: const BouncingScrollPhysics(),
                    child: BlocBuilder<AttendanceBloc, AttendanceState>(
                      builder: (context, state) {
                        return Padding(
                          padding: EdgeInsets.all(AppSizes.space24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // AppSizes.space32.vGap,

                              // /// -------------------- Profile Card --------------------
                              // MonthlyAttendanceTopView(),
                              //
                              // AppSizes.space20.vGap,

                              /// -------------------- Summary Cards --------------------
                              CustomFieldHeading(title: "Attendance Summary:"),
                              MonthlyAttendanceSummary(),

                              AppSizes.space20.vGap,
                              /// calender table
                              CustomFieldHeading(title: "Attendance Calender:"),
                              MonthlyAttendanceCalenderView(),

                              // attendance view
                              // if (!state.monthlyAttendanceLoading) ...[
                              //   Text(
                              //     "View Attendance",
                              //     style: AppTextStyles.w500_14(context),
                              //   ),
                              //   AppSizes.space8.vGap,
                              //   // 📋 Attendance List
                              //   DateWiseAttendanceList(),
                              // ],
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
