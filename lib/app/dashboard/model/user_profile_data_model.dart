// To parse this JSON data, do
//
//     final userProfileDataModel = userProfileDataModelFromJson(jsonString);

import 'dart:convert';

UserProfileDataModel userProfileDataModelFromJson(String str) => UserProfileDataModel.fromJson(json.decode(str));

String userProfileDataModelToJson(UserProfileDataModel data) => json.encode(data.toJson());

class UserProfileDataModel {
  int? id;
  String? profilePath;
  String? firstName;
  String? midName;
  String? lastName;
  DateTime? dateOfBirth;
  dynamic gender;
  String? genderName;
  int? status;
  String? statusName;
  DateTime? doj;
  String? email;
  String? mobileNumber;
  dynamic maritalStatus;
  dynamic maritalStatusName;
  dynamic nationalityType;
  dynamic nationalityName;
  dynamic preferanceType;
  dynamic preferanceName;
  dynamic bloodGroup;
  int? designation;
  String? designationName;
  String? employeeCode;
  bool? isActive;
  dynamic deactiveDateTime;
  int? departmentId;
  String? departmentName;
  String? bkcRegNo;
  bool? isRailwayRetired;
  bool? isWagesRate;
  dynamic pfRegistrationDate;
  dynamic esicRegistrationDate;
  String? bankName;
  String? accountNumber;
  String? ifscCode;
  String? aadharCardNumber;
  dynamic panNumber;
  dynamic offerLetter;
  int? currentProjectId;
  String? projectName;
  String? projectProfilePicPath;

  UserProfileDataModel({
    this.id,
    this.profilePath,
    this.firstName,
    this.midName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.genderName,
    this.status,
    this.statusName,
    this.doj,
    this.email,
    this.mobileNumber,
    this.maritalStatus,
    this.maritalStatusName,
    this.nationalityType,
    this.nationalityName,
    this.preferanceType,
    this.preferanceName,
    this.bloodGroup,
    this.designation,
    this.designationName,
    this.employeeCode,
    this.isActive,
    this.deactiveDateTime,
    this.departmentId,
    this.departmentName,
    this.bkcRegNo,
    this.isRailwayRetired,
    this.isWagesRate,
    this.pfRegistrationDate,
    this.esicRegistrationDate,
    this.bankName,
    this.accountNumber,
    this.ifscCode,
    this.aadharCardNumber,
    this.panNumber,
    this.offerLetter,
    this.currentProjectId,
    this.projectName,
    this.projectProfilePicPath,
  });

