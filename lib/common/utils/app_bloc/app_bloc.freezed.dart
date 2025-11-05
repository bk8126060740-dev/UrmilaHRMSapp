// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginResponseModel? model) updateLoginResponse,
    required TResult Function(UserResponseModel? model) updateUserResponse,
    required TResult Function(UserProfileDataModel? model)
        updateUserProfileData,
    required TResult Function() logoutUser,
    required TResult Function(int tabIndex) updateTabIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginResponseModel? model)? updateLoginResponse,
    TResult? Function(UserResponseModel? model)? updateUserResponse,
    TResult? Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult? Function()? logoutUser,
    TResult? Function(int tabIndex)? updateTabIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginResponseModel? model)? updateLoginResponse,
    TResult Function(UserResponseModel? model)? updateUserResponse,
    TResult Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult Function()? logoutUser,
    TResult Function(int tabIndex)? updateTabIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
    required TResult Function(_UpdateUserResponse value) updateUserResponse,
    required TResult Function(_UpdateUserProfileData value)
        updateUserProfileData,
    required TResult Function(_LogoutUser value) logoutUser,
    required TResult Function(_UpdateTabIndex value) updateTabIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult? Function(_UpdateUserResponse value)? updateUserResponse,
    TResult? Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult? Function(_LogoutUser value)? logoutUser,
    TResult? Function(_UpdateTabIndex value)? updateTabIndex,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult Function(_UpdateUserResponse value)? updateUserResponse,
    TResult Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult Function(_LogoutUser value)? logoutUser,
    TResult Function(_UpdateTabIndex value)? updateTabIndex,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res, AppEvent>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res, $Val extends AppEvent>
    implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateLoginResponseImplCopyWith<$Res> {
  factory _$$UpdateLoginResponseImplCopyWith(_$UpdateLoginResponseImpl value,
          $Res Function(_$UpdateLoginResponseImpl) then) =
      __$$UpdateLoginResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginResponseModel? model});

  $LoginResponseModelCopyWith<$Res>? get model;
}

/// @nodoc
class __$$UpdateLoginResponseImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$UpdateLoginResponseImpl>
    implements _$$UpdateLoginResponseImplCopyWith<$Res> {
  __$$UpdateLoginResponseImplCopyWithImpl(_$UpdateLoginResponseImpl _value,
      $Res Function(_$UpdateLoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$UpdateLoginResponseImpl(
      freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<$Res>? get model {
    if (_value.model == null) {
      return null;
    }

    return $LoginResponseModelCopyWith<$Res>(_value.model!, (value) {
      return _then(_value.copyWith(model: value));
    });
  }
}

/// @nodoc

class _$UpdateLoginResponseImpl
    with DiagnosticableTreeMixin
    implements _UpdateLoginResponse {
  const _$UpdateLoginResponseImpl(this.model);

  @override
  final LoginResponseModel? model;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.updateLoginResponse(model: $model)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.updateLoginResponse'))
      ..add(DiagnosticsProperty('model', model));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateLoginResponseImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateLoginResponseImplCopyWith<_$UpdateLoginResponseImpl> get copyWith =>
      __$$UpdateLoginResponseImplCopyWithImpl<_$UpdateLoginResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginResponseModel? model) updateLoginResponse,
    required TResult Function(UserResponseModel? model) updateUserResponse,
    required TResult Function(UserProfileDataModel? model)
        updateUserProfileData,
    required TResult Function() logoutUser,
    required TResult Function(int tabIndex) updateTabIndex,
  }) {
    return updateLoginResponse(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginResponseModel? model)? updateLoginResponse,
    TResult? Function(UserResponseModel? model)? updateUserResponse,
    TResult? Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult? Function()? logoutUser,
    TResult? Function(int tabIndex)? updateTabIndex,
  }) {
    return updateLoginResponse?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginResponseModel? model)? updateLoginResponse,
    TResult Function(UserResponseModel? model)? updateUserResponse,
    TResult Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult Function()? logoutUser,
    TResult Function(int tabIndex)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (updateLoginResponse != null) {
      return updateLoginResponse(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
    required TResult Function(_UpdateUserResponse value) updateUserResponse,
    required TResult Function(_UpdateUserProfileData value)
        updateUserProfileData,
    required TResult Function(_LogoutUser value) logoutUser,
    required TResult Function(_UpdateTabIndex value) updateTabIndex,
  }) {
    return updateLoginResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult? Function(_UpdateUserResponse value)? updateUserResponse,
    TResult? Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult? Function(_LogoutUser value)? logoutUser,
    TResult? Function(_UpdateTabIndex value)? updateTabIndex,
  }) {
    return updateLoginResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult Function(_UpdateUserResponse value)? updateUserResponse,
    TResult Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult Function(_LogoutUser value)? logoutUser,
    TResult Function(_UpdateTabIndex value)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (updateLoginResponse != null) {
      return updateLoginResponse(this);
    }
    return orElse();
  }
}

