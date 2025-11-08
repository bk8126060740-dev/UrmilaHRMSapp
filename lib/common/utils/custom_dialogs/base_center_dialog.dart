import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class BaseCenterDialog extends StatelessWidget {
  final String title;
  final Widget content;

  const BaseCenterDialog({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadius16),
      ),
      child: Container(
        decoration: ShapeDecoration(
          color: AppColors.bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(AppSizes.borderRadius4),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 24,
              offset: Offset(2, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppSizes.borderRadius4),
                    topLeft: Radius.circular(AppSizes.borderRadius4),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.padding16,
                  vertical: AppSizes.padding16,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.secondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        size: AppSizes.iconSize20,
                        Icons.close,
                        color: AppColors.iconColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: AppSizes.padding16,
                  horizontal: AppSizes.padding16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [Flexible(child: content)],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
