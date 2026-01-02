// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'holiday_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HolidayEvent {
  int? get selectedYear => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? selectedYear) getHolidayList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? selectedYear)? getHolidayList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? selectedYear)? getHolidayList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHolidayList value) getHolidayList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHolidayList value)? getHolidayList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHolidayList value)? getHolidayList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HolidayEventCopyWith<HolidayEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayEventCopyWith<$Res> {
  factory $HolidayEventCopyWith(
          HolidayEvent value, $Res Function(HolidayEvent) then) =
      _$HolidayEventCopyWithImpl<$Res, HolidayEvent>;
  @useResult
  $Res call({int? selectedYear});
}

/// @nodoc
class _$HolidayEventCopyWithImpl<$Res, $Val extends HolidayEvent>
    implements $HolidayEventCopyWith<$Res> {
  _$HolidayEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedYear = freezed,
  }) {
    return _then(_value.copyWith(
      selectedYear: freezed == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetHolidayListImplCopyWith<$Res>
    implements $HolidayEventCopyWith<$Res> {
  factory _$$GetHolidayListImplCopyWith(_$GetHolidayListImpl value,
          $Res Function(_$GetHolidayListImpl) then) =
      __$$GetHolidayListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? selectedYear});
}

/// @nodoc
class __$$GetHolidayListImplCopyWithImpl<$Res>
    extends _$HolidayEventCopyWithImpl<$Res, _$GetHolidayListImpl>
    implements _$$GetHolidayListImplCopyWith<$Res> {
  __$$GetHolidayListImplCopyWithImpl(
      _$GetHolidayListImpl _value, $Res Function(_$GetHolidayListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedYear = freezed,
  }) {
    return _then(_$GetHolidayListImpl(
      selectedYear: freezed == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetHolidayListImpl implements _GetHolidayList {
  const _$GetHolidayListImpl({this.selectedYear});

  @override
  final int? selectedYear;

  @override
  String toString() {
    return 'HolidayEvent.getHolidayList(selectedYear: $selectedYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetHolidayListImpl &&
            (identical(other.selectedYear, selectedYear) ||
                other.selectedYear == selectedYear));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedYear);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetHolidayListImplCopyWith<_$GetHolidayListImpl> get copyWith =>
      __$$GetHolidayListImplCopyWithImpl<_$GetHolidayListImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int? selectedYear) getHolidayList,
  }) {
    return getHolidayList(selectedYear);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int? selectedYear)? getHolidayList,
  }) {
    return getHolidayList?.call(selectedYear);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int? selectedYear)? getHolidayList,
    required TResult orElse(),
  }) {
    if (getHolidayList != null) {
      return getHolidayList(selectedYear);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetHolidayList value) getHolidayList,
  }) {
    return getHolidayList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetHolidayList value)? getHolidayList,
  }) {
    return getHolidayList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetHolidayList value)? getHolidayList,
    required TResult orElse(),
  }) {
    if (getHolidayList != null) {
      return getHolidayList(this);
    }
    return orElse();
  }
}

abstract class _GetHolidayList implements HolidayEvent {
  const factory _GetHolidayList({final int? selectedYear}) =
      _$GetHolidayListImpl;

