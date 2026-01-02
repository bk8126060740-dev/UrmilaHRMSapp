// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emp_hierarchy_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmpHierarchyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? employee) selectEmployee,
    required TResult Function(DropdownModel? department) selectDepartment,
    required TResult Function(DropdownModel? project) selectProject,
    required TResult Function(DropdownModel? firstManager) selectFirstManager,
    required TResult Function(DropdownModel? secondManager) selectSecondManager,
    required TResult Function() getEmpHierarchyData,
    required TResult Function() createEmpHierarchy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? employee)? selectEmployee,
    TResult? Function(DropdownModel? department)? selectDepartment,
    TResult? Function(DropdownModel? project)? selectProject,
    TResult? Function(DropdownModel? firstManager)? selectFirstManager,
    TResult? Function(DropdownModel? secondManager)? selectSecondManager,
    TResult? Function()? getEmpHierarchyData,
    TResult? Function()? createEmpHierarchy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? employee)? selectEmployee,
    TResult Function(DropdownModel? department)? selectDepartment,
    TResult Function(DropdownModel? project)? selectProject,
    TResult Function(DropdownModel? firstManager)? selectFirstManager,
    TResult Function(DropdownModel? secondManager)? selectSecondManager,
    TResult Function()? getEmpHierarchyData,
    TResult Function()? createEmpHierarchy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_SelectDepartment value) selectDepartment,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_SelectFirstManager value) selectFirstManager,
    required TResult Function(_SelectSecondManager value) selectSecondManager,
    required TResult Function(_GetEmpHierarchyData value) getEmpHierarchyData,
    required TResult Function(_CreateEmpHierarchy value) createEmpHierarchy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_SelectDepartment value)? selectDepartment,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_SelectFirstManager value)? selectFirstManager,
    TResult? Function(_SelectSecondManager value)? selectSecondManager,
    TResult? Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult? Function(_CreateEmpHierarchy value)? createEmpHierarchy,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_SelectDepartment value)? selectDepartment,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_SelectFirstManager value)? selectFirstManager,
    TResult Function(_SelectSecondManager value)? selectSecondManager,
    TResult Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult Function(_CreateEmpHierarchy value)? createEmpHierarchy,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmpHierarchyEventCopyWith<$Res> {
  factory $EmpHierarchyEventCopyWith(
          EmpHierarchyEvent value, $Res Function(EmpHierarchyEvent) then) =
      _$EmpHierarchyEventCopyWithImpl<$Res, EmpHierarchyEvent>;
}

/// @nodoc
class _$EmpHierarchyEventCopyWithImpl<$Res, $Val extends EmpHierarchyEvent>
    implements $EmpHierarchyEventCopyWith<$Res> {
  _$EmpHierarchyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SelectEmployeeImplCopyWith<$Res> {
  factory _$$SelectEmployeeImplCopyWith(_$SelectEmployeeImpl value,
          $Res Function(_$SelectEmployeeImpl) then) =
      __$$SelectEmployeeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DropdownModel? employee});
}

/// @nodoc
class __$$SelectEmployeeImplCopyWithImpl<$Res>
    extends _$EmpHierarchyEventCopyWithImpl<$Res, _$SelectEmployeeImpl>
    implements _$$SelectEmployeeImplCopyWith<$Res> {
  __$$SelectEmployeeImplCopyWithImpl(
      _$SelectEmployeeImpl _value, $Res Function(_$SelectEmployeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employee = freezed,
  }) {
    return _then(_$SelectEmployeeImpl(
      freezed == employee
          ? _value.employee
          : employee // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$SelectEmployeeImpl implements _SelectEmployee {
  const _$SelectEmployeeImpl(this.employee);

  @override
  final DropdownModel? employee;

  @override
  String toString() {
    return 'EmpHierarchyEvent.selectEmployee(employee: $employee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectEmployeeImpl &&
            (identical(other.employee, employee) ||
                other.employee == employee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectEmployeeImplCopyWith<_$SelectEmployeeImpl> get copyWith =>
      __$$SelectEmployeeImplCopyWithImpl<_$SelectEmployeeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? employee) selectEmployee,
    required TResult Function(DropdownModel? department) selectDepartment,
    required TResult Function(DropdownModel? project) selectProject,
    required TResult Function(DropdownModel? firstManager) selectFirstManager,
    required TResult Function(DropdownModel? secondManager) selectSecondManager,
    required TResult Function() getEmpHierarchyData,
    required TResult Function() createEmpHierarchy,
  }) {
    return selectEmployee(employee);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? employee)? selectEmployee,
    TResult? Function(DropdownModel? department)? selectDepartment,
    TResult? Function(DropdownModel? project)? selectProject,
    TResult? Function(DropdownModel? firstManager)? selectFirstManager,
    TResult? Function(DropdownModel? secondManager)? selectSecondManager,
    TResult? Function()? getEmpHierarchyData,
    TResult? Function()? createEmpHierarchy,
  }) {
    return selectEmployee?.call(employee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? employee)? selectEmployee,
    TResult Function(DropdownModel? department)? selectDepartment,
    TResult Function(DropdownModel? project)? selectProject,
    TResult Function(DropdownModel? firstManager)? selectFirstManager,
    TResult Function(DropdownModel? secondManager)? selectSecondManager,
    TResult Function()? getEmpHierarchyData,
    TResult Function()? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectEmployee != null) {
      return selectEmployee(employee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_SelectDepartment value) selectDepartment,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_SelectFirstManager value) selectFirstManager,
    required TResult Function(_SelectSecondManager value) selectSecondManager,
    required TResult Function(_GetEmpHierarchyData value) getEmpHierarchyData,
    required TResult Function(_CreateEmpHierarchy value) createEmpHierarchy,
  }) {
    return selectEmployee(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_SelectDepartment value)? selectDepartment,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_SelectFirstManager value)? selectFirstManager,
    TResult? Function(_SelectSecondManager value)? selectSecondManager,
    TResult? Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult? Function(_CreateEmpHierarchy value)? createEmpHierarchy,
  }) {
    return selectEmployee?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_SelectDepartment value)? selectDepartment,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_SelectFirstManager value)? selectFirstManager,
    TResult Function(_SelectSecondManager value)? selectSecondManager,
    TResult Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult Function(_CreateEmpHierarchy value)? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectEmployee != null) {
      return selectEmployee(this);
    }
    return orElse();
  }
}

