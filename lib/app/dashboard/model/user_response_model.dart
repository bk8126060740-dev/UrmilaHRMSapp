// To parse this JSON data, do
//
//     final userResponseModel = userResponseModelFromJson(jsonString);

import 'dart:convert';

UserResponseModel userResponseModelFromJson(String str) =>
    UserResponseModel.fromJson(json.decode(str));

String userResponseModelToJson(UserResponseModel data) =>
    json.encode(data.toJson());

class UserResponseModel {
  int? id;
  int? employeeId;
  String? fullName;
  String? email;
  String? mobileNo;
  DateTime? dateOfBirth;
  int? designation;
  String? designationName;
  String? profilePath;

  UserResponseModel({
    this.id,
    this.employeeId,
    this.fullName,
    this.email,
    this.mobileNo,
    this.dateOfBirth,
    this.designation,
    this.designationName,
    this.profilePath,
  });

  UserResponseModel copyWith({
    int? id,
    int? employeeId,
    String? fullName,
    String? email,
    String? mobileNo,
    DateTime? dateOfBirth,
    int? designation,
    String? designationName,
    String? profilePath,
  }) => UserResponseModel(
    id: id ?? this.id,
    employeeId: employeeId ?? this.employeeId,
    fullName: fullName ?? this.fullName,
    email: email ?? this.email,
    mobileNo: mobileNo ?? this.mobileNo,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    designation: designation ?? this.designation,
    designationName: designationName ?? this.designationName,
    profilePath: profilePath ?? this.profilePath,
  );

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        id: json["id"],
        employeeId: json["employeeId"],
        fullName: json["fullName"],
        email: json["email"],
        mobileNo: json["mobileNo"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        designation: json["designation"],
        designationName: json["designationName"],
        profilePath: json["profilePath"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employeeId": employeeId,
    "fullName": fullName,
    "email": email,
    "mobileNo": mobileNo,
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "designation": designation,
    "designationName": designationName,
    "profilePath": profilePath,
  };
}
