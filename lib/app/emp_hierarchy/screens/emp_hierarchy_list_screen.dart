import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/widgets/appbar/custom_appbar.dart';
import '../../../common/widgets/loader/custom_circular_progress.dart';
import '../../../common/utils/constants/sizes.dart';
import '../bloc/emp_hierarchy_bloc.dart';
import '../widgets/emp_hierarchy_card.dart';
import 'emp_hierarchy_add_screen.dart';

class EmpHierarchyListScreen extends StatelessWidget {
  static const route = "/employee_hierarchy";

  const EmpHierarchyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Employee Hierarchy", showBackButton: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, EmpHierarchyAddScreen.route);
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<EmpHierarchyBloc, EmpHierarchyState>(
        builder: (context, state) {
          log("status ====>> ${state.status}");
          var empHierarchyList =
              state.employeeHierarchyListModel?.hierarchyList ?? [];
          log("status list ====>> $empHierarchyList");
          if (state.status == EmpHierarchyStatus.empHierarchyGetLoading) {
            return const Center(child: CustomCircularProgress());
          }
          return ListView.builder(
            padding: const EdgeInsets.all(AppSizes.padding16),
            itemCount: empHierarchyList.length,
            itemBuilder: (_, i) {
              return EmpHierarchyCard(
                employeeHierarchyItem: empHierarchyList[i],
              );
            },
          );
        },
        listener: (BuildContext context, EmpHierarchyState state) {},
      ),
    );
  }
}
