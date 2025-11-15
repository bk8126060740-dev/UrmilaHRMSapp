// import 'package:flutter/material.dart';
// import 'package:hrms_uis/common/utils/constants/text_styles.dart';
//
// class CustomCheckBox extends StatelessWidget {
//   final bool value;
//   final String? title;
//   final TextStyle? textStyle;
//   final ValueChanged<bool> onChanged;
//   final double? scale;
//
//   const CustomCheckBox({
//     required this.value,
//     required this.onChanged,
//     this.title,
//     this.textStyle,
//     this.scale,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Transform.scale(
//       scale: scale ?? 0.9,
//       child: Theme(
//         data: Theme.of(context).copyWith(
//           visualDensity: VisualDensity.compact,
//           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Transform.translate(
//               offset: const Offset(-6, 0), // <-- removes that 4px gap
//               child: Checkbox(
//                 visualDensity: VisualDensity.compact,
//                 materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                 value: value,
//                 onChanged: (bool? newValue) {
//                   if (newValue != null) onChanged(newValue);
//                 },
//               ),
//             ),
//             if (title != null) ...[
//               // const SizedBox(width: AppSizes.space4),
//               Text(title!, style: textStyle ?? AppTextStyles.w400_14(context)),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';
import 'package:hrms_uis/common/utils/constants/text_styles.dart';

class CustomCheckBox extends StatelessWidget {
  final bool value;
  final String? title;
  final TextStyle? textStyle;
  final ValueChanged<bool> onChanged;
  final double? scale;
  final Color? borderColor; // 👈 new parameter for border color
  final Color? activeColor; // 👈 optional: for fill color
  final Color? checkColor; // tick color
  final bool enabled; // 👈 new parameter

  const CustomCheckBox({
    required this.value,
    required this.onChanged,
    this.title,
    this.textStyle,
    this.scale,
    this.borderColor,
    this.activeColor,
    this.checkColor,
    this.enabled = true, // 👈 default true (enabled)
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Transform.scale(
      scale: scale ?? 0.9,
      child: Theme(
        data: theme.copyWith(
          checkboxTheme: CheckboxThemeData(
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: borderColor ?? theme.colorScheme.outline,
                width: 1.5,
              ),
            ),
            fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
              if (states.contains(WidgetState.selected)) {
                return activeColor ?? AppColors.primaryColor;
              }
              return Colors.transparent;
            }),
            checkColor: WidgetStateProperty.resolveWith<Color?>(
              (states) => checkColor ?? Colors.white,
            ),
            side: BorderSide(
              color: borderColor ?? AppColors.surfaceBorderColor,
              width: 1.5,
            ),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Transform.translate(
              offset: const Offset(-6, 0),
              child: Checkbox(
                value: value,
                onChanged: enabled
                    ? (bool? newValue) {
                        if (newValue != null) onChanged(newValue);
                      }
                    : null, // 👈 disables interaction
              ),
            ),
            if (title != null)
              Text(title!, style: textStyle ?? AppTextStyles.w400_14(context)),
          ],
        ),
      ),
    );
  }
}
