import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/leave/bloc/leave_bloc.dart';
import 'package:hrms_uis/app/leave/widgets/employee/leave_apply_summary_dialog.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/custom_dialogs/bottomSheets.dart';
import 'package:hrms_uis/common/utils/popups/custom_toast.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';
import 'package:hrms_uis/common/widgets/custom/custom_attachment_view.dart';
import 'package:hrms_uis/common/widgets/date_time_picker/custom_date_picker.dart';
import 'package:hrms_uis/common/widgets/dropdown/dropdown_model.dart';
import 'package:hrms_uis/common/widgets/loader/custom_circular_progress.dart';
import 'package:hrms_uis/common/widgets/text_field/custom_text_field.dart';

import '../../../../common/utils/constants/text_styles.dart';
import '../../../../common/utils/helpers/device_utility.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/custom/custom_section_widget.dart';
import '../../../../common/widgets/dropdown/custom_animated_dropdown.dart';
import '../../../../common/widgets/radio/custom_radio_group.dart';

class ApplyLeaveScreen extends StatefulWidget {
  static const route = "/add_leave_screen";

  const ApplyLeaveScreen({super.key});

  @override
  State<ApplyLeaveScreen> createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "Apply Leave",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<LeaveBloc, LeaveState>(
          builder: (context, state) {
            return state.status == LeaveStatus.getLeaveTypeLoading
                ? SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.all(AppSizes.padding16),
                    child: CustomButton(
                      onTap: () {
                        var remark = context.read<LeaveBloc>().remarkController.text.trim();

                        if (state.selectedLeaveType == null) {
                          CustomToast.showError(
                            message: "Please select leave type",
                          );
                          return;
                        }

                        if (state.duration == "Single Day") {
                          if (state.singleDate == null) {
                            CustomToast.showError(
                              message: "Please select date",
                            );
                            return;
                          }
                        }

                        if (state.duration == "Multi-Day") {
                          if (state.fromDate == null) {
                            CustomToast.showError(
                              message: "Please select From Date",
                            );
                            return;
                          }
                          if (state.toDate == null) {
                            CustomToast.showError(
                              message: "Please select To Date",
                            );
                            return;
                          }
                          if (state.toDate!.isBefore(state.fromDate!)) {
                            CustomToast.showError(
                              message: "To Date cannot be before From Date",
                            );
                            return;
                          }
                        }

                        if (remark.isEmpty) {
                          CustomToast.showError(message: "Please enter reason");
                          return;
                        }

                        AppDeviceUtils.unFocus();

                        CustomBottomSheet.show(
                          context: context,
                          title: "Apply Leave Summary",
                          child: BlocProvider.value(
                            value: context.read<LeaveBloc>(),
                            child: LeaveApplySummaryDialog(),
                          ),
                        );
                      },
                      text: "Apply Leave",
                    ),
                  );
          },
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<LeaveBloc, LeaveState>(
          builder: (context, state) {
            return state.status == LeaveStatus.getLeaveTypeLoading
                ? Center(child: CustomCircularProgress())
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSizes.padding16),
                    child: Column(
                      children: [
                        /// ------------------------ Leave Type ------------------------
                        CustomSectionWidget(
                          title: "Leave Type *",
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomAnimatedDropdown<DropdownModel>(
                                initialItem: state.selectedLeaveType,
                                hintText: "Select Leave Type",
                                items:
                                    (state.leaveTypeDataModel?.leaveTypeData ??
                                            [])
                                        .map(
                                          (e) => DropdownModel(
                                            id: "${e.leaveType?.id ?? -1}",
                                            title: e.leaveType?.name ?? '',
                                          ),
                                        )
                                        .toList(),
                                onChanged: (v) {
                                  context.read<LeaveBloc>().add(
                                    LeaveEvent.changeLeaveType(v),
                                  );
                                },
                              ),

                              const SizedBox(height: AppSizes.space12),

                              // SHOW TOTAL LEAVES OF SELECTED LEAVE TYPE
                              if (state.selectedLeaveType != null)
                                Text(
                                  "Total Leaves Available: ${state.selectedLeaveTypeCount ?? 0}",
                                  style: AppTextStyles.w500_14(context),
                                ),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSizes.space20),

                        /// ------------------------ Duration ------------------------
                        CustomSectionWidget(
                          title: "Leave Duration *",
                          child: CustomRadioGroup<String>(
                            value: state.duration,
                            options: const ["Single Day", "Multi-Day"],
                            labels: const ["Single Day", "Multi-Day"],
                            onChanged: (value) {
                              context.read<LeaveBloc>().add(
                                LeaveEvent.changeDuration(value),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: AppSizes.space20),

                        /// ------------------------ Single Day UI ------------------------
                        if (state.duration == "Single Day")
                          _singleDayUI(context, state),

                        /// ------------------------ Multi Day UI ------------------------
                        if (state.duration == "Multi-Day")
                          _multiDayUI(context, state),

                        const SizedBox(height: AppSizes.space20),

                        /// ------------------------ Reason ------------------------
                        CustomSectionWidget(
                          title: "Reason*",
                          child: CustomTextField.outlineBorder(
                            textInputAction: TextInputAction.done,
                            controller: context
                                .read<LeaveBloc>()
                                .remarkController,
                            maxLines: 4,
                            hintText: "Explain your reason...",
                          ),
                        ),

                        const SizedBox(height: AppSizes.space20),

                        /// ------------------------ Attachment ------------------------
                        CustomFilePickerView(
                          title: "Attachment (Optional)",
                          file: state.attachmentFile,
                          onPick: () async {
                            context.read<LeaveBloc>().add(
                              LeaveEvent.selectFile(),
                            );
                          },
                          onClear: () {
                            context.read<LeaveBloc>().add(
                              LeaveEvent.selectFile(clearFile: true),
                            );
                          },
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }

  // ------------------- SINGLE DAY UI -------------------
  Widget _singleDayUI(BuildContext context, LeaveState state) {
    return Column(
      children: [
        CustomSectionWidget(
          title: "Select Date *",
          child: CustomDatePicker(
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
            onDateChanged: (date) {
              context.read<LeaveBloc>().add(LeaveEvent.changeSingleDate(date));
            },
            hintText: "Choose Date",
          ),
        ),
      ],
    );
  }

  // ------------------- MULTI DAY UI -------------------
  Widget _multiDayUI(BuildContext context, LeaveState state) {
    var bloc = context.read<LeaveBloc>();
    final now = DateTime.now();
    return Column(
      children: [
        /// From
        CustomSectionWidget(
          title: "From *",
          child: Column(
            children: [
              CustomDatePicker(
                key: ValueKey('fromDate_${state.fromDate.toString()}'),
                height: AppSizes.textFieldHeightLg,
                hintText: 'From Date',
                firstDate: now,
                lastDate: DateTime(2100),
                initialSelectedDate: state.fromDate,
                onDateChanged: (picked) {
                  bloc.add(
                    LeaveEvent.selectDate(
                      selectedDate: picked,
                      isFromDate: true,
                    ),
                  );
                },
                validator: (date) =>
                    date == null ? "From Date is required" : null,
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSizes.space20),

        /// To
        CustomSectionWidget(
          title: "To *",
          child: Column(
            children: [
              CustomDatePicker(
                height: AppSizes.textFieldHeightLg,
                hintText: 'To Date',
                firstDate: state.fromDate,
                lastDate: DateTime(2100),
                initialSelectedDate: state.toDate,
                onDateChanged: (picked) {
                  bloc.add(
                    LeaveEvent.selectDate(
                      selectedDate: picked,
                      isFromDate: false,
                    ),
                  );
                },
                validator: (date) =>
                    date == null ? "To Date is required" : null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// const SizedBox(height: 16),
// CustomSectionWidget(
//   title: "Day Type",
//   child: CustomAnimatedDropdown<String>(
//     initialItem: state.singleDayType,
//     hintText: "Select Day Type",
//     items: ["Full Day", "First Half", "Second Half"],
//     onChanged: (v) {
//       context.read<LeaveBloc>().add(
//         LeaveEvent.changeSingleDayType(v ?? ""),
//       );
//     },
//   ),
// ),

// Widget _multiDayUI(BuildContext context, LeaveState state) {
//   var bloc = context.read<LeaveBloc>();
//
//   return Column(
//     children: [
//       /// From
//       CustomSectionWidget(
//         title: "From",
//         child: Column(
//           children: [
//             CustomDatePicker(
//               key: ValueKey('fromDate_${state.fromDate ?? 'null'}'),
//               height: AppSizes.textFieldHeightLg,
//               hintText: 'From Date',
//
//               /// Only allow today & future dates
//               firstDate: DateTime.now(),
//               lastDate: DateTime(2100),
//               initialSelectedDate: state.fromDate,
//               onDateChanged: (DateTime picked) {
//                 bloc.add(
//                   LeaveEvent.selectDate(
//                     selectedDate: picked,
//                     isFromDate: true,
//                   ),
//                 );
//               },
//               validator: (date) {
//                 if (date == null) {
//                   return 'From Date is required';
//                 }
//                 return null;
//               },
//             ),
//             // const SizedBox(height: 12),
//             // CustomAnimatedDropdown<String>(
//             //   initialItem: state.fromDayType,
//             //   hintText: "Select Day Type",
//             //   items: ["Full Day", "First Half", "Second Half"],
//             //   onChanged: (v) {
//             //     context.read<LeaveBloc>().add(
//             //       LeaveEvent.changeFromDayType(v ?? ""),
//             //     );
//             //   },
//             // ),
//           ],
//         ),
//       ),
//
//       const SizedBox(height: 20),
//
//       /// To
//       CustomSectionWidget(
//         title: "To",
//         child: Column(
//           children: [
//             CustomDatePicker(
//               height: AppSizes.textFieldHeightLg,
//               hintText: 'To Date',
//               firstDate: state.fromDate ?? DateTime.now(),
//               lastDate: DateTime(2100),
//               initialSelectedDate: state.toDate,
//               onDateChanged: (DateTime picked) {
//                 bloc.add(
//                   LeaveEvent.selectDate(
//                     selectedDate: picked,
//                     isFromDate: false,
//                   ),
//                 );
//               },
//               validator: (date) {
//                 if (date == null) {
//                   return 'To Date is required';
//                 }
//                 return null;
//               },
//             ),
//             // const SizedBox(height: 12),
//             // CustomAnimatedDropdown<String>(
//             //   initialItem: state.toDayType,
//             //   hintText: "Select Day Type",
//             //   items: ["Full Day", "First Half", "Second Half"],
//             //   onChanged: (v) {
//             //     context.read<LeaveBloc>().add(
//             //       LeaveEvent.changeToDayType(v ?? ""),
//             //     );
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
