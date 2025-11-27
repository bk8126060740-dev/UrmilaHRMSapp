import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/custom/custom_section_widget.dart';
import 'package:hrms_uis/common/widgets/dropdown/dropdown_model.dart';
import 'package:hrms_uis/common/widgets/loader/custom_circular_progress.dart';
import 'package:hrms_uis/common/widgets/placeholder/no_data_found.dart';
import 'package:hrms_uis/common/widgets/text/custom_field_heading.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/dropdown/custom_animated_dropdown.dart';
import '../../../../common/widgets/switch/custom_switch.dart';
import '../../bloc/attendance_bloc.dart';
import '../../models/manager_employee_list_model.dart';
import '../../widgets/manager/team_attend_list_view.dart';
import '../../widgets/employee/monthly_attendance_summary.dart';
import '../../widgets/manager/teams_monthly_attendance_calender.dart';

class TeamAttendanceScreen extends StatefulWidget {
  static const route = '/team_attendance_screen';

  const TeamAttendanceScreen({super.key});

  @override
  State<TeamAttendanceScreen> createState() => _TeamAttendanceScreenState();
}

class _TeamAttendanceScreenState extends State<TeamAttendanceScreen> {
  DropdownModel? _selectedEmployee;
  DropdownModel? _selectedMonth;
  DropdownModel? _selectedYear;
  bool _isCalendarView = true;

  late final List<DropdownModel> _months;
  late final List<DropdownModel> _years;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _months = AppHelperFunctions.getMonthList();
    _years = AppHelperFunctions.getYearList(startYear: 2020);
    _selectedMonth = _months.firstWhere(
      (m) => m.id == now.month.toString(),
      orElse: () => _months.first,
    );
    _selectedYear = _years.firstWhere(
      (y) => y.id == now.year.toString(),
      orElse: () => _years.last,
    );
  }

  void _loadAttendance({DateTime? focusedDay}) {
    if (_selectedEmployee == null) return;

    final bloc = context.read<AttendanceBloc>();
    final fd = focusedDay ?? bloc.state.focusedDay;

    final empId = int.tryParse(_selectedEmployee!.id);
    if (empId == null) return;

    bloc.add(
      AttendanceEvent.getMonthlyAttendance(
        empId: empId,
        month: fd.month,
        year: fd.year,
      ),
    );
  }

  /// Called when dropdown month/year changes → update focusedDay in bloc.
  void _updateFocusedDayFromDropdown() {
    if (_selectedMonth == null || _selectedYear == null) return;

    final month = int.tryParse(_selectedMonth!.id);
    final year = int.tryParse(_selectedYear!.id);
    if (month == null || year == null) return;

    final newFocused = DateTime(year, month, 1);

    context.read<AttendanceBloc>().add(
      AttendanceEvent.updateCalendarSelection(
        focusedDay: newFocused,
        resetSelection: true,
      ),
    );
    // No direct API call here; BlocListener will handle it.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "Team Attendance List",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      body: SafeArea(
        child: BlocConsumer<AttendanceBloc, AttendanceState>(
          listenWhen: (prev, curr) => prev.focusedDay != curr.focusedDay,
          listener: (context, state) {
            final fd = state.focusedDay;

            final monthId = fd.month.toString();
            final yearId = fd.year.toString();

            final newMonth = _months.firstWhere(
              (m) => m.id == monthId,
              orElse: () => _months.first,
            );
            final newYear = _years.firstWhere(
              (y) => y.id == yearId,
              orElse: () => _years.last,
            );

            // Update dropdowns if changed (to avoid endless setState)
            if (_selectedMonth?.id != newMonth.id ||
                _selectedYear?.id != newYear.id) {
              setState(() {
                _selectedMonth = newMonth;
                _selectedYear = newYear;
              });
            }

            // Single place where API is called when month/year changes
            _loadAttendance(focusedDay: fd);
          },
          builder: (BuildContext context, AttendanceState state) {
            return state.status == AttendanceStatus.managerEmployeesListLoading
                ? Center(child: CustomCircularProgress())
                : CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.only(
                          left: AppSizes.padding20,
                          right: AppSizes.padding20,
                          top: AppSizes.padding20,
                        ),
                        sliver: SliverList(
                          delegate: SliverChildListDelegate([
                            /// ------------ Filters ------------
                            CustomSectionWidget(
                              title: "Select Employee",
                              child: Column(
                                children: [
                                  _FilterSection(
                                    months: _months,
                                    years: _years,
                                    selectedEmployee: _selectedEmployee,
                                    selectedMonth: _selectedMonth,
                                    selectedYear: _selectedYear,
                                    onEmployeeChanged: (value) {
                                      setState(() => _selectedEmployee = value);
                                      _loadAttendance();
                                    },
                                    onMonthChanged: (value) {
                                      setState(() => _selectedMonth = value);
                                      _updateFocusedDayFromDropdown();
                                    },
                                    onYearChanged: (value) {
                                      setState(() => _selectedYear = value);
                                      _updateFocusedDayFromDropdown();
                                    },
                                  ),
                                ],
                              ),
                            ),

                            if (_selectedEmployee == null ||
                                _selectedMonth == null ||
                                _selectedYear == null)
                              const Center(
                                child: NoDataFound(
                                  message:
                                      'Please select employee, month and year to view attendance.',
                                ),
                              )
                            else ...[
                              AppSizes.space20.vGap,

                              /// Summary
                              MonthlyAttendanceSummary(),

                              AppSizes.space12.vGap,

                              /// Toggle
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _isCalendarView
                                        ? 'Calendar View'
                                        : 'List View',
                                    style: AppTextStyles.w500_14(context),
                                  ),
                                  CustomSwitch(
                                    value: _isCalendarView,
                                    onChanged: (value) {
                                      setState(() => _isCalendarView = value);
                                    },
                                  ),
                                ],
                              ),

                              AppSizes.space8.vGap,
                            ],
                          ]),
                        ),
                      ),

                      /// ⬇ ONLY add these slivers when filters are selected
                      if (_selectedEmployee != null &&
                          _selectedMonth != null &&
                          _selectedYear != null) ...[
                        if (_isCalendarView)
                          const SliverToBoxAdapter(
                            child: TeamsMonthlyAttendanceCalenderView(),
                          ),
                        if (!_isCalendarView) const AttendanceSliverListView(),
                      ],
                    ],
                  );
          },
        ),
      ),
    );
  }
}