abstract class _UpdateLoginResponse implements AppEvent {
  const factory _UpdateLoginResponse(final LoginResponseModel? model) =
      _$UpdateLoginResponseImpl;

  LoginResponseModel? get model;
  @JsonKey(ignore: true)
  _$$UpdateLoginResponseImplCopyWith<_$UpdateLoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserResponseImplCopyWith<$Res> {
  factory _$$UpdateUserResponseImplCopyWith(_$UpdateUserResponseImpl value,
          $Res Function(_$UpdateUserResponseImpl) then) =
      __$$UpdateUserResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserResponseModel? model});
}

/// @nodoc
class __$$UpdateUserResponseImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$UpdateUserResponseImpl>
    implements _$$UpdateUserResponseImplCopyWith<$Res> {
  __$$UpdateUserResponseImplCopyWithImpl(_$UpdateUserResponseImpl _value,
      $Res Function(_$UpdateUserResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$UpdateUserResponseImpl(
      freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as UserResponseModel?,
    ));
  }
}

/// @nodoc

class _$UpdateUserResponseImpl
    with DiagnosticableTreeMixin
    implements _UpdateUserResponse {
  const _$UpdateUserResponseImpl(this.model);

  @override
  final UserResponseModel? model;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.updateUserResponse(model: $model)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.updateUserResponse'))
      ..add(DiagnosticsProperty('model', model));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserResponseImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserResponseImplCopyWith<_$UpdateUserResponseImpl> get copyWith =>
      __$$UpdateUserResponseImplCopyWithImpl<_$UpdateUserResponseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginResponseModel? model) updateLoginResponse,
    required TResult Function(UserResponseModel? model) updateUserResponse,
    required TResult Function(UserProfileDataModel? model)
        updateUserProfileData,
    required TResult Function() logoutUser,
    required TResult Function(int tabIndex) updateTabIndex,
  }) {
    return updateUserResponse(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginResponseModel? model)? updateLoginResponse,
    TResult? Function(UserResponseModel? model)? updateUserResponse,
    TResult? Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult? Function()? logoutUser,
    TResult? Function(int tabIndex)? updateTabIndex,
  }) {
    return updateUserResponse?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginResponseModel? model)? updateLoginResponse,
    TResult Function(UserResponseModel? model)? updateUserResponse,
    TResult Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult Function()? logoutUser,
    TResult Function(int tabIndex)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (updateUserResponse != null) {
      return updateUserResponse(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
    required TResult Function(_UpdateUserResponse value) updateUserResponse,
    required TResult Function(_UpdateUserProfileData value)
        updateUserProfileData,
    required TResult Function(_LogoutUser value) logoutUser,
    required TResult Function(_UpdateTabIndex value) updateTabIndex,
  }) {
    return updateUserResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult? Function(_UpdateUserResponse value)? updateUserResponse,
    TResult? Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult? Function(_LogoutUser value)? logoutUser,
    TResult? Function(_UpdateTabIndex value)? updateTabIndex,
  }) {
    return updateUserResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult Function(_UpdateUserResponse value)? updateUserResponse,
    TResult Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult Function(_LogoutUser value)? logoutUser,
    TResult Function(_UpdateTabIndex value)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (updateUserResponse != null) {
      return updateUserResponse(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserResponse implements AppEvent {
  const factory _UpdateUserResponse(final UserResponseModel? model) =
      _$UpdateUserResponseImpl;

  UserResponseModel? get model;
  @JsonKey(ignore: true)
  _$$UpdateUserResponseImplCopyWith<_$UpdateUserResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateUserProfileDataImplCopyWith<$Res> {
  factory _$$UpdateUserProfileDataImplCopyWith(
          _$UpdateUserProfileDataImpl value,
          $Res Function(_$UpdateUserProfileDataImpl) then) =
      __$$UpdateUserProfileDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserProfileDataModel? model});
}

/// @nodoc
class __$$UpdateUserProfileDataImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$UpdateUserProfileDataImpl>
    implements _$$UpdateUserProfileDataImplCopyWith<$Res> {
  __$$UpdateUserProfileDataImplCopyWithImpl(_$UpdateUserProfileDataImpl _value,
      $Res Function(_$UpdateUserProfileDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = freezed,
  }) {
    return _then(_$UpdateUserProfileDataImpl(
      freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel?,
    ));
  }
}

/// @nodoc

class _$UpdateUserProfileDataImpl
    with DiagnosticableTreeMixin
    implements _UpdateUserProfileData {
  const _$UpdateUserProfileDataImpl(this.model);

  @override
  final UserProfileDataModel? model;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.updateUserProfileData(model: $model)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.updateUserProfileData'))
      ..add(DiagnosticsProperty('model', model));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserProfileDataImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserProfileDataImplCopyWith<_$UpdateUserProfileDataImpl>
      get copyWith => __$$UpdateUserProfileDataImplCopyWithImpl<
          _$UpdateUserProfileDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginResponseModel? model) updateLoginResponse,
    required TResult Function(UserResponseModel? model) updateUserResponse,
    required TResult Function(UserProfileDataModel? model)
        updateUserProfileData,
    required TResult Function() logoutUser,
    required TResult Function(int tabIndex) updateTabIndex,
  }) {
    return updateUserProfileData(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginResponseModel? model)? updateLoginResponse,
    TResult? Function(UserResponseModel? model)? updateUserResponse,
    TResult? Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult? Function()? logoutUser,
    TResult? Function(int tabIndex)? updateTabIndex,
  }) {
    return updateUserProfileData?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginResponseModel? model)? updateLoginResponse,
    TResult Function(UserResponseModel? model)? updateUserResponse,
    TResult Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult Function()? logoutUser,
    TResult Function(int tabIndex)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (updateUserProfileData != null) {
      return updateUserProfileData(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
    required TResult Function(_UpdateUserResponse value) updateUserResponse,
    required TResult Function(_UpdateUserProfileData value)
        updateUserProfileData,
    required TResult Function(_LogoutUser value) logoutUser,
    required TResult Function(_UpdateTabIndex value) updateTabIndex,
  }) {
    return updateUserProfileData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult? Function(_UpdateUserResponse value)? updateUserResponse,
    TResult? Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult? Function(_LogoutUser value)? logoutUser,
    TResult? Function(_UpdateTabIndex value)? updateTabIndex,
  }) {
    return updateUserProfileData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult Function(_UpdateUserResponse value)? updateUserResponse,
    TResult Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult Function(_LogoutUser value)? logoutUser,
    TResult Function(_UpdateTabIndex value)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (updateUserProfileData != null) {
      return updateUserProfileData(this);
    }
    return orElse();
  }
}

