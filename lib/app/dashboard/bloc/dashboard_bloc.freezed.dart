// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DashboardEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserProfileData,
    required TResult Function() getAppVersion,
    required TResult Function(int month, int year) getMonthlyAttendance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserProfileData,
    TResult? Function()? getAppVersion,
    TResult? Function(int month, int year)? getMonthlyAttendance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserProfileData,
    TResult Function()? getAppVersion,
    TResult Function(int month, int year)? getMonthlyAttendance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProfileData value) getUserProfileData,
    required TResult Function(_GetAppVersion value) getAppVersion,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProfileData value)? getUserProfileData,
    TResult? Function(_GetAppVersion value)? getAppVersion,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProfileData value)? getUserProfileData,
    TResult Function(_GetAppVersion value)? getAppVersion,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardEventCopyWith<$Res> {
  factory $DashboardEventCopyWith(
          DashboardEvent value, $Res Function(DashboardEvent) then) =
      _$DashboardEventCopyWithImpl<$Res, DashboardEvent>;
}

/// @nodoc
class _$DashboardEventCopyWithImpl<$Res, $Val extends DashboardEvent>
    implements $DashboardEventCopyWith<$Res> {
  _$DashboardEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetUserProfileDataImplCopyWith<$Res> {
  factory _$$GetUserProfileDataImplCopyWith(_$GetUserProfileDataImpl value,
          $Res Function(_$GetUserProfileDataImpl) then) =
      __$$GetUserProfileDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserProfileDataImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$GetUserProfileDataImpl>
    implements _$$GetUserProfileDataImplCopyWith<$Res> {
  __$$GetUserProfileDataImplCopyWithImpl(_$GetUserProfileDataImpl _value,
      $Res Function(_$GetUserProfileDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserProfileDataImpl implements _GetUserProfileData {
  const _$GetUserProfileDataImpl();

  @override
  String toString() {
    return 'DashboardEvent.getUserProfileData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserProfileDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserProfileData,
    required TResult Function() getAppVersion,
    required TResult Function(int month, int year) getMonthlyAttendance,
  }) {
    return getUserProfileData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserProfileData,
    TResult? Function()? getAppVersion,
    TResult? Function(int month, int year)? getMonthlyAttendance,
  }) {
    return getUserProfileData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserProfileData,
    TResult Function()? getAppVersion,
    TResult Function(int month, int year)? getMonthlyAttendance,
    required TResult orElse(),
  }) {
    if (getUserProfileData != null) {
      return getUserProfileData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProfileData value) getUserProfileData,
    required TResult Function(_GetAppVersion value) getAppVersion,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
  }) {
    return getUserProfileData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProfileData value)? getUserProfileData,
    TResult? Function(_GetAppVersion value)? getAppVersion,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
  }) {
    return getUserProfileData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProfileData value)? getUserProfileData,
    TResult Function(_GetAppVersion value)? getAppVersion,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    required TResult orElse(),
  }) {
    if (getUserProfileData != null) {
      return getUserProfileData(this);
    }
    return orElse();
  }
}

abstract class _GetUserProfileData implements DashboardEvent {
  const factory _GetUserProfileData() = _$GetUserProfileDataImpl;
}

/// @nodoc
abstract class _$$GetAppVersionImplCopyWith<$Res> {
  factory _$$GetAppVersionImplCopyWith(
          _$GetAppVersionImpl value, $Res Function(_$GetAppVersionImpl) then) =
      __$$GetAppVersionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAppVersionImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$GetAppVersionImpl>
    implements _$$GetAppVersionImplCopyWith<$Res> {
  __$$GetAppVersionImplCopyWithImpl(
      _$GetAppVersionImpl _value, $Res Function(_$GetAppVersionImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAppVersionImpl implements _GetAppVersion {
  const _$GetAppVersionImpl();

  @override
  String toString() {
    return 'DashboardEvent.getAppVersion()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAppVersionImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getUserProfileData,
    required TResult Function() getAppVersion,
    required TResult Function(int month, int year) getMonthlyAttendance,
  }) {
    return getAppVersion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserProfileData,
    TResult? Function()? getAppVersion,
    TResult? Function(int month, int year)? getMonthlyAttendance,
  }) {
    return getAppVersion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserProfileData,
    TResult Function()? getAppVersion,
    TResult Function(int month, int year)? getMonthlyAttendance,
    required TResult orElse(),
  }) {
    if (getAppVersion != null) {
      return getAppVersion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProfileData value) getUserProfileData,
    required TResult Function(_GetAppVersion value) getAppVersion,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
  }) {
    return getAppVersion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProfileData value)? getUserProfileData,
    TResult? Function(_GetAppVersion value)? getAppVersion,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
  }) {
    return getAppVersion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProfileData value)? getUserProfileData,
    TResult Function(_GetAppVersion value)? getAppVersion,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    required TResult orElse(),
  }) {
    if (getAppVersion != null) {
      return getAppVersion(this);
    }
    return orElse();
  }
}

