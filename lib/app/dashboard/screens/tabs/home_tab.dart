import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/app/attendance/screens/daily_attendance_screen.dart';
import 'package:hrms_uis/app/attendance/screens/monthly_attendance_screen.dart';
import 'package:hrms_uis/app/salary_slip/screens/salary_slip_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/widgets/image/custom_material_icon.dart';
import '../../../attendance/screens/approve_attend_emp_list_screen.dart';

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
          Text("Services", style: AppTextStyles.w500_14(context)),
          SizedBox(height: AppSizes.space16),
          ServiceBuilder(),
        ],
      ),
    );
  }
}

class ServiceBuilder extends StatefulWidget {
  const ServiceBuilder({super.key});

  @override
  State<ServiceBuilder> createState() => _ServiceBuilderState();
}

class _ServiceBuilderState extends State<ServiceBuilder> {
  @override
  Widget build(BuildContext context) {
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
        ),
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: context.loc.attendanceMGR,
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          // NavigationService.navigateTo(ApproveAttendanceScreen.route);
          NavigationService.navigateTo(ApproveAttendEmpListScreen.route);
        },
        child: SvgPicture.asset(
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
          AppImages.monthViewIconSN,
        ),
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "salary Slip",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        onTap: () {
          NavigationService.navigateTo(SalarySlipScreen.route);
        },
        child: SvgPicture.asset(
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
          AppImages.monthViewIconSN,
        ),
      ),
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
        childAspectRatio: 0.75,
      ),
    );
  }
}
