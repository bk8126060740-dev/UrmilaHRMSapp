import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(color: AppColors.borderColor, width: 1);
  }
}
