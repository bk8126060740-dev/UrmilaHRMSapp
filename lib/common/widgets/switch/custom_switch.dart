import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomSwitch extends StatelessWidget {
  final bool value;
  final double? scale;
  final ValueChanged<bool> onChanged;

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale ?? 0.6,
      child: Switch.adaptive(
        padding: EdgeInsets.zero,
        value: value,
        onChanged: onChanged,
        activeThumbColor: AppColors.primaryColor,
        trackOutlineWidth: WidgetStatePropertyAll(3),
        trackOutlineColor: WidgetStateProperty.resolveWith((
          final Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor;
          }
          return AppColors.primaryColor;
        }),
        trackColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.surface,
        ),
        inactiveThumbColor: AppColors.iconColor,
      ),
    );
  }
}
