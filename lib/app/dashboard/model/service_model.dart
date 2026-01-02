import 'package:flutter/widgets.dart';

class ServiceItemModel {
  final String title;
  final String icon;
  final VoidCallback onTap;

  ServiceItemModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
