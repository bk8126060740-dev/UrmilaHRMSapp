import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const ShimmerLoading({
    super.key,
    required this.child,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!isLoading) return child;

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: _makeTransparent(child),
    );
  }

  /// Makes all text and images transparent so shimmer only shows layout shapes
  Widget _makeTransparent(Widget widget) {
    return Theme(
      data: ThemeData(
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.transparent),
          bodyMedium: TextStyle(color: Colors.transparent),
          bodySmall: TextStyle(color: Colors.transparent),
          titleMedium: TextStyle(color: Colors.transparent),
        ),
      ),
      child: Opacity(opacity: 0.5, child: widget),
    );
  }
}