  @override
  int? get selectedYear;
  @override
  @JsonKey(ignore: true)
  _$$GetHolidayListImplCopyWith<_$GetHolidayListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HolidayState {
  HolidayStatus get status => throw _privateConstructorUsedError;
  HolidayRepo get holidayRepo => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  HolidayListModel? get holidayListModel => throw _privateConstructorUsedError;
  int? get selectedYear => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HolidayStateCopyWith<HolidayState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HolidayStateCopyWith<$Res> {
  factory $HolidayStateCopyWith(
          HolidayState value, $Res Function(HolidayState) then) =
      _$HolidayStateCopyWithImpl<$Res, HolidayState>;
  @useResult
  $Res call(
      {HolidayStatus status,
      HolidayRepo holidayRepo,
      String message,
      HolidayListModel? holidayListModel,
      int? selectedYear});
}

/// @nodoc
class _$HolidayStateCopyWithImpl<$Res, $Val extends HolidayState>
    implements $HolidayStateCopyWith<$Res> {
  _$HolidayStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? holidayRepo = null,
    Object? message = null,
    Object? holidayListModel = freezed,
    Object? selectedYear = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HolidayStatus,
      holidayRepo: null == holidayRepo
          ? _value.holidayRepo
          : holidayRepo // ignore: cast_nullable_to_non_nullable
              as HolidayRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      holidayListModel: freezed == holidayListModel
          ? _value.holidayListModel
          : holidayListModel // ignore: cast_nullable_to_non_nullable
              as HolidayListModel?,
      selectedYear: freezed == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HolidayStateImplCopyWith<$Res>
    implements $HolidayStateCopyWith<$Res> {
  factory _$$HolidayStateImplCopyWith(
          _$HolidayStateImpl value, $Res Function(_$HolidayStateImpl) then) =
      __$$HolidayStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {HolidayStatus status,
      HolidayRepo holidayRepo,
      String message,
      HolidayListModel? holidayListModel,
      int? selectedYear});
}

/// @nodoc
class __$$HolidayStateImplCopyWithImpl<$Res>
    extends _$HolidayStateCopyWithImpl<$Res, _$HolidayStateImpl>
    implements _$$HolidayStateImplCopyWith<$Res> {
  __$$HolidayStateImplCopyWithImpl(
      _$HolidayStateImpl _value, $Res Function(_$HolidayStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? holidayRepo = null,
    Object? message = null,
    Object? holidayListModel = freezed,
    Object? selectedYear = freezed,
  }) {
    return _then(_$HolidayStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HolidayStatus,
      holidayRepo: null == holidayRepo
          ? _value.holidayRepo
          : holidayRepo // ignore: cast_nullable_to_non_nullable
              as HolidayRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      holidayListModel: freezed == holidayListModel
          ? _value.holidayListModel
          : holidayListModel // ignore: cast_nullable_to_non_nullable
              as HolidayListModel?,
      selectedYear: freezed == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$HolidayStateImpl implements _HolidayState {
  const _$HolidayStateImpl(
      {this.status = HolidayStatus.initial,
      required this.holidayRepo,
      this.message = '',
      this.holidayListModel,
      this.selectedYear});

  @override
  @JsonKey()
  final HolidayStatus status;
  @override
  final HolidayRepo holidayRepo;
  @override
  @JsonKey()
  final String message;
  @override
  final HolidayListModel? holidayListModel;
  @override
  final int? selectedYear;

  @override
  String toString() {
    return 'HolidayState(status: $status, holidayRepo: $holidayRepo, message: $message, holidayListModel: $holidayListModel, selectedYear: $selectedYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HolidayStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.holidayRepo, holidayRepo) ||
                other.holidayRepo == holidayRepo) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.holidayListModel, holidayListModel) ||
                other.holidayListModel == holidayListModel) &&
            (identical(other.selectedYear, selectedYear) ||
                other.selectedYear == selectedYear));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, holidayRepo, message,
      holidayListModel, selectedYear);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HolidayStateImplCopyWith<_$HolidayStateImpl> get copyWith =>
      __$$HolidayStateImplCopyWithImpl<_$HolidayStateImpl>(this, _$identity);
}

abstract class _HolidayState implements HolidayState {
  const factory _HolidayState(
      {final HolidayStatus status,
      required final HolidayRepo holidayRepo,
      final String message,
      final HolidayListModel? holidayListModel,
      final int? selectedYear}) = _$HolidayStateImpl;

  @override
  HolidayStatus get status;
  @override
  HolidayRepo get holidayRepo;
  @override
  String get message;
  @override
  HolidayListModel? get holidayListModel;
  @override
  int? get selectedYear;
  @override
  @JsonKey(ignore: true)
  _$$HolidayStateImplCopyWith<_$HolidayStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
