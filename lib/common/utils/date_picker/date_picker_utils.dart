import 'package:flutter/material.dart';

class DatePickerUtils {
  /// Opens a date picker and returns the selected DateTime.
  static Future<DateTime?> pickDate({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime today = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? today,
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue, // calendar header & selected date color
              onPrimary: Colors.white, // text on selected date
              onSurface: Colors.black, // default text color
            ),
          ),
          child: child!,
        );
      },
    );

    return pickedDate;
  }
}
