// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) {
  return _LoginResponseModel.fromJson(json);
}

/// @nodoc
mixin _$LoginResponseModel {
  @HiveField(0)
  String? get token => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get tokenType => throw _privateConstructorUsedError;
  @HiveField(2)
  int? get expiresIn => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get refreshToken => throw _privateConstructorUsedError;
  @HiveField(4)
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseModelCopyWith<LoginResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseModelCopyWith<$Res> {
  factory $LoginResponseModelCopyWith(
          LoginResponseModel value, $Res Function(LoginResponseModel) then) =
      _$LoginResponseModelCopyWithImpl<$Res, LoginResponseModel>;
  @useResult
  $Res call(
      {@HiveField(0) String? token,
      @HiveField(1) String? tokenType,
      @HiveField(2) int? expiresIn,
      @HiveField(3) String? refreshToken,
      @HiveField(4) User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$LoginResponseModelCopyWithImpl<$Res, $Val extends LoginResponseModel>
    implements $LoginResponseModelCopyWith<$Res> {
  _$LoginResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? expiresIn = freezed,
    Object? refreshToken = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseModelImplCopyWith<$Res>
    implements $LoginResponseModelCopyWith<$Res> {
  factory _$$LoginResponseModelImplCopyWith(_$LoginResponseModelImpl value,
          $Res Function(_$LoginResponseModelImpl) then) =
      __$$LoginResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String? token,
      @HiveField(1) String? tokenType,
      @HiveField(2) int? expiresIn,
      @HiveField(3) String? refreshToken,
      @HiveField(4) User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$LoginResponseModelImplCopyWithImpl<$Res>
    extends _$LoginResponseModelCopyWithImpl<$Res, _$LoginResponseModelImpl>
    implements _$$LoginResponseModelImplCopyWith<$Res> {
  __$$LoginResponseModelImplCopyWithImpl(_$LoginResponseModelImpl _value,
      $Res Function(_$LoginResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? expiresIn = freezed,
    Object? refreshToken = freezed,
    Object? user = freezed,
  }) {
    return _then(_$LoginResponseModelImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      tokenType: freezed == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String?,
      expiresIn: freezed == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'LoginResponseAdapter')
class _$LoginResponseModelImpl implements _LoginResponseModel {
  _$LoginResponseModelImpl(
      {@HiveField(0) this.token,
      @HiveField(1) this.tokenType,
      @HiveField(2) this.expiresIn,
      @HiveField(3) this.refreshToken,
      @HiveField(4) this.user});

  factory _$LoginResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseModelImplFromJson(json);

  @override
  @HiveField(0)
  final String? token;
  @override
  @HiveField(1)
  final String? tokenType;
  @override
  @HiveField(2)
  final int? expiresIn;
  @override
  @HiveField(3)
  final String? refreshToken;
  @override
  @HiveField(4)
  final User? user;

  @override
  String toString() {
    return 'LoginResponseModel(token: $token, tokenType: $tokenType, expiresIn: $expiresIn, refreshToken: $refreshToken, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseModelImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, token, tokenType, expiresIn, refreshToken, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseModelImplCopyWith<_$LoginResponseModelImpl> get copyWith =>
      __$$LoginResponseModelImplCopyWithImpl<_$LoginResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseModelImplToJson(
      this,
    );
  }
}

abstract class _LoginResponseModel implements LoginResponseModel {
  factory _LoginResponseModel(
      {@HiveField(0) final String? token,
      @HiveField(1) final String? tokenType,
      @HiveField(2) final int? expiresIn,
      @HiveField(3) final String? refreshToken,
      @HiveField(4) final User? user}) = _$LoginResponseModelImpl;

  factory _LoginResponseModel.fromJson(Map<String, dynamic> json) =
      _$LoginResponseModelImpl.fromJson;

  @override
  @HiveField(0)
  String? get token;
  @override
  @HiveField(1)
  String? get tokenType;
  @override
  @HiveField(2)
  int? get expiresIn;
  @override
  @HiveField(3)
  String? get refreshToken;
  @override
  @HiveField(4)
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseModelImplCopyWith<_$LoginResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String? get fullName => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get emailId => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get profilePic => throw _privateConstructorUsedError;
  @HiveField(4)
  int? get userTypeId => throw _privateConstructorUsedError;
  @HiveField(5)
  int? get designationId => throw _privateConstructorUsedError;
  @HiveField(6)
  String? get designationName => throw _privateConstructorUsedError;
  @HiveField(7)
  bool? get isCheckIn => throw _privateConstructorUsedError;
  @HiveField(8)
  bool? get isOnboardComplete => throw _privateConstructorUsedError;
  @HiveField(9)
  bool? get isHo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? fullName,
      @HiveField(2) String? emailId,
      @HiveField(3) String? profilePic,
      @HiveField(4) int? userTypeId,
      @HiveField(5) int? designationId,
      @HiveField(6) String? designationName,
      @HiveField(7) bool? isCheckIn,
      @HiveField(8) bool? isOnboardComplete,
      @HiveField(9) bool? isHo});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? emailId = freezed,
    Object? profilePic = freezed,
    Object? userTypeId = freezed,
    Object? designationId = freezed,
    Object? designationName = freezed,
    Object? isCheckIn = freezed,
    Object? isOnboardComplete = freezed,
    Object? isHo = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      userTypeId: freezed == userTypeId
          ? _value.userTypeId
          : userTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      designationId: freezed == designationId
          ? _value.designationId
          : designationId // ignore: cast_nullable_to_non_nullable
              as int?,
      designationName: freezed == designationName
          ? _value.designationName
          : designationName // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheckIn: freezed == isCheckIn
          ? _value.isCheckIn
          : isCheckIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnboardComplete: freezed == isOnboardComplete
          ? _value.isOnboardComplete
          : isOnboardComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHo: freezed == isHo
          ? _value.isHo
          : isHo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int? id,
      @HiveField(1) String? fullName,
      @HiveField(2) String? emailId,
      @HiveField(3) String? profilePic,
      @HiveField(4) int? userTypeId,
      @HiveField(5) int? designationId,
      @HiveField(6) String? designationName,
      @HiveField(7) bool? isCheckIn,
      @HiveField(8) bool? isOnboardComplete,
      @HiveField(9) bool? isHo});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? emailId = freezed,
    Object? profilePic = freezed,
    Object? userTypeId = freezed,
    Object? designationId = freezed,
    Object? designationName = freezed,
    Object? isCheckIn = freezed,
    Object? isOnboardComplete = freezed,
    Object? isHo = freezed,
  }) {
    return _then(_$UserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      emailId: freezed == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      userTypeId: freezed == userTypeId
          ? _value.userTypeId
          : userTypeId // ignore: cast_nullable_to_non_nullable
              as int?,
      designationId: freezed == designationId
          ? _value.designationId
          : designationId // ignore: cast_nullable_to_non_nullable
              as int?,
      designationName: freezed == designationName
          ? _value.designationName
          : designationName // ignore: cast_nullable_to_non_nullable
              as String?,
      isCheckIn: freezed == isCheckIn
          ? _value.isCheckIn
          : isCheckIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnboardComplete: freezed == isOnboardComplete
          ? _value.isOnboardComplete
          : isOnboardComplete // ignore: cast_nullable_to_non_nullable
              as bool?,
      isHo: freezed == isHo
          ? _value.isHo
          : isHo // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'UserAdapter')
class _$UserImpl implements _User {
  _$UserImpl(
      {@HiveField(0) this.id,
      @HiveField(1) this.fullName,
      @HiveField(2) this.emailId,
      @HiveField(3) this.profilePic,
      @HiveField(4) this.userTypeId,
      @HiveField(5) this.designationId,
      @HiveField(6) this.designationName,
      @HiveField(7) this.isCheckIn,
      @HiveField(8) this.isOnboardComplete,
      @HiveField(9) this.isHo});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final String? fullName;
  @override
  @HiveField(2)
  final String? emailId;
  @override
  @HiveField(3)
  final String? profilePic;
  @override
  @HiveField(4)
  final int? userTypeId;
  @override
  @HiveField(5)
  final int? designationId;
  @override
  @HiveField(6)
  final String? designationName;
  @override
  @HiveField(7)
  final bool? isCheckIn;
  @override
  @HiveField(8)
  final bool? isOnboardComplete;
  @override
  @HiveField(9)
  final bool? isHo;

  @override
  String toString() {
    return 'User(id: $id, fullName: $fullName, emailId: $emailId, profilePic: $profilePic, userTypeId: $userTypeId, designationId: $designationId, designationName: $designationName, isCheckIn: $isCheckIn, isOnboardComplete: $isOnboardComplete, isHo: $isHo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.userTypeId, userTypeId) ||
                other.userTypeId == userTypeId) &&
            (identical(other.designationId, designationId) ||
                other.designationId == designationId) &&
            (identical(other.designationName, designationName) ||
                other.designationName == designationName) &&
            (identical(other.isCheckIn, isCheckIn) ||
                other.isCheckIn == isCheckIn) &&
            (identical(other.isOnboardComplete, isOnboardComplete) ||
                other.isOnboardComplete == isOnboardComplete) &&
            (identical(other.isHo, isHo) || other.isHo == isHo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      fullName,
      emailId,
      profilePic,
      userTypeId,
      designationId,
      designationName,
      isCheckIn,
      isOnboardComplete,
      isHo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {@HiveField(0) final int? id,
      @HiveField(1) final String? fullName,
      @HiveField(2) final String? emailId,
      @HiveField(3) final String? profilePic,
      @HiveField(4) final int? userTypeId,
      @HiveField(5) final int? designationId,
      @HiveField(6) final String? designationName,
      @HiveField(7) final bool? isCheckIn,
      @HiveField(8) final bool? isOnboardComplete,
      @HiveField(9) final bool? isHo}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  String? get fullName;
  @override
  @HiveField(2)
  String? get emailId;
  @override
  @HiveField(3)
  String? get profilePic;
  @override
  @HiveField(4)
  int? get userTypeId;
  @override
  @HiveField(5)
  int? get designationId;
  @override
  @HiveField(6)
  String? get designationName;
  @override
  @HiveField(7)
  bool? get isCheckIn;
  @override
  @HiveField(8)
  bool? get isOnboardComplete;
  @override
  @HiveField(9)
  bool? get isHo;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
