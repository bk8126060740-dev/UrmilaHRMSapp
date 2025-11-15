import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/checkbox/custom_checkbox.dart';
import 'package:hrms_uis/common/widgets/dialog/common_bottom_sheet.dart';
import 'package:hrms_uis/common/widgets/loader/custom_circular_progress.dart';
import 'package:hrms_uis/common/widgets/placeholder/no_data_found.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/custom_dialogs/bottomSheets.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../widgets/approve_attendance_list_card.dart';
import '../widgets/approve_reject_view.dart';
import '../widgets/custom_filter_bottom_sheet.dart';

class ApproveAttendEmpListScreen extends StatefulWidget {
  static const route = '/approve_attendance_emp_list';

  const ApproveAttendEmpListScreen({super.key});

  @override
  State<ApproveAttendEmpListScreen> createState() =>
      _ApproveAttendEmpListScreenState();
}

class _ApproveAttendEmpListScreenState
    extends State<ApproveAttendEmpListScreen> {
  final TextEditingController searchController = TextEditingController();

  final RefreshController refreshController = RefreshController();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AttendanceBloc>().add(
        const AttendanceEvent.getApproveAttendanceList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        var approveAttendanceList =
            state.approveAttendanceListModel?.attendecList ?? [];
        return Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            elevation: 0,
            title: context.loc.approveAttendance,
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
                context.read<AttendanceBloc>().add(
                  const AttendanceEvent.getApproveAttendanceList(),
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
                    // 🔹 Select All
                    Padding(
                      padding: EdgeInsets.only(
                        left: AppSizes.padding12,
                        right: AppSizes.padding12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomCheckBox(
                            enabled: approveAttendanceList.isNotEmpty,
                            borderColor: AppColors.iconColor,
                            value: state.selectAll,
                            title: "Select All",
                            scale: 1,
                            onChanged: (value) {
                              context.read<AttendanceBloc>().add(
                                AttendanceEvent.toggleAllSelection(value),
                              );
                            },
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            child: const Icon(
                              Icons.filter_list,
                              size: 24,
                              color: AppColors.iconColor,
                            ),
                            onTap: () {
                              CustomBottomSheet.showCommonBottomSheet(
                                context: context,
                                child: BlocProvider.value(
                                  value: context.read<AttendanceBloc>(),
                                  child: CommonBottomSheet(
                                    title: "Attendance Filter",
                                    child: CustomFilterDialog(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: AppSizes.space8),

                    // 🔹 Filter + Search Bar
                    TextField(
                      // enabled: approveAttendanceList.isNotEmpty,
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search employee...",
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: InkWell(
                          onTap: () {
                            searchController.clear();
                            context.read<AttendanceBloc>().add(
                              AttendanceEvent.searchEmployeeFromList(""),
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
                        context.read<AttendanceBloc>().add(
                          AttendanceEvent.searchEmployeeFromList(value),
                        );
                      },
                    ),

                    const SizedBox(height: AppSizes.space16),

                    // 🔹 Employee list
                    Expanded(
                      child: state.getApproveAttendanceLoading
                          ? Center(child: CustomCircularProgress())
                          : approveAttendanceList.isEmpty
                          ? Center(
                              child: NoDataFound(
                                message: "No attendance found",
                              ),
                            )
                          : ApproveAttendanceListCard(),
                    ),

                    // 🔹 Remark + Approve/Reject Button
                    ApproveRejectView(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // 🔹 Subtitle builder
  String _buildSubtitle(AttendanceState state) {
    if (state.selectedFilter == "Custom" &&
        state.fromDate != null &&
        state.toDate != null) {
      return "${DateFormat('dd-MMM').format(state.fromDate!)} - ${DateFormat('dd-MMM').format(state.toDate!)}";
    }
    if (state.selectedFilter == "Daily") {
      return "Today (${DateFormat('dd-MMM-yyyy').format(DateTime.now())})";
    }
    if (state.selectedFilter == "Weekly") return "This Week";
    if (state.selectedFilter == "Monthly") return "This Month";
    return "";
  }
}
