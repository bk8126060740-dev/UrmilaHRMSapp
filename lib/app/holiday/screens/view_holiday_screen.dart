import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/loader/custom_circular_progress.dart';
import '../../../../common/widgets/placeholder/no_data_found.dart';
import '../bloc/holiday_bloc.dart';
import '../widgets/holiday_item.dart';

class ViewHolidayScreen extends StatefulWidget {
  static const route = '/view_holidays';

  const ViewHolidayScreen({super.key});

  @override
  State<ViewHolidayScreen> createState() => _ViewHolidayScreenState();
}

class _ViewHolidayScreenState extends State<ViewHolidayScreen> {
  final RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // context.read<HolidayBloc>().add(HolidayEvent.getHolidayList());
    });
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Holiday List",
        showBackButton: true,
        showAvatar: false,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: SafeArea(
        child: SmartRefresher(
          controller: refreshController,
          enablePullDown: true,
          onRefresh: () {
            context.read<HolidayBloc>().add(HolidayEvent.getHolidayList());
            refreshController.refreshCompleted();
          },
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSizes.padding16,
              right: AppSizes.padding16,
              bottom: AppSizes.padding16,
            ),
            child: BlocBuilder<HolidayBloc, HolidayState>(
              builder: (context, state) {
                var holidayList = state.holidayListModel?.holiday ?? [];
                return Column(
                  children: [
                    _buildYearFilter(context),
                    Expanded(
                      child: state.status == HolidayStatus.holidayLoading
                          ? const Center(child: CustomCircularProgress())
                          : holidayList.isEmpty
                          ? const Center(child: NoDataFound())
                          : ListView.builder(
                              itemCount: holidayList.length,
                              itemBuilder: (_, index) {
                                return HolidayItem(holiday: holidayList[index]);
                              },
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildYearFilter(BuildContext context) {
    final years = List.generate(2, (i) => DateTime.now().year - i);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Selected Year:", style: AppTextStyles.w400_14(context)),
        BlocBuilder<HolidayBloc, HolidayState>(
          builder: (context, state) {
            return PopupMenuButton<int>(
              padding: EdgeInsets.zero,
              menuPadding: EdgeInsets.zero,
              icon: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${state.selectedYear ?? DateTime.now().year}",
                    style: AppTextStyles.w400_12(context),
                  ),
                  SizedBox(width: AppSizes.space4),
                  Icon(size: AppSizes.iconSize20, Icons.keyboard_arrow_down),
                ],
              ),
              onSelected: (year) {
                context.read<HolidayBloc>().add(
                  HolidayEvent.getHolidayList(selectedYear: year),
                );
              },
              itemBuilder: (context) => years
                  .map(
                    (year) => PopupMenuItem<int>(
                      value: year,
                      child: Text(
                        year.toString(),
                        style: AppTextStyles.w400_12(context),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
