import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/attendance/bloc/attendance_bloc.dart';
import 'package:hrms_uis/common/navigation_service/navigation_service.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';
import 'package:hrms_uis/common/widgets/checkbox/custom_checkbox.dart';
import 'package:hrms_uis/common/widgets/dialog/common_bottom_sheet.dart';
import 'package:intl/intl.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/text_styles.dart';
import '../../../common/utils/custom_dialogs/bottomSheets.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../widgets/custom_filter_bottom_sheet.dart';
import 'approve_attend_emp_details.dart';

class ApproveAttendEmpListScreen extends StatefulWidget {
  static const route = '/approve_attendance_emp_list';

  const ApproveAttendEmpListScreen({super.key});

  @override
  State<ApproveAttendEmpListScreen> createState() =>
      _ApproveAttendEmpListScreenState();
}

class _ApproveAttendEmpListScreenState
    extends State<ApproveAttendEmpListScreen> {
  final TextEditingController remarkController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AttendanceBloc, AttendanceState>(
      listener: (context, state) {},
      builder: (context, state) {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSizes.padding16,
                horizontal: AppSizes.padding16,
              ),
              child: Column(
                children: [
                  // 🔹 Select All
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.padding12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCheckBox(
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
                        IconButton(
                          icon: const Icon(
                            Icons.filter_list,
                            size: 24,
                            color: AppColors.iconColor,
                          ),
                          onPressed: () {
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

                  const SizedBox(height: 8),

                  // 🔹 Filter + Search Bar
                  TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search employee...",
                      prefixIcon: const Icon(Icons.search),
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

                  const SizedBox(height: 16),

                  // 🔹 Employee list
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.employees.length,
                      itemBuilder: (context, index) {
                        final emp = state.employees[index];
                        final isSelected = state.selectedEmployeeIds.contains(
                          emp['id'].toString(),
                        );

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withFixedOpacity(0.05),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSizes.padding12,
                              vertical: AppSizes.padding4,
                            ),
                            leading: CustomCheckBox(
                              value: isSelected,
                              onChanged: (_) {
                                final bloc = context.read<AttendanceBloc>();
                                bloc.add(
                                  AttendanceEvent.toggleSingleSelection(
                                    employeeId: emp['id'].toString(),
                                  ),
                                );
                              },
                            ),
                            title: Text(
                              emp["name"],
                              style: AppTextStyles.w400_14(
                                context,
                                color: AppColors.textColor,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      size: 16,
                                      color: AppColors.iconColor,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      emp["date"],
                                      style: AppTextStyles.w400_12(
                                        context,
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.access_time,
                                      size: 16,
                                      color: AppColors.iconColor,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      emp["status"],
                                      style: AppTextStyles.w400_12(
                                        context,
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            trailing: InkWell(
                              onTap: () {
                                NavigationService.navigateTo(
                                  ApproveAttendEmpDetails.route,
                                  arguments: EmployeeSwipeModel(
                                    name: "KUNDAN KUMAR",
                                    empCode: "UISPAT332",
                                    department: "IT",
                                    dateTime: DateTime(2025, 11, 4, 9, 54),
                                    inOut: "IN",
                                    remark: "On time swipe",
                                    location:
                                        "AIIMS - DIGHA Service road, Patna, Bihar, 801503, India",
                                    imageUrl: "https://example.com/photo.jpg",
                                  ),
                                );
                              },
                              child: const Icon(
                                Icons.visibility_outlined,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // 🔹 Remark + Approve Button
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: AppDecorations.card(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: remarkController,
                          maxLines: 2,
                          decoration: InputDecoration(
                            hintText: "Enter remarks...",
                            filled: true,
                            fillColor: Colors.grey.shade100,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            text: "Approve Selected",
                            onTap: _approveSelected,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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

  // Approve button logic
  void _approveSelected() {
    var bloc = context.read<AttendanceBloc>();

    final selected = bloc.state.employees.where((e) => e["selected"]).toList();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${selected.length} requests approved")),
    );
  }
}
