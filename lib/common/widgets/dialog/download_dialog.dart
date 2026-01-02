import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

import '../../utils/constants/sizes.dart';
import '../button/custom_button.dart';

class DownloadDialog extends StatelessWidget {
  const DownloadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: CustomButton(
            isBorderButton: true,
            onTap: () => Navigator.pop(context),
            text: 'Cancel',
          ),
        ),
        const SizedBox(width: AppSizes.space8),
        CustomButton(
          onTap: () {
            permission.openAppSettings();
            Navigator.of(context).pop();
          },
          text: 'Open Settings',
        ),
      ],
    );
  }
}
