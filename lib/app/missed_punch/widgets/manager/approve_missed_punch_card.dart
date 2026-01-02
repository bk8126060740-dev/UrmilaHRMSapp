import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/missed_punch/bloc/missed_punch_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/utils/formatters/date_formats.dart';
import 'package:hrms_uis/common/utils/formatters/formatter.dart';
import 'package:hrms_uis/common/widgets/checkbox/custom_checkbox.dart';
import 'package:hrms_uis/common/widgets/placeholder/no_data_found.dart';

import '../../../../common/navigation_service/navigation_service.dart';
import '../../../../common/widgets/custom/custom_title_value_view.dart';
import '../../screens/manager/approve_missed_punch_details.dart';

class ApproveMissedPunchCard extends StatelessWidget {
  const ApproveMissedPunchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MissedPunchBloc, MissedPunchState>(
      builder: (context, state) {
        final missingPunchList =
            state.approvalMissingPunchModel?.swipeRequestList ?? [];

        if (missingPunchList.isEmpty) {
          return const Center(child: NoDataFound());
        }

        return ListView.builder(
          itemCount: missingPunchList.length,
          itemBuilder: (context, index) {
            final missingPunchData = missingPunchList[index];
            final isSelected = state.selectedMissingPunchIds.contains(
              missingPunchData.id.toString(),
            );

            /// Side strip color based on Category
            var missingPunchType = missingPunchData.swipeTypeName ?? "-";
            Color stripColor = missingPunchType == "Missing Punch"
                ? Colors.deepOrange
                : missingPunchType == "New Joinee"
                ? Colors.deepPurple
                : AppColors.primaryColor;

            String requestDate =
                AppFormatter.formatDate(
                  missingPunchData.swipeDate,
                  format: DateFormats.fullMonth,
                ) ??
                ""; // 12 Jan 2025

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
                      context.read<MissedPunchBloc>().add(
                        MissedPunchEvent.toggleSingleSelection(
                          missingPunchId: missingPunchData.id.toString(),
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
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "${missingPunchData.employeeName.withFallback()}(${missingPunchData.employeeId})",
                                style: AppTextStyles.w400_14(
                                  context,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: AppSizes.space4),

                        CustomTitleValueView(
                          title: "Type : ",
                          value: missingPunchType,
                          valueColor: stripColor,
                        ),

                        // const SizedBox(height: AppSizes.space4),
                        CustomTitleValueView(
                          title: "Request Date : ",
                          value: requestDate,
                        ),

                        // Status
                        // Row(
                        //   children: [
                        //     Text(
                        //       statusTxt,
                        //       style: AppTextStyles.w400_12(
                        //         context,
                        //         color: statusColor,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSizes.space4),
                  InkWell(
                    onTap: () {
                      NavigationService.navigateTo(
                        ApproveMissedPunchDetails.route,
                        arguments: missingPunchData,
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
