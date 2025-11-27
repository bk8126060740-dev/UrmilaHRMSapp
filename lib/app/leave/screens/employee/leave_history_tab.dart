import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/loader/custom_circular_progress.dart';
import '../../../../common/widgets/placeholder/no_data_found.dart';
import '../../bloc/leave_bloc.dart';
import '../../widgets/employee/leave_history_item.dart';

class LeaveHistoryTab extends StatelessWidget {
  const LeaveHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        final leaveHistory = state.employeeLeaveDataModel?.empLeaveData ?? [];

        return Column(
          children: [
            // 🔹 Filter By
            // Padding(
            //   padding: EdgeInsets.only(
            //     left: AppSizes.padding16,
            //     right: AppSizes.padding16,
            //     top: AppSizes.padding16,
            //   ),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(child: Text("Filter By")),
            //       InkWell(
            //         child: const Icon(
            //           Icons.filter_list,
            //           size: 24,
            //           color: AppColors.iconColor,
            //         ),
            //         onTap: () {
            //           // CustomBottomSheet.show(
            //           //   context: context,
            //           //   title: "Leave Filter",
            //           //   child: BlocProvider.value(
            //           //     value: context.read<LeaveBloc>(),
            //           //     child: LeaveHistoryFilterBottomSheet(),
            //           //   ),
            //           // );
            //         },
            //       ),
            //     ],
            //   ),
            // ),

            Expanded(
              child: state.getEmpLeaveLoading
                  ? const Center(child: CustomCircularProgress())
                  : leaveHistory.isEmpty
                  ? const Center(child: NoDataFound())
                  : Padding(
                      padding: const EdgeInsets.only(top: AppSizes.space16),
                      child: ListView.builder(
                        padding: const EdgeInsets.only(
                          left: AppSizes.padding16,
                          right: AppSizes.padding16,
                        ),
                        itemCount: leaveHistory.length,
                        itemBuilder: (context, index) {
                          final item = leaveHistory[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: AppSizes.space12,
                            ),
                            child: LeaveHistoryItem(item: item),
                          );
                        },
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}