  UserProfileDataModel copyWith({
    int? id,
    dynamic profilePath,
    String? firstName,
    dynamic midName,
    String? lastName,
    DateTime? dateOfBirth,
    dynamic gender,
    dynamic genderName,
    int? status,
    String? statusName,
    DateTime? doj,
    String? email,
    String? mobileNumber,
    dynamic maritalStatus,
    dynamic maritalStatusName,
    dynamic nationalityType,
    dynamic nationalityName,
    dynamic preferanceType,
    dynamic preferanceName,
    dynamic bloodGroup,
    int? designation,
    String? designationName,
    String? employeeCode,
    bool? isActive,
    dynamic deactiveDateTime,
    int? departmentId,
    String? departmentName,
    String? bkcRegNo,
    bool? isRailwayRetired,
    bool? isWagesRate,
    dynamic pfRegistrationDate,
    dynamic esicRegistrationDate,
    String? bankName,
    String? accountNumber,
    String? ifscCode,
    String? aadharCardNumber,
    dynamic panNumber,
    dynamic offerLetter,
    int? currentProjectId,
    String? projectName,
    String? projectProfilePicPath,
  }) =>
      UserProfileDataModel(
        id: id ?? this.id,
        profilePath: profilePath ?? this.profilePath,
        firstName: firstName ?? this.firstName,
        midName: midName ?? this.midName,
        lastName: lastName ?? this.lastName,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        gender: gender ?? this.gender,
        genderName: genderName ?? this.genderName,
        status: status ?? this.status,
        statusName: statusName ?? this.statusName,
        doj: doj ?? this.doj,
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        maritalStatus: maritalStatus ?? this.maritalStatus,
        maritalStatusName: maritalStatusName ?? this.maritalStatusName,
        nationalityType: nationalityType ?? this.nationalityType,
        nationalityName: nationalityName ?? this.nationalityName,
        preferanceType: preferanceType ?? this.preferanceType,
        preferanceName: preferanceName ?? this.preferanceName,
        bloodGroup: bloodGroup ?? this.bloodGroup,
        designation: designation ?? this.designation,
        designationName: designationName ?? this.designationName,
        employeeCode: employeeCode ?? this.employeeCode,
        isActive: isActive ?? this.isActive,
        deactiveDateTime: deactiveDateTime ?? this.deactiveDateTime,
        departmentId: departmentId ?? this.departmentId,
        departmentName: departmentName ?? this.departmentName,
        bkcRegNo: bkcRegNo ?? this.bkcRegNo,
        isRailwayRetired: isRailwayRetired ?? this.isRailwayRetired,
        isWagesRate: isWagesRate ?? this.isWagesRate,
        pfRegistrationDate: pfRegistrationDate ?? this.pfRegistrationDate,
        esicRegistrationDate: esicRegistrationDate ?? this.esicRegistrationDate,
        bankName: bankName ?? this.bankName,
        accountNumber: accountNumber ?? this.accountNumber,
        ifscCode: ifscCode ?? this.ifscCode,
        aadharCardNumber: aadharCardNumber ?? this.aadharCardNumber,
        panNumber: panNumber ?? this.panNumber,
        offerLetter: offerLetter ?? this.offerLetter,
        currentProjectId: currentProjectId ?? this.currentProjectId,
        projectName: projectName ?? this.projectName,
        projectProfilePicPath: projectProfilePicPath ?? this.projectProfilePicPath,
      );

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) => UserProfileDataModel(
    id: json["id"],
    profilePath: json["profilePath"],
    firstName: json["firstName"],
    midName: json["midName"],
    lastName: json["lastName"],
    dateOfBirth: json["dateOfBirth"] == null ? null : DateTime.parse(json["dateOfBirth"]),
    gender: json["gender"],
    genderName: json["genderName"],
    status: json["status"],
    statusName: json["statusName"],
    doj: json["doj"] == null ? null : DateTime.parse(json["doj"]),
    email: json["email"],
    mobileNumber: json["mobileNumber"],
    maritalStatus: json["maritalStatus"],
    maritalStatusName: json["maritalStatusName"],
    nationalityType: json["nationalityType"],
    nationalityName: json["nationalityName"],
    preferanceType: json["preferanceType"],
    preferanceName: json["preferanceName"],
    bloodGroup: json["bloodGroup"],
    designation: json["designation"],
    designationName: json["designationName"],
    employeeCode: json["employeeCode"],
    isActive: json["isActive"],
    deactiveDateTime: json["deactiveDateTime"],
    departmentId: json["departmentId"],
    departmentName: json["departmentName"],
    bkcRegNo: json["bkcRegNo"],
    isRailwayRetired: json["isRailwayRetired"],
    isWagesRate: json["isWagesRate"],
    pfRegistrationDate: json["pfRegistrationDate"],
    esicRegistrationDate: json["esicRegistrationDate"],
    bankName: json["bankName"],
    accountNumber: json["accountNumber"],
    ifscCode: json["ifscCode"],
    aadharCardNumber: json["aadharCardNumber"],
    panNumber: json["panNumber"],
    offerLetter: json["offerLetter"],
    currentProjectId: json["currentProjectId"],
    projectName: json["projectName"],
    projectProfilePicPath: json["projectProfilePicPath"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "profilePath": profilePath,
    "firstName": firstName,
    "midName": midName,
    "lastName": lastName,
    "dateOfBirth": dateOfBirth?.toIso8601String(),
    "gender": gender,
    "genderName": genderName,
    "status": status,
    "statusName": statusName,
    "doj": doj?.toIso8601String(),
    "email": email,
    "mobileNumber": mobileNumber,
    "maritalStatus": maritalStatus,
    "maritalStatusName": maritalStatusName,
    "nationalityType": nationalityType,
    "nationalityName": nationalityName,
    "preferanceType": preferanceType,
    "preferanceName": preferanceName,
    "bloodGroup": bloodGroup,
    "designation": designation,
    "designationName": designationName,
    "employeeCode": employeeCode,
    "isActive": isActive,
    "deactiveDateTime": deactiveDateTime,
    "departmentId": departmentId,
    "departmentName": departmentName,
    "bkcRegNo": bkcRegNo,
    "isRailwayRetired": isRailwayRetired,
    "isWagesRate": isWagesRate,
    "pfRegistrationDate": pfRegistrationDate,
    "esicRegistrationDate": esicRegistrationDate,
    "bankName": bankName,
    "accountNumber": accountNumber,
    "ifscCode": ifscCode,
    "aadharCardNumber": aadharCardNumber,
    "panNumber": panNumber,
    "offerLetter": offerLetter,
    "currentProjectId": currentProjectId,
    "projectName": projectName,
    "projectProfilePicPath": projectProfilePicPath,
  };
}
