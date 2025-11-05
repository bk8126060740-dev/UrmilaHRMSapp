import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({
    super.key,
    this.backgroundColor,
    this.size = 28,
  });

  final Color? backgroundColor;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: backgroundColor ?? AppColors.accentColor,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.whiteTextColor),
        strokeWidth: 2.5,
      ),
    );
  }
}
