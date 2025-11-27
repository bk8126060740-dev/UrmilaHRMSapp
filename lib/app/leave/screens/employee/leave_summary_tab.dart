import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/loader/custom_circular_progress.dart';
import '../../../../common/widgets/placeholder/no_data_found.dart';
import '../../bloc/leave_bloc.dart';
import '../../widgets/employee/leave_summary_base.dart';

class LeaveSummaryTab extends StatelessWidget {
  const LeaveSummaryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        final leaveType = state.leaveTypeDataModel?.leaveTypeData ?? [];

        return state.getLeaveTypeLoading
            ? const Center(child: CustomCircularProgress())
            : leaveType.isEmpty
            ? const Center(child: NoDataFound())
            /*: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(AppSizes.padding16),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8,
                  crossAxisSpacing: AppSizes.space16,
                  mainAxisSpacing: AppSizes.space16,
                ),
                itemCount: leaveType.length,
                itemBuilder: (context, index) {
                  final item = leaveType[index];
                  return LeaveSummaryBase(
                    title: item.leaveType?.name ?? "",
                    value: "${item.remainingBalance ?? ""}",
                  );
                },
              )*/
            : ListView.builder(
                padding: const EdgeInsets.only(
                  top: AppSizes.padding16,
                  left: AppSizes.padding16,
                  right: AppSizes.padding16,
                ),
                itemCount: leaveType.length,
                itemBuilder: (context, index) {
                  final item = leaveType[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSizes.space12),
                    child: LeaveSummaryBase(
                      title: item.leaveType?.name ?? "",
                      value: "${item.remainingBalance ?? ""}",
                      leaveTypeBalanceItem: item,
                    ),
                  );
                },
              );
        // return SingleChildScrollView(
        //   padding: const EdgeInsets.all(AppSizes.padding16),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       GridView.builder(
        //         shrinkWrap: true,
        //         physics: const NeverScrollableScrollPhysics(),
        //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //           crossAxisCount: 2,
        //           childAspectRatio: 1.8,
        //           crossAxisSpacing: AppSizes.space16,
        //           mainAxisSpacing: AppSizes.space16,
        //         ),
        //         itemCount: leaveType.length,
        //         itemBuilder: (context, index) {
        //           final item = leaveType[index];
        //           return LeaveSummaryBase(
        //             title: item.leaveType?.name ?? "",
        //             value: "${item.remainingBalance ?? ""}",
        //           );
        //         },
        //       ),
        //       const SizedBox(height: AppSizes.space24),
        //     ],
        //   ),
        // );
      },
    );
  }
}
