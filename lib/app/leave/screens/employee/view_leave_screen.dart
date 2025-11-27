import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/leave/bloc/leave_bloc.dart';
import 'package:hrms_uis/app/leave/screens/employee/apply_leave_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/widgets/tab_bar/custom_tab_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/widgets/appbar/custom_appbar.dart';
import 'leave_history_tab.dart';
import 'leave_summary_tab.dart';

class ViewLeaveScreen extends StatefulWidget {
  static const route = '/view_leave_screen';

  const ViewLeaveScreen({super.key});

  @override
  State<ViewLeaveScreen> createState() => _ViewLeaveScreenState();
}

class _ViewLeaveScreenState extends State<ViewLeaveScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final RefreshController _historyRefreshController = RefreshController();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      log("Tab index outer :-> ${tabController.index}");
      if (tabController.indexIsChanging) {
        log("Tab index inner :-> ${tabController.index}");
        final leaveBloc = context.read<LeaveBloc>();
        if (tabController.index == 0) {
          leaveBloc.add(LeaveEvent.getLeaveType());
        } else {
          leaveBloc.add(LeaveEvent.getEmpLeave());
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _historyRefreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final leaveBloc = context.read<LeaveBloc>();

    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "View Leave",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      floatingActionButton: SafeArea(
        child: FloatingActionButton(
          onPressed: () {
            NavigationService.navigateTo(ApplyLeaveScreen.route)?.then((value) {
              if (value == true && context.mounted) {
                leaveBloc.add(LeaveEvent.getLeaveType());
                leaveBloc.add(LeaveEvent.getEmpLeave());
              }
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: _historyRefreshController,
          onRefresh: () async {
            if (tabController.index == 0) {
              leaveBloc.add(LeaveEvent.getLeaveType());
            } else {
              leaveBloc.add(LeaveEvent.getEmpLeave());
            }
            _historyRefreshController.refreshCompleted();
          },
          child: CustomTabBarScreen(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(text: 'Leave Summary'),
              Tab(text: 'Leave History'),
            ],
            tabViews: [LeaveSummaryTab(), LeaveHistoryTab()],
          ),
          // child: Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(
          //         left: AppSizes.padding16,
          //         right: AppSizes.padding16,
          //         top: AppSizes.padding16,
          //       ),
          //       child: TabBar(
          //         dividerColor: AppColors.surfaceBorderColor,
          //         controller: tabController,
          //         indicatorColor: Colors.transparent,
          //         // indicator: BoxDecoration(
          //         //   color: AppColor.primaryColor,
          //         // ),
          //         // indicatorColor: Theme.of(context).primaryColor,
          //         // indicatorSize: TabBarIndicatorSize.tab,
          //         labelStyle: AppTextStyles.w400_12(context),
          //         labelColor: AppColors.whiteTextColor,
          //         indicator: BoxDecoration(
          //           color: AppColors.primaryColor,
          //           borderRadius: BorderRadius.circular(AppSizes.borderRadius4),
          //         ),
          //         unselectedLabelColor: AppColors.primaryColor,
          //         indicatorSize: TabBarIndicatorSize.tab,
          //         tabs: [
          //           Tab(text: 'Leave Summary'),
          //           Tab(text: 'Leave History'),
          //         ],
          //         // labelColor: AppColor.whiteColor,
          //         // unselectedLabelColor: AppColor.primaryColor,
          //       ),
          //     ),
          //     Expanded(
          //       child: TabBarView(
          //         physics: NeverScrollableScrollPhysics(),
          //         controller: tabController,
          //         children: [LeaveSummaryTab(), LeaveHistoryTab()],
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}









/*
class ViewLeaveScreen extends StatefulWidget {
  static const route = '/view_leave_screen';

  const ViewLeaveScreen({super.key});

  @override
  State<ViewLeaveScreen> createState() => _ViewLeaveScreenState();
}

class _ViewLeaveScreenState extends State<ViewLeaveScreen> {
  final RefreshController refreshController = RefreshController();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var leaveBloc = context.read<LeaveBloc>();
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "View Leave",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationService.navigateTo(ApplyLeaveScreen.route)?.then((value) {
            if (value == true) {
              if (context.mounted) {
                leaveBloc.add(LeaveEvent.getLeaveType());
                leaveBloc.add(LeaveEvent.getEmpLeave());
              }
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: BlocConsumer<LeaveBloc, LeaveState>(
          listener: (context, state) {
            if (!state.getLeaveTypeLoading && !state.getEmpLeaveLoading) {
              // refreshController.refreshCompleted();
            }

            if (state.status == LeaveStatus.getLeaveTypeError) {
              CustomToast.showError(message: state.message);
              // refreshController.refreshFailed();
            }
          },
          builder: (context, state) {
            var leaveHistory = state.employeeLeaveDataModel?.empLeaveData ?? [];
            var leaveType = state.leaveTypeDataModel?.leaveTypeData ?? [];
            return SmartRefresher(
              onRefresh: () async {
                leaveBloc.add(LeaveEvent.getLeaveType());
                leaveBloc.add(LeaveEvent.getEmpLeave());
                refreshController.refreshCompleted();
              },
              controller: refreshController,
              child: state.getLeaveTypeLoading && state.getEmpLeaveLoading
                  ? Center(child: CustomCircularProgress())
                  : CustomScrollView(
                      slivers: [
                        // leave summary
                        if (state.getLeaveTypeLoading) ...[
                          const SliverToBoxAdapter(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ] else ...[
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: AppSizes.padding16,
                                right: AppSizes.padding16,
                                top: AppSizes.padding16,
                              ),
                              child: Column(
                                children: [
                                  CustomFieldHeading(title: "Leave Summary"),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2, // 2 cards per row
                                          childAspectRatio:
                                              1.8, // adjust height/width
                                          crossAxisSpacing: AppSizes.space16,
                                          mainAxisSpacing: AppSizes.space16,
                                        ),
                                    itemCount: leaveType.length,
                                    itemBuilder: (context, index) {
                                      var leaveItem = leaveType[index];
                                      return LeaveSummaryBase(
                                        title: leaveItem.name ?? "",
                                        value: "${leaveItem.yearlyLimit ?? ""}",
                                        // color: _colorForLeave(title),
                                      );
                                    },
                                  ),
                                  SizedBox(height: AppSizes.space16),
                                  CustomFieldHeading(title: "Leave History"),
                                ],
                              ),
                            ),
                          ),
                        ],

                        // leave list
                        if (state.getEmpLeaveLoading) ...[
                          const SliverToBoxAdapter(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          ),
                        ] else if (leaveHistory.isEmpty) ...[
                          const SliverToBoxAdapter(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: NoDataFound(),
                              ),
                            ),
                          ),
                        ] else ...[
                          SliverList(
                            delegate: SliverChildBuilderDelegate((
                              context,
                              index,
                            ) {
                              final item = leaveHistory[index];
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.padding16,
                                ),
                                child: LeaveHistoryItem(item: item),
                              );
                            }, childCount: leaveHistory.length),
                          ),
                        ],
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
*/