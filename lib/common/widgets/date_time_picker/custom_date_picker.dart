import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/formatters/date_formats.dart';
import '../../utils/popups/custom_snackbar.dart';

/*
class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.borderColor,
    this.hintText,
    this.initialSelectedDate,
    this.firstDate,
    this.lastDate,
    this.iconImage,
    this.trailing,
    this.mainAxisAlignment,
    this.hintColor,
    this.enabled = true,
    required this.onDateChanged,
    this.dateFormat,
    this.validator,
    this.dependentDate,
    this.dependentFieldName,
  });

  final double? width, height, borderRadius, fontSize;
  final Color? borderColor, hintColor;
  final String? hintText;
  final DateTime? initialSelectedDate, firstDate, lastDate;
  final SvgPicture? iconImage;
  final Widget? trailing;
  final MainAxisAlignment? mainAxisAlignment;
  final bool enabled;
  final Function(DateTime) onDateChanged;
  final FormFieldValidator<DateTime>? validator;
  final DateFormat? dateFormat;

  /// NEW: Dependency support for "To Date" based on "From Date"
  final DateTime? dependentDate;
  final String? dependentFieldName;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: initialSelectedDate,
      validator: validator,
      builder: (field) {
        final isDateSelected = field.value != null;
        final Color effectiveTextColor = isDateSelected
            ? AppColors.textColor
            : (hintColor ?? Colors.grey);
        final Color effectiveIconColor = isDateSelected
            ? AppColors.iconColor
            : Colors.grey;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: enabled
                  ? () async {
                      if (dependentDate == null && dependentFieldName != null) {
                        CustomSnackBar.showError(
                          context: context,
                          message: "Please select $dependentFieldName first",
                        );
                        return;
                      }

                      final DateTime now = DateTime.now();
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: field.value ?? dependentDate ?? now,
                        firstDate:
                            firstDate ??
                            dependentDate ??
                            now.subtract(const Duration(days: 365)),
                        lastDate:
                            lastDate ?? now.add(const Duration(days: 365)),
                      );

                      if (picked != null) {
                        field.didChange(picked);
                        onDateChanged(picked);
                      }
                    }
                  : null,
              child: Container(
                // height: height,
                // width: width,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.padding12,
                  vertical: AppSizes.padding12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? AppSizes.inputFieldRadius,
                  ),
                  border: Border.all(
                    color: borderColor ?? AppColors.borderColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                      mainAxisAlignment ?? MainAxisAlignment.start,
                  children: [
                    iconImage ??
                        Icon(
                          Icons.calendar_month_rounded,
                          color: effectiveIconColor,
                        ),
                    const SizedBox(width: AppSizes.space16),
                    Text(
                      isDateSelected
                          ? (dateFormat ?? DateFormat(DateFormats.fullMonth))
                                .format(field.value!)
                          : hintText ?? "Select date",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: effectiveTextColor,
                        fontSize: fontSize,
                      ),
                    ),
                    if (trailing != null) ...[
                      const SizedBox(width: AppSizes.space8),
                      trailing!,
                    ],
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSizes.padding8,
                  left: AppSizes.padding8,
                ),
                child: Text(
                  field.errorText ?? '',
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(color: AppColors.error),
                ),
              ),
          ],
        );
      },
    );
  }
}
*/

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.fontSize,
    this.borderColor,
    this.hintText,
    this.initialSelectedDate,
    this.firstDate,
    this.lastDate,
    this.iconImage,
    this.trailing,
    this.mainAxisAlignment,
    this.hintColor,
    this.enabled = true,
    required this.onDateChanged,
    this.dateFormat,
    this.validator,
    this.dependentDate,
    this.dependentFieldName,
  });

  final double? width, height, borderRadius, fontSize;
  final Color? borderColor, hintColor;
  final String? hintText;
  final DateTime? initialSelectedDate, firstDate, lastDate;
  final SvgPicture? iconImage;
  final Widget? trailing;
  final MainAxisAlignment? mainAxisAlignment;
  final bool enabled;
  final Function(DateTime) onDateChanged;
  final FormFieldValidator<DateTime>? validator;
  final DateFormat? dateFormat;

  // NEW: Dependency support for "To Date" based on "From Date"
  final DateTime? dependentDate;
  final String? dependentFieldName;

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      key: ValueKey(initialSelectedDate), // This line is crucial
      initialValue: initialSelectedDate,
      validator: validator,
      builder: (field) {
        final isDateSelected = field.value != null;
        final Color effectiveTextColor = isDateSelected
            ? AppColors.textColor
            : (hintColor ?? AppColors.hintTextColor);
        final Color effectiveIconColor = isDateSelected
            ? AppColors.textColor
            : AppColors.hintTextColor;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: enabled
                  ? () async {
                      if (dependentDate == null && dependentFieldName != null) {
                        CustomSnackBar.showWarning(
                          context: context,
                          message: "Please select $dependentFieldName first",
                        );
                        return;
                      }

                      final DateTime now = DateTime.now();
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        // initialDate: field.value ?? dependentDate ?? now,
                        // firstDate: firstDate ??
                        //     dependentDate ??
                        //     now.subtract(const Duration(days: 365)),
                        // lastDate:
                        // lastDate ?? now.add(const Duration(days: 365)),
                        initialDate: field.value ?? now,
                        firstDate:
                            firstDate ??
                            dependentDate ??
                            now.subtract(const Duration(days: 365)),
                        lastDate:
                            lastDate ?? now.add(const Duration(days: 365)),
                      );

                      if (picked != null) {
                        field.didChange(picked);
                        onDateChanged(picked);
                      }
                    }
                  : null,
              child: Container(
                height: height,
                width: width,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.padding12,
                  vertical: AppSizes.padding8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    borderRadius ?? AppSizes.inputFieldRadius,
                  ),
                  border: Border.all(
                    color: borderColor ?? AppColors.borderColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment:
                      mainAxisAlignment ?? MainAxisAlignment.start,
                  children: [
                    iconImage ??
                        Icon(
                          Icons.calendar_month_rounded,
                          color: effectiveIconColor,
                        ),
                    const SizedBox(width: AppSizes.space8),
                    Text(
                      isDateSelected
                          ? (dateFormat ?? DateFormat(DateFormats.fullMonth))
                                .format(field.value!)
                          : hintText ?? "Select date",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: effectiveTextColor,
                        fontSize: fontSize,
                      ),
                    ),
                    if (trailing != null) ...[
                      const SizedBox(width: AppSizes.space4),
                      trailing!,
                    ],
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(
                  top: AppSizes.padding4,
                  left: AppSizes.padding8,
                ),
                child: Text(
                  field.errorText ?? '',
                  style: Theme.of(
                    context,
                  ).textTheme.labelMedium?.copyWith(color: AppColors.error),
                ),
              ),
          ],
        );
      },
    );
  }
}
