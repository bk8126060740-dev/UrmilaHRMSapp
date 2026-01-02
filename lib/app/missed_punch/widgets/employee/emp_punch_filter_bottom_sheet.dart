import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/missed_punch/bloc/missed_punch_bloc.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';

import '../../../../common/utils/popups/custom_toast.dart';
import '../../../../common/widgets/date_time_picker/custom_date_picker.dart';
import '../../../../common/widgets/dropdown/custom_animated_dropdown.dart';
import '../../../../common/widgets/text/custom_field_heading.dart';

class EmpPunchFilterBottomSheet extends StatefulWidget {
  const EmpPunchFilterBottomSheet({super.key});

  @override
  State<EmpPunchFilterBottomSheet> createState() =>
      _EmpPunchFilterBottomSheetState();
}

class _EmpPunchFilterBottomSheetState extends State<EmpPunchFilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<MissedPunchBloc>();
    return BlocBuilder<MissedPunchBloc, MissedPunchState>(
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
                  MissedPunchEvent.selectFilterType(
                    selectedFilterType: value ?? "",
                  ),
                );
              },
            ),
            SizedBox(height: AppSizes.space16),
            CustomFieldHeading(title: "From"),
            CustomDatePicker(
              enabled: state.selectedFilter.toLowerCase() == "custom",
              key: ValueKey('fromDate_${state.fromDate ?? 'null'}'),
              height: AppSizes.textFieldHeightLg,
              hintText: 'From Date',
              lastDate: DateTime.now(),
              initialSelectedDate: state.fromDate,
              onDateChanged: (DateTime picked) {
                bloc.add(
                  MissedPunchEvent.selectDate(
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
              height: AppSizes.textFieldHeightLg,
              hintText: 'To Date',
              lastDate: DateTime.now(),
              initialSelectedDate: state.toDate,
              onDateChanged: (DateTime picked) {
                bloc.add(
                  MissedPunchEvent.selectDate(
                    selectedDate: picked,
                    isFromDate: false,
                  ),
                );
              },
              dependentFieldName: "From Date",
              dependentDate: state.fromDate,
              validator: (date) {
                if (date == null) {
                  return 'To Date is required';
                }
                return null;
              },
            ),
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
                      bloc.add(
                        const MissedPunchEvent.getEmployeesMissedPunchList(),
                      );
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
