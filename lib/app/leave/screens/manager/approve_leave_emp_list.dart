import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/appbar/custom_appbar.dart';
import 'package:hrms_uis/common/widgets/checkbox/custom_checkbox.dart';
import 'package:hrms_uis/common/widgets/loader/custom_circular_progress.dart';
import 'package:hrms_uis/common/widgets/placeholder/no_data_found.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/utils/custom_dialogs/bottomSheets.dart';
import '../../bloc/leave_bloc.dart';
import '../../widgets/manager/approval_leave_emp_card.dart';
import '../../widgets/manager/leave_approve_reject_view.dart';
import '../../widgets/manager/leave_filter_bottom_sheet.dart';

class ApproveLeaveEmpList extends StatefulWidget {
  static const route = '/approve_leave_emp_list';

  const ApproveLeaveEmpList({super.key});

  @override
  State<ApproveLeaveEmpList> createState() => _ApproveLeaveEmpListState();
}

class _ApproveLeaveEmpListState extends State<ApproveLeaveEmpList> {
  final TextEditingController searchController = TextEditingController();
  final RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LeaveBloc>().add(const LeaveEvent.getApproveLeaveList());
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeaveBloc, LeaveState>(
      builder: (context, state) {
        final leaveList = state.approveLeaveListModel?.leaveList ?? [];

        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            elevation: 0,
            title: "Approve Leave",
            subtitle: _buildSubtitle(state),
            showAvatar: false,
            showBackButton: true,
            showNavigation: false,
            showCalendarIcon: false,
          ),
          body: SafeArea(
            child: SmartRefresher(
              controller: refreshController,
              enablePullDown: true,
              onRefresh: () {
                context.read<LeaveBloc>().add(
                  const LeaveEvent.getApproveLeaveList(),
                );
                refreshController.refreshCompleted();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.padding16,
                  horizontal: AppSizes.padding16,
                ),
                child: Column(
                  children: [
                    // 🔹 Select All + Filter
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.padding12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCheckBox(
                            enabled: leaveList.isNotEmpty,
                            borderColor: AppColors.iconColor,
                            value: state.selectAll,
                            title: "Select All",
                            scale: 1,
                            onChanged: (value) {
                              context.read<LeaveBloc>().add(
                                LeaveEvent.toggleAllSelection(value),
                              );
                            },
                          ),
                          InkWell(
                            onTap: () {
                              CustomBottomSheet.show(
                                context: context,
                                title: "Leave Filter",
                                child: BlocProvider.value(
                                  value: context.read<LeaveBloc>(),
                                  child: LeaveFilterBottomSheet(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.filter_list,
                              size: 24,
                              color: AppColors.iconColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSizes.space8),

                    // 🔹 Search
                    TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search employee...",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: InkWell(
                          onTap: () {
                            searchController.clear();
                            context.read<LeaveBloc>().add(
                              const LeaveEvent.searchEmployeeFromList(""),
                            );
                          },
                          child: const Icon(
                            Icons.close,
                            size: AppSizes.iconSize20,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        context.read<LeaveBloc>().add(
                          LeaveEvent.searchEmployeeFromList(value),
                        );
                      },
                    ),

                    const SizedBox(height: AppSizes.space16),

                    // 🔹 List
                    Expanded(
                      child: state.getApproveLeaveLoading
                          ? const Center(child: CustomCircularProgress())
                          : leaveList.isEmpty
                          ? const Center(
                              child: NoDataFound(
                                message: "No leave requests found",
                              ),
                            )
                          : const ApproveLeaveEmpCard(),
                    ),

                    // 🔹 Approve / Reject + Remark
                    const LeaveApproveRejectView(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _buildSubtitle(LeaveState state) {
    if (state.selectedFilter == "Custom" &&
        state.fromDate != null &&
        state.toDate != null) {
      return "${DateFormat('dd-MMM').format(state.fromDate!)} - "
          "${DateFormat('dd-MMM').format(state.toDate!)}";
    }
    if (state.selectedFilter == "Daily") {
      return "Today (${DateFormat('dd-MMM-yyyy').format(DateTime.now())})";
    }
    if (state.selectedFilter == "Weekly") return "This Week";
    if (state.selectedFilter == "Monthly") return "This Month";
    return "";
  }
}
