// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'salary_slip_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalarySlipEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? selectedYear) selectYear,
    required TResult Function(DropdownModel? selectedMonth) selectMonth,
    required TResult Function() downloadSalarySlip,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? selectedYear)? selectYear,
    TResult? Function(DropdownModel? selectedMonth)? selectMonth,
    TResult? Function()? downloadSalarySlip,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? selectedYear)? selectYear,
    TResult Function(DropdownModel? selectedMonth)? selectMonth,
    TResult Function()? downloadSalarySlip,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectYear value) selectYear,
    required TResult Function(_SelectMonth value) selectMonth,
    required TResult Function(_DownloadSalarySlip value) downloadSalarySlip,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectYear value)? selectYear,
    TResult? Function(_SelectMonth value)? selectMonth,
    TResult? Function(_DownloadSalarySlip value)? downloadSalarySlip,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectYear value)? selectYear,
    TResult Function(_SelectMonth value)? selectMonth,
    TResult Function(_DownloadSalarySlip value)? downloadSalarySlip,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalarySlipEventCopyWith<$Res> {
  factory $SalarySlipEventCopyWith(
          SalarySlipEvent value, $Res Function(SalarySlipEvent) then) =
      _$SalarySlipEventCopyWithImpl<$Res, SalarySlipEvent>;
}

/// @nodoc
class _$SalarySlipEventCopyWithImpl<$Res, $Val extends SalarySlipEvent>
    implements $SalarySlipEventCopyWith<$Res> {
  _$SalarySlipEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SelectYearImplCopyWith<$Res> {
  factory _$$SelectYearImplCopyWith(
          _$SelectYearImpl value, $Res Function(_$SelectYearImpl) then) =
      __$$SelectYearImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DropdownModel? selectedYear});
}

/// @nodoc
class __$$SelectYearImplCopyWithImpl<$Res>
    extends _$SalarySlipEventCopyWithImpl<$Res, _$SelectYearImpl>
    implements _$$SelectYearImplCopyWith<$Res> {
  __$$SelectYearImplCopyWithImpl(
      _$SelectYearImpl _value, $Res Function(_$SelectYearImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedYear = freezed,
  }) {
    return _then(_$SelectYearImpl(
      selectedYear: freezed == selectedYear
          ? _value.selectedYear
          : selectedYear // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$SelectYearImpl implements _SelectYear {
  const _$SelectYearImpl({this.selectedYear});

  @override
  final DropdownModel? selectedYear;

  @override
  String toString() {
    return 'SalarySlipEvent.selectYear(selectedYear: $selectedYear)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectYearImpl &&
            (identical(other.selectedYear, selectedYear) ||
                other.selectedYear == selectedYear));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedYear);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectYearImplCopyWith<_$SelectYearImpl> get copyWith =>
      __$$SelectYearImplCopyWithImpl<_$SelectYearImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? selectedYear) selectYear,
    required TResult Function(DropdownModel? selectedMonth) selectMonth,
    required TResult Function() downloadSalarySlip,
  }) {
    return selectYear(selectedYear);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? selectedYear)? selectYear,
    TResult? Function(DropdownModel? selectedMonth)? selectMonth,
    TResult? Function()? downloadSalarySlip,
  }) {
    return selectYear?.call(selectedYear);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? selectedYear)? selectYear,
    TResult Function(DropdownModel? selectedMonth)? selectMonth,
    TResult Function()? downloadSalarySlip,
    required TResult orElse(),
  }) {
    if (selectYear != null) {
      return selectYear(selectedYear);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectYear value) selectYear,
    required TResult Function(_SelectMonth value) selectMonth,
    required TResult Function(_DownloadSalarySlip value) downloadSalarySlip,
  }) {
    return selectYear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectYear value)? selectYear,
    TResult? Function(_SelectMonth value)? selectMonth,
    TResult? Function(_DownloadSalarySlip value)? downloadSalarySlip,
  }) {
    return selectYear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectYear value)? selectYear,
    TResult Function(_SelectMonth value)? selectMonth,
    TResult Function(_DownloadSalarySlip value)? downloadSalarySlip,
    required TResult orElse(),
  }) {
    if (selectYear != null) {
      return selectYear(this);
    }
    return orElse();
  }
}

abstract class _SelectYear implements SalarySlipEvent {
  const factory _SelectYear({final DropdownModel? selectedYear}) =
      _$SelectYearImpl;

  DropdownModel? get selectedYear;
  @JsonKey(ignore: true)
  _$$SelectYearImplCopyWith<_$SelectYearImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectMonthImplCopyWith<$Res> {
  factory _$$SelectMonthImplCopyWith(
          _$SelectMonthImpl value, $Res Function(_$SelectMonthImpl) then) =
      __$$SelectMonthImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DropdownModel? selectedMonth});
}

