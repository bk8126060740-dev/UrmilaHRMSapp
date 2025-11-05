import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

class AppDecorations {
  static BoxDecoration card({
    Color color = Colors.white,
    BorderRadiusGeometry radius = const BorderRadius.all(
      Radius.circular(AppSizes.borderRadius16),
    ),
    double elevation = 2,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: radius,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withFixedOpacity(0.1),
          blurRadius: elevation * 2,
          offset: Offset(0, elevation),
        ),
      ],
    );
  }
}
