import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hrms_uis/app/profile/screens/profile_screen.dart';
import 'package:hrms_uis/app/salary_slip/screens/salary_slip_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/app_bloc/app_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/enums.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/widgets/image/custom_material_icon.dart';

class ESSTab extends StatelessWidget {
  const ESSTab({super.key});

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
        title: "Payslip",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        child: SvgPicture.asset(
          AppImages.paySlipIcon,
          fit: BoxFit.fill,
          width: AppSizes.iconSize24,
          height: AppSizes.iconSize24,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
        onTap: () {
          NavigationService.navigateTo(SalarySlipScreen.route);
        },
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "Personal Info.",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        child: SvgPicture.asset(
          AppImages.personalInfoIcon,
          fit: BoxFit.fill,
          width: AppSizes.iconSize24,
          height: AppSizes.iconSize24,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
        onTap: () {
          NavigationService.navigateTo(
            ProfileScreen.route,
            arguments: EssTabMenuEnum.personalInfo,
          );
        },
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "Employment",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        child: SvgPicture.asset(
          AppImages.employmentIcon,
          fit: BoxFit.fill,
          width: AppSizes.iconSize24,
          height: AppSizes.iconSize24,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
        onTap: () {
          NavigationService.navigateTo(
            ProfileScreen.route,
            arguments: EssTabMenuEnum.employment,
          );
        },
      ),
      MaterialSquareIcon(
        squareColor: AppColors.surfaceColor,
        title: "Bank",
        textStyle: serviceTextStyle,
        iconTextGap: 8.0,
        child: SvgPicture.asset(
          AppImages.bankIcon,
          fit: BoxFit.fill,
          width: AppSizes.iconSize24,
          height: AppSizes.iconSize24,
          colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
        ),
        onTap: () {
          NavigationService.navigateTo(
            ProfileScreen.route,
            arguments: EssTabMenuEnum.bank,
          );
        },
      ),

      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Employment",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Contact",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Personal",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Statutory",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Bank",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Family",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Nominee",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Immigration",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Driving Licence",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Skills",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Language",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Qualification",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Social Details",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Assets List",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Prev Experience",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Policy",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Download CTC",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Payslip",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Tax Projection",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),
      // MaterialSquareIcon(
      //   squareColor: AppColors.surfaceColor,
      //   title: "Tax Eligibility",
      //   textStyle: serviceTextStyle,
      //   iconTextGap: 8.0,
      //   child: SvgPicture.asset(
      //     AppImages.attendanceIcon,
      //     fit: BoxFit.fill,
      //     colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //   ),
      //   onTap: () {},
      // ),

      // if (isManager)
      //   MaterialSquareIcon(
      //     squareColor: AppColors.surfaceColor,
      //     title: context.loc.attendanceMGR,
      //     textStyle: serviceTextStyle,
      //     iconTextGap: 8.0,
      //     onTap: () {},
      //     child: SvgPicture.asset(
      //       AppImages.managerApproveIcon,
      //       fit: BoxFit.fill,
      //       height: 20,
      //       width: 20,
      //       colorFilter: ColorFilter.mode(AppColors.iconColor, BlendMode.srcIn),
      //     ),
      //   ),
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.padding16,
        horizontal: AppSizes.padding16,
      ),
      child: GridView.builder(
        itemCount: employeeItems.length,
        itemBuilder: (context, index) => employeeItems[index],
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 12,
          childAspectRatio: 0.90,
        ),
      ),
    );
  }
}
