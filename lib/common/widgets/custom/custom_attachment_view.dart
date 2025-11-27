import 'dart:io';

import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/decorations.dart';
import '../../utils/constants/sizes.dart';
import '../button/custom_button.dart';
import 'custom_section_widget.dart';

class CustomFilePickerView extends StatelessWidget {
  final String title;
  final File? file;
  final VoidCallback onPick;
  final VoidCallback? onClear;

  const CustomFilePickerView({
    super.key,
    required this.title,
    required this.file,
    required this.onPick,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSectionWidget(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---- Attach File Button ----
          CustomButton(
            isBorderButton: true,
            text: file == null ? "Attach File" : "Change File",
            onTap: onPick,
          ),

          if (file != null) const SizedBox(height: AppSizes.space12),

          // ---- Show Selected File Info ----
          if (file != null)
            CustomSelectedAttachmentView(file: file!, onClear: onClear),
        ],
      ),
    );
  }
}

class CustomSelectedAttachmentView extends StatelessWidget {
  final File file;
  final VoidCallback? onClear;

  const CustomSelectedAttachmentView({
    super.key,
    required this.file,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.padding16,
        vertical: AppSizes.padding16,
      ),
      decoration: AppDecorations.card(color: AppColors.surfaceColor),
      child: Row(
        children: [
          Icon(Icons.insert_drive_file, color: Colors.blue),
          const SizedBox(width: AppSizes.space8),
          Expanded(
            child: Text(
              file.path.split('/').last,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (onClear != null)
            InkWell(
              onTap: onClear,
              child: Icon(Icons.close, color: Colors.red),
            ),
        ],
      ),
    );
  }
}
