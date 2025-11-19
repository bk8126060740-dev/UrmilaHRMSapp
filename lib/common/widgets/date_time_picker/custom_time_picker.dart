import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomTimePicker extends StatefulWidget {
  const CustomTimePicker({
    super.key,
    required this.onTimeSelected,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.hintColor,
    this.hintText = "Select Time",
    this.initialTime,
    this.trailing,
    this.enabled = true,
  });

  final double? width, height, borderRadius;
  final Color? borderColor, hintColor;
  final String hintText;
  final TimeOfDay? initialTime;
  final Function(TimeOfDay) onTimeSelected;
  final Widget? trailing;
  final bool enabled;

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay? selectedTime;

  Future<void> _openTimePicker(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? widget.initialTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            timePickerTheme: TimePickerThemeData(
              dialHandColor: AppColors.primaryColor,
              hourMinuteColor: Colors.white,
              hourMinuteTextColor: AppColors.textColor,
              entryModeIconColor: AppColors.primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
      widget.onTimeSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTimeSelected = selectedTime != null;
    final Color effectiveTextColor = isTimeSelected
        ? AppColors.textColor
        : (widget.hintColor ?? AppColors.hintTextColor);
    final Color effectiveIconColor = isTimeSelected
        ? AppColors.textColor
        : AppColors.hintTextColor;

    return GestureDetector(
      onTap: widget.enabled ? () => _openTimePicker(context) : null,
      child: Container(
        height: widget.height,
        width: widget.width,
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.padding12,
          vertical: AppSizes.padding12,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? AppSizes.inputFieldRadius,
          ),
          border: Border.all(
            color: widget.borderColor ?? AppColors.borderColor,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.access_time_filled_rounded,
              size: 20,
              color: effectiveIconColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                selectedTime == null
                    ? widget.hintText
                    : selectedTime!.format(context),
                style: AppTextStyles.w400_14(
                  context,
                  color: effectiveTextColor,
                ),
              ),
            ),
            if (widget.trailing != null) widget.trailing!,
          ],
        ),
      ),
    );
  }
}
