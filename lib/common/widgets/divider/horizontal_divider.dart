import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColors.dividerColor, height: 1,);
  }
}
