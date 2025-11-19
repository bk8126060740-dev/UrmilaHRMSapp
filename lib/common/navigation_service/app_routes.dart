import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';

import '../../app/attendance/models/approve_attendance_model.dart';
import '../../app/attendance/models/daily_attendance_model.dart';
import '../../app/attendance/screens/approve_attend_emp_details.dart';
import '../../app/attendance/screens/approve_attend_emp_list_screen.dart';
import '../../app/attendance/screens/approve_attendance_screen.dart';
import '../../app/attendance/screens/daily_attendance_details_screen.dart';
import '../../app/attendance/screens/daily_attendance_screen.dart';
import '../../app/attendance/screens/monthly_attendance_screen.dart';
import '../../app/auth/bloc/auth_bloc.dart';
import '../../app/auth/screens/forgot_password_screen.dart';
import '../../app/auth/screens/login_screen.dart';
import '../../app/dashboard/screens/dashboard_screen.dart';
import '../../app/leave/screens/apply_leave_screen.dart';
import '../../app/leave/screens/view_leave_screen.dart';
import '../../app/missed_punch/screens/apply_missed_punch_screen.dart';
import '../../app/missed_punch/screens/view_missed_punch_screen.dart';
import '../../app/profile/screens/profile_screen.dart';
import '../../app/salary_slip/screens/salary_slip_screen.dart';
import '../../app/splash/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthBloc(),
            child: SplashScreen(),
          ),
        );
      case LoginScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => AuthBloc()..add(AuthEvent.fetchRememberMe()),
              child: const LoginScreen(),
            );
          },
        );
      case ForgotPasswordScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => AuthBloc(),
              child: const ForgotPasswordScreen(),
            );
          },
        );
      case DashboardScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            final args =
                settings.arguments
                    as Map<String, dynamic>?; // 👈 get args safely
            final initialIndex = args != null && args.containsKey('index')
                ? args['index'] as int
                : 0;

            var loginModel = context.read<AppBloc>().state.loginResponse;
            var now = DateTime.now();
            return BlocProvider(
              create: (context) =>
                  DashboardBloc(userId: loginModel?.employeeId)
                    ..add(DashboardEvent.getUserProfileData()),
              // ..add(
              //   DashboardEvent.getMonthlyAttendance(
              //     month: now.month,
              //     year: now.year,
              //   ),
              // ,
              child: DashboardScreen(initialIndex: initialIndex),
            );
          },
        );
      case ProfileScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            var loginModel = context.read<AppBloc>().state.loginResponse;
            return BlocProvider(
              create: (context) =>
                  DashboardBloc(userId: loginModel?.employeeId)
                    ..add(DashboardEvent.getUserProfileData()),
              child: ProfileScreen(),
            );
          },
        );
      case MonthlyAttendanceScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            var loginModel = context.read<AppBloc>().state.loginResponse;
            var now = DateTime.now();
            return BlocProvider(
              create: (context) =>
                  AttendanceBloc(userId: loginModel?.employeeId)..add(
                    AttendanceEvent.getMonthlyAttendance(
                      month: now.month,
                      year: now.year,
                      dateTime: now,
                    ),
                  ),
              /*..add(AttendanceEvent.getDailyAttendance(date: now))*/
              child: MonthlyAttendanceScreen(),
            );
          },
        );
      case DailyAttendanceScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            var loginModel = context.read<AppBloc>().state.loginResponse;

            return BlocProvider(
              create: (context) =>
                  AttendanceBloc(userId: loginModel?.employeeId)
                    ..add(AttendanceEvent.initDate()),
              child: DailyAttendanceScreen(),
            );
          },
        );
      case DailyAttendanceDetailsScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            final attendanceData = settings.arguments as DailyAttendanceData?;
            return DailyAttendanceDetailsScreen(attendanceData: attendanceData);
          },
        );
      case ApproveAttendanceScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return ApproveAttendanceScreen();
          },
        );
      case ApproveAttendEmpListScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) {
                var loginModel = context.read<AppBloc>().state.loginResponse;
                return AttendanceBloc(userId: loginModel?.employeeId)..add(
                  AttendanceEvent.selectFilterType(selectedFilterType: "Daily"),
                );
              },
              child: ApproveAttendEmpListScreen(),
            );
          },
        );
      case ApproveAttendEmpDetails.route:
        return MaterialPageRoute(
          builder: (context) {
            final employeeSwipeModel = settings.arguments as AttendecList?;
            return ApproveAttendEmpDetails(
              employeeAttendData: employeeSwipeModel,
            );
          },
        );
      case SalarySlipScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            var loginModel = context.read<AppBloc>().state.loginResponse;
            return BlocProvider(
              create: (context) =>
                  DashboardBloc(userId: loginModel?.employeeId)
                    ..add(DashboardEvent.getUserProfileData()),
              child: SalarySlipScreen(),
            );
          },
        );
      case ViewLeaveScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return ViewLeaveScreen();
          },
        );
      case ApplyLeaveScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return ApplyLeaveScreen();
          },
        );
      case ViewMissedPunchScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return ViewMissedPunchScreen();
          },
        );
      case ApplyMissedPunchScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            return ApplyMissedPunchScreen();
          },
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
