import 'package:flutter/material.dart';
import 'package:hrms_uis/common/utils/constants/decorations.dart';
import 'package:hrms_uis/common/utils/constants/sizes.dart';
import 'package:hrms_uis/common/widgets/switch/custom_switch.dart';

import '../../../common/utils/constants/text_styles.dart';
import '../models/emp_hierarchy_list_model.dart';

class EmpHierarchyCard extends StatelessWidget {
  final EmployeeHierarchyItem employeeHierarchyItem;

  const EmpHierarchyCard({super.key, required this.employeeHierarchyItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecorations.card(),
      margin: EdgeInsets.only(bottom: AppSizes.space16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              employeeHierarchyItem.employeeName ?? "-",
              style: AppTextStyles.w600_16(context),
            ),

            const SizedBox(height: AppSizes.space4),

            Text(
              "${employeeHierarchyItem.departmentName} | ${employeeHierarchyItem.projectName}",
            ),

            const SizedBox(height: AppSizes.space4),

            Text("L1: ${employeeHierarchyItem.firstLevelManagerName ?? "-"}"),

            const SizedBox(height: AppSizes.space4),

            Text("L2: ${employeeHierarchyItem.secondLevelManagerName ?? '-'}"),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Status', style: AppTextStyles.w500_14(context)),
                    CustomSwitch(
                      value: employeeHierarchyItem.isActive ?? false,
                      onChanged: (value) {
                        // setState(() => _isCalendarView = value);
                      },
                    ),
                  ],
                ),
                TextButton(
                  onPressed: (employeeHierarchyItem.isActive ?? false)
                      ? () {}
                      : null,
                  child: const Text("Edit"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
