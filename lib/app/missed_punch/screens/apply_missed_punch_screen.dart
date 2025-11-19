import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';

import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../../../common/widgets/custom/custom_section_widget.dart';
import '../../../common/widgets/date_time_picker/custom_date_picker.dart';
import '../../../common/widgets/date_time_picker/custom_time_picker.dart';
import '../../../common/widgets/dropdown/custom_animated_dropdown.dart';
import '../../../common/widgets/text_field/custom_text_field.dart';

class ApplyMissedPunchScreen extends StatefulWidget {
  static const route = "/apply_missed_punch";

  const ApplyMissedPunchScreen({super.key});

  @override
  State<ApplyMissedPunchScreen> createState() => _ApplyMissedPunchScreenState();
}

class _ApplyMissedPunchScreenState extends State<ApplyMissedPunchScreen> {
  final reason = TextEditingController();

  String? type;
  String? category;
  DateTime? requestDate;
  String? mode;
  TimeOfDay? inTime;
  TimeOfDay? outTime;
  final reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        elevation: 0,
        title: "Apply Missed Punch In/Out",
        showAvatar: false,
        showBackButton: true,
        showNavigation: false,
        showCalendarIcon: false,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.padding16),
        child: CustomButton(onTap: () {}, text: "Save"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.padding16),
          child: Column(
            spacing: AppSizes.space16,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSectionWidget(
                title: "Type",
                child: CustomAnimatedDropdown<String>(
                  initialItem: type,
                  hintText: "Select Type",
                  items: ['Regularization', 'Missing Punch'],
                  onChanged: (v) => setState(() => type = v),
                ),
              ),

              // const SizedBox(height: AppSizes.space12),
              CustomSectionWidget(
                title: "Category",
                child: CustomAnimatedDropdown<String>(
                  initialItem: category,
                  hintText: "Select Category",
                  items: const [
                    'Early Coming',
                    'Late Going',
                    'New Joinee',
                    'Missing Punch',
                  ],
                  onChanged: (v) => setState(() => category = v),
                ),
              ),

              // const SizedBox(height: AppSizes.space12),
              CustomSectionWidget(
                title: "Request Date",
                child: CustomDatePicker(
                  initialSelectedDate: requestDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                  hintText: "Select Date",
                  onDateChanged: (picked) {
                    setState(() => requestDate = picked);
                  },
                ),
              ),

              // const SizedBox(height: AppSizes.space12),
              CustomSectionWidget(
                title: "Mode",
                child: CustomAnimatedDropdown<String>(
                  initialItem: mode,
                  hintText: "Select Mode",
                  items: const ['In', 'Out', 'Both'],
                  onChanged: (v) => setState(() => mode = v),
                ),
              ),

              // const SizedBox(height: AppSizes.space12),
              CustomSectionWidget(
                title: "In Time",
                child: CustomTimePicker(
                  initialTime: inTime,
                  hintText: "Select In Time",
                  onTimeSelected: (TimeOfDay t) {
                    setState(() => inTime = t);
                  },
                ),
              ),

              // const SizedBox(height: AppSizes.space12),
              CustomSectionWidget(
                title: "Out Time",
                child: CustomTimePicker(
                  initialTime: outTime,
                  hintText: "Select Out Time",
                  onTimeSelected: (TimeOfDay t) {
                    setState(() => outTime = t);
                  },
                ),
              ),

              // const SizedBox(height: AppSizes.space12),

              /// ------------------------ Reason ------------------------
              CustomSectionWidget(
                title: "Reason",
                child: CustomTextField.outlineBorder(
                  controller: reason,
                  maxLines: 4,
                  hintText: "Explain your reason...",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
