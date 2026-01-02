import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/custom_dialogs/bottomSheets.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/loader/custom_circular_progress.dart';
import '../../../../common/widgets/placeholder/no_data_found.dart';
import '../../bloc/missed_punch_bloc.dart';
import '../../widgets/employee/emp_punch_filter_bottom_sheet.dart';
import '../../widgets/employee/missed_punch_item.dart';
import 'apply_missed_punch_screen.dart';

class ViewMissedPunchScreen extends StatefulWidget {
  static const route = '/view_missed_punch';

  const ViewMissedPunchScreen({super.key});

  @override
  State<ViewMissedPunchScreen> createState() => _ViewMissedPunchScreenState();
}

class _ViewMissedPunchScreenState extends State<ViewMissedPunchScreen> {
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
      context.read<MissedPunchBloc>().add(
        const MissedPunchEvent.getEmployeesMissedPunchList(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var missedPunchBloc = context.read<MissedPunchBloc>();

    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "Missed Punch History",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationService.navigateTo(ApplyMissedPunchScreen.route)?.then((
            value,
          ) {
            if (value == true && context.mounted) {
              missedPunchBloc.add(
                MissedPunchEvent.getEmployeesMissedPunchList(),
              );
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          onRefresh: () {
            context.read<MissedPunchBloc>().add(
              const MissedPunchEvent.getApprovalMissedPunchList(),
            );
            refreshController.refreshCompleted();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSizes.padding16,
              horizontal: AppSizes.padding16,
            ),
            child: BlocConsumer<MissedPunchBloc, MissedPunchState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                final missedPunchList =
                    state.employeesMissedPunchModel?.swipeRequestList ?? [];

                return Column(
                  children: [
                    // 🔹 Select All + Filter
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.padding12,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Text("Filter")),
                          InkWell(
                            onTap: () {
                              CustomBottomSheet.show(
                                context: context,
                                title: "Missed Punch Filter",
                                child: BlocProvider.value(
                                  value: context.read<MissedPunchBloc>(),
                                  child: EmpPunchFilterBottomSheet(),
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

                    const SizedBox(height: AppSizes.space16),

                    // 🔹 List
                    Expanded(
                      child: state.getEmpMissedPunchListLoading
                          ? const Center(child: CustomCircularProgress())
                          : missedPunchList.isEmpty
                          ? const Center(child: NoDataFound())
                          : ListView.builder(
                              itemCount: missedPunchList.length,
                              itemBuilder: (_, i) => MissedPunchItem(
                                employeesMissedPunchData: missedPunchList[i],
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      // body: SafeArea(
      //   child: SmartRefresher(
      //     onRefresh: () async {
      //       refreshController.refreshCompleted();
      //     },
      //     controller: refreshController,
      //     child: ListView.builder(
      //       padding: const EdgeInsets.all(16),
      //       itemCount: history.length,
      //       itemBuilder: (_, i) => MissedPunchItem(item: history[i]),
      //     ),
      //   ),
      // ),
    );
  }
}
