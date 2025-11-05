import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/colors.dart';

class CustomRefreshIndicator extends StatelessWidget {
  final Future<void> Function()? onRefresh;
  final Widget child;

  // Optional customization properties
  final Color? color; // Progress indicator color
  final Color? backgroundColor; // Background behind spinner
  final double? displacement; // Distance from top before showing
  final double? strokeWidth; // Thickness of spinner line
  final double? edgeOffset; // Offset from top edge
  final String? semanticsLabel; // For accessibility
  final String? semanticsValue; // For accessibility
  final ScrollPhysics? physics; // Scroll behavior
  final bool? triggerModeAnywhere; // Allow trigger anywhere, not just at top

  const CustomRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
    this.color,
    this.backgroundColor,
    this.displacement,
    this.strokeWidth,
    this.edgeOffset,
    this.semanticsLabel,
    this.semanticsValue,
    this.physics,
    this.triggerModeAnywhere = false,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh ?? () async {},
      color: color ?? AppColors.iconColor,
      backgroundColor: backgroundColor ?? AppColors.bgColor,
      displacement: displacement ?? 40.0,
      strokeWidth: strokeWidth ?? 2.0,
      edgeOffset: edgeOffset ?? 0.0,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      triggerMode: triggerModeAnywhere == true
          ? RefreshIndicatorTriggerMode.anywhere
          : RefreshIndicatorTriggerMode.onEdge,
      child: SingleChildScrollView(
        physics: physics ?? const AlwaysScrollableScrollPhysics(),
        child: child,
      ),
    );
  }
}
