import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'login_response_model.freezed.dart';

part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  @HiveType(typeId: 1, adapterName: 'LoginResponseAdapter')
  factory LoginResponseModel({
    @HiveField(0) String? token,
    @HiveField(1) int? userId,
    @HiveField(2) int? employeeId,
    @HiveField(3) int? projectId,
    @HiveField(4) String? projectName,
    @HiveField(5) double? baseLatitude,
    @HiveField(6) double? baseLongitude,
    @HiveField(7) String? fullName,
    @HiveField(8) String? employeeType,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
