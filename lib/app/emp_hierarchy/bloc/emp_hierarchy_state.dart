part of 'emp_hierarchy_bloc.dart';

@freezed
class EmpHierarchyState with _$EmpHierarchyState {
  const factory EmpHierarchyState({
    required EmpHierarchyRepo empHierarchyRepo,
    @Default(EmpHierarchyStatus.initial) EmpHierarchyStatus status,
    @Default('') String message,

    EmployeeHierarchyListModel? employeeHierarchyListModel,
    DropdownModel? selectedEmployee,
    DropdownModel? selectedDepartment,
    DropdownModel? selectedProject,
    DropdownModel? selectedFirstManager,
    DropdownModel? selectedSecondManager,
  }) = _EmpHierarchyState;
}

enum EmpHierarchyStatus {
  initial,
  empHierarchyGetLoading,
  empHierarchyGetSuccess,
  empHierarchyGetError,

  empHierarchyCreateLoading,
  empHierarchyCreateSuccess,
  empHierarchyCreateError,
}