/// @nodoc
class __$$SelectMonthImplCopyWithImpl<$Res>
    extends _$SalarySlipEventCopyWithImpl<$Res, _$SelectMonthImpl>
    implements _$$SelectMonthImplCopyWith<$Res> {
  __$$SelectMonthImplCopyWithImpl(
      _$SelectMonthImpl _value, $Res Function(_$SelectMonthImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMonth = freezed,
  }) {
    return _then(_$SelectMonthImpl(
      selectedMonth: freezed == selectedMonth
          ? _value.selectedMonth
          : selectedMonth // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$SelectMonthImpl implements _SelectMonth {
  const _$SelectMonthImpl({this.selectedMonth});

  @override
  final DropdownModel? selectedMonth;

  @override
  String toString() {
    return 'SalarySlipEvent.selectMonth(selectedMonth: $selectedMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectMonthImpl &&
            (identical(other.selectedMonth, selectedMonth) ||
                other.selectedMonth == selectedMonth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectMonthImplCopyWith<_$SelectMonthImpl> get copyWith =>
      __$$SelectMonthImplCopyWithImpl<_$SelectMonthImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? selectedYear) selectYear,
    required TResult Function(DropdownModel? selectedMonth) selectMonth,
    required TResult Function() downloadSalarySlip,
  }) {
    return selectMonth(selectedMonth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? selectedYear)? selectYear,
    TResult? Function(DropdownModel? selectedMonth)? selectMonth,
    TResult? Function()? downloadSalarySlip,
  }) {
    return selectMonth?.call(selectedMonth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? selectedYear)? selectYear,
    TResult Function(DropdownModel? selectedMonth)? selectMonth,
    TResult Function()? downloadSalarySlip,
    required TResult orElse(),
  }) {
    if (selectMonth != null) {
      return selectMonth(selectedMonth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectYear value) selectYear,
    required TResult Function(_SelectMonth value) selectMonth,
    required TResult Function(_DownloadSalarySlip value) downloadSalarySlip,
  }) {
    return selectMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectYear value)? selectYear,
    TResult? Function(_SelectMonth value)? selectMonth,
    TResult? Function(_DownloadSalarySlip value)? downloadSalarySlip,
  }) {
    return selectMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectYear value)? selectYear,
    TResult Function(_SelectMonth value)? selectMonth,
    TResult Function(_DownloadSalarySlip value)? downloadSalarySlip,
    required TResult orElse(),
  }) {
    if (selectMonth != null) {
      return selectMonth(this);
    }
    return orElse();
  }
}

abstract class _SelectMonth implements SalarySlipEvent {
  const factory _SelectMonth({final DropdownModel? selectedMonth}) =
      _$SelectMonthImpl;

  DropdownModel? get selectedMonth;
  @JsonKey(ignore: true)
  _$$SelectMonthImplCopyWith<_$SelectMonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadSalarySlipImplCopyWith<$Res> {
  factory _$$DownloadSalarySlipImplCopyWith(_$DownloadSalarySlipImpl value,
          $Res Function(_$DownloadSalarySlipImpl) then) =
      __$$DownloadSalarySlipImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadSalarySlipImplCopyWithImpl<$Res>
    extends _$SalarySlipEventCopyWithImpl<$Res, _$DownloadSalarySlipImpl>
    implements _$$DownloadSalarySlipImplCopyWith<$Res> {
  __$$DownloadSalarySlipImplCopyWithImpl(_$DownloadSalarySlipImpl _value,
      $Res Function(_$DownloadSalarySlipImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DownloadSalarySlipImpl implements _DownloadSalarySlip {
  const _$DownloadSalarySlipImpl();

  @override
  String toString() {
    return 'SalarySlipEvent.downloadSalarySlip()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadSalarySlipImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DropdownModel? selectedYear) selectYear,
    required TResult Function(DropdownModel? selectedMonth) selectMonth,
    required TResult Function() downloadSalarySlip,
  }) {
    return downloadSalarySlip();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DropdownModel? selectedYear)? selectYear,
    TResult? Function(DropdownModel? selectedMonth)? selectMonth,
    TResult? Function()? downloadSalarySlip,
  }) {
    return downloadSalarySlip?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DropdownModel? selectedYear)? selectYear,
    TResult Function(DropdownModel? selectedMonth)? selectMonth,
    TResult Function()? downloadSalarySlip,
    required TResult orElse(),
  }) {
    if (downloadSalarySlip != null) {
      return downloadSalarySlip();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SelectYear value) selectYear,
    required TResult Function(_SelectMonth value) selectMonth,
    required TResult Function(_DownloadSalarySlip value) downloadSalarySlip,
  }) {
    return downloadSalarySlip(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SelectYear value)? selectYear,
    TResult? Function(_SelectMonth value)? selectMonth,
    TResult? Function(_DownloadSalarySlip value)? downloadSalarySlip,
  }) {
    return downloadSalarySlip?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SelectYear value)? selectYear,
    TResult Function(_SelectMonth value)? selectMonth,
    TResult Function(_DownloadSalarySlip value)? downloadSalarySlip,
    required TResult orElse(),
  }) {
    if (downloadSalarySlip != null) {
      return downloadSalarySlip(this);
    }
    return orElse();
  }
}