abstract class _SelectEmployee implements EmpHierarchyEvent {
  const factory _SelectEmployee(final DropdownModel? employee) =
      _$SelectEmployeeImpl;

  DropdownModel? get employee;
  @JsonKey(ignore: true)
  _$$SelectEmployeeImplCopyWith<_$SelectEmployeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectDepartmentImplCopyWith<$Res> {
  factory _$$SelectDepartmentImplCopyWith(_$SelectDepartmentImpl value,
          $Res Function(_$SelectDepartmentImpl) then) =
      __$$SelectDepartmentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DropdownModel? department});
}

/// @nodoc
class __$$SelectDepartmentImplCopyWithImpl<$Res>
    extends _$EmpHierarchyEventCopyWithImpl<$Res, _$SelectDepartmentImpl>
    implements _$$SelectDepartmentImplCopyWith<$Res> {
  __$$SelectDepartmentImplCopyWithImpl(_$SelectDepartmentImpl _value,
      $Res Function(_$SelectDepartmentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? department = freezed,
  }) {
    return _then(_$SelectDepartmentImpl(
      freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$SelectDepartmentImpl implements _SelectDepartment {
  const _$SelectDepartmentImpl(this.department);

  @override
  final DropdownModel? department;

  @override
  String toString() {
    return 'EmpHierarchyEvent.selectDepartment(department: $department)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectDepartmentImpl &&
            (identical(other.department, department) ||
                other.department == department));
  }

  @override
  int get hashCode => Object.hash(runtimeType, department);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectDepartmentImplCopyWith<_$SelectDepartmentImpl> get copyWith =>
      __$$SelectDepartmentImplCopyWithImpl<_$SelectDepartmentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? employee) selectEmployee,
    required TResult Function(DropdownModel? department) selectDepartment,
    required TResult Function(DropdownModel? project) selectProject,
    required TResult Function(DropdownModel? firstManager) selectFirstManager,
    required TResult Function(DropdownModel? secondManager) selectSecondManager,
    required TResult Function() getEmpHierarchyData,
    required TResult Function() createEmpHierarchy,
  }) {
    return selectDepartment(department);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? employee)? selectEmployee,
    TResult? Function(DropdownModel? department)? selectDepartment,
    TResult? Function(DropdownModel? project)? selectProject,
    TResult? Function(DropdownModel? firstManager)? selectFirstManager,
    TResult? Function(DropdownModel? secondManager)? selectSecondManager,
    TResult? Function()? getEmpHierarchyData,
    TResult? Function()? createEmpHierarchy,
  }) {
    return selectDepartment?.call(department);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? employee)? selectEmployee,
    TResult Function(DropdownModel? department)? selectDepartment,
    TResult Function(DropdownModel? project)? selectProject,
    TResult Function(DropdownModel? firstManager)? selectFirstManager,
    TResult Function(DropdownModel? secondManager)? selectSecondManager,
    TResult Function()? getEmpHierarchyData,
    TResult Function()? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectDepartment != null) {
      return selectDepartment(department);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_SelectDepartment value) selectDepartment,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_SelectFirstManager value) selectFirstManager,
    required TResult Function(_SelectSecondManager value) selectSecondManager,
    required TResult Function(_GetEmpHierarchyData value) getEmpHierarchyData,
    required TResult Function(_CreateEmpHierarchy value) createEmpHierarchy,
  }) {
    return selectDepartment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_SelectDepartment value)? selectDepartment,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_SelectFirstManager value)? selectFirstManager,
    TResult? Function(_SelectSecondManager value)? selectSecondManager,
    TResult? Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult? Function(_CreateEmpHierarchy value)? createEmpHierarchy,
  }) {
    return selectDepartment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_SelectDepartment value)? selectDepartment,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_SelectFirstManager value)? selectFirstManager,
    TResult Function(_SelectSecondManager value)? selectSecondManager,
    TResult Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult Function(_CreateEmpHierarchy value)? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectDepartment != null) {
      return selectDepartment(this);
    }
    return orElse();
  }
}