class _FilterSection extends StatelessWidget {
  final List<DropdownModel> months;
  final List<DropdownModel> years;

  final DropdownModel? selectedEmployee;
  final DropdownModel? selectedMonth;
  final DropdownModel? selectedYear;

  final ValueChanged<DropdownModel?> onEmployeeChanged;
  final ValueChanged<DropdownModel?> onMonthChanged;
  final ValueChanged<DropdownModel?> onYearChanged;

  const _FilterSection({
    required this.months,
    required this.years,
    required this.selectedEmployee,
    required this.selectedMonth,
    required this.selectedYear,
    required this.onEmployeeChanged,
    required this.onMonthChanged,
    required this.onYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        var managerEmployeesList =
            state.managerEmployeesListModel?.employeeList ?? [];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomFieldHeading(title: 'Employee'),
            CustomAnimatedDropdown<DropdownModel>(
              initialItem: selectedEmployee,
              hintText: 'Employee',
              items: managerEmployeesList.map((e) {
                return DropdownModel(
                  id: e.id?.toString() ?? "",
                  title: buildEmployeeTitle(e),
                );
              }).toList(),
              onChanged: onEmployeeChanged,
            ),

            AppSizes.space12.vGap,

            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CustomFieldHeading(title: 'Month'),
                      CustomAnimatedDropdown<DropdownModel>(
                        initialItem: selectedMonth,
                        hintText: 'Month',
                        items: months,
                        onChanged: onMonthChanged,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: AppSizes.space12),
                Expanded(
                  child: Column(
                    children: [
                      CustomFieldHeading(title: 'Year'),
                      CustomAnimatedDropdown<DropdownModel>(
                        initialItem: selectedYear,
                        hintText: 'Year',
                        items: years,
                        onChanged: onYearChanged,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  String buildEmployeeTitle(EmployeeListItem e) {
    final nameParts = [e.firstName, /* e.midName, */ e.lastName];
    // Filter out null or empty values
    final fullName = nameParts
        .where((x) => x != null && x.trim().isNotEmpty)
        .join(" ");
    if (e.id != null /*&& e.id!.isNotEmpty*/) {
      return "$fullName (${e.id})";
    }
    return fullName;
  }
}
