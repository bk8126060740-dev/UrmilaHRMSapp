import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/missed_punch/bloc/missed_punch_bloc.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/appbar/custom_appbar.dart';
import 'package:hrms_uis/common/widgets/checkbox/custom_checkbox.dart';
import 'package:hrms_uis/common/widgets/loader/custom_circular_progress.dart';
import 'package:hrms_uis/common/widgets/placeholder/no_data_found.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/utils/custom_dialogs/bottomSheets.dart';
import '../../widgets/manager/approve_missed_punch_card.dart';
import '../../widgets/manager/approve_punch_filter_bottom_sheet.dart';
import '../../widgets/manager/punch_approve_reject_view.dart';

class ApproveMissedPunchListScreen extends StatefulWidget {
  static const route = '/approve_missing_punch_list';

  const ApproveMissedPunchListScreen({super.key});

  @override
  State<ApproveMissedPunchListScreen> createState() =>
      _ApproveMissedPunchListScreenState();
}

class _ApproveMissedPunchListScreenState
    extends State<ApproveMissedPunchListScreen> {
  final TextEditingController searchController = TextEditingController();
  final RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MissedPunchBloc>().add(
        const MissedPunchEvent.getApprovalPunchList(),
      );
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
    return BlocBuilder<MissedPunchBloc, MissedPunchState>(
      builder: (context, state) {
        final leaveList =
            state.approvalMissingPunchModel?.missingPunchList ?? [];

        return Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: CustomAppBar(
            elevation: 0,
            title: "Approve Missed Punch",
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
                context.read<MissedPunchBloc>().add(
                  const MissedPunchEvent.getApprovalPunchList(),
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
                              context.read<MissedPunchBloc>().add(
                                MissedPunchEvent.toggleAllSelection(value),
                              );
                            },
                          ),
                          InkWell(
                            onTap: () {
                              CustomBottomSheet.show(
                                context: context,
                                title: "Leave Filter",
                                child: BlocProvider.value(
                                  value: context.read<MissedPunchBloc>(),
                                  child: ApprovePunchFilterBottomSheet(),
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
                            context.read<MissedPunchBloc>().add(
                              const MissedPunchEvent.searchEmployeeFromList(""),
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
                        context.read<MissedPunchBloc>().add(
                          MissedPunchEvent.searchEmployeeFromList(value),
                        );
                      },
                    ),

                    const SizedBox(height: AppSizes.space16),

                    // 🔹 List
                    Expanded(
                      child: state.getApprovalPunchListLoading
                          ? const Center(child: CustomCircularProgress())
                          : leaveList.isEmpty
                          ? const Center(
                              child: NoDataFound(
                                message: "No leave requests found",
                              ),
                            )
                          : const ApproveMissedPunchCard(),
                    ),

                    // 🔹 Approve / Reject + Remark
                    const PunchApproveRejectView(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
