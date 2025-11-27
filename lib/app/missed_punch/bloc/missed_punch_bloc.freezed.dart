// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'missed_punch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MissedPunchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissedPunchEventCopyWith<$Res> {
  factory $MissedPunchEventCopyWith(
          MissedPunchEvent value, $Res Function(MissedPunchEvent) then) =
      _$MissedPunchEventCopyWithImpl<$Res, MissedPunchEvent>;
}

/// @nodoc
class _$MissedPunchEventCopyWithImpl<$Res, $Val extends MissedPunchEvent>
    implements $MissedPunchEventCopyWith<$Res> {
  _$MissedPunchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ChangeRequestDateImplCopyWith<$Res> {
  factory _$$ChangeRequestDateImplCopyWith(_$ChangeRequestDateImpl value,
          $Res Function(_$ChangeRequestDateImpl) then) =
      __$$ChangeRequestDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$ChangeRequestDateImplCopyWithImpl<$Res>
    extends _$MissedPunchEventCopyWithImpl<$Res, _$ChangeRequestDateImpl>
    implements _$$ChangeRequestDateImplCopyWith<$Res> {
  __$$ChangeRequestDateImplCopyWithImpl(_$ChangeRequestDateImpl _value,
      $Res Function(_$ChangeRequestDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$ChangeRequestDateImpl(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$ChangeRequestDateImpl implements _ChangeRequestDate {
  const _$ChangeRequestDateImpl(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'MissedPunchEvent.changeRequestDate(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeRequestDateImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeRequestDateImplCopyWith<_$ChangeRequestDateImpl> get copyWith =>
      __$$ChangeRequestDateImplCopyWithImpl<_$ChangeRequestDateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) {
    return changeRequestDate(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) {
    return changeRequestDate?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (changeRequestDate != null) {
      return changeRequestDate(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) {
    return changeRequestDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) {
    return changeRequestDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (changeRequestDate != null) {
      return changeRequestDate(this);
    }
    return orElse();
  }
}

abstract class _ChangeRequestDate implements MissedPunchEvent {
  const factory _ChangeRequestDate(final DateTime date) =
      _$ChangeRequestDateImpl;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$ChangeRequestDateImplCopyWith<_$ChangeRequestDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeMissedPunchTypeImplCopyWith<$Res> {
  factory _$$ChangeMissedPunchTypeImplCopyWith(
          _$ChangeMissedPunchTypeImpl value,
          $Res Function(_$ChangeMissedPunchTypeImpl) then) =
      __$$ChangeMissedPunchTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DropdownModel? type});
}

/// @nodoc
class __$$ChangeMissedPunchTypeImplCopyWithImpl<$Res>
    extends _$MissedPunchEventCopyWithImpl<$Res, _$ChangeMissedPunchTypeImpl>
    implements _$$ChangeMissedPunchTypeImplCopyWith<$Res> {
  __$$ChangeMissedPunchTypeImplCopyWithImpl(_$ChangeMissedPunchTypeImpl _value,
      $Res Function(_$ChangeMissedPunchTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
  }) {
    return _then(_$ChangeMissedPunchTypeImpl(
      freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$ChangeMissedPunchTypeImpl implements _ChangeMissedPunchType {
  const _$ChangeMissedPunchTypeImpl(this.type);

  @override
  final DropdownModel? type;

  @override
  String toString() {
    return 'MissedPunchEvent.changeMissedPunchType(type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeMissedPunchTypeImpl &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeMissedPunchTypeImplCopyWith<_$ChangeMissedPunchTypeImpl>
      get copyWith => __$$ChangeMissedPunchTypeImplCopyWithImpl<
          _$ChangeMissedPunchTypeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) {
    return changeMissedPunchType(type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) {
    return changeMissedPunchType?.call(type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (changeMissedPunchType != null) {
      return changeMissedPunchType(type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) {
    return changeMissedPunchType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) {
    return changeMissedPunchType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (changeMissedPunchType != null) {
      return changeMissedPunchType(this);
    }
    return orElse();
  }
}

abstract class _ChangeMissedPunchType implements MissedPunchEvent {
  const factory _ChangeMissedPunchType(final DropdownModel? type) =
      _$ChangeMissedPunchTypeImpl;

  DropdownModel? get type;
  @JsonKey(ignore: true)
  _$$ChangeMissedPunchTypeImplCopyWith<_$ChangeMissedPunchTypeImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectFilterTypeImplCopyWith<$Res> {
  factory _$$SelectFilterTypeImplCopyWith(_$SelectFilterTypeImpl value,
          $Res Function(_$SelectFilterTypeImpl) then) =
      __$$SelectFilterTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedFilterType});
}

/// @nodoc
class __$$SelectFilterTypeImplCopyWithImpl<$Res>
    extends _$MissedPunchEventCopyWithImpl<$Res, _$SelectFilterTypeImpl>
    implements _$$SelectFilterTypeImplCopyWith<$Res> {
  __$$SelectFilterTypeImplCopyWithImpl(_$SelectFilterTypeImpl _value,
      $Res Function(_$SelectFilterTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedFilterType = null,
  }) {
    return _then(_$SelectFilterTypeImpl(
      selectedFilterType: null == selectedFilterType
          ? _value.selectedFilterType
          : selectedFilterType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectFilterTypeImpl implements _SelectFilterType {
  const _$SelectFilterTypeImpl({required this.selectedFilterType});

  @override
  final String selectedFilterType;

  @override
  String toString() {
    return 'MissedPunchEvent.selectFilterType(selectedFilterType: $selectedFilterType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectFilterTypeImpl &&
            (identical(other.selectedFilterType, selectedFilterType) ||
                other.selectedFilterType == selectedFilterType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedFilterType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectFilterTypeImplCopyWith<_$SelectFilterTypeImpl> get copyWith =>
      __$$SelectFilterTypeImplCopyWithImpl<_$SelectFilterTypeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) {
    return selectFilterType(selectedFilterType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) {
    return selectFilterType?.call(selectedFilterType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (selectFilterType != null) {
      return selectFilterType(selectedFilterType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) {
    return selectFilterType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) {
    return selectFilterType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (selectFilterType != null) {
      return selectFilterType(this);
    }
    return orElse();
  }
}

abstract class _SelectFilterType implements MissedPunchEvent {
  const factory _SelectFilterType({required final String selectedFilterType}) =
      _$SelectFilterTypeImpl;

  String get selectedFilterType;
  @JsonKey(ignore: true)
  _$$SelectFilterTypeImplCopyWith<_$SelectFilterTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectDateImplCopyWith<$Res> {
  factory _$$SelectDateImplCopyWith(
          _$SelectDateImpl value, $Res Function(_$SelectDateImpl) then) =
      __$$SelectDateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime selectedDate, bool isFromDate});
}

/// @nodoc
class __$$SelectDateImplCopyWithImpl<$Res>
    extends _$MissedPunchEventCopyWithImpl<$Res, _$SelectDateImpl>
    implements _$$SelectDateImplCopyWith<$Res> {
  __$$SelectDateImplCopyWithImpl(
      _$SelectDateImpl _value, $Res Function(_$SelectDateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
    Object? isFromDate = null,
  }) {
    return _then(_$SelectDateImpl(
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isFromDate: null == isFromDate
          ? _value.isFromDate
          : isFromDate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SelectDateImpl implements _SelectDate {
  const _$SelectDateImpl(
      {required this.selectedDate, required this.isFromDate});

  @override
  final DateTime selectedDate;
  @override
  final bool isFromDate;

  @override
  String toString() {
    return 'MissedPunchEvent.selectDate(selectedDate: $selectedDate, isFromDate: $isFromDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectDateImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.isFromDate, isFromDate) ||
                other.isFromDate == isFromDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate, isFromDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectDateImplCopyWith<_$SelectDateImpl> get copyWith =>
      __$$SelectDateImplCopyWithImpl<_$SelectDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) {
    return selectDate(selectedDate, isFromDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) {
    return selectDate?.call(selectedDate, isFromDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (selectDate != null) {
      return selectDate(selectedDate, isFromDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) {
    return selectDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) {
    return selectDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (selectDate != null) {
      return selectDate(this);
    }
    return orElse();
  }
}

abstract class _SelectDate implements MissedPunchEvent {
  const factory _SelectDate(
      {required final DateTime selectedDate,
      required final bool isFromDate}) = _$SelectDateImpl;

  DateTime get selectedDate;
  bool get isFromDate;
  @JsonKey(ignore: true)
  _$$SelectDateImplCopyWith<_$SelectDateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleAllSelectionImplCopyWith<$Res> {
  factory _$$ToggleAllSelectionImplCopyWith(_$ToggleAllSelectionImpl value,
          $Res Function(_$ToggleAllSelectionImpl) then) =
      __$$ToggleAllSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool value});
}

/// @nodoc
class __$$ToggleAllSelectionImplCopyWithImpl<$Res>
    extends _$MissedPunchEventCopyWithImpl<$Res, _$ToggleAllSelectionImpl>
    implements _$$ToggleAllSelectionImplCopyWith<$Res> {
  __$$ToggleAllSelectionImplCopyWithImpl(_$ToggleAllSelectionImpl _value,
      $Res Function(_$ToggleAllSelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$ToggleAllSelectionImpl(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleAllSelectionImpl implements _ToggleAllSelection {
  const _$ToggleAllSelectionImpl(this.value);

  @override
  final bool value;

  @override
  String toString() {
    return 'MissedPunchEvent.toggleAllSelection(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleAllSelectionImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleAllSelectionImplCopyWith<_$ToggleAllSelectionImpl> get copyWith =>
      __$$ToggleAllSelectionImplCopyWithImpl<_$ToggleAllSelectionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) {
    return toggleAllSelection(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) {
    return toggleAllSelection?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (toggleAllSelection != null) {
      return toggleAllSelection(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) {
    return toggleAllSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) {
    return toggleAllSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (toggleAllSelection != null) {
      return toggleAllSelection(this);
    }
    return orElse();
  }
}

abstract class _ToggleAllSelection implements MissedPunchEvent {
  const factory _ToggleAllSelection(final bool value) =
      _$ToggleAllSelectionImpl;

  bool get value;
  @JsonKey(ignore: true)
  _$$ToggleAllSelectionImplCopyWith<_$ToggleAllSelectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToggleSingleSelectionImplCopyWith<$Res> {
  factory _$$ToggleSingleSelectionImplCopyWith(
          _$ToggleSingleSelectionImpl value,
          $Res Function(_$ToggleSingleSelectionImpl) then) =
      __$$ToggleSingleSelectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String missingPunchId});
}

/// @nodoc
class __$$ToggleSingleSelectionImplCopyWithImpl<$Res>
    extends _$MissedPunchEventCopyWithImpl<$Res, _$ToggleSingleSelectionImpl>
    implements _$$ToggleSingleSelectionImplCopyWith<$Res> {
  __$$ToggleSingleSelectionImplCopyWithImpl(_$ToggleSingleSelectionImpl _value,
      $Res Function(_$ToggleSingleSelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missingPunchId = null,
  }) {
    return _then(_$ToggleSingleSelectionImpl(
      missingPunchId: null == missingPunchId
          ? _value.missingPunchId
          : missingPunchId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleSingleSelectionImpl implements _ToggleSingleSelection {
  const _$ToggleSingleSelectionImpl({required this.missingPunchId});

  @override
  final String missingPunchId;

  @override
  String toString() {
    return 'MissedPunchEvent.toggleSingleSelection(missingPunchId: $missingPunchId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSingleSelectionImpl &&
            (identical(other.missingPunchId, missingPunchId) ||
                other.missingPunchId == missingPunchId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, missingPunchId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSingleSelectionImplCopyWith<_$ToggleSingleSelectionImpl>
      get copyWith => __$$ToggleSingleSelectionImplCopyWithImpl<
          _$ToggleSingleSelectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) {
    return toggleSingleSelection(missingPunchId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) {
    return toggleSingleSelection?.call(missingPunchId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (toggleSingleSelection != null) {
      return toggleSingleSelection(missingPunchId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) {
    return toggleSingleSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) {
    return toggleSingleSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (toggleSingleSelection != null) {
      return toggleSingleSelection(this);
    }
    return orElse();
  }
}

abstract class _ToggleSingleSelection implements MissedPunchEvent {
  const factory _ToggleSingleSelection({required final String missingPunchId}) =
      _$ToggleSingleSelectionImpl;

  String get missingPunchId;
  @JsonKey(ignore: true)
  _$$ToggleSingleSelectionImplCopyWith<_$ToggleSingleSelectionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchEmployeeFromListImplCopyWith<$Res> {
  factory _$$SearchEmployeeFromListImplCopyWith(
          _$SearchEmployeeFromListImpl value,
          $Res Function(_$SearchEmployeeFromListImpl) then) =
      __$$SearchEmployeeFromListImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchEmployeeFromListImplCopyWithImpl<$Res>
    extends _$MissedPunchEventCopyWithImpl<$Res, _$SearchEmployeeFromListImpl>
    implements _$$SearchEmployeeFromListImplCopyWith<$Res> {
  __$$SearchEmployeeFromListImplCopyWithImpl(
      _$SearchEmployeeFromListImpl _value,
      $Res Function(_$SearchEmployeeFromListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchEmployeeFromListImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchEmployeeFromListImpl implements _SearchEmployeeFromList {
  const _$SearchEmployeeFromListImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'MissedPunchEvent.searchEmployeeFromList(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEmployeeFromListImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEmployeeFromListImplCopyWith<_$SearchEmployeeFromListImpl>
      get copyWith => __$$SearchEmployeeFromListImplCopyWithImpl<
          _$SearchEmployeeFromListImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) {
    return searchEmployeeFromList(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) {
    return searchEmployeeFromList?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (searchEmployeeFromList != null) {
      return searchEmployeeFromList(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) {
    return searchEmployeeFromList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) {
    return searchEmployeeFromList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (searchEmployeeFromList != null) {
      return searchEmployeeFromList(this);
    }
    return orElse();
  }
}

abstract class _SearchEmployeeFromList implements MissedPunchEvent {
  const factory _SearchEmployeeFromList(final String query) =
      _$SearchEmployeeFromListImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchEmployeeFromListImplCopyWith<_$SearchEmployeeFromListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetApprovalPunchListImplCopyWith<$Res> {
  factory _$$GetApprovalPunchListImplCopyWith(_$GetApprovalPunchListImpl value,
          $Res Function(_$GetApprovalPunchListImpl) then) =
      __$$GetApprovalPunchListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetApprovalPunchListImplCopyWithImpl<$Res>
    extends _$MissedPunchEventCopyWithImpl<$Res, _$GetApprovalPunchListImpl>
    implements _$$GetApprovalPunchListImplCopyWith<$Res> {
  __$$GetApprovalPunchListImplCopyWithImpl(_$GetApprovalPunchListImpl _value,
      $Res Function(_$GetApprovalPunchListImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetApprovalPunchListImpl implements _GetApprovalPunchList {
  const _$GetApprovalPunchListImpl();

  @override
  String toString() {
    return 'MissedPunchEvent.getApprovalPunchList()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetApprovalPunchListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) {
    return getApprovalPunchList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) {
    return getApprovalPunchList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (getApprovalPunchList != null) {
      return getApprovalPunchList();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) {
    return getApprovalPunchList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) {
    return getApprovalPunchList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (getApprovalPunchList != null) {
      return getApprovalPunchList(this);
    }
    return orElse();
  }
}

abstract class _GetApprovalPunchList implements MissedPunchEvent {
  const factory _GetApprovalPunchList() = _$GetApprovalPunchListImpl;
}

/// @nodoc
abstract class _$$ApprovePunchByManagerImplCopyWith<$Res> {
  factory _$$ApprovePunchByManagerImplCopyWith(
          _$ApprovePunchByManagerImpl value,
          $Res Function(_$ApprovePunchByManagerImpl) then) =
      __$$ApprovePunchByManagerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isApprove});
}

/// @nodoc
class __$$ApprovePunchByManagerImplCopyWithImpl<$Res>
    extends _$MissedPunchEventCopyWithImpl<$Res, _$ApprovePunchByManagerImpl>
    implements _$$ApprovePunchByManagerImplCopyWith<$Res> {
  __$$ApprovePunchByManagerImplCopyWithImpl(_$ApprovePunchByManagerImpl _value,
      $Res Function(_$ApprovePunchByManagerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isApprove = null,
  }) {
    return _then(_$ApprovePunchByManagerImpl(
      isApprove: null == isApprove
          ? _value.isApprove
          : isApprove // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ApprovePunchByManagerImpl implements _ApprovePunchByManager {
  const _$ApprovePunchByManagerImpl({required this.isApprove});

  @override
  final bool isApprove;

  @override
  String toString() {
    return 'MissedPunchEvent.approvePunchByManager(isApprove: $isApprove)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApprovePunchByManagerImpl &&
            (identical(other.isApprove, isApprove) ||
                other.isApprove == isApprove));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isApprove);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApprovePunchByManagerImplCopyWith<_$ApprovePunchByManagerImpl>
      get copyWith => __$$ApprovePunchByManagerImplCopyWithImpl<
          _$ApprovePunchByManagerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) changeRequestDate,
    required TResult Function(DropdownModel? type) changeMissedPunchType,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String missingPunchId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
    required TResult Function() getApprovalPunchList,
    required TResult Function(bool isApprove) approvePunchByManager,
  }) {
    return approvePunchByManager(isApprove);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? changeRequestDate,
    TResult? Function(DropdownModel? type)? changeMissedPunchType,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String missingPunchId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
    TResult? Function()? getApprovalPunchList,
    TResult? Function(bool isApprove)? approvePunchByManager,
  }) {
    return approvePunchByManager?.call(isApprove);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? changeRequestDate,
    TResult Function(DropdownModel? type)? changeMissedPunchType,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String missingPunchId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    TResult Function()? getApprovalPunchList,
    TResult Function(bool isApprove)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (approvePunchByManager != null) {
      return approvePunchByManager(isApprove);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeRequestDate value) changeRequestDate,
    required TResult Function(_ChangeMissedPunchType value)
        changeMissedPunchType,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
    required TResult Function(_GetApprovalPunchList value) getApprovalPunchList,
    required TResult Function(_ApprovePunchByManager value)
        approvePunchByManager,
  }) {
    return approvePunchByManager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeRequestDate value)? changeRequestDate,
    TResult? Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult? Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult? Function(_ApprovePunchByManager value)? approvePunchByManager,
  }) {
    return approvePunchByManager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeRequestDate value)? changeRequestDate,
    TResult Function(_ChangeMissedPunchType value)? changeMissedPunchType,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    TResult Function(_GetApprovalPunchList value)? getApprovalPunchList,
    TResult Function(_ApprovePunchByManager value)? approvePunchByManager,
    required TResult orElse(),
  }) {
    if (approvePunchByManager != null) {
      return approvePunchByManager(this);
    }
    return orElse();
  }
}

abstract class _ApprovePunchByManager implements MissedPunchEvent {
  const factory _ApprovePunchByManager({required final bool isApprove}) =
      _$ApprovePunchByManagerImpl;

  bool get isApprove;
  @JsonKey(ignore: true)
  _$$ApprovePunchByManagerImplCopyWith<_$ApprovePunchByManagerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MissedPunchState {
  MissedPunchRepo get missedPunchRepo => throw _privateConstructorUsedError;
  MissedPunchStatus get status => throw _privateConstructorUsedError;
  String get message =>
      throw _privateConstructorUsedError; // apply screen------------->>
  DateTime? get requestDate => throw _privateConstructorUsedError;
  DropdownModel? get selectedMissedPunchType =>
      throw _privateConstructorUsedError; // manager punch approve part============>>
  String get selectedFilter => throw _privateConstructorUsedError;
  DateTime? get fromDate => throw _privateConstructorUsedError;
  DateTime? get toDate => throw _privateConstructorUsedError;
  ApprovalMissedPunchModel? get approvalMissingPunchModel =>
      throw _privateConstructorUsedError;
  ApprovalMissedPunchModel? get fetchApprovalMissingPunchModel =>
      throw _privateConstructorUsedError;
  Set<String> get selectedMissingPunchIds => throw _privateConstructorUsedError;
  bool get selectAll =>
      throw _privateConstructorUsedError; // for loaders ================>>
  dynamic get getMissedPunchLoading => throw _privateConstructorUsedError;
  dynamic get applyMissedPunchLoading => throw _privateConstructorUsedError;
  dynamic get getApprovalPunchListLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MissedPunchStateCopyWith<MissedPunchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MissedPunchStateCopyWith<$Res> {
  factory $MissedPunchStateCopyWith(
          MissedPunchState value, $Res Function(MissedPunchState) then) =
      _$MissedPunchStateCopyWithImpl<$Res, MissedPunchState>;
  @useResult
  $Res call(
      {MissedPunchRepo missedPunchRepo,
      MissedPunchStatus status,
      String message,
      DateTime? requestDate,
      DropdownModel? selectedMissedPunchType,
      String selectedFilter,
      DateTime? fromDate,
      DateTime? toDate,
      ApprovalMissedPunchModel? approvalMissingPunchModel,
      ApprovalMissedPunchModel? fetchApprovalMissingPunchModel,
      Set<String> selectedMissingPunchIds,
      bool selectAll,
      dynamic getMissedPunchLoading,
      dynamic applyMissedPunchLoading,
      dynamic getApprovalPunchListLoading});
}

/// @nodoc
class _$MissedPunchStateCopyWithImpl<$Res, $Val extends MissedPunchState>
    implements $MissedPunchStateCopyWith<$Res> {
  _$MissedPunchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missedPunchRepo = null,
    Object? status = null,
    Object? message = null,
    Object? requestDate = freezed,
    Object? selectedMissedPunchType = freezed,
    Object? selectedFilter = null,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? approvalMissingPunchModel = freezed,
    Object? fetchApprovalMissingPunchModel = freezed,
    Object? selectedMissingPunchIds = null,
    Object? selectAll = null,
    Object? getMissedPunchLoading = freezed,
    Object? applyMissedPunchLoading = freezed,
    Object? getApprovalPunchListLoading = freezed,
  }) {
    return _then(_value.copyWith(
      missedPunchRepo: null == missedPunchRepo
          ? _value.missedPunchRepo
          : missedPunchRepo // ignore: cast_nullable_to_non_nullable
              as MissedPunchRepo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MissedPunchStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: freezed == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedMissedPunchType: freezed == selectedMissedPunchType
          ? _value.selectedMissedPunchType
          : selectedMissedPunchType // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvalMissingPunchModel: freezed == approvalMissingPunchModel
          ? _value.approvalMissingPunchModel
          : approvalMissingPunchModel // ignore: cast_nullable_to_non_nullable
              as ApprovalMissedPunchModel?,
      fetchApprovalMissingPunchModel: freezed == fetchApprovalMissingPunchModel
          ? _value.fetchApprovalMissingPunchModel
          : fetchApprovalMissingPunchModel // ignore: cast_nullable_to_non_nullable
              as ApprovalMissedPunchModel?,
      selectedMissingPunchIds: null == selectedMissingPunchIds
          ? _value.selectedMissingPunchIds
          : selectedMissingPunchIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectAll: null == selectAll
          ? _value.selectAll
          : selectAll // ignore: cast_nullable_to_non_nullable
              as bool,
      getMissedPunchLoading: freezed == getMissedPunchLoading
          ? _value.getMissedPunchLoading
          : getMissedPunchLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      applyMissedPunchLoading: freezed == applyMissedPunchLoading
          ? _value.applyMissedPunchLoading
          : applyMissedPunchLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      getApprovalPunchListLoading: freezed == getApprovalPunchListLoading
          ? _value.getApprovalPunchListLoading
          : getApprovalPunchListLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MissedPunchStateImplCopyWith<$Res>
    implements $MissedPunchStateCopyWith<$Res> {
  factory _$$MissedPunchStateImplCopyWith(_$MissedPunchStateImpl value,
          $Res Function(_$MissedPunchStateImpl) then) =
      __$$MissedPunchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MissedPunchRepo missedPunchRepo,
      MissedPunchStatus status,
      String message,
      DateTime? requestDate,
      DropdownModel? selectedMissedPunchType,
      String selectedFilter,
      DateTime? fromDate,
      DateTime? toDate,
      ApprovalMissedPunchModel? approvalMissingPunchModel,
      ApprovalMissedPunchModel? fetchApprovalMissingPunchModel,
      Set<String> selectedMissingPunchIds,
      bool selectAll,
      dynamic getMissedPunchLoading,
      dynamic applyMissedPunchLoading,
      dynamic getApprovalPunchListLoading});
}

/// @nodoc
class __$$MissedPunchStateImplCopyWithImpl<$Res>
    extends _$MissedPunchStateCopyWithImpl<$Res, _$MissedPunchStateImpl>
    implements _$$MissedPunchStateImplCopyWith<$Res> {
  __$$MissedPunchStateImplCopyWithImpl(_$MissedPunchStateImpl _value,
      $Res Function(_$MissedPunchStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? missedPunchRepo = null,
    Object? status = null,
    Object? message = null,
    Object? requestDate = freezed,
    Object? selectedMissedPunchType = freezed,
    Object? selectedFilter = null,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? approvalMissingPunchModel = freezed,
    Object? fetchApprovalMissingPunchModel = freezed,
    Object? selectedMissingPunchIds = null,
    Object? selectAll = null,
    Object? getMissedPunchLoading = freezed,
    Object? applyMissedPunchLoading = freezed,
    Object? getApprovalPunchListLoading = freezed,
  }) {
    return _then(_$MissedPunchStateImpl(
      missedPunchRepo: null == missedPunchRepo
          ? _value.missedPunchRepo
          : missedPunchRepo // ignore: cast_nullable_to_non_nullable
              as MissedPunchRepo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MissedPunchStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      requestDate: freezed == requestDate
          ? _value.requestDate
          : requestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      selectedMissedPunchType: freezed == selectedMissedPunchType
          ? _value.selectedMissedPunchType
          : selectedMissedPunchType // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      selectedFilter: null == selectedFilter
          ? _value.selectedFilter
          : selectedFilter // ignore: cast_nullable_to_non_nullable
              as String,
      fromDate: freezed == fromDate
          ? _value.fromDate
          : fromDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      toDate: freezed == toDate
          ? _value.toDate
          : toDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      approvalMissingPunchModel: freezed == approvalMissingPunchModel
          ? _value.approvalMissingPunchModel
          : approvalMissingPunchModel // ignore: cast_nullable_to_non_nullable
              as ApprovalMissedPunchModel?,
      fetchApprovalMissingPunchModel: freezed == fetchApprovalMissingPunchModel
          ? _value.fetchApprovalMissingPunchModel
          : fetchApprovalMissingPunchModel // ignore: cast_nullable_to_non_nullable
              as ApprovalMissedPunchModel?,
      selectedMissingPunchIds: null == selectedMissingPunchIds
          ? _value._selectedMissingPunchIds
          : selectedMissingPunchIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectAll: null == selectAll
          ? _value.selectAll
          : selectAll // ignore: cast_nullable_to_non_nullable
              as bool,
      getMissedPunchLoading: freezed == getMissedPunchLoading
          ? _value.getMissedPunchLoading!
          : getMissedPunchLoading,
      applyMissedPunchLoading: freezed == applyMissedPunchLoading
          ? _value.applyMissedPunchLoading!
          : applyMissedPunchLoading,
      getApprovalPunchListLoading: freezed == getApprovalPunchListLoading
          ? _value.getApprovalPunchListLoading!
          : getApprovalPunchListLoading,
    ));
  }
}

/// @nodoc

class _$MissedPunchStateImpl implements _MissedPunchState {
  const _$MissedPunchStateImpl(
      {required this.missedPunchRepo,
      this.status = MissedPunchStatus.initial,
      this.message = '',
      this.requestDate,
      this.selectedMissedPunchType,
      this.selectedFilter = 'Daily',
      this.fromDate,
      this.toDate,
      this.approvalMissingPunchModel,
      this.fetchApprovalMissingPunchModel,
      final Set<String> selectedMissingPunchIds = const <String>{},
      this.selectAll = false,
      this.getMissedPunchLoading = false,
      this.applyMissedPunchLoading = false,
      this.getApprovalPunchListLoading = false})
      : _selectedMissingPunchIds = selectedMissingPunchIds;

  @override
  final MissedPunchRepo missedPunchRepo;
  @override
  @JsonKey()
  final MissedPunchStatus status;
  @override
  @JsonKey()
  final String message;
// apply screen------------->>
  @override
  final DateTime? requestDate;
  @override
  final DropdownModel? selectedMissedPunchType;
// manager punch approve part============>>
  @override
  @JsonKey()
  final String selectedFilter;
  @override
  final DateTime? fromDate;
  @override
  final DateTime? toDate;
  @override
  final ApprovalMissedPunchModel? approvalMissingPunchModel;
  @override
  final ApprovalMissedPunchModel? fetchApprovalMissingPunchModel;
  final Set<String> _selectedMissingPunchIds;
  @override
  @JsonKey()
  Set<String> get selectedMissingPunchIds {
    if (_selectedMissingPunchIds is EqualUnmodifiableSetView)
      return _selectedMissingPunchIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedMissingPunchIds);
  }

  @override
  @JsonKey()
  final bool selectAll;
// for loaders ================>>
  @override
  @JsonKey()
  final dynamic getMissedPunchLoading;
  @override
  @JsonKey()
  final dynamic applyMissedPunchLoading;
  @override
  @JsonKey()
  final dynamic getApprovalPunchListLoading;

  @override
  String toString() {
    return 'MissedPunchState(missedPunchRepo: $missedPunchRepo, status: $status, message: $message, requestDate: $requestDate, selectedMissedPunchType: $selectedMissedPunchType, selectedFilter: $selectedFilter, fromDate: $fromDate, toDate: $toDate, approvalMissingPunchModel: $approvalMissingPunchModel, fetchApprovalMissingPunchModel: $fetchApprovalMissingPunchModel, selectedMissingPunchIds: $selectedMissingPunchIds, selectAll: $selectAll, getMissedPunchLoading: $getMissedPunchLoading, applyMissedPunchLoading: $applyMissedPunchLoading, getApprovalPunchListLoading: $getApprovalPunchListLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MissedPunchStateImpl &&
            (identical(other.missedPunchRepo, missedPunchRepo) ||
                other.missedPunchRepo == missedPunchRepo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.requestDate, requestDate) ||
                other.requestDate == requestDate) &&
            (identical(
                    other.selectedMissedPunchType, selectedMissedPunchType) ||
                other.selectedMissedPunchType == selectedMissedPunchType) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            (identical(other.approvalMissingPunchModel,
                    approvalMissingPunchModel) ||
                other.approvalMissingPunchModel == approvalMissingPunchModel) &&
            (identical(other.fetchApprovalMissingPunchModel,
                    fetchApprovalMissingPunchModel) ||
                other.fetchApprovalMissingPunchModel ==
                    fetchApprovalMissingPunchModel) &&
            const DeepCollectionEquality().equals(
                other._selectedMissingPunchIds, _selectedMissingPunchIds) &&
            (identical(other.selectAll, selectAll) ||
                other.selectAll == selectAll) &&
            const DeepCollectionEquality()
                .equals(other.getMissedPunchLoading, getMissedPunchLoading) &&
            const DeepCollectionEquality().equals(
                other.applyMissedPunchLoading, applyMissedPunchLoading) &&
            const DeepCollectionEquality().equals(
                other.getApprovalPunchListLoading,
                getApprovalPunchListLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      missedPunchRepo,
      status,
      message,
      requestDate,
      selectedMissedPunchType,
      selectedFilter,
      fromDate,
      toDate,
      approvalMissingPunchModel,
      fetchApprovalMissingPunchModel,
      const DeepCollectionEquality().hash(_selectedMissingPunchIds),
      selectAll,
      const DeepCollectionEquality().hash(getMissedPunchLoading),
      const DeepCollectionEquality().hash(applyMissedPunchLoading),
      const DeepCollectionEquality().hash(getApprovalPunchListLoading));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MissedPunchStateImplCopyWith<_$MissedPunchStateImpl> get copyWith =>
      __$$MissedPunchStateImplCopyWithImpl<_$MissedPunchStateImpl>(
          this, _$identity);
}

abstract class _MissedPunchState implements MissedPunchState {
  const factory _MissedPunchState(
      {required final MissedPunchRepo missedPunchRepo,
      final MissedPunchStatus status,
      final String message,
      final DateTime? requestDate,
      final DropdownModel? selectedMissedPunchType,
      final String selectedFilter,
      final DateTime? fromDate,
      final DateTime? toDate,
      final ApprovalMissedPunchModel? approvalMissingPunchModel,
      final ApprovalMissedPunchModel? fetchApprovalMissingPunchModel,
      final Set<String> selectedMissingPunchIds,
      final bool selectAll,
      final dynamic getMissedPunchLoading,
      final dynamic applyMissedPunchLoading,
      final dynamic getApprovalPunchListLoading}) = _$MissedPunchStateImpl;

  @override
  MissedPunchRepo get missedPunchRepo;
  @override
  MissedPunchStatus get status;
  @override
  String get message;
  @override // apply screen------------->>
  DateTime? get requestDate;
  @override
  DropdownModel? get selectedMissedPunchType;
  @override // manager punch approve part============>>
  String get selectedFilter;
  @override
  DateTime? get fromDate;
  @override
  DateTime? get toDate;
  @override
  ApprovalMissedPunchModel? get approvalMissingPunchModel;
  @override
  ApprovalMissedPunchModel? get fetchApprovalMissingPunchModel;
  @override
  Set<String> get selectedMissingPunchIds;
  @override
  bool get selectAll;
  @override // for loaders ================>>
  dynamic get getMissedPunchLoading;
  @override
  dynamic get applyMissedPunchLoading;
  @override
  dynamic get getApprovalPunchListLoading;
  @override
  @JsonKey(ignore: true)
  _$$MissedPunchStateImplCopyWith<_$MissedPunchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
