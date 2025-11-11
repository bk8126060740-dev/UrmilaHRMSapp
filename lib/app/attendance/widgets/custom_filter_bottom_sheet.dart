import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/utils/popups/custom_toast.dart';

import '../../../common/utils/constants/sizes.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../../../common/widgets/date_time_picker/custom_date_picker.dart';
import '../../../common/widgets/dropdown/custom_animated_dropdown.dart';
import '../../../common/widgets/text/custom_field_heading.dart';
import '../bloc/attendance_bloc.dart';

class CustomFilterDialog extends StatefulWidget {
  const CustomFilterDialog({super.key});

  @override
  State<CustomFilterDialog> createState() => _CustomFilterDialogState();
}

class _CustomFilterDialogState extends State<CustomFilterDialog> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<AttendanceBloc>();
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        return Column(
          children: [
            const CustomFieldHeading(title: "Filter Type"),
            CustomAnimatedDropdown<String>(
              items: ["Daily", "Weekly", "Monthly", "Custom"],
              initialItem: state.selectedFilter,
              hintText: '-- Select Filter Type --',
              onChanged: (value) {
                log("selected filter type : $value");
                bloc.add(
                  AttendanceEvent.selectFilterType(
                    selectedFilterType: value ?? "",
                  ),
                );
              },
            ),
            // if (state.selectedFilter == "Custom") ...[
            SizedBox(height: AppSizes.space16),
            CustomFieldHeading(title: "From"),
            CustomDatePicker(
              enabled: state.selectedFilter.toLowerCase() == "custom",
              key: ValueKey('fromDate_${state.fromDate ?? 'null'}'),
              height: AppSizes.textFieldHeightLg,
              initialSelectedDate: state.fromDate,
              hintText: "From Date",
              onDateChanged: (DateTime picked) {
                bloc.add(
                  AttendanceEvent.selectDate(
                    selectedDate: picked,
                    isFromDate: true,
                  ),
                );
              },
              validator: (date) {
                if (date == null) {
                  return 'From Date is required';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSizes.space16),
            CustomFieldHeading(title: "To"),
            CustomDatePicker(
              enabled: state.selectedFilter.toLowerCase() == "custom",
              key: ValueKey('toDate_${state.toDate ?? 'null'}'),
              height: AppSizes.textFieldHeightLg,
              initialSelectedDate: state.toDate,
              hintText: "To Date",
              onDateChanged: (DateTime picked) {
                bloc.add(
                  AttendanceEvent.selectDate(
                    selectedDate: picked,
                    isFromDate: false,
                  ),
                );
              },
              validator: (date) {
                if (date == null) {
                  return 'To Date is required';
                }
                return null;
              },
            ),
            // ],
            SizedBox(height: AppSizes.space16),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () => Navigator.pop(context),
                    text: "Cancel",
                    isBorderButton: true,
                  ),
                ),
                SizedBox(width: AppSizes.space16),
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      if (state.selectedFilter == "Custom" &&
                          (state.fromDate == null || state.toDate == null)) {
                        CustomToast.showError(
                          message: "Please select both dates",
                        );
                        return;
                      }
                      Navigator.pop(context);
                    },
                    text: "Apply",
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
