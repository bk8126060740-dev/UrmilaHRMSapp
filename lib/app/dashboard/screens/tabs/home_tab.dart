import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/app/attendance/screens/employee/daily_attendance_screen.dart';
import 'package:hrms_uis/app/attendance/screens/employee/monthly_attendance_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/widgets/image/custom_material_icon.dart';
import '../../../attendance/screens/manager/approve_attend_emp_list_screen.dart';
import '../../../attendance/screens/manager/team_attendance_screen.dart';
import '../../../leave/screens/employee/view_leave_screen.dart';
import '../../../leave/screens/manager/approve_leave_emp_list.dart';
import '../../../missed_punch/screens/employee/view_missed_punch_screen.dart';
import '../../../missed_punch/screens/manager/approve_missed_punch_list_screen.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.padding16,
        horizontal: AppSizes.padding16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("Services", style: AppTextStyles.w500_14(context)),
          // SizedBox(height: AppSizes.space16),
          ServiceBuilder(),
        ],
      ),
    );
  }
}

/*
class ServiceBuilder extends StatefulWidget {
  const ServiceBuilder({super.key});

  @override
  State<ServiceBuilder> createState() => _ServiceBuilderState();
}

class _ServiceBuilderState extends State<ServiceBuilder> {
  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppBloc>().state;
    final serviceTextStyle = AppTextStyles.w400_12(
      context,
      color: AppColors.textColor,
    ).copyWith(fontSize: 11);
    ValueNotifier<List<MaterialSquareIcon>> items = ValueNotifier([
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: context.loc.attendance,
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        child: SvgPicture.asset(
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
          AppImages.attendanceIcon,
          fit: BoxFit.fill,
        ),
        onTap: () {
          NavigationService.navigateTo(DailyAttendanceScreen.route);
        },
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "View Atten.",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(MonthlyAttendanceScreen.route);
        },
        child: SvgPicture.asset(
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
          AppImages.monthViewIconSN,
          fit: BoxFit.fill,
          height: 20,
          width: 20,
        ),
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "Leave",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(ViewLeaveScreen.route);
        },
        child: SvgPicture.asset(
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
          AppImages.leaveIcon,
        ),
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "Missed Punch",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(ViewMissedPunchScreen.route);
        },
        child: SvgPicture.asset(
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
          AppImages.leaveIcon,
        ),
      ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "salary Slip",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   onTap: () {
      //     NavigationService.navigateTo(SalarySlipScreen.route);
      //   },
      //   child: SvgPicture.asset(
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //     AppImages.monthViewIconSN,
      //   ),
      // ),
      if (appState.loginResponse?.employeeType == "M")
        MaterialSquareIcon(
          squareColor: AppColors.surfaceColor,
          title: context.loc.attendanceMGR,
          textStyle: serviceTextStyle,
          iconTextGap: 8.0,
          onTap: () {
            NavigationService.navigateTo(ApproveAttendEmpListScreen.route);
          },
          child: SvgPicture.asset(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
            AppImages.managerApproveIcon,
            height: 20,
            width: 20,
          ),
        ),
      if (appState.loginResponse?.employeeType == "M")
        MaterialSquareIcon(
          squareColor: AppColors.surfaceColor,
          title: "Team Atten.",
          textStyle: serviceTextStyle,
          iconTextGap: 8.0,
          onTap: () {
            NavigationService.navigateTo(TeamAttendanceScreen.route);
          },
          child: SvgPicture.asset(
            colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
            AppImages.monthViewIconSN,
            fit: BoxFit.fill,
            height: 20,
            width: 20,
          ),
        ),
      if (appState.loginResponse?.employeeType == "M")
        MaterialSquareIcon(
          squareColor: AppColors.surfaceColor,
          title: context.loc.leaveMGR,
          textStyle: serviceTextStyle,
          iconTextGap: 8.0,
          onTap: () {
            NavigationService.navigateTo(ApproveLeaveEmpList.route);
          },
          child: SvgPicture.asset(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
            AppImages.leaveManagerIcon,
            height: 20,
            width: 20,
          ),
        ),
      // if (appState.loginResponse?.employeeType == "M")
      //   MaterialSquareIcon(
      //     squareColor: AppColors.surfaceColor,
      //     title: context.loc.teamLeave,
      //     textStyle: serviceTextStyle,
      //     iconTextGap: 8.0,
      //     onTap: () {
      //       // NavigationService.navigateTo(ApproveAttendEmpListScreen.route);
      //     },
      //     child: SvgPicture.asset(
      //       fit: BoxFit.fill,
      //       colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //       AppImages.leaveIcon,
      //       height: 20,
      //       width: 20,
      //     ),
      //   ),
    ]);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.value.length,
      // crossAxisCount: 4,
      itemBuilder: (context, index) {
        return items.value[index];
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 12,
        // mainAxisExtent: 120,
        childAspectRatio: 0.90,
      ),
    );
  }
}
*/

class ServiceBuilder extends StatefulWidget {
  const ServiceBuilder({super.key});

  @override
  State<ServiceBuilder> createState() => _ServiceBuilderState();
}

class _ServiceBuilderState extends State<ServiceBuilder> {
  @override
  Widget build(BuildContext context) {
    var appState = context.read<AppBloc>().state;
    final isManager = appState.loginResponse?.employeeType == "M";

    final serviceTextStyle = AppTextStyles.w400_12(
      context,
      color: AppColors.textColor,
    ).copyWith(fontSize: 11);

    /// ---------------- EMPLOYEE SERVICES ----------------
    final employeeItems = <MaterialSquareIcon>[
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: context.loc.attendance,
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        child: SvgPicture.asset(
          AppImages.attendanceIcon,
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
        onTap: () {
          NavigationService.navigateTo(DailyAttendanceScreen.route);
        },
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "View Atten.",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(MonthlyAttendanceScreen.route);
        },
        child: SvgPicture.asset(
          AppImages.monthViewIconSN,
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "Leave",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(ViewLeaveScreen.route);
        },
        child: SvgPicture.asset(
          AppImages.leaveIcon,
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "Missed Punch",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(ViewMissedPunchScreen.route);
        },
        child: SvgPicture.asset(
          AppImages.missingPunchIcon,
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
      ),
    ];

    /// ---------------- MANAGER SERVICES ----------------
    final managerItems = <MaterialSquareIcon>[
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: context.loc.attendanceMGR,
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(ApproveAttendEmpListScreen.route);
        },
        child: SvgPicture.asset(
          AppImages.managerApproveIcon,
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "Team Atten.",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(TeamAttendanceScreen.route);
        },
        child: SvgPicture.asset(
          AppImages.monthViewIconSN,
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: context.loc.leaveMGR,
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(ApproveLeaveEmpList.route);
        },
        child: SvgPicture.asset(
          AppImages.leaveManagerIcon,
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "Punch Mgr.",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(ApproveMissedPunchListScreen.route);
        },
        child: SvgPicture.asset(
          AppImages.punchManageIcon,
          fit: BoxFit.fill,
          height: 20,
          width: 20,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Employee section
        Text("Employee Services", style: AppTextStyles.w500_14(context)),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: employeeItems.length,
          itemBuilder: (context, index) => employeeItems[index],
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 12,
            childAspectRatio: 0.90,
          ),
        ),

        // Manager section (only for M)
        if (isManager) ...[
          const SizedBox(height: 20),
          Text("Manager Services", style: AppTextStyles.w500_14(context)),
          const SizedBox(height: 8),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: managerItems.length,
            itemBuilder: (context, index) => managerItems[index],
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 12,
              childAspectRatio: 0.90,
            ),
          ),
        ],
      ],
    );
  }
}
