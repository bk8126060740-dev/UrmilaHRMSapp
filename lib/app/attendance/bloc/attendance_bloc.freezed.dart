// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AttendanceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceEventCopyWith<$Res> {
  factory $AttendanceEventCopyWith(
          AttendanceEvent value, $Res Function(AttendanceEvent) then) =
      _$AttendanceEventCopyWithImpl<$Res, AttendanceEvent>;
}

/// @nodoc
class _$AttendanceEventCopyWithImpl<$Res, $Val extends AttendanceEvent>
    implements $AttendanceEventCopyWith<$Res> {
  _$AttendanceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RequestLocationImplCopyWith<$Res> {
  factory _$$RequestLocationImplCopyWith(_$RequestLocationImpl value,
          $Res Function(_$RequestLocationImpl) then) =
      __$$RequestLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestLocationImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$RequestLocationImpl>
    implements _$$RequestLocationImplCopyWith<$Res> {
  __$$RequestLocationImplCopyWithImpl(
      _$RequestLocationImpl _value, $Res Function(_$RequestLocationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestLocationImpl implements _RequestLocation {
  const _$RequestLocationImpl();

  @override
  String toString() {
    return 'AttendanceEvent.requestLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return requestLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return requestLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (requestLocation != null) {
      return requestLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return requestLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return requestLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (requestLocation != null) {
      return requestLocation(this);
    }
    return orElse();
  }
}

abstract class _RequestLocation implements AttendanceEvent {
  const factory _RequestLocation() = _$RequestLocationImpl;
}

/// @nodoc
abstract class _$$CapturePhotoImplCopyWith<$Res> {
  factory _$$CapturePhotoImplCopyWith(
          _$CapturePhotoImpl value, $Res Function(_$CapturePhotoImpl) then) =
      __$$CapturePhotoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CapturePhotoImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$CapturePhotoImpl>
    implements _$$CapturePhotoImplCopyWith<$Res> {
  __$$CapturePhotoImplCopyWithImpl(
      _$CapturePhotoImpl _value, $Res Function(_$CapturePhotoImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CapturePhotoImpl implements _CapturePhoto {
  const _$CapturePhotoImpl();

  @override
  String toString() {
    return 'AttendanceEvent.capturePhoto()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CapturePhotoImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return capturePhoto();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return capturePhoto?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (capturePhoto != null) {
      return capturePhoto();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return capturePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return capturePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (capturePhoto != null) {
      return capturePhoto(this);
    }
    return orElse();
  }
}

abstract class _CapturePhoto implements AttendanceEvent {
  const factory _CapturePhoto() = _$CapturePhotoImpl;
}

/// @nodoc
abstract class _$$InitDateImplCopyWith<$Res> {
  factory _$$InitDateImplCopyWith(
          _$InitDateImpl value, $Res Function(_$InitDateImpl) then) =
      __$$InitDateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitDateImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$InitDateImpl>
    implements _$$InitDateImplCopyWith<$Res> {
  __$$InitDateImplCopyWithImpl(
      _$InitDateImpl _value, $Res Function(_$InitDateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitDateImpl implements _InitDate {
  const _$InitDateImpl();

  @override
  String toString() {
    return 'AttendanceEvent.initDate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitDateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return initDate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return initDate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (initDate != null) {
      return initDate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return initDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return initDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (initDate != null) {
      return initDate(this);
    }
    return orElse();
  }
}

abstract class _InitDate implements AttendanceEvent {
  const factory _InitDate() = _$InitDateImpl;
}

/// @nodoc
abstract class _$$PreviousDateImplCopyWith<$Res> {
  factory _$$PreviousDateImplCopyWith(
          _$PreviousDateImpl value, $Res Function(_$PreviousDateImpl) then) =
      __$$PreviousDateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PreviousDateImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$PreviousDateImpl>
    implements _$$PreviousDateImplCopyWith<$Res> {
  __$$PreviousDateImplCopyWithImpl(
      _$PreviousDateImpl _value, $Res Function(_$PreviousDateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PreviousDateImpl implements _PreviousDate {
  const _$PreviousDateImpl();

  @override
  String toString() {
    return 'AttendanceEvent.previousDate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PreviousDateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return previousDate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return previousDate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (previousDate != null) {
      return previousDate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return previousDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return previousDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (previousDate != null) {
      return previousDate(this);
    }
    return orElse();
  }
}

abstract class _PreviousDate implements AttendanceEvent {
  const factory _PreviousDate() = _$PreviousDateImpl;
}

/// @nodoc
abstract class _$$NextDateImplCopyWith<$Res> {
  factory _$$NextDateImplCopyWith(
          _$NextDateImpl value, $Res Function(_$NextDateImpl) then) =
      __$$NextDateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NextDateImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$NextDateImpl>
    implements _$$NextDateImplCopyWith<$Res> {
  __$$NextDateImplCopyWithImpl(
      _$NextDateImpl _value, $Res Function(_$NextDateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NextDateImpl implements _NextDate {
  const _$NextDateImpl();

  @override
  String toString() {
    return 'AttendanceEvent.nextDate()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NextDateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return nextDate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return nextDate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (nextDate != null) {
      return nextDate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return nextDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return nextDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (nextDate != null) {
      return nextDate(this);
    }
    return orElse();
  }
}

abstract class _NextDate implements AttendanceEvent {
  const factory _NextDate() = _$NextDateImpl;
}

/// @nodoc
abstract class _$$GetDailyAttendanceImplCopyWith<$Res> {
  factory _$$GetDailyAttendanceImplCopyWith(_$GetDailyAttendanceImpl value,
          $Res Function(_$GetDailyAttendanceImpl) then) =
      __$$GetDailyAttendanceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$GetDailyAttendanceImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$GetDailyAttendanceImpl>
    implements _$$GetDailyAttendanceImplCopyWith<$Res> {
  __$$GetDailyAttendanceImplCopyWithImpl(_$GetDailyAttendanceImpl _value,
      $Res Function(_$GetDailyAttendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$GetDailyAttendanceImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GetDailyAttendanceImpl implements _GetDailyAttendance {
  const _$GetDailyAttendanceImpl({required this.date});

  @override
  final DateTime date;

  @override
  String toString() {
    return 'AttendanceEvent.getDailyAttendance(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDailyAttendanceImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDailyAttendanceImplCopyWith<_$GetDailyAttendanceImpl> get copyWith =>
      __$$GetDailyAttendanceImplCopyWithImpl<_$GetDailyAttendanceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return getDailyAttendance(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return getDailyAttendance?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (getDailyAttendance != null) {
      return getDailyAttendance(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return getDailyAttendance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return getDailyAttendance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (getDailyAttendance != null) {
      return getDailyAttendance(this);
    }
    return orElse();
  }
}

abstract class _GetDailyAttendance implements AttendanceEvent {
  const factory _GetDailyAttendance({required final DateTime date}) =
      _$GetDailyAttendanceImpl;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$GetDailyAttendanceImplCopyWith<_$GetDailyAttendanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckInImplCopyWith<$Res> {
  factory _$$CheckInImplCopyWith(
          _$CheckInImpl value, $Res Function(_$CheckInImpl) then) =
      __$$CheckInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckInImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$CheckInImpl>
    implements _$$CheckInImplCopyWith<$Res> {
  __$$CheckInImplCopyWithImpl(
      _$CheckInImpl _value, $Res Function(_$CheckInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckInImpl implements _CheckIn {
  const _$CheckInImpl();

  @override
  String toString() {
    return 'AttendanceEvent.checkIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return checkIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return checkIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (checkIn != null) {
      return checkIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return checkIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return checkIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (checkIn != null) {
      return checkIn(this);
    }
    return orElse();
  }
}

abstract class _CheckIn implements AttendanceEvent {
  const factory _CheckIn() = _$CheckInImpl;
}

/// @nodoc
abstract class _$$CheckOutImplCopyWith<$Res> {
  factory _$$CheckOutImplCopyWith(
          _$CheckOutImpl value, $Res Function(_$CheckOutImpl) then) =
      __$$CheckOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckOutImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$CheckOutImpl>
    implements _$$CheckOutImplCopyWith<$Res> {
  __$$CheckOutImplCopyWithImpl(
      _$CheckOutImpl _value, $Res Function(_$CheckOutImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CheckOutImpl implements _CheckOut {
  const _$CheckOutImpl();

  @override
  String toString() {
    return 'AttendanceEvent.checkOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return checkOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return checkOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return checkOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return checkOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut(this);
    }
    return orElse();
  }
}

abstract class _CheckOut implements AttendanceEvent {
  const factory _CheckOut() = _$CheckOutImpl;
}

/// @nodoc
abstract class _$$GetMonthlyAttendanceImplCopyWith<$Res> {
  factory _$$GetMonthlyAttendanceImplCopyWith(_$GetMonthlyAttendanceImpl value,
          $Res Function(_$GetMonthlyAttendanceImpl) then) =
      __$$GetMonthlyAttendanceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool fromButton, int month, int year, DateTime dateTime});
}

/// @nodoc
class __$$GetMonthlyAttendanceImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$GetMonthlyAttendanceImpl>
    implements _$$GetMonthlyAttendanceImplCopyWith<$Res> {
  __$$GetMonthlyAttendanceImplCopyWithImpl(_$GetMonthlyAttendanceImpl _value,
      $Res Function(_$GetMonthlyAttendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromButton = null,
    Object? month = null,
    Object? year = null,
    Object? dateTime = null,
  }) {
    return _then(_$GetMonthlyAttendanceImpl(
      fromButton: null == fromButton
          ? _value.fromButton
          : fromButton // ignore: cast_nullable_to_non_nullable
              as bool,
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$GetMonthlyAttendanceImpl implements _GetMonthlyAttendance {
  const _$GetMonthlyAttendanceImpl(
      {this.fromButton = false,
      required this.month,
      required this.year,
      required this.dateTime});

  @override
  @JsonKey()
  final bool fromButton;
  @override
  final int month;
  @override
  final int year;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'AttendanceEvent.getMonthlyAttendance(fromButton: $fromButton, month: $month, year: $year, dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMonthlyAttendanceImpl &&
            (identical(other.fromButton, fromButton) ||
                other.fromButton == fromButton) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fromButton, month, year, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMonthlyAttendanceImplCopyWith<_$GetMonthlyAttendanceImpl>
      get copyWith =>
          __$$GetMonthlyAttendanceImplCopyWithImpl<_$GetMonthlyAttendanceImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return getMonthlyAttendance(fromButton, month, year, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return getMonthlyAttendance?.call(fromButton, month, year, dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (getMonthlyAttendance != null) {
      return getMonthlyAttendance(fromButton, month, year, dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return getMonthlyAttendance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return getMonthlyAttendance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (getMonthlyAttendance != null) {
      return getMonthlyAttendance(this);
    }
    return orElse();
  }
}

abstract class _GetMonthlyAttendance implements AttendanceEvent {
  const factory _GetMonthlyAttendance(
      {final bool fromButton,
      required final int month,
      required final int year,
      required final DateTime dateTime}) = _$GetMonthlyAttendanceImpl;

  bool get fromButton;
  int get month;
  int get year;
  DateTime get dateTime;
  @JsonKey(ignore: true)
  _$$GetMonthlyAttendanceImplCopyWith<_$GetMonthlyAttendanceImpl>
      get copyWith => throw _privateConstructorUsedError;
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
    extends _$AttendanceEventCopyWithImpl<$Res, _$SelectDateImpl>
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
    return 'AttendanceEvent.selectDate(selectedDate: $selectedDate, isFromDate: $isFromDate)';
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
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return selectDate(selectedDate, isFromDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return selectDate?.call(selectedDate, isFromDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
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
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return selectDate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return selectDate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (selectDate != null) {
      return selectDate(this);
    }
    return orElse();
  }
}

abstract class _SelectDate implements AttendanceEvent {
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
abstract class _$$SelectFilterTypeImplCopyWith<$Res> {
  factory _$$SelectFilterTypeImplCopyWith(_$SelectFilterTypeImpl value,
          $Res Function(_$SelectFilterTypeImpl) then) =
      __$$SelectFilterTypeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String selectedFilterType});
}

/// @nodoc
class __$$SelectFilterTypeImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$SelectFilterTypeImpl>
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
    return 'AttendanceEvent.selectFilterType(selectedFilterType: $selectedFilterType)';
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
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return selectFilterType(selectedFilterType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return selectFilterType?.call(selectedFilterType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
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
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return selectFilterType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return selectFilterType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (selectFilterType != null) {
      return selectFilterType(this);
    }
    return orElse();
  }
}

abstract class _SelectFilterType implements AttendanceEvent {
  const factory _SelectFilterType({required final String selectedFilterType}) =
      _$SelectFilterTypeImpl;

  String get selectedFilterType;
  @JsonKey(ignore: true)
  _$$SelectFilterTypeImplCopyWith<_$SelectFilterTypeImpl> get copyWith =>
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
    extends _$AttendanceEventCopyWithImpl<$Res, _$ToggleAllSelectionImpl>
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
    return 'AttendanceEvent.toggleAllSelection(value: $value)';
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
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return toggleAllSelection(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return toggleAllSelection?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
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
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return toggleAllSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return toggleAllSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (toggleAllSelection != null) {
      return toggleAllSelection(this);
    }
    return orElse();
  }
}

abstract class _ToggleAllSelection implements AttendanceEvent {
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
  $Res call({String employeeId});
}

/// @nodoc
class __$$ToggleSingleSelectionImplCopyWithImpl<$Res>
    extends _$AttendanceEventCopyWithImpl<$Res, _$ToggleSingleSelectionImpl>
    implements _$$ToggleSingleSelectionImplCopyWith<$Res> {
  __$$ToggleSingleSelectionImplCopyWithImpl(_$ToggleSingleSelectionImpl _value,
      $Res Function(_$ToggleSingleSelectionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? employeeId = null,
  }) {
    return _then(_$ToggleSingleSelectionImpl(
      employeeId: null == employeeId
          ? _value.employeeId
          : employeeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ToggleSingleSelectionImpl implements _ToggleSingleSelection {
  const _$ToggleSingleSelectionImpl({required this.employeeId});

  @override
  final String employeeId;

  @override
  String toString() {
    return 'AttendanceEvent.toggleSingleSelection(employeeId: $employeeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleSingleSelectionImpl &&
            (identical(other.employeeId, employeeId) ||
                other.employeeId == employeeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, employeeId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleSingleSelectionImplCopyWith<_$ToggleSingleSelectionImpl>
      get copyWith => __$$ToggleSingleSelectionImplCopyWithImpl<
          _$ToggleSingleSelectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return toggleSingleSelection(employeeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return toggleSingleSelection?.call(employeeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (toggleSingleSelection != null) {
      return toggleSingleSelection(employeeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return toggleSingleSelection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return toggleSingleSelection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (toggleSingleSelection != null) {
      return toggleSingleSelection(this);
    }
    return orElse();
  }
}

abstract class _ToggleSingleSelection implements AttendanceEvent {
  const factory _ToggleSingleSelection({required final String employeeId}) =
      _$ToggleSingleSelectionImpl;

  String get employeeId;
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
    extends _$AttendanceEventCopyWithImpl<$Res, _$SearchEmployeeFromListImpl>
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
    return 'AttendanceEvent.searchEmployeeFromList(query: $query)';
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
    required TResult Function() requestLocation,
    required TResult Function() capturePhoto,
    required TResult Function() initDate,
    required TResult Function() previousDate,
    required TResult Function() nextDate,
    required TResult Function(DateTime date) getDailyAttendance,
    required TResult Function() checkIn,
    required TResult Function() checkOut,
    required TResult Function(
            bool fromButton, int month, int year, DateTime dateTime)
        getMonthlyAttendance,
    required TResult Function(DateTime selectedDate, bool isFromDate)
        selectDate,
    required TResult Function(String selectedFilterType) selectFilterType,
    required TResult Function(bool value) toggleAllSelection,
    required TResult Function(String employeeId) toggleSingleSelection,
    required TResult Function(String query) searchEmployeeFromList,
  }) {
    return searchEmployeeFromList(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? requestLocation,
    TResult? Function()? capturePhoto,
    TResult? Function()? initDate,
    TResult? Function()? previousDate,
    TResult? Function()? nextDate,
    TResult? Function(DateTime date)? getDailyAttendance,
    TResult? Function()? checkIn,
    TResult? Function()? checkOut,
    TResult? Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult? Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult? Function(String selectedFilterType)? selectFilterType,
    TResult? Function(bool value)? toggleAllSelection,
    TResult? Function(String employeeId)? toggleSingleSelection,
    TResult? Function(String query)? searchEmployeeFromList,
  }) {
    return searchEmployeeFromList?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? requestLocation,
    TResult Function()? capturePhoto,
    TResult Function()? initDate,
    TResult Function()? previousDate,
    TResult Function()? nextDate,
    TResult Function(DateTime date)? getDailyAttendance,
    TResult Function()? checkIn,
    TResult Function()? checkOut,
    TResult Function(bool fromButton, int month, int year, DateTime dateTime)?
        getMonthlyAttendance,
    TResult Function(DateTime selectedDate, bool isFromDate)? selectDate,
    TResult Function(String selectedFilterType)? selectFilterType,
    TResult Function(bool value)? toggleAllSelection,
    TResult Function(String employeeId)? toggleSingleSelection,
    TResult Function(String query)? searchEmployeeFromList,
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
    required TResult Function(_RequestLocation value) requestLocation,
    required TResult Function(_CapturePhoto value) capturePhoto,
    required TResult Function(_InitDate value) initDate,
    required TResult Function(_PreviousDate value) previousDate,
    required TResult Function(_NextDate value) nextDate,
    required TResult Function(_GetDailyAttendance value) getDailyAttendance,
    required TResult Function(_CheckIn value) checkIn,
    required TResult Function(_CheckOut value) checkOut,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
    required TResult Function(_SelectDate value) selectDate,
    required TResult Function(_SelectFilterType value) selectFilterType,
    required TResult Function(_ToggleAllSelection value) toggleAllSelection,
    required TResult Function(_ToggleSingleSelection value)
        toggleSingleSelection,
    required TResult Function(_SearchEmployeeFromList value)
        searchEmployeeFromList,
  }) {
    return searchEmployeeFromList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RequestLocation value)? requestLocation,
    TResult? Function(_CapturePhoto value)? capturePhoto,
    TResult? Function(_InitDate value)? initDate,
    TResult? Function(_PreviousDate value)? previousDate,
    TResult? Function(_NextDate value)? nextDate,
    TResult? Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult? Function(_CheckIn value)? checkIn,
    TResult? Function(_CheckOut value)? checkOut,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult? Function(_SelectDate value)? selectDate,
    TResult? Function(_SelectFilterType value)? selectFilterType,
    TResult? Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult? Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult? Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
  }) {
    return searchEmployeeFromList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RequestLocation value)? requestLocation,
    TResult Function(_CapturePhoto value)? capturePhoto,
    TResult Function(_InitDate value)? initDate,
    TResult Function(_PreviousDate value)? previousDate,
    TResult Function(_NextDate value)? nextDate,
    TResult Function(_GetDailyAttendance value)? getDailyAttendance,
    TResult Function(_CheckIn value)? checkIn,
    TResult Function(_CheckOut value)? checkOut,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    TResult Function(_SelectDate value)? selectDate,
    TResult Function(_SelectFilterType value)? selectFilterType,
    TResult Function(_ToggleAllSelection value)? toggleAllSelection,
    TResult Function(_ToggleSingleSelection value)? toggleSingleSelection,
    TResult Function(_SearchEmployeeFromList value)? searchEmployeeFromList,
    required TResult orElse(),
  }) {
    if (searchEmployeeFromList != null) {
      return searchEmployeeFromList(this);
    }
    return orElse();
  }
}

abstract class _SearchEmployeeFromList implements AttendanceEvent {
  const factory _SearchEmployeeFromList(final String query) =
      _$SearchEmployeeFromListImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchEmployeeFromListImplCopyWith<_$SearchEmployeeFromListImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AttendanceState {
  AttendanceRepo get attendanceRepo => throw _privateConstructorUsedError;
  AttendanceStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  File? get photoFile =>
      throw _privateConstructorUsedError; // new fields for date handling
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  DateTime? get today => throw _privateConstructorUsedError; // Filter Info
  String get selectedFilter => throw _privateConstructorUsedError;
  DateTime? get fromDate => throw _privateConstructorUsedError;
  DateTime? get toDate =>
      throw _privateConstructorUsedError; // 🔹 Employee Selection
  List<Map<String, dynamic>> get employees =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get fetchedEmployees =>
      throw _privateConstructorUsedError;
  Set<String> get selectedEmployeeIds => throw _privateConstructorUsedError;
  bool get selectAll => throw _privateConstructorUsedError; // daily attendance
  DailyAttendanceModel? get dailyAttendanceModel =>
      throw _privateConstructorUsedError; // monthly attendance
  MonthlyAttendanceModel? get monthlyAttendanceModel =>
      throw _privateConstructorUsedError;
  dynamic get monthlyAttendanceLoading => throw _privateConstructorUsedError;
  dynamic get dailyAttendanceLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceStateCopyWith<AttendanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceStateCopyWith<$Res> {
  factory $AttendanceStateCopyWith(
          AttendanceState value, $Res Function(AttendanceState) then) =
      _$AttendanceStateCopyWithImpl<$Res, AttendanceState>;
  @useResult
  $Res call(
      {AttendanceRepo attendanceRepo,
      AttendanceStatus status,
      String message,
      double? latitude,
      double? longitude,
      String? address,
      File? photoFile,
      DateTime? selectedDate,
      DateTime? today,
      String selectedFilter,
      DateTime? fromDate,
      DateTime? toDate,
      List<Map<String, dynamic>> employees,
      List<Map<String, dynamic>> fetchedEmployees,
      Set<String> selectedEmployeeIds,
      bool selectAll,
      DailyAttendanceModel? dailyAttendanceModel,
      MonthlyAttendanceModel? monthlyAttendanceModel,
      dynamic monthlyAttendanceLoading,
      dynamic dailyAttendanceLoading});
}

/// @nodoc
class _$AttendanceStateCopyWithImpl<$Res, $Val extends AttendanceState>
    implements $AttendanceStateCopyWith<$Res> {
  _$AttendanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceRepo = null,
    Object? status = null,
    Object? message = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? photoFile = freezed,
    Object? selectedDate = freezed,
    Object? today = freezed,
    Object? selectedFilter = null,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? employees = null,
    Object? fetchedEmployees = null,
    Object? selectedEmployeeIds = null,
    Object? selectAll = null,
    Object? dailyAttendanceModel = freezed,
    Object? monthlyAttendanceModel = freezed,
    Object? monthlyAttendanceLoading = freezed,
    Object? dailyAttendanceLoading = freezed,
  }) {
    return _then(_value.copyWith(
      attendanceRepo: null == attendanceRepo
          ? _value.attendanceRepo
          : attendanceRepo // ignore: cast_nullable_to_non_nullable
              as AttendanceRepo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendanceStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      photoFile: freezed == photoFile
          ? _value.photoFile
          : photoFile // ignore: cast_nullable_to_non_nullable
              as File?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      today: freezed == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      employees: null == employees
          ? _value.employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      fetchedEmployees: null == fetchedEmployees
          ? _value.fetchedEmployees
          : fetchedEmployees // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      selectedEmployeeIds: null == selectedEmployeeIds
          ? _value.selectedEmployeeIds
          : selectedEmployeeIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectAll: null == selectAll
          ? _value.selectAll
          : selectAll // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyAttendanceModel: freezed == dailyAttendanceModel
          ? _value.dailyAttendanceModel
          : dailyAttendanceModel // ignore: cast_nullable_to_non_nullable
              as DailyAttendanceModel?,
      monthlyAttendanceModel: freezed == monthlyAttendanceModel
          ? _value.monthlyAttendanceModel
          : monthlyAttendanceModel // ignore: cast_nullable_to_non_nullable
              as MonthlyAttendanceModel?,
      monthlyAttendanceLoading: freezed == monthlyAttendanceLoading
          ? _value.monthlyAttendanceLoading
          : monthlyAttendanceLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dailyAttendanceLoading: freezed == dailyAttendanceLoading
          ? _value.dailyAttendanceLoading
          : dailyAttendanceLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AttendanceStateImplCopyWith<$Res>
    implements $AttendanceStateCopyWith<$Res> {
  factory _$$AttendanceStateImplCopyWith(_$AttendanceStateImpl value,
          $Res Function(_$AttendanceStateImpl) then) =
      __$$AttendanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AttendanceRepo attendanceRepo,
      AttendanceStatus status,
      String message,
      double? latitude,
      double? longitude,
      String? address,
      File? photoFile,
      DateTime? selectedDate,
      DateTime? today,
      String selectedFilter,
      DateTime? fromDate,
      DateTime? toDate,
      List<Map<String, dynamic>> employees,
      List<Map<String, dynamic>> fetchedEmployees,
      Set<String> selectedEmployeeIds,
      bool selectAll,
      DailyAttendanceModel? dailyAttendanceModel,
      MonthlyAttendanceModel? monthlyAttendanceModel,
      dynamic monthlyAttendanceLoading,
      dynamic dailyAttendanceLoading});
}

/// @nodoc
class __$$AttendanceStateImplCopyWithImpl<$Res>
    extends _$AttendanceStateCopyWithImpl<$Res, _$AttendanceStateImpl>
    implements _$$AttendanceStateImplCopyWith<$Res> {
  __$$AttendanceStateImplCopyWithImpl(
      _$AttendanceStateImpl _value, $Res Function(_$AttendanceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attendanceRepo = null,
    Object? status = null,
    Object? message = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? address = freezed,
    Object? photoFile = freezed,
    Object? selectedDate = freezed,
    Object? today = freezed,
    Object? selectedFilter = null,
    Object? fromDate = freezed,
    Object? toDate = freezed,
    Object? employees = null,
    Object? fetchedEmployees = null,
    Object? selectedEmployeeIds = null,
    Object? selectAll = null,
    Object? dailyAttendanceModel = freezed,
    Object? monthlyAttendanceModel = freezed,
    Object? monthlyAttendanceLoading = freezed,
    Object? dailyAttendanceLoading = freezed,
  }) {
    return _then(_$AttendanceStateImpl(
      attendanceRepo: null == attendanceRepo
          ? _value.attendanceRepo
          : attendanceRepo // ignore: cast_nullable_to_non_nullable
              as AttendanceRepo,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AttendanceStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      photoFile: freezed == photoFile
          ? _value.photoFile
          : photoFile // ignore: cast_nullable_to_non_nullable
              as File?,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      today: freezed == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      employees: null == employees
          ? _value._employees
          : employees // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      fetchedEmployees: null == fetchedEmployees
          ? _value._fetchedEmployees
          : fetchedEmployees // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      selectedEmployeeIds: null == selectedEmployeeIds
          ? _value._selectedEmployeeIds
          : selectedEmployeeIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      selectAll: null == selectAll
          ? _value.selectAll
          : selectAll // ignore: cast_nullable_to_non_nullable
              as bool,
      dailyAttendanceModel: freezed == dailyAttendanceModel
          ? _value.dailyAttendanceModel
          : dailyAttendanceModel // ignore: cast_nullable_to_non_nullable
              as DailyAttendanceModel?,
      monthlyAttendanceModel: freezed == monthlyAttendanceModel
          ? _value.monthlyAttendanceModel
          : monthlyAttendanceModel // ignore: cast_nullable_to_non_nullable
              as MonthlyAttendanceModel?,
      monthlyAttendanceLoading: freezed == monthlyAttendanceLoading
          ? _value.monthlyAttendanceLoading!
          : monthlyAttendanceLoading,
      dailyAttendanceLoading: freezed == dailyAttendanceLoading
          ? _value.dailyAttendanceLoading!
          : dailyAttendanceLoading,
    ));
  }
}

/// @nodoc

class _$AttendanceStateImpl implements _AttendanceState {
  const _$AttendanceStateImpl(
      {required this.attendanceRepo,
      this.status = AttendanceStatus.initial,
      this.message = '',
      this.latitude,
      this.longitude,
      this.address,
      this.photoFile,
      this.selectedDate = null,
      this.today = null,
      this.selectedFilter = 'Daily',
      this.fromDate,
      this.toDate,
      final List<Map<String, dynamic>> employees = const [],
      final List<Map<String, dynamic>> fetchedEmployees = const [],
      final Set<String> selectedEmployeeIds = const <String>{},
      this.selectAll = false,
      this.dailyAttendanceModel,
      this.monthlyAttendanceModel,
      this.monthlyAttendanceLoading = false,
      this.dailyAttendanceLoading = false})
      : _employees = employees,
        _fetchedEmployees = fetchedEmployees,
        _selectedEmployeeIds = selectedEmployeeIds;

  @override
  final AttendanceRepo attendanceRepo;
  @override
  @JsonKey()
  final AttendanceStatus status;
  @override
  @JsonKey()
  final String message;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? address;
  @override
  final File? photoFile;
// new fields for date handling
  @override
  @JsonKey()
  final DateTime? selectedDate;
  @override
  @JsonKey()
  final DateTime? today;
// Filter Info
  @override
  @JsonKey()
  final String selectedFilter;
  @override
  final DateTime? fromDate;
  @override
  final DateTime? toDate;
// 🔹 Employee Selection
  final List<Map<String, dynamic>> _employees;
// 🔹 Employee Selection
  @override
  @JsonKey()
  List<Map<String, dynamic>> get employees {
    if (_employees is EqualUnmodifiableListView) return _employees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_employees);
  }

  final List<Map<String, dynamic>> _fetchedEmployees;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get fetchedEmployees {
    if (_fetchedEmployees is EqualUnmodifiableListView)
      return _fetchedEmployees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fetchedEmployees);
  }

  final Set<String> _selectedEmployeeIds;
  @override
  @JsonKey()
  Set<String> get selectedEmployeeIds {
    if (_selectedEmployeeIds is EqualUnmodifiableSetView)
      return _selectedEmployeeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_selectedEmployeeIds);
  }

  @override
  @JsonKey()
  final bool selectAll;
// daily attendance
  @override
  final DailyAttendanceModel? dailyAttendanceModel;
// monthly attendance
  @override
  final MonthlyAttendanceModel? monthlyAttendanceModel;
  @override
  @JsonKey()
  final dynamic monthlyAttendanceLoading;
  @override
  @JsonKey()
  final dynamic dailyAttendanceLoading;

  @override
  String toString() {
    return 'AttendanceState(attendanceRepo: $attendanceRepo, status: $status, message: $message, latitude: $latitude, longitude: $longitude, address: $address, photoFile: $photoFile, selectedDate: $selectedDate, today: $today, selectedFilter: $selectedFilter, fromDate: $fromDate, toDate: $toDate, employees: $employees, fetchedEmployees: $fetchedEmployees, selectedEmployeeIds: $selectedEmployeeIds, selectAll: $selectAll, dailyAttendanceModel: $dailyAttendanceModel, monthlyAttendanceModel: $monthlyAttendanceModel, monthlyAttendanceLoading: $monthlyAttendanceLoading, dailyAttendanceLoading: $dailyAttendanceLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttendanceStateImpl &&
            (identical(other.attendanceRepo, attendanceRepo) ||
                other.attendanceRepo == attendanceRepo) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.photoFile, photoFile) ||
                other.photoFile == photoFile) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.today, today) || other.today == today) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter) &&
            (identical(other.fromDate, fromDate) ||
                other.fromDate == fromDate) &&
            (identical(other.toDate, toDate) || other.toDate == toDate) &&
            const DeepCollectionEquality()
                .equals(other._employees, _employees) &&
            const DeepCollectionEquality()
                .equals(other._fetchedEmployees, _fetchedEmployees) &&
            const DeepCollectionEquality()
                .equals(other._selectedEmployeeIds, _selectedEmployeeIds) &&
            (identical(other.selectAll, selectAll) ||
                other.selectAll == selectAll) &&
            (identical(other.dailyAttendanceModel, dailyAttendanceModel) ||
                other.dailyAttendanceModel == dailyAttendanceModel) &&
            (identical(other.monthlyAttendanceModel, monthlyAttendanceModel) ||
                other.monthlyAttendanceModel == monthlyAttendanceModel) &&
            const DeepCollectionEquality().equals(
                other.monthlyAttendanceLoading, monthlyAttendanceLoading) &&
            const DeepCollectionEquality()
                .equals(other.dailyAttendanceLoading, dailyAttendanceLoading));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        attendanceRepo,
        status,
        message,
        latitude,
        longitude,
        address,
        photoFile,
        selectedDate,
        today,
        selectedFilter,
        fromDate,
        toDate,
        const DeepCollectionEquality().hash(_employees),
        const DeepCollectionEquality().hash(_fetchedEmployees),
        const DeepCollectionEquality().hash(_selectedEmployeeIds),
        selectAll,
        dailyAttendanceModel,
        monthlyAttendanceModel,
        const DeepCollectionEquality().hash(monthlyAttendanceLoading),
        const DeepCollectionEquality().hash(dailyAttendanceLoading)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AttendanceStateImplCopyWith<_$AttendanceStateImpl> get copyWith =>
      __$$AttendanceStateImplCopyWithImpl<_$AttendanceStateImpl>(
          this, _$identity);
}

abstract class _AttendanceState implements AttendanceState {
  const factory _AttendanceState(
      {required final AttendanceRepo attendanceRepo,
      final AttendanceStatus status,
      final String message,
      final double? latitude,
      final double? longitude,
      final String? address,
      final File? photoFile,
      final DateTime? selectedDate,
      final DateTime? today,
      final String selectedFilter,
      final DateTime? fromDate,
      final DateTime? toDate,
      final List<Map<String, dynamic>> employees,
      final List<Map<String, dynamic>> fetchedEmployees,
      final Set<String> selectedEmployeeIds,
      final bool selectAll,
      final DailyAttendanceModel? dailyAttendanceModel,
      final MonthlyAttendanceModel? monthlyAttendanceModel,
      final dynamic monthlyAttendanceLoading,
      final dynamic dailyAttendanceLoading}) = _$AttendanceStateImpl;

  @override
  AttendanceRepo get attendanceRepo;
  @override
  AttendanceStatus get status;
  @override
  String get message;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  String? get address;
  @override
  File? get photoFile;
  @override // new fields for date handling
  DateTime? get selectedDate;
  @override
  DateTime? get today;
  @override // Filter Info
  String get selectedFilter;
  @override
  DateTime? get fromDate;
  @override
  DateTime? get toDate;
  @override // 🔹 Employee Selection
  List<Map<String, dynamic>> get employees;
  @override
  List<Map<String, dynamic>> get fetchedEmployees;
  @override
  Set<String> get selectedEmployeeIds;
  @override
  bool get selectAll;
  @override // daily attendance
  DailyAttendanceModel? get dailyAttendanceModel;
  @override // monthly attendance
  MonthlyAttendanceModel? get monthlyAttendanceModel;
  @override
  dynamic get monthlyAttendanceLoading;
  @override
  dynamic get dailyAttendanceLoading;
  @override
  @JsonKey(ignore: true)
  _$$AttendanceStateImplCopyWith<_$AttendanceStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
