import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/app/missed_punch/bloc/missed_punch_bloc.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/dropdown/dropdown_model.dart';

import '../../../../common/widgets/appbar/custom_appbar.dart';
import '../../../../common/widgets/button/custom_button.dart';
import '../../../../common/widgets/custom/custom_section_widget.dart';
import '../../../../common/widgets/date_time_picker/custom_date_picker.dart';
import '../../../../common/widgets/dropdown/custom_animated_dropdown.dart';
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
        title: "Apply Missed Punch In/Out",
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
              return CustomButton(onTap: () {}, text: "Save");
            },
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.padding16),
          child: BlocConsumer<MissedPunchBloc, MissedPunchState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Column(
                spacing: AppSizes.space16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomSectionWidget(
                    title: "Type",
                    child: CustomAnimatedDropdown<DropdownModel>(
                      initialItem: state.selectedMissedPunchType,
                      hintText: "Select Type",
                      items: [
                        DropdownModel(id: "1", title: "New Joinee"),
                        DropdownModel(id: "2", title: "Missing Punch"),
                      ],
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

                  /// Reason Date ===============>>
                  CustomSectionWidget(
                    title: "Reason",
                    child: CustomTextField.outlineBorder(
                      controller: missedPunchBloc.reasonController,
                      maxLines: 4,
                      hintText: "Explain your reason...",
                      maxLength: 100,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
