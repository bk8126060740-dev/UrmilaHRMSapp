import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/app/dashboard/bloc/dashboard_bloc.dart';
import 'package:hrms_uis/app/leave/bloc/leave_bloc.dart';
import 'package:hrms_uis/app/leave/model/approval_leave_list_model.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';

import '../../app/attendance/models/approve_attendance_model.dart';
import '../../app/attendance/models/daily_attendance_model.dart';
import '../../app/attendance/screens/manager/approve_attend_emp_details.dart';
import '../../app/attendance/screens/manager/approve_attend_emp_list_screen.dart';
import '../../app/attendance/screens/manager/team_attendance_screen.dart';
import '../../app/attendance/screens/employee/daily_attendance_details_screen.dart';
import '../../app/attendance/screens/employee/daily_attendance_screen.dart';
import '../../app/attendance/screens/employee/monthly_attendance_screen.dart';
import '../../app/auth/bloc/auth_bloc.dart';
import '../../app/auth/screens/forgot_password_screen.dart';
import '../../app/auth/screens/login_screen.dart';
import '../../app/dashboard/screens/dashboard_screen.dart';
import '../../app/leave/model/employee_leave_data_model.dart';
import '../../app/leave/screens/employee/apply_leave_screen.dart';
import '../../app/leave/screens/employee/leave_history_details_screen.dart';
import '../../app/leave/screens/employee/view_leave_screen.dart';
import '../../app/leave/screens/manager/approve_leave_emp_details.dart';
import '../../app/leave/screens/manager/approve_leave_emp_list.dart';
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
            final args = settings.arguments as Map<String, dynamic>?;
            final initialIndex = args != null && args.containsKey('index')
                ? args['index'] as int
                : 0;

            var loginModel = context.read<AppBloc>().state.loginResponse;
            return BlocProvider(
              create: (context) =>
                  DashboardBloc(userId: loginModel?.employeeId)
                    ..add(DashboardEvent.getUserProfileData()),
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
                    ),
                  ),
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
      case TeamAttendanceScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            var loginModel = context.read<AppBloc>().state.loginResponse;
            return BlocProvider(
              create: (context) =>
                  AttendanceBloc(userId: loginModel?.employeeId)
                    ..add(AttendanceEvent.getManagersEmployeeList()),
              child: TeamAttendanceScreen(),
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
            var loginModel = context.read<AppBloc>().state.loginResponse;
            return BlocProvider(
              create: (context) => LeaveBloc(empId: loginModel?.employeeId)
                ..add(LeaveEvent.getLeaveType())
                /*..add(LeaveEvent.getEmpLeave())*/,
              child: ViewLeaveScreen(),
            );
          },
        );
      case ApplyLeaveScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            var loginModel = context.read<AppBloc>().state.loginResponse;
            return BlocProvider(
              create: (context) =>
                  LeaveBloc(empId: loginModel?.employeeId)
                    ..add(LeaveEvent.getLeaveType()),
              child: ApplyLeaveScreen(),
            );
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
      case ApproveLeaveEmpList.route:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) {
                var loginModel = context.read<AppBloc>().state.loginResponse;
                return LeaveBloc(empId: loginModel?.employeeId)..add(
                  LeaveEvent.selectFilterType(selectedFilterType: "Daily"),
                );
              },
              child: ApproveLeaveEmpList(),
            );
          },
        );
      case ApproveLeaveEmpDetails.route:
        return MaterialPageRoute(
          builder: (context) {
            final employeeSwipeModel =
                settings.arguments as ApprovalLeaveListItem?;
            return ApproveLeaveEmpDetails(leaveData: employeeSwipeModel);
          },
        );
      case LeaveHistoryDetailsScreen.route:
        return MaterialPageRoute(
          builder: (context) {
            final leaveData = settings.arguments as EmpLeaveDataItem?;
            return LeaveHistoryDetailsScreen(item: leaveData);
          },
        );
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
