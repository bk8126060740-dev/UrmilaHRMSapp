import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/widgets/dropdown/dropdown_model.dart';
import '../models/emp_hierarchy_list_model.dart';
import '../repo/emp_hierarchy_repo.dart';

part 'emp_hierarchy_bloc.freezed.dart';

part 'emp_hierarchy_event.dart';

part 'emp_hierarchy_state.dart';

class EmpHierarchyBloc extends Bloc<EmpHierarchyEvent, EmpHierarchyState> {
  EmpHierarchyBloc()
    : super(EmpHierarchyState(empHierarchyRepo: EmpHierarchyRepo())) {
    on<_SelectEmployee>((event, emit) {
      emit(
        state.copyWith(
          selectedEmployee: event.employee,
          status: EmpHierarchyStatus.initial,
        ),
      );
    });

    on<_SelectDepartment>((event, emit) {
      emit(
        state.copyWith(
          selectedDepartment: event.department,
          status: EmpHierarchyStatus.initial,
        ),
      );
    });

    on<_SelectProject>((event, emit) {
      emit(
        state.copyWith(
          selectedProject: event.project,
          status: EmpHierarchyStatus.initial,
        ),
      );
    });

    on<_SelectFirstManager>((event, emit) {
      emit(
        state.copyWith(
          selectedFirstManager: event.firstManager,
          status: EmpHierarchyStatus.initial,
        ),
      );
    });

    on<_SelectSecondManager>((event, emit) {
      emit(
        state.copyWith(
          selectedSecondManager: event.secondManager,
          status: EmpHierarchyStatus.initial,
        ),
      );
    });

    on<_GetEmpHierarchyData>((event, emit) async {
      log("status fetch event ====>> this is called");

      emit(state.copyWith(status: EmpHierarchyStatus.empHierarchyGetLoading));

      // ⏳ Simulate API delay
      await Future.delayed(const Duration(seconds: 2));
      log("status bloc ====>> this is called");

      // 📦 Mock Data
      final mockHierarchyList = <EmployeeHierarchyItem>[
        EmployeeHierarchyItem(
          id: 1,
          employeeName: "Amit Sharma",
          departmentName: "IT",
          projectName: "HRMS",
          firstLevelManagerName: "Rahul Verma",
          secondLevelManagerName: "Neha Singh",
          isActive: true,
        ),
        EmployeeHierarchyItem(
          id: 2,
          employeeName: "Pooja Mehta",
          departmentName: "HR",
          projectName: "Recruitment",
          firstLevelManagerName: "Anjali Patel",
          secondLevelManagerName: null,
          isActive: true,
        ),
        EmployeeHierarchyItem(
          id: 3,
          employeeName: "Rohan Gupta",
          departmentName: "Finance",
          projectName: "Payroll",
          firstLevelManagerName: "Suresh Iyer",
          secondLevelManagerName: "Vikram Rao",
          isActive: false,
        ),
        EmployeeHierarchyItem(
          id: 4,
          employeeName: "Sneha Kulkarni",
          departmentName: "Operations",
          projectName: "Vendor Mgmt",
          firstLevelManagerName: "Kunal Desai",
          secondLevelManagerName: null,
          isActive: true,
        ),
        EmployeeHierarchyItem(
          id: 5,
          employeeName: "Arjun Malhotra",
          departmentName: "Sales",
          projectName: "CRM",
          firstLevelManagerName: "Ritu Khanna",
          secondLevelManagerName: "Mohit Bansal",
          isActive: false,
        ),
      ];
      log("status bloc ====>> $mockHierarchyList");

      emit(
        state.copyWith(
          status: EmpHierarchyStatus.empHierarchyGetSuccess,
          employeeHierarchyListModel: EmployeeHierarchyListModel(
            hierarchyList: mockHierarchyList,
          ),
        ),
      );
    });

    on<_CreateEmpHierarchy>((event, emit) async {
      log("create empHierarchy ====>> this is called");
    });
  }
}
