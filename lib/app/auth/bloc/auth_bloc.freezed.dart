// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRememberMe,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRememberMe,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRememberMe,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRememberMe value) fetchRememberMe,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_GetUserData value) getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRememberMe value)? fetchRememberMe,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUserData value)? getUserData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRememberMe value)? fetchRememberMe,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FetchRememberMeImplCopyWith<$Res> {
  factory _$$FetchRememberMeImplCopyWith(_$FetchRememberMeImpl value,
          $Res Function(_$FetchRememberMeImpl) then) =
      __$$FetchRememberMeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchRememberMeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$FetchRememberMeImpl>
    implements _$$FetchRememberMeImplCopyWith<$Res> {
  __$$FetchRememberMeImplCopyWithImpl(
      _$FetchRememberMeImpl _value, $Res Function(_$FetchRememberMeImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchRememberMeImpl implements _FetchRememberMe {
  const _$FetchRememberMeImpl();

  @override
  String toString() {
    return 'AuthEvent.fetchRememberMe()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchRememberMeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRememberMe,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() getUserData,
  }) {
    return fetchRememberMe();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRememberMe,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? getUserData,
  }) {
    return fetchRememberMe?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRememberMe,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (fetchRememberMe != null) {
      return fetchRememberMe();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRememberMe value) fetchRememberMe,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return fetchRememberMe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRememberMe value)? fetchRememberMe,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return fetchRememberMe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRememberMe value)? fetchRememberMe,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (fetchRememberMe != null) {
      return fetchRememberMe(this);
    }
    return orElse();
  }
}

abstract class _FetchRememberMe implements AuthEvent {
  const factory _FetchRememberMe() = _$FetchRememberMeImpl;
}

/// @nodoc
abstract class _$$TogglePasswordVisibilityImplCopyWith<$Res> {
  factory _$$TogglePasswordVisibilityImplCopyWith(
          _$TogglePasswordVisibilityImpl value,
          $Res Function(_$TogglePasswordVisibilityImpl) then) =
      __$$TogglePasswordVisibilityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isConfirmPassword});
}

/// @nodoc
class __$$TogglePasswordVisibilityImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$TogglePasswordVisibilityImpl>
    implements _$$TogglePasswordVisibilityImplCopyWith<$Res> {
  __$$TogglePasswordVisibilityImplCopyWithImpl(
      _$TogglePasswordVisibilityImpl _value,
      $Res Function(_$TogglePasswordVisibilityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isConfirmPassword = null,
  }) {
    return _then(_$TogglePasswordVisibilityImpl(
      isConfirmPassword: null == isConfirmPassword
          ? _value.isConfirmPassword
          : isConfirmPassword // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TogglePasswordVisibilityImpl implements _TogglePasswordVisibility {
  const _$TogglePasswordVisibilityImpl({this.isConfirmPassword = false});

  @override
  @JsonKey()
  final bool isConfirmPassword;

  @override
  String toString() {
    return 'AuthEvent.togglePasswordVisibility(isConfirmPassword: $isConfirmPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TogglePasswordVisibilityImpl &&
            (identical(other.isConfirmPassword, isConfirmPassword) ||
                other.isConfirmPassword == isConfirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isConfirmPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TogglePasswordVisibilityImplCopyWith<_$TogglePasswordVisibilityImpl>
      get copyWith => __$$TogglePasswordVisibilityImplCopyWithImpl<
          _$TogglePasswordVisibilityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRememberMe,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() getUserData,
  }) {
    return togglePasswordVisibility(isConfirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRememberMe,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? getUserData,
  }) {
    return togglePasswordVisibility?.call(isConfirmPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRememberMe,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility(isConfirmPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRememberMe value) fetchRememberMe,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return togglePasswordVisibility(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRememberMe value)? fetchRememberMe,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return togglePasswordVisibility?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRememberMe value)? fetchRememberMe,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (togglePasswordVisibility != null) {
      return togglePasswordVisibility(this);
    }
    return orElse();
  }
}

abstract class _TogglePasswordVisibility implements AuthEvent {
  const factory _TogglePasswordVisibility({final bool isConfirmPassword}) =
      _$TogglePasswordVisibilityImpl;

  bool get isConfirmPassword;
  @JsonKey(ignore: true)
  _$$TogglePasswordVisibilityImplCopyWith<_$TogglePasswordVisibilityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RememberMeImplCopyWith<$Res> {
  factory _$$RememberMeImplCopyWith(
          _$RememberMeImpl value, $Res Function(_$RememberMeImpl) then) =
      __$$RememberMeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isRemember});
}

/// @nodoc
class __$$RememberMeImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RememberMeImpl>
    implements _$$RememberMeImplCopyWith<$Res> {
  __$$RememberMeImplCopyWithImpl(
      _$RememberMeImpl _value, $Res Function(_$RememberMeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isRemember = null,
  }) {
    return _then(_$RememberMeImpl(
      isRemember: null == isRemember
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$RememberMeImpl implements _RememberMe {
  const _$RememberMeImpl({this.isRemember = false});

  @override
  @JsonKey()
  final bool isRemember;

  @override
  String toString() {
    return 'AuthEvent.rememberMe(isRemember: $isRemember)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RememberMeImpl &&
            (identical(other.isRemember, isRemember) ||
                other.isRemember == isRemember));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRemember);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RememberMeImplCopyWith<_$RememberMeImpl> get copyWith =>
      __$$RememberMeImplCopyWithImpl<_$RememberMeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRememberMe,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() getUserData,
  }) {
    return rememberMe(isRemember);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRememberMe,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? getUserData,
  }) {
    return rememberMe?.call(isRemember);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRememberMe,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (rememberMe != null) {
      return rememberMe(isRemember);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRememberMe value) fetchRememberMe,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return rememberMe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRememberMe value)? fetchRememberMe,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return rememberMe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRememberMe value)? fetchRememberMe,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (rememberMe != null) {
      return rememberMe(this);
    }
    return orElse();
  }
}

