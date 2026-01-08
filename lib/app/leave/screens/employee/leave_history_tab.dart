import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/loader/custom_circular_progress.dart';
import '../../../../common/widgets/placeholder/no_data_found.dart';
import '../../bloc/leave_bloc.dart';
import '../../widgets/employee/leave_history_item.dart';

class LeaveHistoryTab extends StatelessWidget {
  const LeaveHistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    var leaveBloc = context.read<LeaveBloc>();
    return BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        final leaveHistory = state.employeeLeaveDataModel?.empLeaveData ?? [];

        return Padding(
          padding: const EdgeInsets.all(AppSizes.padding16),
          child: Column(
            children: [
              // 🔹 Filter + Search Bar
              TextField(
                // enabled: approveAttendanceList.isNotEmpty,
                controller: leaveBloc.searchController,
                decoration: InputDecoration(
                  hintText: "Search leave...",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: InkWell(
                    onTap: () {
                      leaveBloc.searchController.clear();
                      leaveBloc.add(LeaveEvent.searchEmployeeLeave(""));
                    },
                    child: const Icon(Icons.close, size: AppSizes.iconSize20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (value) {
                  leaveBloc.add(LeaveEvent.searchEmployeeLeave(value));
                },
              ),

              const SizedBox(height: AppSizes.space16),

              Expanded(
                child: state.getEmpLeaveLoading
                    ? const Center(child: CustomCircularProgress())
                    : leaveHistory.isEmpty
                    ? const Center(child: NoDataFound())
                    : ListView.builder(
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
            ],
          ),
        );
      },
    );
  }
}
