import 'package:flutter/material.dart';
import 'package:hrms_uis/app/leave/screens/apply_leave_screen.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/widgets/text/custom_field_heading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../common/utils/constants/sizes.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../widgets/leave_history_item.dart';
import '../widgets/leave_summary_base.dart';

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

  // Summary counters (you can update dynamically later)
  final int totalLeave = 24;
  final int paidLeave = 12;
  final int casualLeave = 8;
  final int sickLeave = 4;
  final int halfDayLeave = 2;
  final int earlyLeave = 1;

  // Updated leave history structure
  final List<Map<String, dynamic>> leaveHistory = [
    // MULTI-DAY LEAVE
    {
      "type": "Casual Leave",
      "from": "10 Nov 2025",
      "to": "12 Nov 2025",
      "durationType": "Multi Day",
      "status": "Approved",
    },

    // FULL DAY (Single Day)
    {
      "type": "Sick Leave",
      "from": "20 Oct 2025",
      "to": "20 Oct 2025",
      "durationType": "Full Day",
      "status": "Pending",
    },

    // FIRST HALF
    {
      "type": "Casual Leave",
      "from": "05 Sep 2025",
      "to": "05 Sep 2025",
      "durationType": "First Half",
      "status": "Approved",
    },

    // SECOND HALF
    {
      "type": "Paid Leave",
      "from": "06 Sep 2025",
      "to": "06 Sep 2025",
      "durationType": "Second Half",
      "status": "Approved",
    },

    // MULTI-DAY with different start/end half types
    {
      "type": "Sick Leave",
      "from": "01 Aug 2025",
      "to": "03 Aug 2025",
      "durationType": "Multi Day",
      "status": "Rejected",
    },
  ];

  @override
  Widget build(BuildContext context) {
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
          NavigationService.navigateTo(ApplyLeaveScreen.route);
        },
        child: const Icon(Icons.add),
      ),
      // BODY
      body: SafeArea(
        child: SmartRefresher(
          onRefresh: () async {
            refreshController.refreshCompleted();
          },
          controller: refreshController,
          child: CustomScrollView(
            // physics: const BouncingScrollPhysics(),
            slivers: [
              // leave summary
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: AppSizes.padding16,
                    right: AppSizes.padding16,
                    top: AppSizes.padding16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ------------ SUMMARY SECTION ------------
                      CustomFieldHeading(title: "Leave Summary"),

                      // Row 1
                      Row(
                        children: [
                          Expanded(
                            child: LeaveSummaryBase(
                              title: "Total Leave",
                              value: totalLeave.toString(),
                              color: Colors.green,
                            ),
                          ),
                          SizedBox(width: AppSizes.space16),
                          Expanded(
                            child: LeaveSummaryBase(
                              title: "Paid Leave",
                              value: paidLeave.toString(),
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: AppSizes.space16),

                      // Row 2
                      Row(
                        children: [
                          Expanded(
                            child: LeaveSummaryBase(
                              title: "Casual Leave",
                              value: casualLeave.toString(),
                              color: Colors.deepPurple,
                            ),
                          ),
                          SizedBox(width: AppSizes.space16),
                          Expanded(
                            child: LeaveSummaryBase(
                              title: "Sick Leave",
                              value: sickLeave.toString(),
                              color: Colors.deepOrange,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: AppSizes.space16),

                      // ------------ HISTORY SECTION ------------
                      CustomFieldHeading(title: "Leave History"),
                    ],
                  ),
                ),
              ),
              // leave list
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = leaveHistory[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: AppSizes.padding16,
                      right: AppSizes.padding16,
                    ),
                    child: LeaveHistoryItem(item: item),
                  );
                }, childCount: leaveHistory.length),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