abstract class _RememberMe implements AuthEvent {
  const factory _RememberMe({final bool isRemember}) = _$RememberMeImpl;

  bool get isRemember;
  @JsonKey(ignore: true)
  _$$RememberMeImplCopyWith<_$RememberMeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl();

  @override
  String toString() {
    return 'AuthEvent.login()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRememberMe,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() getUserData,
  }) {
    return login();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRememberMe,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? getUserData,
  }) {
    return login?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRememberMe,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRememberMe value) fetchRememberMe,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRememberMe value)? fetchRememberMe,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRememberMe value)? fetchRememberMe,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login() = _$LoginImpl;
}

/// @nodoc
abstract class _$$GetUserDataImplCopyWith<$Res> {
  factory _$$GetUserDataImplCopyWith(
          _$GetUserDataImpl value, $Res Function(_$GetUserDataImpl) then) =
      __$$GetUserDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserDataImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$GetUserDataImpl>
    implements _$$GetUserDataImplCopyWith<$Res> {
  __$$GetUserDataImplCopyWithImpl(
      _$GetUserDataImpl _value, $Res Function(_$GetUserDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserDataImpl implements _GetUserData {
  const _$GetUserDataImpl();

  @override
  String toString() {
    return 'AuthEvent.getUserData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchRememberMe,
    required TResult Function(bool isConfirmPassword) togglePasswordVisibility,
    required TResult Function(bool isRemember) rememberMe,
    required TResult Function() login,
    required TResult Function() getUserData,
  }) {
    return getUserData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchRememberMe,
    TResult? Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult? Function(bool isRemember)? rememberMe,
    TResult? Function()? login,
    TResult? Function()? getUserData,
  }) {
    return getUserData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchRememberMe,
    TResult Function(bool isConfirmPassword)? togglePasswordVisibility,
    TResult Function(bool isRemember)? rememberMe,
    TResult Function()? login,
    TResult Function()? getUserData,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRememberMe value) fetchRememberMe,
    required TResult Function(_TogglePasswordVisibility value)
        togglePasswordVisibility,
    required TResult Function(_RememberMe value) rememberMe,
    required TResult Function(_Login value) login,
    required TResult Function(_GetUserData value) getUserData,
  }) {
    return getUserData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchRememberMe value)? fetchRememberMe,
    TResult? Function(_TogglePasswordVisibility value)?
        togglePasswordVisibility,
    TResult? Function(_RememberMe value)? rememberMe,
    TResult? Function(_Login value)? login,
    TResult? Function(_GetUserData value)? getUserData,
  }) {
    return getUserData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRememberMe value)? fetchRememberMe,
    TResult Function(_TogglePasswordVisibility value)? togglePasswordVisibility,
    TResult Function(_RememberMe value)? rememberMe,
    TResult Function(_Login value)? login,
    TResult Function(_GetUserData value)? getUserData,
    required TResult orElse(),
  }) {
    if (getUserData != null) {
      return getUserData(this);
    }
    return orElse();
  }
}