abstract class _UpdateUserProfileData implements AppEvent {
  const factory _UpdateUserProfileData(final UserProfileDataModel? model) =
      _$UpdateUserProfileDataImpl;

  UserProfileDataModel? get model;
  @JsonKey(ignore: true)
  _$$UpdateUserProfileDataImplCopyWith<_$UpdateUserProfileDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutUserImplCopyWith<$Res> {
  factory _$$LogoutUserImplCopyWith(
          _$LogoutUserImpl value, $Res Function(_$LogoutUserImpl) then) =
      __$$LogoutUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutUserImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$LogoutUserImpl>
    implements _$$LogoutUserImplCopyWith<$Res> {
  __$$LogoutUserImplCopyWithImpl(
      _$LogoutUserImpl _value, $Res Function(_$LogoutUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutUserImpl with DiagnosticableTreeMixin implements _LogoutUser {
  const _$LogoutUserImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.logoutUser()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppEvent.logoutUser'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginResponseModel? model) updateLoginResponse,
    required TResult Function(UserResponseModel? model) updateUserResponse,
    required TResult Function(UserProfileDataModel? model)
        updateUserProfileData,
    required TResult Function() logoutUser,
    required TResult Function(int tabIndex) updateTabIndex,
  }) {
    return logoutUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginResponseModel? model)? updateLoginResponse,
    TResult? Function(UserResponseModel? model)? updateUserResponse,
    TResult? Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult? Function()? logoutUser,
    TResult? Function(int tabIndex)? updateTabIndex,
  }) {
    return logoutUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginResponseModel? model)? updateLoginResponse,
    TResult Function(UserResponseModel? model)? updateUserResponse,
    TResult Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult Function()? logoutUser,
    TResult Function(int tabIndex)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (logoutUser != null) {
      return logoutUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
    required TResult Function(_UpdateUserResponse value) updateUserResponse,
    required TResult Function(_UpdateUserProfileData value)
        updateUserProfileData,
    required TResult Function(_LogoutUser value) logoutUser,
    required TResult Function(_UpdateTabIndex value) updateTabIndex,
  }) {
    return logoutUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult? Function(_UpdateUserResponse value)? updateUserResponse,
    TResult? Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult? Function(_LogoutUser value)? logoutUser,
    TResult? Function(_UpdateTabIndex value)? updateTabIndex,
  }) {
    return logoutUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult Function(_UpdateUserResponse value)? updateUserResponse,
    TResult Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult Function(_LogoutUser value)? logoutUser,
    TResult Function(_UpdateTabIndex value)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (logoutUser != null) {
      return logoutUser(this);
    }
    return orElse();
  }
}

