import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/missed_punch/bloc/missed_punch_bloc.dart';
import 'package:hrms_uis/app/missed_punch/widgets/employee/missed_punch_apply_summary_dialog.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/helpers/device_utility.dart';
import 'package:hrms_uis/common/widgets/dropdown/dropdown_model.dart';

import '../../../../common/utils/custom_dialogs/bottomSheets.dart';
import '../../../../common/utils/popups/custom_toast.dart';
import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/button/custom_button.dart';
import '../../../../common/widgets/custom/custom_section_widget.dart';
import '../../../../common/widgets/date_time_picker/custom_date_picker.dart';
import '../../../../common/widgets/dropdown/custom_animated_dropdown.dart';
import '../../../../common/widgets/loader/custom_circular_progress.dart';
import '../../../../common/widgets/text_field/custom_text_field.dart';

class ApplyMissedPunchScreen extends StatefulWidget {
  static const route = "/apply_missed_punch";

  const ApplyMissedPunchScreen({super.key});

  @override
  State<ApplyMissedPunchScreen> createState() => _ApplyMissedPunchScreenState();
}

class _ApplyMissedPunchScreenState extends State<ApplyMissedPunchScreen> {
  @override
  Widget build(BuildContext context) {
    var missedPunchBloc = context.read<MissedPunchBloc>();
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "Apply Missed Punch",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding16),
          child: BlocBuilder<MissedPunchBloc, MissedPunchState>(
            builder: (context, state) {
              return state.status == MissedPunchStatus.getMissedPunchTypeLoading
                  ? SizedBox.shrink()
                  : CustomButton(
                      onTap: () {
                        if (state.selectedMissedPunchType == null) {
                          CustomToast.showError(
                            message: "Please select missed punch type",
                          );
                          return;
                        }

                        if (state.requestDate == null) {
                          CustomToast.showError(
                            message: "Please select request date",
                          );
                          return;
                        }

                        if (missedPunchBloc.reasonController.text
                            .trim()
                            .isEmpty) {
                          CustomToast.showError(message: "Please enter reason");
                          return;
                        }

                        AppDeviceUtils.unFocus();

                        CustomBottomSheet.show(
                          context: context,
                          title: "Apply Missed Punch Summary",
                          child: BlocProvider.value(
                            value: context.read<MissedPunchBloc>(),
                            child: MissedPunchApplySummaryDialog(),
                          ),
                        );
                      },
                      text: "Save",
                    );
            },
          ),
        ),
      ),
      body: SafeArea(
        child: BlocConsumer<MissedPunchBloc, MissedPunchState>(
          listener: (context, state) {},
          builder: (context, state) {
            return state.status == MissedPunchStatus.getMissedPunchTypeLoading
                ? Center(child: CustomCircularProgress())
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(AppSizes.padding16),
                    child: Column(
                      spacing: AppSizes.space16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomSectionWidget(
                          title: "Type",
                          child: CustomAnimatedDropdown<DropdownModel>(
                            initialItem: state.selectedMissedPunchType,
                            hintText: "Select Type",
                            items:
                                (state
                                            .missedPunchTypeListModel
                                            ?.missedPunchList ??
                                        [])
                                    .map(
                                      (e) => DropdownModel(
                                        id: "${e.id ?? -1}",
                                        title: e.name ?? '',
                                      ),
                                    )
                                    .toList(),
                            onChanged: (v) {
                              missedPunchBloc.add(
                                MissedPunchEvent.changeMissedPunchType(v),
                              );
                            },
                          ),
                        ),

                        /// missed request date===============>>
                        CustomSectionWidget(
                          title: "Request Date",
                          child: CustomDatePicker(
                            initialSelectedDate: state.requestDate,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                            hintText: "Select Date",
                            onDateChanged: (picked) {
                              missedPunchBloc.add(
                                MissedPunchEvent.changeRequestDate(picked),
                              );
                            },
                          ),
                        ),

                        /// missed punch in/out time ===============>>
                        // CustomSectionWidget(
                        //   title: "Punch IN/OUT",
                        //   child: Column(
                        //     children: [
                        //       CustomFieldHeading(title: "In Time"),
                        //       CustomTimePicker(
                        //         // initialTime: state.requestDate,
                        //         hintText: "Select In Time",
                        //         onTimeSelected: (inTime) {
                        //           log("selected in-time=========>> $inTime");
                        //           log(
                        //             AppFormatter.formatTimeOfDay(inTime),
                        //           ); // 09:30:00
                        //           missedPunchBloc.add(
                        //             MissedPunchEvent.selectInOutTime(
                        //               inTime: true,
                        //               inOutTime: inTime,
                        //             ),
                        //           );
                        //         },
                        //       ),
                        //       AppSizes.space16.vGap,
                        //       CustomFieldHeading(title: "Out Time"),
                        //       CustomTimePicker(
                        //         // initialTime: state.requestDate,
                        //         hintText: "Select Out Time",
                        //         onTimeSelected: (outTime) {
                        //           log("selected out-time=========>> $outTime");
                        //           log(
                        //             AppFormatter.formatTimeOfDay(outTime),
                        //           ); // 19:30:00
                        //           missedPunchBloc.add(
                        //             MissedPunchEvent.selectInOutTime(
                        //               inTime: false,
                        //               inOutTime: outTime,
                        //             ),
                        //           );
                        //         },
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        /// Reason Date ===============>>
                        CustomSectionWidget(
                          title: "Reason",
                          child: CustomTextField.outlineBorder(
                            textInputAction: TextInputAction.done,
                            controller: missedPunchBloc.reasonController,
                            maxLines: 4,
                            hintText: "Explain your reason...",
                            maxLength: 100,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