abstract class _GetAppVersion implements DashboardEvent {
  const factory _GetAppVersion() = _$GetAppVersionImpl;
}

/// @nodoc
abstract class _$$GetMonthlyAttendanceImplCopyWith<$Res> {
  factory _$$GetMonthlyAttendanceImplCopyWith(_$GetMonthlyAttendanceImpl value,
          $Res Function(_$GetMonthlyAttendanceImpl) then) =
      __$$GetMonthlyAttendanceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int month, int year});
}

/// @nodoc
class __$$GetMonthlyAttendanceImplCopyWithImpl<$Res>
    extends _$DashboardEventCopyWithImpl<$Res, _$GetMonthlyAttendanceImpl>
    implements _$$GetMonthlyAttendanceImplCopyWith<$Res> {
  __$$GetMonthlyAttendanceImplCopyWithImpl(_$GetMonthlyAttendanceImpl _value,
      $Res Function(_$GetMonthlyAttendanceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_$GetMonthlyAttendanceImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GetMonthlyAttendanceImpl implements _GetMonthlyAttendance {
  const _$GetMonthlyAttendanceImpl({required this.month, required this.year});

  @override
  final int month;
  @override
  final int year;

  @override
  String toString() {
    return 'DashboardEvent.getMonthlyAttendance(month: $month, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMonthlyAttendanceImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, year);

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
    required TResult Function() getUserProfileData,
    required TResult Function() getAppVersion,
    required TResult Function(int month, int year) getMonthlyAttendance,
  }) {
    return getMonthlyAttendance(month, year);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getUserProfileData,
    TResult? Function()? getAppVersion,
    TResult? Function(int month, int year)? getMonthlyAttendance,
  }) {
    return getMonthlyAttendance?.call(month, year);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getUserProfileData,
    TResult Function()? getAppVersion,
    TResult Function(int month, int year)? getMonthlyAttendance,
    required TResult orElse(),
  }) {
    if (getMonthlyAttendance != null) {
      return getMonthlyAttendance(month, year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetUserProfileData value) getUserProfileData,
    required TResult Function(_GetAppVersion value) getAppVersion,
    required TResult Function(_GetMonthlyAttendance value) getMonthlyAttendance,
  }) {
    return getMonthlyAttendance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetUserProfileData value)? getUserProfileData,
    TResult? Function(_GetAppVersion value)? getAppVersion,
    TResult? Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
  }) {
    return getMonthlyAttendance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetUserProfileData value)? getUserProfileData,
    TResult Function(_GetAppVersion value)? getAppVersion,
    TResult Function(_GetMonthlyAttendance value)? getMonthlyAttendance,
    required TResult orElse(),
  }) {
    if (getMonthlyAttendance != null) {
      return getMonthlyAttendance(this);
    }
    return orElse();
  }
}

abstract class _GetMonthlyAttendance implements DashboardEvent {
  const factory _GetMonthlyAttendance(
      {required final int month,
      required final int year}) = _$GetMonthlyAttendanceImpl;

