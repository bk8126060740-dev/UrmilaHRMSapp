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
      userId: fields[1] as int?,
      employeeId: fields[2] as int?,
      projectId: fields[3] as int?,
      projectName: fields[4] as String?,
      baseLatitude: fields[5] as double?,
      baseLongitude: fields[6] as double?,
      fullName: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$LoginResponseModelImpl obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.employeeId)
      ..writeByte(3)
      ..write(obj.projectId)
      ..writeByte(4)
      ..write(obj.projectName)
      ..writeByte(5)
      ..write(obj.baseLatitude)
      ..writeByte(6)
      ..write(obj.baseLongitude)
      ..writeByte(7)
      ..write(obj.fullName);
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseModelImpl _$$LoginResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResponseModelImpl(
      token: json['token'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      employeeId: (json['employeeId'] as num?)?.toInt(),
      projectId: (json['projectId'] as num?)?.toInt(),
      projectName: json['projectName'] as String?,
      baseLatitude: (json['baseLatitude'] as num?)?.toDouble(),
      baseLongitude: (json['baseLongitude'] as num?)?.toDouble(),
      fullName: json['fullName'] as String?,
    );

Map<String, dynamic> _$$LoginResponseModelImplToJson(
        _$LoginResponseModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
      'employeeId': instance.employeeId,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'baseLatitude': instance.baseLatitude,
      'baseLongitude': instance.baseLongitude,
      'fullName': instance.fullName,
    };