abstract class _DownloadSalarySlip implements SalarySlipEvent {
  const factory _DownloadSalarySlip() = _$DownloadSalarySlipImpl;
}

/// @nodoc
mixin _$SalarySlipState {
  SalarySlipStatus get status => throw _privateConstructorUsedError;
  SalarySlipRepo get salarySlipRepo => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  File? get file => throw _privateConstructorUsedError;
  double get progress => throw _privateConstructorUsedError;
  DropdownModel? get year => throw _privateConstructorUsedError;
  DropdownModel? get month => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalarySlipStateCopyWith<SalarySlipState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalarySlipStateCopyWith<$Res> {
  factory $SalarySlipStateCopyWith(
          SalarySlipState value, $Res Function(SalarySlipState) then) =
      _$SalarySlipStateCopyWithImpl<$Res, SalarySlipState>;
  @useResult
  $Res call(
      {SalarySlipStatus status,
      SalarySlipRepo salarySlipRepo,
      String message,
      File? file,
      double progress,
      DropdownModel? year,
      DropdownModel? month});
}

/// @nodoc
class _$SalarySlipStateCopyWithImpl<$Res, $Val extends SalarySlipState>
    implements $SalarySlipStateCopyWith<$Res> {
  _$SalarySlipStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? salarySlipRepo = null,
    Object? message = null,
    Object? file = freezed,
    Object? progress = null,
    Object? year = freezed,
    Object? month = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SalarySlipStatus,
      salarySlipRepo: null == salarySlipRepo
          ? _value.salarySlipRepo
          : salarySlipRepo // ignore: cast_nullable_to_non_nullable
              as SalarySlipRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalarySlipStateImplCopyWith<$Res>
    implements $SalarySlipStateCopyWith<$Res> {
  factory _$$SalarySlipStateImplCopyWith(_$SalarySlipStateImpl value,
          $Res Function(_$SalarySlipStateImpl) then) =
      __$$SalarySlipStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SalarySlipStatus status,
      SalarySlipRepo salarySlipRepo,
      String message,
      File? file,
      double progress,
      DropdownModel? year,
      DropdownModel? month});
}

/// @nodoc
class __$$SalarySlipStateImplCopyWithImpl<$Res>
    extends _$SalarySlipStateCopyWithImpl<$Res, _$SalarySlipStateImpl>
    implements _$$SalarySlipStateImplCopyWith<$Res> {
  __$$SalarySlipStateImplCopyWithImpl(
      _$SalarySlipStateImpl _value, $Res Function(_$SalarySlipStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? salarySlipRepo = null,
    Object? message = null,
    Object? file = freezed,
    Object? progress = null,
    Object? year = freezed,
    Object? month = freezed,
  }) {
    return _then(_$SalarySlipStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as SalarySlipStatus,
      salarySlipRepo: null == salarySlipRepo
          ? _value.salarySlipRepo
          : salarySlipRepo // ignore: cast_nullable_to_non_nullable
              as SalarySlipRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File?,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
      month: freezed == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as DropdownModel?,
    ));
  }
}

/// @nodoc

class _$SalarySlipStateImpl implements _SalarySlipState {
  const _$SalarySlipStateImpl(
      {this.status = SalarySlipStatus.initial,
      required this.salarySlipRepo,
      this.message = '',
      this.file,
      this.progress = 0,
      this.year,
      this.month});

  @override
  @JsonKey()
  final SalarySlipStatus status;
  @override
  final SalarySlipRepo salarySlipRepo;
  @override
  @JsonKey()
  final String message;
  @override
  final File? file;
  @override
  @JsonKey()
  final double progress;
  @override
  final DropdownModel? year;
  @override
  final DropdownModel? month;

  @override
  String toString() {
    return 'SalarySlipState(status: $status, salarySlipRepo: $salarySlipRepo, message: $message, file: $file, progress: $progress, year: $year, month: $month)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalarySlipStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.salarySlipRepo, salarySlipRepo) ||
                other.salarySlipRepo == salarySlipRepo) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.month, month) || other.month == month));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, salarySlipRepo, message,
      file, progress, year, month);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalarySlipStateImplCopyWith<_$SalarySlipStateImpl> get copyWith =>
      __$$SalarySlipStateImplCopyWithImpl<_$SalarySlipStateImpl>(
          this, _$identity);
}

abstract class _SalarySlipState implements SalarySlipState {
  const factory _SalarySlipState(
      {final SalarySlipStatus status,
      required final SalarySlipRepo salarySlipRepo,
      final String message,
      final File? file,
      final double progress,
      final DropdownModel? year,
      final DropdownModel? month}) = _$SalarySlipStateImpl;

  @override
  SalarySlipStatus get status;
  @override
  SalarySlipRepo get salarySlipRepo;
  @override
  String get message;
  @override
  File? get file;
  @override
  double get progress;
  @override
  DropdownModel? get year;
  @override
  DropdownModel? get month;
  @override
  @JsonKey(ignore: true)
  _$$SalarySlipStateImplCopyWith<_$SalarySlipStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
