import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class CustomMaterialIcon extends StatelessWidget {
  const CustomMaterialIcon({
    super.key,
    required this.onTap,
    this.icon,
    this.size,
    this.iconSize,
  });

  final VoidCallback? onTap;
  final IconData? icon;
  final double? size;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0x2B000000), // #0000002B
              offset: const Offset(1, 4), // x=1, y=4
              blurRadius: 11.4,
              spreadRadius: 0,
            ),
          ],
        ),
        height: size ?? 36,
        width: size ?? 36,
        // padding: const EdgeInsets.all(8),
        child: Center(
          child: Center(
            child: Icon(
              icon ?? Icons.arrow_back_ios_outlined,
              size: iconSize ?? AppSizes.iconSize16,
            ),
          ),
        ),
      ),
    );
  }
}
