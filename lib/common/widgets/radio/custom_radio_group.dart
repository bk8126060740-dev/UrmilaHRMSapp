import 'package:flutter/material.dart';

import 'custom_radio.dart';

class CustomRadioGroup<T> extends StatelessWidget {
  final T value;
  final List<T> options;
  final List<String> labels; // titles to show
  final ValueChanged<T> onChanged;

  const CustomRadioGroup({
    super.key,
    required this.value,
    required this.options,
    required this.labels,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(options.length, (index) {
        final option = options[index];
        final label = labels[index];
        return InkWell(
          onTap: () => onChanged(option),
          child: CustomRadio<T>(
            value: option,
            groupValue: value,
            title: label,
            onChanged: (v) => onChanged(v as T),
          ),
        );
      }),
    );
  }
}