  int get month;
  int get year;
  @JsonKey(ignore: true)
  _$$GetMonthlyAttendanceImplCopyWith<_$GetMonthlyAttendanceImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DashboardState {
  DashboardStatus get status => throw _privateConstructorUsedError;
  DashboardRepo get dashboardRepo => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  UserProfileDataModel? get userProfileDataModel =>
      throw _privateConstructorUsedError;
  MonthlyAttendanceModel? get monthlyAttendanceModel =>
      throw _privateConstructorUsedError;
  AppVersionModel? get appVersionModel => throw _privateConstructorUsedError;
  dynamic get userProfileLoading => throw _privateConstructorUsedError;
  dynamic get appVersionLoading => throw _privateConstructorUsedError;
  dynamic get monthlyAttendanceLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call(
      {DashboardStatus status,
      DashboardRepo dashboardRepo,
      String message,
      UserProfileDataModel? userProfileDataModel,
      MonthlyAttendanceModel? monthlyAttendanceModel,
      AppVersionModel? appVersionModel,
      dynamic userProfileLoading,
      dynamic appVersionLoading,
      dynamic monthlyAttendanceLoading});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dashboardRepo = null,
    Object? message = null,
    Object? userProfileDataModel = freezed,
    Object? monthlyAttendanceModel = freezed,
    Object? appVersionModel = freezed,
    Object? userProfileLoading = freezed,
    Object? appVersionLoading = freezed,
    Object? monthlyAttendanceLoading = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DashboardStatus,
      dashboardRepo: null == dashboardRepo
          ? _value.dashboardRepo
          : dashboardRepo // ignore: cast_nullable_to_non_nullable
              as DashboardRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileDataModel: freezed == userProfileDataModel
          ? _value.userProfileDataModel
          : userProfileDataModel // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel?,
      monthlyAttendanceModel: freezed == monthlyAttendanceModel
          ? _value.monthlyAttendanceModel
          : monthlyAttendanceModel // ignore: cast_nullable_to_non_nullable
              as MonthlyAttendanceModel?,
      appVersionModel: freezed == appVersionModel
          ? _value.appVersionModel
          : appVersionModel // ignore: cast_nullable_to_non_nullable
              as AppVersionModel?,
      userProfileLoading: freezed == userProfileLoading
          ? _value.userProfileLoading
          : userProfileLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      appVersionLoading: freezed == appVersionLoading
          ? _value.appVersionLoading
          : appVersionLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      monthlyAttendanceLoading: freezed == monthlyAttendanceLoading
          ? _value.monthlyAttendanceLoading
          : monthlyAttendanceLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DashboardStateImplCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$DashboardStateImplCopyWith(_$DashboardStateImpl value,
          $Res Function(_$DashboardStateImpl) then) =
      __$$DashboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DashboardStatus status,
      DashboardRepo dashboardRepo,
      String message,
      UserProfileDataModel? userProfileDataModel,
      MonthlyAttendanceModel? monthlyAttendanceModel,
      AppVersionModel? appVersionModel,
      dynamic userProfileLoading,
      dynamic appVersionLoading,
      dynamic monthlyAttendanceLoading});
}

/// @nodoc
class __$$DashboardStateImplCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$DashboardStateImpl>
    implements _$$DashboardStateImplCopyWith<$Res> {
  __$$DashboardStateImplCopyWithImpl(
      _$DashboardStateImpl _value, $Res Function(_$DashboardStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? dashboardRepo = null,
    Object? message = null,
    Object? userProfileDataModel = freezed,
    Object? monthlyAttendanceModel = freezed,
    Object? appVersionModel = freezed,
    Object? userProfileLoading = freezed,
    Object? appVersionLoading = freezed,
    Object? monthlyAttendanceLoading = freezed,
  }) {
    return _then(_$DashboardStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DashboardStatus,
      dashboardRepo: null == dashboardRepo
          ? _value.dashboardRepo
          : dashboardRepo // ignore: cast_nullable_to_non_nullable
              as DashboardRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileDataModel: freezed == userProfileDataModel
          ? _value.userProfileDataModel
          : userProfileDataModel // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel?,
      monthlyAttendanceModel: freezed == monthlyAttendanceModel
          ? _value.monthlyAttendanceModel
          : monthlyAttendanceModel // ignore: cast_nullable_to_non_nullable
              as MonthlyAttendanceModel?,
      appVersionModel: freezed == appVersionModel
          ? _value.appVersionModel
          : appVersionModel // ignore: cast_nullable_to_non_nullable
              as AppVersionModel?,
      userProfileLoading: freezed == userProfileLoading
          ? _value.userProfileLoading!
          : userProfileLoading,
      appVersionLoading: freezed == appVersionLoading
          ? _value.appVersionLoading!
          : appVersionLoading,
      monthlyAttendanceLoading: freezed == monthlyAttendanceLoading
          ? _value.monthlyAttendanceLoading!
          : monthlyAttendanceLoading,
    ));
  }
}

