import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/widgets/button/custom_button.dart';
import 'package:hrms_uis/common/widgets/date_time_picker/custom_date_picker.dart';
import 'package:hrms_uis/common/widgets/text_field/custom_text_field.dart';

import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/custom/custom_section_widget.dart';
import '../../../common/widgets/dropdown/custom_animated_dropdown.dart';
import '../../../common/widgets/radio/custom_radio_group.dart';

class ApplyLeaveScreen extends StatefulWidget {
  static const route = "/add_leave_screen";

  const ApplyLeaveScreen({super.key});

  @override
  State<ApplyLeaveScreen> createState() => _ApplyLeaveScreenState();
}

class _ApplyLeaveScreenState extends State<ApplyLeaveScreen> {
  String? leaveType;
  String duration = "Single Day";

  DateTime? singleDate;
  String singleDayType = "Full Day";

  DateTime? fromDate;
  String fromDayType = "Full Day";

  DateTime? toDate;
  String toDayType = "Full Day";

  final reason = TextEditingController();

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(onTap: () {}, text: "Apply Leave"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// ------------------------ Leave Type ------------------------
              CustomSectionWidget(
                title: "Leave Type",
                child: CustomAnimatedDropdown<String>(
                  initialItem: leaveType,
                  hintText: "Select Leave Type",
                  items: [
                    "Casual Leave",
                    "Sick Leave",
                    "Earned Leave",
                    "Unpaid Leave",
                  ],
                  onChanged: (v) => setState(() => leaveType = v),
                ),
              ),

              const SizedBox(height: 20),

              /// ------------------------ Duration ------------------------
              CustomSectionWidget(
                title: "Leave Duration",
                child: CustomRadioGroup<String>(
                  value: duration,
                  options: const ["Single Day", "Multi-Day"],
                  labels: const ["Single Day", "Multi-Day"],
                  onChanged: (val) {
                    setState(() => duration = val);
                  },
                ),
              ),

              const SizedBox(height: 20),

              /// ------------------------ Single Day UI ------------------------
              if (duration == "Single Day") _singleDayUI(context),

              /// ------------------------ Multi Day UI ------------------------
              if (duration == "Multi-Day") _multiDayUI(context),

              const SizedBox(height: 20),

              /// ------------------------ Reason ------------------------
              CustomSectionWidget(
                title: "Reason",
                child: CustomTextField.outlineBorder(
                  controller: reason,
                  maxLines: 4,
                  hintText: "Explain your reason...",
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------- SINGLE DAY UI -------------------
  Widget _singleDayUI(BuildContext context) {
    return Column(
      children: [
        CustomSectionWidget(
          title: "Select Date",
          child: CustomDatePicker(
            onDateChanged: (picked) {
              setState(() => singleDate = picked);
            },
            hintText: "Choose Date",
          ),
        ),
        const SizedBox(height: 16),
        CustomSectionWidget(
          title: "Day Type",
          child: CustomAnimatedDropdown<String>(
            initialItem: singleDayType,
            hintText: "Select Day Type",
            items: ["Full Day", "First Half", "Second Half"],
            onChanged: (v) {
              setState(() => singleDayType = v!);
            },
          ),
        ),
      ],
    );
  }

  // ------------------- MULTI DAY UI -------------------
  Widget _multiDayUI(BuildContext context) {
    return Column(
      children: [
        /// From
        CustomSectionWidget(
          title: "From",
          child: Column(
            children: [
              CustomDatePicker(
                onDateChanged: (picked) {
                  setState(() => fromDate = picked);
                },
                hintText: "Choose Date",
              ),
              const SizedBox(height: 12),
              CustomAnimatedDropdown<String>(
                initialItem: fromDayType,
                hintText: "Select Day Type",
                items: ["Full Day", "First Half", "Second Half"],
                onChanged: (v) {
                  setState(() => fromDayType = v!);
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        /// To
        CustomSectionWidget(
          title: "To",
          child: Column(
            children: [
              CustomDatePicker(
                onDateChanged: (picked) {
                  setState(() => toDate = picked);
                },
                hintText: "Choose Date",
              ),
              const SizedBox(height: 12),
              CustomAnimatedDropdown<String>(
                initialItem: toDayType,
                hintText: "Select Day Type",
                items: ["Full Day", "First Half", "Second Half"],
                onChanged: (v) {
                  setState(() => toDayType = v!);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