abstract class _SelectDepartment implements EmpHierarchyEvent {
  const factory _SelectDepartment(final DropdownModel? department) =
      _$SelectDepartmentImpl;

  DropdownModel? get department;
  @JsonKey(ignore: true)
  _$$SelectDepartmentImplCopyWith<_$SelectDepartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectProjectImplCopyWith<$Res> {
  factory _$$SelectProjectImplCopyWith(
          _$SelectProjectImpl value, $Res Function(_$SelectProjectImpl) then) =
      __$$SelectProjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DropdownModel? project});
}

/// @nodoc
class __$$SelectProjectImplCopyWithImpl<$Res>
    extends _$EmpHierarchyEventCopyWithImpl<$Res, _$SelectProjectImpl>
    implements _$$SelectProjectImplCopyWith<$Res> {
  __$$SelectProjectImplCopyWithImpl(
      _$SelectProjectImpl _value, $Res Function(_$SelectProjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$SelectProjectImpl(
      freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$SelectProjectImpl implements _SelectProject {
  const _$SelectProjectImpl(this.project);

  @override
  final DropdownModel? project;

  @override
  String toString() {
    return 'EmpHierarchyEvent.selectProject(project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectProjectImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectProjectImplCopyWith<_$SelectProjectImpl> get copyWith =>
      __$$SelectProjectImplCopyWithImpl<_$SelectProjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? employee) selectEmployee,
    required TResult Function(DropdownModel? department) selectDepartment,
    required TResult Function(DropdownModel? project) selectProject,
    required TResult Function(DropdownModel? firstManager) selectFirstManager,
    required TResult Function(DropdownModel? secondManager) selectSecondManager,
    required TResult Function() getEmpHierarchyData,
    required TResult Function() createEmpHierarchy,
  }) {
    return selectProject(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? employee)? selectEmployee,
    TResult? Function(DropdownModel? department)? selectDepartment,
    TResult? Function(DropdownModel? project)? selectProject,
    TResult? Function(DropdownModel? firstManager)? selectFirstManager,
    TResult? Function(DropdownModel? secondManager)? selectSecondManager,
    TResult? Function()? getEmpHierarchyData,
    TResult? Function()? createEmpHierarchy,
  }) {
    return selectProject?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? employee)? selectEmployee,
    TResult Function(DropdownModel? department)? selectDepartment,
    TResult Function(DropdownModel? project)? selectProject,
    TResult Function(DropdownModel? firstManager)? selectFirstManager,
    TResult Function(DropdownModel? secondManager)? selectSecondManager,
    TResult Function()? getEmpHierarchyData,
    TResult Function()? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_SelectDepartment value) selectDepartment,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_SelectFirstManager value) selectFirstManager,
    required TResult Function(_SelectSecondManager value) selectSecondManager,
    required TResult Function(_GetEmpHierarchyData value) getEmpHierarchyData,
    required TResult Function(_CreateEmpHierarchy value) createEmpHierarchy,
  }) {
    return selectProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_SelectDepartment value)? selectDepartment,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_SelectFirstManager value)? selectFirstManager,
    TResult? Function(_SelectSecondManager value)? selectSecondManager,
    TResult? Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult? Function(_CreateEmpHierarchy value)? createEmpHierarchy,
  }) {
    return selectProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_SelectDepartment value)? selectDepartment,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_SelectFirstManager value)? selectFirstManager,
    TResult Function(_SelectSecondManager value)? selectSecondManager,
    TResult Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult Function(_CreateEmpHierarchy value)? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(this);
    }
    return orElse();
  }
}

abstract class _SelectProject implements EmpHierarchyEvent {
  const factory _SelectProject(final DropdownModel? project) =
      _$SelectProjectImpl;

  DropdownModel? get project;
  @JsonKey(ignore: true)
  _$$SelectProjectImplCopyWith<_$SelectProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectFirstManagerImplCopyWith<$Res> {
  factory _$$SelectFirstManagerImplCopyWith(_$SelectFirstManagerImpl value,
          $Res Function(_$SelectFirstManagerImpl) then) =
      __$$SelectFirstManagerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DropdownModel? firstManager});
}

