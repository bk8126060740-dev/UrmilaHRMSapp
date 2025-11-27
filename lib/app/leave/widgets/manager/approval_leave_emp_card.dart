import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:hrms_uis/common/widgets/checkbox/custom_checkbox.dart';
import 'package:hrms_uis/common/widgets/placeholder/no_data_found.dart';

import '../../bloc/leave_bloc.dart';
import '../../screens/manager/approve_leave_emp_details.dart';

class ApproveLeaveEmpCard extends StatelessWidget {
  const ApproveLeaveEmpCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        final leaveList = state.approveLeaveListModel?.leaveList ?? [];

        if (leaveList.isEmpty) {
          return const Center(child: NoDataFound());
        }

        return ListView.builder(
          itemCount: leaveList.length,
          itemBuilder: (context, index) {
            final leave = leaveList[index];
            final isSelected = state.selectedLeaveIds.contains(
              leave.id.toString(),
            );

            String type = leave.leaveTypeName ?? "N/A";

            String from =
                AppFormatter.formatDate(
                  leave.startDate,
                  format: DateFormats.fullMonth,
                ) ??
                "";

            String to =
                AppFormatter.formatDate(
                  leave.endDate,
                  format: DateFormats.fullMonth,
                ) ??
                "";

            String durationType = '${leave.noOfDays}';

            /// ---- Leave Type Color ----
            Color typeColor = type == "Paid Leave"
                ? Colors.blue
                : type == "Casual Leave"
                ? Colors.deepPurple
                : type == "Sick Leave"
                ? Colors.deepOrange
                : Colors.indigo;

            /// ---- Final Date Text ----
            String finalDate = (from == to) ? from : "$from → $to";

            final int? status = leave.firstLevelStatus;

            final statusColor = status == 1
                ? Colors.green
                : status == 0
                ? Colors.orange
                : status == -1
                ? Colors.red
                : Colors.grey;

            final statusTxt = status == 1
                ? "Approved"
                : status == 0
                ? "Pending"
                : status == -1
                ? "Rejected"
                : "Unknown";

            return Container(
              margin: const EdgeInsets.only(bottom: AppSizes.space16),
              padding: const EdgeInsets.symmetric(
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
                      context.read<LeaveBloc>().add(
                        LeaveEvent.toggleSingleSelection(
                          leaveId: leave.id.toString(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: AppSizes.space4),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Employee Name
                        Text(
                          "${leave.employeeName.withFallback()}(${leave.employeeId})",
                          style: AppTextStyles.w400_14(
                            context,
                            color: AppColors.textColor,
                          ),
                        ),
                        const SizedBox(height: AppSizes.space4),

                        // Leave Type
                        Text(
                          type,
                          style: AppTextStyles.w400_12(
                            context,
                            color: typeColor,
                          ),
                        ),
                        const SizedBox(height: AppSizes.space4),

                        // From - To
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
                                "$from - $to",
                                style: AppTextStyles.w400_12(
                                  context,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.space4),

                        // Duration Type + Status
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Duration: $durationType Day",
                                style: AppTextStyles.w400_12(
                                  context,
                                  color: AppColors.secondaryTextColor,
                                ),
                              ),
                            ),
                            Text(
                              statusTxt,
                              style: AppTextStyles.w400_12(
                                context,
                                color: statusColor,
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
                        ApproveLeaveEmpDetails.route,
                        arguments: leave,
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