abstract class _LogoutUser implements AppEvent {
  const factory _LogoutUser() = _$LogoutUserImpl;
}

/// @nodoc
abstract class _$$UpdateTabIndexImplCopyWith<$Res> {
  factory _$$UpdateTabIndexImplCopyWith(_$UpdateTabIndexImpl value,
          $Res Function(_$UpdateTabIndexImpl) then) =
      __$$UpdateTabIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class __$$UpdateTabIndexImplCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res, _$UpdateTabIndexImpl>
    implements _$$UpdateTabIndexImplCopyWith<$Res> {
  __$$UpdateTabIndexImplCopyWithImpl(
      _$UpdateTabIndexImpl _value, $Res Function(_$UpdateTabIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_$UpdateTabIndexImpl(
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateTabIndexImpl
    with DiagnosticableTreeMixin
    implements _UpdateTabIndex {
  const _$UpdateTabIndexImpl({required this.tabIndex});

  @override
  final int tabIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.updateTabIndex(tabIndex: $tabIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.updateTabIndex'))
      ..add(DiagnosticsProperty('tabIndex', tabIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTabIndexImpl &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTabIndexImplCopyWith<_$UpdateTabIndexImpl> get copyWith =>
      __$$UpdateTabIndexImplCopyWithImpl<_$UpdateTabIndexImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoginResponseModel? model) updateLoginResponse,
    required TResult Function(UserResponseModel? model) updateUserResponse,
    required TResult Function(UserProfileDataModel? model)
        updateUserProfileData,
    required TResult Function() logoutUser,
    required TResult Function(int tabIndex) updateTabIndex,
  }) {
    return updateTabIndex(tabIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoginResponseModel? model)? updateLoginResponse,
    TResult? Function(UserResponseModel? model)? updateUserResponse,
    TResult? Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult? Function()? logoutUser,
    TResult? Function(int tabIndex)? updateTabIndex,
  }) {
    return updateTabIndex?.call(tabIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoginResponseModel? model)? updateLoginResponse,
    TResult Function(UserResponseModel? model)? updateUserResponse,
    TResult Function(UserProfileDataModel? model)? updateUserProfileData,
    TResult Function()? logoutUser,
    TResult Function(int tabIndex)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (updateTabIndex != null) {
      return updateTabIndex(tabIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateLoginResponse value) updateLoginResponse,
    required TResult Function(_UpdateUserResponse value) updateUserResponse,
    required TResult Function(_UpdateUserProfileData value)
        updateUserProfileData,
    required TResult Function(_LogoutUser value) logoutUser,
    required TResult Function(_UpdateTabIndex value) updateTabIndex,
  }) {
    return updateTabIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult? Function(_UpdateUserResponse value)? updateUserResponse,
    TResult? Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult? Function(_LogoutUser value)? logoutUser,
    TResult? Function(_UpdateTabIndex value)? updateTabIndex,
  }) {
    return updateTabIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_UpdateLoginResponse value)? updateLoginResponse,
    TResult Function(_UpdateUserResponse value)? updateUserResponse,
    TResult Function(_UpdateUserProfileData value)? updateUserProfileData,
    TResult Function(_LogoutUser value)? logoutUser,
    TResult Function(_UpdateTabIndex value)? updateTabIndex,
    required TResult orElse(),
  }) {
    if (updateTabIndex != null) {
      return updateTabIndex(this);
    }
    return orElse();
  }
}

abstract class _UpdateTabIndex implements AppEvent {
  const factory _UpdateTabIndex({required final int tabIndex}) =
      _$UpdateTabIndexImpl;

