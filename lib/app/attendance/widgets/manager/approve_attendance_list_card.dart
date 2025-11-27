import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/widgets/placeholder/no_data_found.dart';

import '../../../../common/navigation_service/navigation_service.dart';
import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/decorations.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/utils/formatters/date_formats.dart';
import '../../../../common/utils/formatters/formatter.dart';
import '../../../../common/widgets/checkbox/custom_checkbox.dart';
import '../../bloc/attendance_bloc.dart';
import '../../screens/manager/approve_attend_emp_details.dart';

class ApproveAttendanceListCard extends StatelessWidget {
  const ApproveAttendanceListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        var approveAttendanceList =
            state.approveAttendanceListModel?.attendecList ?? [];
        return ListView.builder(
          itemCount: approveAttendanceList.length,
          itemBuilder: (context, index) {
            final employeeAttendData = approveAttendanceList[index];
            final isSelected = state.selectedEmployeeIds.contains(
              employeeAttendData.id.toString(),
            );

            return approveAttendanceList.isEmpty
                ? Center(child: NoDataFound())
                : Container(
                    margin: const EdgeInsets.only(bottom: AppSizes.space16),
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.padding8,
                      horizontal: AppSizes.padding12,
                    ),
                    decoration: AppDecorations.card(
                      radius: BorderRadius.circular(AppSizes.borderRadius8),
                    ),
                    child: Row(
                      children: [
                        CustomCheckBox(
                          value: isSelected,
                          borderColor: AppColors.iconColor,
                          onChanged: (_) {
                            final bloc = context.read<AttendanceBloc>();
                            bloc.add(
                              AttendanceEvent.toggleSingleSelection(
                                employeeId: employeeAttendData.id.toString(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: AppSizes.space4),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${employeeAttendData.employeeName}",
                                style: AppTextStyles.w400_14(
                                  context,
                                  color: AppColors.textColor,
                                ),
                              ),
                              const SizedBox(height: AppSizes.space4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    size: 16,
                                    color: AppColors.iconColor,
                                  ),
                                  const SizedBox(width: AppSizes.space4),
                                  Expanded(
                                    child: Text(
                                      AppFormatter.formatDate(
                                            employeeAttendData.attendanceDate,
                                            format: DateFormats.fullMonth,
                                          ) ??
                                          "N/A",
                                      style: AppTextStyles.w400_12(
                                        context,
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSizes.space4),
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: AppColors.iconColor,
                                        ),
                                        const SizedBox(width: AppSizes.space4),
                                        Expanded(
                                          child: Text(
                                            "IN : ${AppFormatter.formatTimeString(employeeAttendData.inTime)}",
                                            style: AppTextStyles.w400_12(
                                              context,
                                              color:
                                                  AppColors.secondaryTextColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.access_time,
                                          size: 16,
                                          color: AppColors.iconColor,
                                        ),
                                        const SizedBox(width: AppSizes.space4),
                                        Text(
                                          "OUT : ${AppFormatter.formatTimeString(employeeAttendData.outTime) ?? "N/A"}",
                                          style: AppTextStyles.w400_12(
                                            context,
                                            color: AppColors.secondaryTextColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: AppSizes.space4),
                        InkWell(
                          onTap: () {
                            NavigationService.navigateTo(
                              ApproveAttendEmpDetails.route,
                              arguments: employeeAttendData,
                            );
                          },
                          child: const Icon(
                            Icons.visibility_outlined,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        );
      },
    );
  }
}