/// @nodoc
class __$$SelectFirstManagerImplCopyWithImpl<$Res>
    extends _$EmpHierarchyEventCopyWithImpl<$Res, _$SelectFirstManagerImpl>
    implements _$$SelectFirstManagerImplCopyWith<$Res> {
  __$$SelectFirstManagerImplCopyWithImpl(_$SelectFirstManagerImpl _value,
      $Res Function(_$SelectFirstManagerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstManager = freezed,
  }) {
    return _then(_$SelectFirstManagerImpl(
      freezed == firstManager
          ? _value.firstManager
          : firstManager // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$SelectFirstManagerImpl implements _SelectFirstManager {
  const _$SelectFirstManagerImpl(this.firstManager);

  @override
  final DropdownModel? firstManager;

  @override
  String toString() {
    return 'EmpHierarchyEvent.selectFirstManager(firstManager: $firstManager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectFirstManagerImpl &&
            (identical(other.firstManager, firstManager) ||
                other.firstManager == firstManager));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstManager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectFirstManagerImplCopyWith<_$SelectFirstManagerImpl> get copyWith =>
      __$$SelectFirstManagerImplCopyWithImpl<_$SelectFirstManagerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? employee) selectEmployee,
    required TResult Function(DropdownModel? department) selectDepartment,
    required TResult Function(DropdownModel? project) selectProject,
    required TResult Function(DropdownModel? firstManager) selectFirstManager,
    required TResult Function(DropdownModel? secondManager) selectSecondManager,
    required TResult Function() getEmpHierarchyData,
    required TResult Function() createEmpHierarchy,
  }) {
    return selectFirstManager(firstManager);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? employee)? selectEmployee,
    TResult? Function(DropdownModel? department)? selectDepartment,
    TResult? Function(DropdownModel? project)? selectProject,
    TResult? Function(DropdownModel? firstManager)? selectFirstManager,
    TResult? Function(DropdownModel? secondManager)? selectSecondManager,
    TResult? Function()? getEmpHierarchyData,
    TResult? Function()? createEmpHierarchy,
  }) {
    return selectFirstManager?.call(firstManager);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? employee)? selectEmployee,
    TResult Function(DropdownModel? department)? selectDepartment,
    TResult Function(DropdownModel? project)? selectProject,
    TResult Function(DropdownModel? firstManager)? selectFirstManager,
    TResult Function(DropdownModel? secondManager)? selectSecondManager,
    TResult Function()? getEmpHierarchyData,
    TResult Function()? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectFirstManager != null) {
      return selectFirstManager(firstManager);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_SelectDepartment value) selectDepartment,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_SelectFirstManager value) selectFirstManager,
    required TResult Function(_SelectSecondManager value) selectSecondManager,
    required TResult Function(_GetEmpHierarchyData value) getEmpHierarchyData,
    required TResult Function(_CreateEmpHierarchy value) createEmpHierarchy,
  }) {
    return selectFirstManager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_SelectDepartment value)? selectDepartment,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_SelectFirstManager value)? selectFirstManager,
    TResult? Function(_SelectSecondManager value)? selectSecondManager,
    TResult? Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult? Function(_CreateEmpHierarchy value)? createEmpHierarchy,
  }) {
    return selectFirstManager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_SelectDepartment value)? selectDepartment,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_SelectFirstManager value)? selectFirstManager,
    TResult Function(_SelectSecondManager value)? selectSecondManager,
    TResult Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult Function(_CreateEmpHierarchy value)? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectFirstManager != null) {
      return selectFirstManager(this);
    }
    return orElse();
  }
}

abstract class _SelectFirstManager implements EmpHierarchyEvent {
  const factory _SelectFirstManager(final DropdownModel? firstManager) =
      _$SelectFirstManagerImpl;

  DropdownModel? get firstManager;
  @JsonKey(ignore: true)
  _$$SelectFirstManagerImplCopyWith<_$SelectFirstManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectSecondManagerImplCopyWith<$Res> {
  factory _$$SelectSecondManagerImplCopyWith(_$SelectSecondManagerImpl value,
          $Res Function(_$SelectSecondManagerImpl) then) =
      __$$SelectSecondManagerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DropdownModel? secondManager});
}