abstract class _GetUserData implements AuthEvent {
  const factory _GetUserData() = _$GetUserDataImpl;
}

/// @nodoc
mixin _$AuthState {
  AuthStatus get status => throw _privateConstructorUsedError;
  AuthRepo get authRepo => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  LoginResponseModel? get loginResponseModel =>
      throw _privateConstructorUsedError;
  int get uniqueKey => throw _privateConstructorUsedError;
  bool get visibility => throw _privateConstructorUsedError;
  bool get confirmVisibility => throw _privateConstructorUsedError;
  dynamic get rememberMe => throw _privateConstructorUsedError;
  dynamic get loginLoading => throw _privateConstructorUsedError;
  UserResponseModel? get userResponseModel =>
      throw _privateConstructorUsedError;
  dynamic get userResponseLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
  @useResult
  $Res call(
      {AuthStatus status,
      AuthRepo authRepo,
      String message,
      LoginResponseModel? loginResponseModel,
      int uniqueKey,
      bool visibility,
      bool confirmVisibility,
      dynamic rememberMe,
      dynamic loginLoading,
      UserResponseModel? userResponseModel,
      dynamic userResponseLoading});

  $LoginResponseModelCopyWith<$Res>? get loginResponseModel;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? authRepo = null,
    Object? message = null,
    Object? loginResponseModel = freezed,
    Object? uniqueKey = null,
    Object? visibility = null,
    Object? confirmVisibility = null,
    Object? rememberMe = freezed,
    Object? loginLoading = freezed,
    Object? userResponseModel = freezed,
    Object? userResponseLoading = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      authRepo: null == authRepo
          ? _value.authRepo
          : authRepo // ignore: cast_nullable_to_non_nullable
              as AuthRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      loginResponseModel: freezed == loginResponseModel
          ? _value.loginResponseModel
          : loginResponseModel // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      uniqueKey: null == uniqueKey
          ? _value.uniqueKey
          : uniqueKey // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmVisibility: null == confirmVisibility
          ? _value.confirmVisibility
          : confirmVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberMe: freezed == rememberMe
          ? _value.rememberMe
          : rememberMe // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loginLoading: freezed == loginLoading
          ? _value.loginLoading
          : loginLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userResponseModel: freezed == userResponseModel
          ? _value.userResponseModel
          : userResponseModel // ignore: cast_nullable_to_non_nullable
              as UserResponseModel?,
      userResponseLoading: freezed == userResponseLoading
          ? _value.userResponseLoading
          : userResponseLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<$Res>? get loginResponseModel {
    if (_value.loginResponseModel == null) {
      return null;
    }

    return $LoginResponseModelCopyWith<$Res>(_value.loginResponseModel!,
        (value) {
      return _then(_value.copyWith(loginResponseModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AuthStateImplCopyWith<$Res>
    implements $AuthStateCopyWith<$Res> {
  factory _$$AuthStateImplCopyWith(
          _$AuthStateImpl value, $Res Function(_$AuthStateImpl) then) =
      __$$AuthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AuthStatus status,
      AuthRepo authRepo,
      String message,
      LoginResponseModel? loginResponseModel,
      int uniqueKey,
      bool visibility,
      bool confirmVisibility,
      dynamic rememberMe,
      dynamic loginLoading,
      UserResponseModel? userResponseModel,
      dynamic userResponseLoading});

  @override
  $LoginResponseModelCopyWith<$Res>? get loginResponseModel;
}

/// @nodoc
class __$$AuthStateImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$AuthStateImpl>
    implements _$$AuthStateImplCopyWith<$Res> {
  __$$AuthStateImplCopyWithImpl(
      _$AuthStateImpl _value, $Res Function(_$AuthStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? authRepo = null,
    Object? message = null,
    Object? loginResponseModel = freezed,
    Object? uniqueKey = null,
    Object? visibility = null,
    Object? confirmVisibility = null,
    Object? rememberMe = freezed,
    Object? loginLoading = freezed,
    Object? userResponseModel = freezed,
    Object? userResponseLoading = freezed,
  }) {
    return _then(_$AuthStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
      authRepo: null == authRepo
          ? _value.authRepo
          : authRepo // ignore: cast_nullable_to_non_nullable
              as AuthRepo,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      loginResponseModel: freezed == loginResponseModel
          ? _value.loginResponseModel
          : loginResponseModel // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      uniqueKey: null == uniqueKey
          ? _value.uniqueKey
          : uniqueKey // ignore: cast_nullable_to_non_nullable
              as int,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as bool,
      confirmVisibility: null == confirmVisibility
          ? _value.confirmVisibility
          : confirmVisibility // ignore: cast_nullable_to_non_nullable
              as bool,
      rememberMe: freezed == rememberMe ? _value.rememberMe! : rememberMe,
      loginLoading:
          freezed == loginLoading ? _value.loginLoading! : loginLoading,
      userResponseModel: freezed == userResponseModel
          ? _value.userResponseModel
          : userResponseModel // ignore: cast_nullable_to_non_nullable
              as UserResponseModel?,
      userResponseLoading: freezed == userResponseLoading
          ? _value.userResponseLoading!
          : userResponseLoading,
    ));
  }
}

/// @nodoc

class _$AuthStateImpl implements _AuthState {
  const _$AuthStateImpl(
      {this.status = AuthStatus.initial,
      required this.authRepo,
      this.message = '',
      this.loginResponseModel,
      this.uniqueKey = 0,
      this.visibility = true,
      this.confirmVisibility = true,
      this.rememberMe = false,
      this.loginLoading = false,
      this.userResponseModel,
      this.userResponseLoading = false});

  @override
  @JsonKey()
  final AuthStatus status;
  @override
  final AuthRepo authRepo;
  @override
  @JsonKey()
  final String message;
  @override
  final LoginResponseModel? loginResponseModel;
  @override
  @JsonKey()
  final int uniqueKey;
  @override
  @JsonKey()
  final bool visibility;
  @override
  @JsonKey()
  final bool confirmVisibility;
  @override
  @JsonKey()
  final dynamic rememberMe;
  @override
  @JsonKey()
  final dynamic loginLoading;
  @override
  final UserResponseModel? userResponseModel;
  @override
  @JsonKey()
  final dynamic userResponseLoading;

  @override
  String toString() {
    return 'AuthState(status: $status, authRepo: $authRepo, message: $message, loginResponseModel: $loginResponseModel, uniqueKey: $uniqueKey, visibility: $visibility, confirmVisibility: $confirmVisibility, rememberMe: $rememberMe, loginLoading: $loginLoading, userResponseModel: $userResponseModel, userResponseLoading: $userResponseLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.authRepo, authRepo) ||
                other.authRepo == authRepo) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.loginResponseModel, loginResponseModel) ||
                other.loginResponseModel == loginResponseModel) &&
            (identical(other.uniqueKey, uniqueKey) ||
                other.uniqueKey == uniqueKey) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.confirmVisibility, confirmVisibility) ||
                other.confirmVisibility == confirmVisibility) &&
            const DeepCollectionEquality()
                .equals(other.rememberMe, rememberMe) &&
            const DeepCollectionEquality()
                .equals(other.loginLoading, loginLoading) &&
            (identical(other.userResponseModel, userResponseModel) ||
                other.userResponseModel == userResponseModel) &&
            const DeepCollectionEquality()
                .equals(other.userResponseLoading, userResponseLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      authRepo,
      message,
      loginResponseModel,
      uniqueKey,
      visibility,
      confirmVisibility,
      const DeepCollectionEquality().hash(rememberMe),
      const DeepCollectionEquality().hash(loginLoading),
      userResponseModel,
      const DeepCollectionEquality().hash(userResponseLoading));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      __$$AuthStateImplCopyWithImpl<_$AuthStateImpl>(this, _$identity);
}

abstract class _AuthState implements AuthState {
  const factory _AuthState(
      {final AuthStatus status,
      required final AuthRepo authRepo,
      final String message,
      final LoginResponseModel? loginResponseModel,
      final int uniqueKey,
      final bool visibility,
      final bool confirmVisibility,
      final dynamic rememberMe,
      final dynamic loginLoading,
      final UserResponseModel? userResponseModel,
      final dynamic userResponseLoading}) = _$AuthStateImpl;

  @override
  AuthStatus get status;
  @override
  AuthRepo get authRepo;
  @override
  String get message;
  @override
  LoginResponseModel? get loginResponseModel;
  @override
  int get uniqueKey;
  @override
  bool get visibility;
  @override
  bool get confirmVisibility;
  @override
  dynamic get rememberMe;
  @override
  dynamic get loginLoading;
  @override
  UserResponseModel? get userResponseModel;
  @override
  dynamic get userResponseLoading;
  @override
  @JsonKey(ignore: true)
  _$$AuthStateImplCopyWith<_$AuthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