/// @nodoc

class _$DashboardStateImpl implements _DashboardState {
  const _$DashboardStateImpl(
      {this.status = DashboardStatus.initial,
      required this.dashboardRepo,
      this.message = '',
      this.userProfileDataModel,
      this.monthlyAttendanceModel,
      this.appVersionModel,
      this.userProfileLoading = false,
      this.appVersionLoading = false,
      this.monthlyAttendanceLoading = false});

  @override
  @JsonKey()
  final DashboardStatus status;
  @override
  final DashboardRepo dashboardRepo;
  @override
  @JsonKey()
  final String message;
  @override
  final UserProfileDataModel? userProfileDataModel;
  @override
  final MonthlyAttendanceModel? monthlyAttendanceModel;
  @override
  final AppVersionModel? appVersionModel;
  @override
  @JsonKey()
  final dynamic userProfileLoading;
  @override
  @JsonKey()
  final dynamic appVersionLoading;
  @override
  @JsonKey()
  final dynamic monthlyAttendanceLoading;

  @override
  String toString() {
    return 'DashboardState(status: $status, dashboardRepo: $dashboardRepo, message: $message, userProfileDataModel: $userProfileDataModel, monthlyAttendanceModel: $monthlyAttendanceModel, appVersionModel: $appVersionModel, userProfileLoading: $userProfileLoading, appVersionLoading: $appVersionLoading, monthlyAttendanceLoading: $monthlyAttendanceLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.dashboardRepo, dashboardRepo) ||
                other.dashboardRepo == dashboardRepo) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.userProfileDataModel, userProfileDataModel) ||
                other.userProfileDataModel == userProfileDataModel) &&
            (identical(other.monthlyAttendanceModel, monthlyAttendanceModel) ||
                other.monthlyAttendanceModel == monthlyAttendanceModel) &&
            (identical(other.appVersionModel, appVersionModel) ||
                other.appVersionModel == appVersionModel) &&
            const DeepCollectionEquality()
                .equals(other.userProfileLoading, userProfileLoading) &&
            const DeepCollectionEquality()
                .equals(other.appVersionLoading, appVersionLoading) &&
            const DeepCollectionEquality().equals(
                other.monthlyAttendanceLoading, monthlyAttendanceLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      dashboardRepo,
      message,
      userProfileDataModel,
      monthlyAttendanceModel,
      appVersionModel,
      const DeepCollectionEquality().hash(userProfileLoading),
      const DeepCollectionEquality().hash(appVersionLoading),
      const DeepCollectionEquality().hash(monthlyAttendanceLoading));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      __$$DashboardStateImplCopyWithImpl<_$DashboardStateImpl>(
          this, _$identity);
}

abstract class _DashboardState implements DashboardState {
  const factory _DashboardState(
      {final DashboardStatus status,
      required final DashboardRepo dashboardRepo,
      final String message,
      final UserProfileDataModel? userProfileDataModel,
      final MonthlyAttendanceModel? monthlyAttendanceModel,
      final AppVersionModel? appVersionModel,
      final dynamic userProfileLoading,
      final dynamic appVersionLoading,
      final dynamic monthlyAttendanceLoading}) = _$DashboardStateImpl;

  @override
  DashboardStatus get status;
  @override
  DashboardRepo get dashboardRepo;
  @override
  String get message;
  @override
  UserProfileDataModel? get userProfileDataModel;
  @override
  MonthlyAttendanceModel? get monthlyAttendanceModel;
  @override
  AppVersionModel? get appVersionModel;
  @override
  dynamic get userProfileLoading;
  @override
  dynamic get appVersionLoading;
  @override
  dynamic get monthlyAttendanceLoading;
  @override
  @JsonKey(ignore: true)
  _$$DashboardStateImplCopyWith<_$DashboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