/// @nodoc
class __$$SelectSecondManagerImplCopyWithImpl<$Res>
    extends _$EmpHierarchyEventCopyWithImpl<$Res, _$SelectSecondManagerImpl>
    implements _$$SelectSecondManagerImplCopyWith<$Res> {
  __$$SelectSecondManagerImplCopyWithImpl(_$SelectSecondManagerImpl _value,
      $Res Function(_$SelectSecondManagerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secondManager = freezed,
  }) {
    return _then(_$SelectSecondManagerImpl(
      freezed == secondManager
          ? _value.secondManager
          : secondManager // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$SelectSecondManagerImpl implements _SelectSecondManager {
  const _$SelectSecondManagerImpl(this.secondManager);

  @override
  final DropdownModel? secondManager;

  @override
  String toString() {
    return 'EmpHierarchyEvent.selectSecondManager(secondManager: $secondManager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectSecondManagerImpl &&
            (identical(other.secondManager, secondManager) ||
                other.secondManager == secondManager));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secondManager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectSecondManagerImplCopyWith<_$SelectSecondManagerImpl> get copyWith =>
      __$$SelectSecondManagerImplCopyWithImpl<_$SelectSecondManagerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? employee) selectEmployee,
    required TResult Function(DropdownModel? department) selectDepartment,
    required TResult Function(DropdownModel? project) selectProject,
    required TResult Function(DropdownModel? firstManager) selectFirstManager,
    required TResult Function(DropdownModel? secondManager) selectSecondManager,
    required TResult Function() getEmpHierarchyData,
    required TResult Function() createEmpHierarchy,
  }) {
    return selectSecondManager(secondManager);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? employee)? selectEmployee,
    TResult? Function(DropdownModel? department)? selectDepartment,
    TResult? Function(DropdownModel? project)? selectProject,
    TResult? Function(DropdownModel? firstManager)? selectFirstManager,
    TResult? Function(DropdownModel? secondManager)? selectSecondManager,
    TResult? Function()? getEmpHierarchyData,
    TResult? Function()? createEmpHierarchy,
  }) {
    return selectSecondManager?.call(secondManager);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? employee)? selectEmployee,
    TResult Function(DropdownModel? department)? selectDepartment,
    TResult Function(DropdownModel? project)? selectProject,
    TResult Function(DropdownModel? firstManager)? selectFirstManager,
    TResult Function(DropdownModel? secondManager)? selectSecondManager,
    TResult Function()? getEmpHierarchyData,
    TResult Function()? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectSecondManager != null) {
      return selectSecondManager(secondManager);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_SelectDepartment value) selectDepartment,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_SelectFirstManager value) selectFirstManager,
    required TResult Function(_SelectSecondManager value) selectSecondManager,
    required TResult Function(_GetEmpHierarchyData value) getEmpHierarchyData,
    required TResult Function(_CreateEmpHierarchy value) createEmpHierarchy,
  }) {
    return selectSecondManager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_SelectDepartment value)? selectDepartment,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_SelectFirstManager value)? selectFirstManager,
    TResult? Function(_SelectSecondManager value)? selectSecondManager,
    TResult? Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult? Function(_CreateEmpHierarchy value)? createEmpHierarchy,
  }) {
    return selectSecondManager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_SelectDepartment value)? selectDepartment,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_SelectFirstManager value)? selectFirstManager,
    TResult Function(_SelectSecondManager value)? selectSecondManager,
    TResult Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult Function(_CreateEmpHierarchy value)? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (selectSecondManager != null) {
      return selectSecondManager(this);
    }
    return orElse();
  }
}

abstract class _SelectSecondManager implements EmpHierarchyEvent {
  const factory _SelectSecondManager(final DropdownModel? secondManager) =
      _$SelectSecondManagerImpl;

  DropdownModel? get secondManager;
  @JsonKey(ignore: true)
  _$$SelectSecondManagerImplCopyWith<_$SelectSecondManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetEmpHierarchyDataImplCopyWith<$Res> {
  factory _$$GetEmpHierarchyDataImplCopyWith(_$GetEmpHierarchyDataImpl value,
          $Res Function(_$GetEmpHierarchyDataImpl) then) =
      __$$GetEmpHierarchyDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetEmpHierarchyDataImplCopyWithImpl<$Res>
    extends _$EmpHierarchyEventCopyWithImpl<$Res, _$GetEmpHierarchyDataImpl>
    implements _$$GetEmpHierarchyDataImplCopyWith<$Res> {
  __$$GetEmpHierarchyDataImplCopyWithImpl(_$GetEmpHierarchyDataImpl _value,
      $Res Function(_$GetEmpHierarchyDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetEmpHierarchyDataImpl implements _GetEmpHierarchyData {
  const _$GetEmpHierarchyDataImpl();

  @override
  String toString() {
    return 'EmpHierarchyEvent.getEmpHierarchyData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetEmpHierarchyDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? employee) selectEmployee,
    required TResult Function(DropdownModel? department) selectDepartment,
    required TResult Function(DropdownModel? project) selectProject,
    required TResult Function(DropdownModel? firstManager) selectFirstManager,
    required TResult Function(DropdownModel? secondManager) selectSecondManager,
    required TResult Function() getEmpHierarchyData,
    required TResult Function() createEmpHierarchy,
  }) {
    return getEmpHierarchyData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? employee)? selectEmployee,
    TResult? Function(DropdownModel? department)? selectDepartment,
    TResult? Function(DropdownModel? project)? selectProject,
    TResult? Function(DropdownModel? firstManager)? selectFirstManager,
    TResult? Function(DropdownModel? secondManager)? selectSecondManager,
    TResult? Function()? getEmpHierarchyData,
    TResult? Function()? createEmpHierarchy,
  }) {
    return getEmpHierarchyData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? employee)? selectEmployee,
    TResult Function(DropdownModel? department)? selectDepartment,
    TResult Function(DropdownModel? project)? selectProject,
    TResult Function(DropdownModel? firstManager)? selectFirstManager,
    TResult Function(DropdownModel? secondManager)? selectSecondManager,
    TResult Function()? getEmpHierarchyData,
    TResult Function()? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (getEmpHierarchyData != null) {
      return getEmpHierarchyData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_SelectDepartment value) selectDepartment,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_SelectFirstManager value) selectFirstManager,
    required TResult Function(_SelectSecondManager value) selectSecondManager,
    required TResult Function(_GetEmpHierarchyData value) getEmpHierarchyData,
    required TResult Function(_CreateEmpHierarchy value) createEmpHierarchy,
  }) {
    return getEmpHierarchyData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_SelectDepartment value)? selectDepartment,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_SelectFirstManager value)? selectFirstManager,
    TResult? Function(_SelectSecondManager value)? selectSecondManager,
    TResult? Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult? Function(_CreateEmpHierarchy value)? createEmpHierarchy,
  }) {
    return getEmpHierarchyData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_SelectDepartment value)? selectDepartment,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_SelectFirstManager value)? selectFirstManager,
    TResult Function(_SelectSecondManager value)? selectSecondManager,
    TResult Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult Function(_CreateEmpHierarchy value)? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (getEmpHierarchyData != null) {
      return getEmpHierarchyData(this);
    }
    return orElse();
  }
}

