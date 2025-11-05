// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoginResponseAdapter extends TypeAdapter<_$LoginResponseModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$LoginResponseModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$LoginResponseModelImpl(
      token: fields[0] as String?,
      tokenType: fields[1] as String?,
      expiresIn: fields[2] as int?,
      refreshToken: fields[3] as String?,
      user: fields[4] as User?,
    );
  }

  @override
  void write(BinaryWriter writer, _$LoginResponseModelImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.tokenType)
      ..writeByte(2)
      ..write(obj.expiresIn)
      ..writeByte(3)
      ..write(obj.refreshToken)
      ..writeByte(4)
      ..write(obj.user);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoginResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserAdapter extends TypeAdapter<_$UserImpl> {
  @override
  final int typeId = 2;

  @override
  _$UserImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$UserImpl(
      id: fields[0] as int?,
      fullName: fields[1] as String?,
      emailId: fields[2] as String?,
      profilePic: fields[3] as String?,
      userTypeId: fields[4] as int?,
      designationId: fields[5] as int?,
      designationName: fields[6] as String?,
      isCheckIn: fields[7] as bool?,
      isOnboardComplete: fields[8] as bool?,
      isHo: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, _$UserImpl obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.emailId)
      ..writeByte(3)
      ..write(obj.profilePic)
      ..writeByte(4)
      ..write(obj.userTypeId)
      ..writeByte(5)
      ..write(obj.designationId)
      ..writeByte(6)
      ..write(obj.designationName)
      ..writeByte(7)
      ..write(obj.isCheckIn)
      ..writeByte(8)
      ..write(obj.isOnboardComplete)
      ..writeByte(9)
      ..write(obj.isHo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseModelImpl _$$LoginResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResponseModelImpl(
      token: json['token'] as String?,
      tokenType: json['tokenType'] as String?,
      expiresIn: (json['expiresIn'] as num?)?.toInt(),
      refreshToken: json['refreshToken'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LoginResponseModelImplToJson(
        _$LoginResponseModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      emailId: json['emailId'] as String?,
      profilePic: json['profilePic'] as String?,
      userTypeId: (json['userTypeId'] as num?)?.toInt(),
      designationId: (json['designationId'] as num?)?.toInt(),
      designationName: json['designationName'] as String?,
      isCheckIn: json['isCheckIn'] as bool?,
      isOnboardComplete: json['isOnboardComplete'] as bool?,
      isHo: json['isHo'] as bool?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'emailId': instance.emailId,
      'profilePic': instance.profilePic,
      'userTypeId': instance.userTypeId,
      'designationId': instance.designationId,
      'designationName': instance.designationName,
      'isCheckIn': instance.isCheckIn,
      'isOnboardComplete': instance.isOnboardComplete,
      'isHo': instance.isHo,
    };
