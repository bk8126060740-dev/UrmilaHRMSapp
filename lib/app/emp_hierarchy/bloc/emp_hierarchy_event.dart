part of 'emp_hierarchy_bloc.dart';

@freezed
class EmpHierarchyEvent with _$EmpHierarchyEvent {
  const factory EmpHierarchyEvent.selectEmployee(DropdownModel? employee) =
      _SelectEmployee;

  const factory EmpHierarchyEvent.selectDepartment(DropdownModel? department) =
      _SelectDepartment;

  const factory EmpHierarchyEvent.selectProject(DropdownModel? project) =
      _SelectProject;

  const factory EmpHierarchyEvent.selectFirstManager(
    DropdownModel? firstManager,
  ) = _SelectFirstManager;

  const factory EmpHierarchyEvent.selectSecondManager(
    DropdownModel? secondManager,
  ) = _SelectSecondManager;

  const factory EmpHierarchyEvent.getEmpHierarchyData() = _GetEmpHierarchyData;

  const factory EmpHierarchyEvent.createEmpHierarchy() = _CreateEmpHierarchy;
}