abstract class _GetEmpHierarchyData implements EmpHierarchyEvent {
  const factory _GetEmpHierarchyData() = _$GetEmpHierarchyDataImpl;
}

/// @nodoc
abstract class _$$CreateEmpHierarchyImplCopyWith<$Res> {
  factory _$$CreateEmpHierarchyImplCopyWith(_$CreateEmpHierarchyImpl value,
          $Res Function(_$CreateEmpHierarchyImpl) then) =
      __$$CreateEmpHierarchyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateEmpHierarchyImplCopyWithImpl<$Res>
    extends _$EmpHierarchyEventCopyWithImpl<$Res, _$CreateEmpHierarchyImpl>
    implements _$$CreateEmpHierarchyImplCopyWith<$Res> {
  __$$CreateEmpHierarchyImplCopyWithImpl(_$CreateEmpHierarchyImpl _value,
      $Res Function(_$CreateEmpHierarchyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateEmpHierarchyImpl implements _CreateEmpHierarchy {
  const _$CreateEmpHierarchyImpl();

  @override
  String toString() {
    return 'EmpHierarchyEvent.createEmpHierarchy()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateEmpHierarchyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? employee) selectEmployee,
    required TResult Function(DropdownModel? department) selectDepartment,
    required TResult Function(DropdownModel? project) selectProject,
    required TResult Function(DropdownModel? firstManager) selectFirstManager,
    required TResult Function(DropdownModel? secondManager) selectSecondManager,
    required TResult Function() getEmpHierarchyData,
    required TResult Function() createEmpHierarchy,
  }) {
    return createEmpHierarchy();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? employee)? selectEmployee,
    TResult? Function(DropdownModel? department)? selectDepartment,
    TResult? Function(DropdownModel? project)? selectProject,
    TResult? Function(DropdownModel? firstManager)? selectFirstManager,
    TResult? Function(DropdownModel? secondManager)? selectSecondManager,
    TResult? Function()? getEmpHierarchyData,
    TResult? Function()? createEmpHierarchy,
  }) {
    return createEmpHierarchy?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? employee)? selectEmployee,
    TResult Function(DropdownModel? department)? selectDepartment,
    TResult Function(DropdownModel? project)? selectProject,
    TResult Function(DropdownModel? firstManager)? selectFirstManager,
    TResult Function(DropdownModel? secondManager)? selectSecondManager,
    TResult Function()? getEmpHierarchyData,
    TResult Function()? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (createEmpHierarchy != null) {
      return createEmpHierarchy();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectEmployee value) selectEmployee,
    required TResult Function(_SelectDepartment value) selectDepartment,
    required TResult Function(_SelectProject value) selectProject,
    required TResult Function(_SelectFirstManager value) selectFirstManager,
    required TResult Function(_SelectSecondManager value) selectSecondManager,
    required TResult Function(_GetEmpHierarchyData value) getEmpHierarchyData,
    required TResult Function(_CreateEmpHierarchy value) createEmpHierarchy,
  }) {
    return createEmpHierarchy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectEmployee value)? selectEmployee,
    TResult? Function(_SelectDepartment value)? selectDepartment,
    TResult? Function(_SelectProject value)? selectProject,
    TResult? Function(_SelectFirstManager value)? selectFirstManager,
    TResult? Function(_SelectSecondManager value)? selectSecondManager,
    TResult? Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult? Function(_CreateEmpHierarchy value)? createEmpHierarchy,
  }) {
    return createEmpHierarchy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectEmployee value)? selectEmployee,
    TResult Function(_SelectDepartment value)? selectDepartment,
    TResult Function(_SelectProject value)? selectProject,
    TResult Function(_SelectFirstManager value)? selectFirstManager,
    TResult Function(_SelectSecondManager value)? selectSecondManager,
    TResult Function(_GetEmpHierarchyData value)? getEmpHierarchyData,
    TResult Function(_CreateEmpHierarchy value)? createEmpHierarchy,
    required TResult orElse(),
  }) {
    if (createEmpHierarchy != null) {
      return createEmpHierarchy(this);
    }
    return orElse();
  }
}

