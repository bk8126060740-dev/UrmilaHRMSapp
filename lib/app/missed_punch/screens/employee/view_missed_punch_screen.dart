import 'package:flutter/material.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/widgets/appbar/custom_appbar.dart';
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

  final List<Map<String, dynamic>> history = [
    {
      "type": "Missing Punch",
      "category": "Late Going",
      "requestDate": "12 Jan 2025",
      "mode": "Out",
      "inTime": null,
      "outTime": "06:45 PM",
      "status": "Approved",
    },
    {
      "type": "Regularization",
      "category": "Early Coming",
      "requestDate": "10 Jan 2025",
      "mode": "In",
      "inTime": "08:55 AM",
      "outTime": null,
      "status": "Pending",
    },
    {
      "type": "Missing Punch",
      "category": "Missing Punch",
      "requestDate": "08 Jan 2025",
      "mode": "Both",
      "inTime": "09:30 AM",
      "outTime": "06:30 PM",
      "status": "Rejected",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "Missed Attendance History",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          NavigationService.navigateTo(ApplyMissedPunchScreen.route);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SmartRefresher(
          onRefresh: () async {
            refreshController.refreshCompleted();
          },
          controller: refreshController,
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: history.length,
            itemBuilder: (_, i) => MissedPunchItem(item: history[i]),
          ),
        ),
      ),
    );
  }
}