  int get tabIndex;
  @JsonKey(ignore: true)
  _$$UpdateTabIndexImplCopyWith<_$UpdateTabIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  AppStatus get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  LoginResponseModel? get loginResponse => throw _privateConstructorUsedError;
  UserResponseModel? get userResponse => throw _privateConstructorUsedError;
  UserProfileDataModel? get userProfileModel =>
      throw _privateConstructorUsedError;
  int get currentTabIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {AppStatus status,
      String message,
      LoginResponseModel? loginResponse,
      UserResponseModel? userResponse,
      UserProfileDataModel? userProfileModel,
      int currentTabIndex});

  $LoginResponseModelCopyWith<$Res>? get loginResponse;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? loginResponse = freezed,
    Object? userResponse = freezed,
    Object? userProfileModel = freezed,
    Object? currentTabIndex = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      loginResponse: freezed == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      userResponse: freezed == userResponse
          ? _value.userResponse
          : userResponse // ignore: cast_nullable_to_non_nullable
              as UserResponseModel?,
      userProfileModel: freezed == userProfileModel
          ? _value.userProfileModel
          : userProfileModel // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel?,
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginResponseModelCopyWith<$Res>? get loginResponse {
    if (_value.loginResponse == null) {
      return null;
    }

    return $LoginResponseModelCopyWith<$Res>(_value.loginResponse!, (value) {
      return _then(_value.copyWith(loginResponse: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AppStatus status,
      String message,
      LoginResponseModel? loginResponse,
      UserResponseModel? userResponse,
      UserProfileDataModel? userProfileModel,
      int currentTabIndex});

  @override
  $LoginResponseModelCopyWith<$Res>? get loginResponse;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? loginResponse = freezed,
    Object? userResponse = freezed,
    Object? userProfileModel = freezed,
    Object? currentTabIndex = null,
  }) {
    return _then(_$AppStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as AppStatus,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      loginResponse: freezed == loginResponse
          ? _value.loginResponse
          : loginResponse // ignore: cast_nullable_to_non_nullable
              as LoginResponseModel?,
      userResponse: freezed == userResponse
          ? _value.userResponse
          : userResponse // ignore: cast_nullable_to_non_nullable
              as UserResponseModel?,
      userProfileModel: freezed == userProfileModel
          ? _value.userProfileModel
          : userProfileModel // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel?,
      currentTabIndex: null == currentTabIndex
          ? _value.currentTabIndex
          : currentTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AppStateImpl with DiagnosticableTreeMixin implements _AppState {
  const _$AppStateImpl(
      {this.status = AppStatus.initial,
      this.message = '',
      this.loginResponse,
      this.userResponse,
      this.userProfileModel,
      this.currentTabIndex = 0});

  @override
  @JsonKey()
  final AppStatus status;
  @override
  @JsonKey()
  final String message;
  @override
  final LoginResponseModel? loginResponse;
  @override
  final UserResponseModel? userResponse;
  @override
  final UserProfileDataModel? userProfileModel;
  @override
  @JsonKey()
  final int currentTabIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(status: $status, message: $message, loginResponse: $loginResponse, userResponse: $userResponse, userProfileModel: $userProfileModel, currentTabIndex: $currentTabIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('loginResponse', loginResponse))
      ..add(DiagnosticsProperty('userResponse', userResponse))
      ..add(DiagnosticsProperty('userProfileModel', userProfileModel))
      ..add(DiagnosticsProperty('currentTabIndex', currentTabIndex));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.loginResponse, loginResponse) ||
                other.loginResponse == loginResponse) &&
            (identical(other.userResponse, userResponse) ||
                other.userResponse == userResponse) &&
            (identical(other.userProfileModel, userProfileModel) ||
                other.userProfileModel == userProfileModel) &&
            (identical(other.currentTabIndex, currentTabIndex) ||
                other.currentTabIndex == currentTabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, message, loginResponse,
      userResponse, userProfileModel, currentTabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {final AppStatus status,
      final String message,
      final LoginResponseModel? loginResponse,
      final UserResponseModel? userResponse,
      final UserProfileDataModel? userProfileModel,
      final int currentTabIndex}) = _$AppStateImpl;

  @override
  AppStatus get status;
  @override
  String get message;
  @override
  LoginResponseModel? get loginResponse;
  @override
  UserResponseModel? get userResponse;
  @override
  UserProfileDataModel? get userProfileModel;
  @override
  int get currentTabIndex;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
