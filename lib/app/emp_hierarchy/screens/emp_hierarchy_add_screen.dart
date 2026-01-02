import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrms_uis/common/widgets/text/custom_field_heading.dart';

import '../../../common/utils/constants/sizes.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/button/custom_button.dart';
import '../../../common/widgets/custom/custom_section_widget.dart';
import '../../../common/widgets/dropdown/custom_animated_dropdown.dart';
import '../../../common/widgets/dropdown/dropdown_model.dart';
import '../../../common/widgets/text_field/custom_text_field.dart';
import '../bloc/emp_hierarchy_bloc.dart';

class EmpHierarchyAddScreen extends StatelessWidget {
  static const route = "/add_hierarchy";

  const EmpHierarchyAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Add Hierarchy", showBackButton: true),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(AppSizes.padding16),
        child: BlocBuilder<EmpHierarchyBloc, EmpHierarchyState>(
          builder: (context, state) {
            return CustomButton(
              isLoading:
                  state.status == EmpHierarchyStatus.empHierarchyCreateLoading,
              text: "Save Hierarchy",
              onTap: () {
                // context.read<HierarchyBloc>().add(SaveHierarchy());
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.padding16),
        child: BlocConsumer<EmpHierarchyBloc, EmpHierarchyState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                CustomSectionWidget(
                  title: "Hierarchy Details",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFieldHeading(title: "Employee"),
                      CustomAnimatedDropdown<DropdownModel>(
                        initialItem: state.selectedEmployee,
                        hintText: "Select Employee",
                        items: [DropdownModel(id: "1", title: "Abc")],
                        onChanged: (v) {
                          context.read<EmpHierarchyBloc>().add(
                            EmpHierarchyEvent.selectEmployee(v),
                          );
                        },
                      ),

                      const SizedBox(height: AppSizes.space20),

                      CustomFieldHeading(title: "Department"),
                      CustomAnimatedDropdown<DropdownModel>(
                        initialItem: state.selectedEmployee,
                        hintText: "Select Department",
                        items: [DropdownModel(id: "1", title: "Abc")],
                        onChanged: (v) {
                          context.read<EmpHierarchyBloc>().add(
                            EmpHierarchyEvent.selectDepartment(v),
                          );
                        },
                      ),

                      const SizedBox(height: AppSizes.space20),

                      CustomFieldHeading(title: "Project"),
                      CustomAnimatedDropdown<DropdownModel>(
                        initialItem: state.selectedEmployee,
                        hintText: "Select Project",
                        items: [DropdownModel(id: "1", title: "Abc")],
                        onChanged: (v) {
                          context.read<EmpHierarchyBloc>().add(
                            EmpHierarchyEvent.selectProject(v),
                          );
                        },
                      ),
                      const SizedBox(height: AppSizes.space20),

                      CustomFieldHeading(title: "First Level Mgr"),
                      CustomAnimatedDropdown<DropdownModel>(
                        initialItem: state.selectedEmployee,
                        hintText: "Select First Level Manager",
                        items: [DropdownModel(id: "1", title: "Abc")],
                        onChanged: (v) {
                          context.read<EmpHierarchyBloc>().add(
                            EmpHierarchyEvent.selectFirstManager(v),
                          );
                        },
                      ),
                      const SizedBox(height: AppSizes.space20),

                      CustomFieldHeading(title: "Second Level Mgr"),
                      CustomAnimatedDropdown<DropdownModel>(
                        initialItem: state.selectedEmployee,
                        hintText: "Select Second Level Manager",
                        items: [DropdownModel(id: "1", title: "Abc")],
                        onChanged: (v) {
                          context.read<EmpHierarchyBloc>().add(
                            EmpHierarchyEvent.selectSecondManager(v),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.space20),

                CustomSectionWidget(
                  title: "Purpose",
                  child: CustomTextField.outlineBorder(
                    maxLines: 3,
                    hintText: "Enter purpose",
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