abstract class _CreateEmpHierarchy implements EmpHierarchyEvent {
  const factory _CreateEmpHierarchy() = _$CreateEmpHierarchyImpl;
}

/// @nodoc
mixin _$EmpHierarchyState {
  EmpHierarchyRepo get empHierarchyRepo => throw _privateConstructorUsedError;
  EmpHierarchyStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  EmployeeHierarchyListModel? get employeeHierarchyListModel =>
      throw _privateConstructorUsedError;
  DropdownModel? get selectedEmployee => throw _privateConstructorUsedError;
  DropdownModel? get selectedDepartment => throw _privateConstructorUsedError;
  DropdownModel? get selectedProject => throw _privateConstructorUsedError;
  DropdownModel? get selectedFirstManager => throw _privateConstructorUsedError;
  DropdownModel? get selectedSecondManager =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmpHierarchyStateCopyWith<EmpHierarchyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmpHierarchyStateCopyWith<$Res> {
  factory $EmpHierarchyStateCopyWith(
          EmpHierarchyState value, $Res Function(EmpHierarchyState) then) =
      _$EmpHierarchyStateCopyWithImpl<$Res, EmpHierarchyState>;
  @useResult
  $Res call(
      {EmpHierarchyRepo empHierarchyRepo,
      EmpHierarchyStatus status,
      String message,
      EmployeeHierarchyListModel? employeeHierarchyListModel,
      DropdownModel? selectedEmployee,
      DropdownModel? selectedDepartment,
      DropdownModel? selectedProject,
      DropdownModel? selectedFirstManager,
      DropdownModel? selectedSecondManager});
}

/// @nodoc
class _$EmpHierarchyStateCopyWithImpl<$Res, $Val extends EmpHierarchyState>
    implements $EmpHierarchyStateCopyWith<$Res> {
  _$EmpHierarchyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empHierarchyRepo = null,
    Object? status = null,
    Object? message = null,
    Object? employeeHierarchyListModel = freezed,
    Object? selectedEmployee = freezed,
    Object? selectedDepartment = freezed,
    Object? selectedProject = freezed,
    Object? selectedFirstManager = freezed,
    Object? selectedSecondManager = freezed,
  }) {
    return _then(_value.copyWith(
      empHierarchyRepo: null == empHierarchyRepo
          ? _value.empHierarchyRepo
          : empHierarchyRepo // ignore: cast_nullable_to_non_nullable
              as EmpHierarchyRepo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmpHierarchyStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      employeeHierarchyListModel: freezed == employeeHierarchyListModel
          ? _value.employeeHierarchyListModel
          : employeeHierarchyListModel // ignore: cast_nullable_to_non_nullable
              as EmployeeHierarchyListModel?,
      selectedEmployee: freezed == selectedEmployee
          ? _value.selectedEmployee
          : selectedEmployee // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedDepartment: freezed == selectedDepartment
          ? _value.selectedDepartment
          : selectedDepartment // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedProject: freezed == selectedProject
          ? _value.selectedProject
          : selectedProject // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedFirstManager: freezed == selectedFirstManager
          ? _value.selectedFirstManager
          : selectedFirstManager // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedSecondManager: freezed == selectedSecondManager
          ? _value.selectedSecondManager
          : selectedSecondManager // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmpHierarchyStateImplCopyWith<$Res>
    implements $EmpHierarchyStateCopyWith<$Res> {
  factory _$$EmpHierarchyStateImplCopyWith(_$EmpHierarchyStateImpl value,
          $Res Function(_$EmpHierarchyStateImpl) then) =
      __$$EmpHierarchyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EmpHierarchyRepo empHierarchyRepo,
      EmpHierarchyStatus status,
      String message,
      EmployeeHierarchyListModel? employeeHierarchyListModel,
      DropdownModel? selectedEmployee,
      DropdownModel? selectedDepartment,
      DropdownModel? selectedProject,
      DropdownModel? selectedFirstManager,
      DropdownModel? selectedSecondManager});
}

/// @nodoc
class __$$EmpHierarchyStateImplCopyWithImpl<$Res>
    extends _$EmpHierarchyStateCopyWithImpl<$Res, _$EmpHierarchyStateImpl>
    implements _$$EmpHierarchyStateImplCopyWith<$Res> {
  __$$EmpHierarchyStateImplCopyWithImpl(_$EmpHierarchyStateImpl _value,
      $Res Function(_$EmpHierarchyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? empHierarchyRepo = null,
    Object? status = null,
    Object? message = null,
    Object? employeeHierarchyListModel = freezed,
    Object? selectedEmployee = freezed,
    Object? selectedDepartment = freezed,
    Object? selectedProject = freezed,
    Object? selectedFirstManager = freezed,
    Object? selectedSecondManager = freezed,
  }) {
    return _then(_$EmpHierarchyStateImpl(
      empHierarchyRepo: null == empHierarchyRepo
          ? _value.empHierarchyRepo
          : empHierarchyRepo // ignore: cast_nullable_to_non_nullable
              as EmpHierarchyRepo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EmpHierarchyStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      employeeHierarchyListModel: freezed == employeeHierarchyListModel
          ? _value.employeeHierarchyListModel
          : employeeHierarchyListModel // ignore: cast_nullable_to_non_nullable
              as EmployeeHierarchyListModel?,
      selectedEmployee: freezed == selectedEmployee
          ? _value.selectedEmployee
          : selectedEmployee // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedDepartment: freezed == selectedDepartment
          ? _value.selectedDepartment
          : selectedDepartment // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedProject: freezed == selectedProject
          ? _value.selectedProject
          : selectedProject // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedFirstManager: freezed == selectedFirstManager
          ? _value.selectedFirstManager
          : selectedFirstManager // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedSecondManager: freezed == selectedSecondManager
          ? _value.selectedSecondManager
          : selectedSecondManager // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$EmpHierarchyStateImpl implements _EmpHierarchyState {
  const _$EmpHierarchyStateImpl(
      {required this.empHierarchyRepo,
      this.status = EmpHierarchyStatus.initial,
      this.message = '',
      this.employeeHierarchyListModel,
      this.selectedEmployee,
      this.selectedDepartment,
      this.selectedProject,
      this.selectedFirstManager,
      this.selectedSecondManager});

  @override
  final EmpHierarchyRepo empHierarchyRepo;
  @override
  @JsonKey()
  final EmpHierarchyStatus status;
  @override
  @JsonKey()
  final String message;
  @override
  final EmployeeHierarchyListModel? employeeHierarchyListModel;
  @override
  final DropdownModel? selectedEmployee;
  @override
  final DropdownModel? selectedDepartment;
  @override
  final DropdownModel? selectedProject;
  @override
  final DropdownModel? selectedFirstManager;
  @override
  final DropdownModel? selectedSecondManager;

  @override
  String toString() {
    return 'EmpHierarchyState(empHierarchyRepo: $empHierarchyRepo, status: $status, message: $message, employeeHierarchyListModel: $employeeHierarchyListModel, selectedEmployee: $selectedEmployee, selectedDepartment: $selectedDepartment, selectedProject: $selectedProject, selectedFirstManager: $selectedFirstManager, selectedSecondManager: $selectedSecondManager)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmpHierarchyStateImpl &&
            (identical(other.empHierarchyRepo, empHierarchyRepo) ||
                other.empHierarchyRepo == empHierarchyRepo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.employeeHierarchyListModel,
                    employeeHierarchyListModel) ||
                other.employeeHierarchyListModel ==
                    employeeHierarchyListModel) &&
            (identical(other.selectedEmployee, selectedEmployee) ||
                other.selectedEmployee == selectedEmployee) &&
            (identical(other.selectedDepartment, selectedDepartment) ||
                other.selectedDepartment == selectedDepartment) &&
            (identical(other.selectedProject, selectedProject) ||
                other.selectedProject == selectedProject) &&
            (identical(other.selectedFirstManager, selectedFirstManager) ||
                other.selectedFirstManager == selectedFirstManager) &&
            (identical(other.selectedSecondManager, selectedSecondManager) ||
                other.selectedSecondManager == selectedSecondManager));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      empHierarchyRepo,
      status,
      message,
      employeeHierarchyListModel,
      selectedEmployee,
      selectedDepartment,
      selectedProject,
      selectedFirstManager,
      selectedSecondManager);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmpHierarchyStateImplCopyWith<_$EmpHierarchyStateImpl> get copyWith =>
      __$$EmpHierarchyStateImplCopyWithImpl<_$EmpHierarchyStateImpl>(
          this, _$identity);
}

abstract class _EmpHierarchyState implements EmpHierarchyState {
  const factory _EmpHierarchyState(
      {required final EmpHierarchyRepo empHierarchyRepo,
      final EmpHierarchyStatus status,
      final String message,
      final EmployeeHierarchyListModel? employeeHierarchyListModel,
      final DropdownModel? selectedEmployee,
      final DropdownModel? selectedDepartment,
      final DropdownModel? selectedProject,
      final DropdownModel? selectedFirstManager,
      final DropdownModel? selectedSecondManager}) = _$EmpHierarchyStateImpl;

  @override
  EmpHierarchyRepo get empHierarchyRepo;
  @override
  EmpHierarchyStatus get status;
  @override
  String get message;
  @override
  EmployeeHierarchyListModel? get employeeHierarchyListModel;
  @override
  DropdownModel? get selectedEmployee;
  @override
  DropdownModel? get selectedDepartment;
  @override
  DropdownModel? get selectedProject;
  @override
  DropdownModel? get selectedFirstManager;
  @override
  DropdownModel? get selectedSecondManager;
  @override
  @JsonKey(ignore: true)
  _$$EmpHierarchyStateImplCopyWith<_$EmpHierarchyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
