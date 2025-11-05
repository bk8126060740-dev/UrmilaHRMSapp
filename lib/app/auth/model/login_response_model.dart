import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'login_response_model.freezed.dart';

part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  @HiveType(typeId: 1, adapterName: 'LoginResponseAdapter')
  factory LoginResponseModel({
    @HiveField(0) String? token,
    @HiveField(1) String? tokenType,
    @HiveField(2) int? expiresIn,
    @HiveField(3) String? refreshToken,
    @HiveField(4) User? user,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@freezed
class User with _$User {
  @HiveType(typeId: 2, adapterName: 'UserAdapter')
  factory User({
    @HiveField(0) int? id,
    @HiveField(1) String? fullName,
    @HiveField(2) String? emailId,
    @HiveField(3) String? profilePic,
    @HiveField(4) int? userTypeId,
    @HiveField(5) int? designationId,
    @HiveField(6) String? designationName,
    @HiveField(7) bool? isCheckIn,
    @HiveField(8) bool? isOnboardComplete,
    @HiveField(9) bool? isHo,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
