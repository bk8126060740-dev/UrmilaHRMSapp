import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/extensions/extension.dart';

import '../../utils/constants/colors.dart';

class CustomAnimatedDropdown<T> extends StatelessWidget {
  const CustomAnimatedDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.validator,
    this.controller,
    this.hintText,
    this.initialItem,
  });

  final List<T>? items;
  final dynamic Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final SingleSelectController<T?>? controller;
  final String? hintText;
  final T? initialItem;

  @override
  Widget build(BuildContext context) {
    final isDisabled = onChanged == null;

    return AbsorbPointer(
      absorbing: isDisabled,
      child: Opacity(
        opacity: isDisabled ? 0.6 : 1.0, // Dim visually if disabled
        child: SizedBox(
          child: DropdownButtonHideUnderline(
            child: CustomDropdown<T>.search(
              itemsListPadding: const EdgeInsets.only(bottom: 10, top: 10),
              initialItem: initialItem,
              closedHeaderPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 0,
              ),
              hideSelectedFieldWhenExpanded: true,
              excludeSelected: false,
              validator: validator,
              controller: controller,
              items: items,
              onChanged: onChanged,
              hintText: hintText,
              expandedHeaderPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 0,
              ),
              decoration: CustomDropdownDecoration(
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.hintTextColor,
                ),
                closedFillColor: Colors.transparent,
                expandedFillColor: AppColors.bgColor,
                expandedShadow: [
                  BoxShadow(
                    color: Colors.black.withFixedOpacity(0.25),
                    offset: const Offset(0, 4),
                    blurRadius: 12,
                    spreadRadius: 2,
                  ),
                ],
                listItemDecoration: ListItemDecoration(
                  highlightColor: Colors.transparent,
                  splashColor: AppColors.accentColor.withAlpha(30),
                  selectedColor: AppColors.inputBorderColor,
                ),
                closedSuffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Theme.of(context).disabledColor,
                ),
                closedBorder: BoxBorder.all(
                  width: 0,
                  color: Colors.transparent,
                ),
                closedErrorBorder: BoxBorder.all(
                  width: 0,
                  color: Colors.transparent,
                ),
                headerStyle: TextStyle(color: AppColors.textColor),
                listItemStyle: TextStyle(color: AppColors.textColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomAnimatedSearchDropdown extends StatelessWidget {
  const CustomAnimatedSearchDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.validator,
    this.controller,
  });

  final List<dynamic>? items;
  final dynamic Function(dynamic)? onChanged;
  final String? Function(dynamic)? validator;
  final SingleSelectController<dynamic>? controller;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown.search(
      hideSelectedFieldWhenExpanded: true,
      excludeSelected: false,
      validator: validator,
      controller: controller,
      items: items,
      onChanged: onChanged,
      decoration: CustomDropdownDecoration(
        closedSuffixIcon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Theme.of(context).disabledColor,
        ),
        closedBorder: Border(
          bottom: BorderSide(color: AppColors.inputBorderColor),
          top: BorderSide(color: AppColors.inputBorderColor),
          left: BorderSide(color: AppColors.inputBorderColor),
          right: BorderSide(color: AppColors.inputBorderColor),
        ),
        headerStyle: const TextStyle(color: Colors.black),
        listItemStyle: const TextStyle(color: Colors.black),
      ),
    );
  }
}

class CustomMultiSelectDropdown extends StatelessWidget {
  const CustomMultiSelectDropdown({
    super.key,
    required this.items,
    required this.onListChanged,
    this.validator,
    this.controller,
  });

  final List<dynamic>? items;
  final dynamic Function(List<dynamic>)? onListChanged;
  final String? Function(dynamic)? validator;
  final SingleSelectController<dynamic>? controller;

  @override
  Widget build(BuildContext context) {
    return CustomDropdown.multiSelect(
      hideSelectedFieldWhenExpanded: true,
      listValidator: validator,
      controller: controller,
      items: items,
      decoration: CustomDropdownDecoration(
        closedSuffixIcon: Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Theme.of(context).disabledColor,
        ),
        closedBorder: Border(
          bottom: BorderSide(color: AppColors.inputBorderColor),
          top: BorderSide(color: AppColors.inputBorderColor),
          left: BorderSide(color: AppColors.inputBorderColor),
          right: BorderSide(color: AppColors.inputBorderColor),
        ),
        listItemDecoration: ListItemDecoration(
          selectedIconColor: AppColors.scaffoldBgColor,
        ),
        headerStyle: const TextStyle(color: Colors.black),
        listItemStyle: const TextStyle(color: Colors.black),
      ),
      onListChanged: onListChanged,
    );
  }
}
