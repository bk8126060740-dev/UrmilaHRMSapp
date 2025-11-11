// To parse this JSON data, do
//
//     final userProfileDataModel = userProfileDataModelFromJson(jsonString);

import 'dart:convert';

UserProfileDataModel userProfileDataModelFromJson(String str) =>
    UserProfileDataModel.fromJson(json.decode(str));

String userProfileDataModelToJson(UserProfileDataModel data) =>
    json.encode(data.toJson());

class UserProfileDataModel {
  int? id;
  String? profilePath;
  String? firstName;
  dynamic midName;
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
  String? maritalStatusName;
  dynamic nationalityType;
  String? nationalityName;
  dynamic preferanceType;
  String? preferanceName;
  dynamic bloodGroup;
  int? designation;
  String? designationName;
  String? employeeCode;
  bool? isActive;
  dynamic deactiveDateTime;
  int? departmentId;
  String? departmentName;
  String? bkcRegNo;
  int? age;
  bool? isRailwayRetired;
  bool? isWagesRate;
  dynamic pfRegistrationDate;
  dynamic esicRegistrationDate;
  dynamic bankName;
  dynamic accountNumber;
  dynamic ifscCode;
  dynamic aadharCardNumber;
  dynamic panNumber;
  String? offerLetter;
  CurrentProject? currentProject;
  List<SalarySlip>? salarySlips;

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
    this.age,
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
    this.currentProject,
    this.salarySlips,
  });

  UserProfileDataModel copyWith({
    int? id,
    String? profilePath,
    String? firstName,
    dynamic midName,
    String? lastName,
    DateTime? dateOfBirth,
    dynamic gender,
    String? genderName,
    int? status,
    String? statusName,
    DateTime? doj,
    String? email,
    String? mobileNumber,
    dynamic maritalStatus,
    String? maritalStatusName,
    dynamic nationalityType,
    String? nationalityName,
    dynamic preferanceType,
    String? preferanceName,
    dynamic bloodGroup,
    int? designation,
    String? designationName,
    String? employeeCode,
    bool? isActive,
    dynamic deactiveDateTime,
    int? departmentId,
    String? departmentName,
    String? bkcRegNo,
    int? age,
    bool? isRailwayRetired,
    bool? isWagesRate,
    dynamic pfRegistrationDate,
    dynamic esicRegistrationDate,
    dynamic bankName,
    dynamic accountNumber,
    dynamic ifscCode,
    dynamic aadharCardNumber,
    dynamic panNumber,
    String? offerLetter,
    CurrentProject? currentProject,
    List<SalarySlip>? salarySlips,
  }) => UserProfileDataModel(
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
    age: age ?? this.age,
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
    currentProject: currentProject ?? this.currentProject,
    salarySlips: salarySlips ?? this.salarySlips,
  );

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) =>
      UserProfileDataModel(
        id: json["id"],
        profilePath: json["profilePath"],
        firstName: json["firstName"],
        midName: json["midName"],
        lastName: json["lastName"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
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
        age: json["age"],
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
        currentProject: json["currentProject"] == null
            ? null
            : CurrentProject.fromJson(json["currentProject"]),
        salarySlips: json["salarySlips"] == null
            ? []
            : List<SalarySlip>.from(
                json["salarySlips"]!.map((x) => SalarySlip.fromJson(x)),
              ),
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
    "age": age,
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
    "currentProject": currentProject?.toJson(),
    "salarySlips": salarySlips == null
        ? []
        : List<dynamic>.from(salarySlips!.map((x) => x.toJson())),
  };
}

class CurrentProject {
  int? id;
  int? employeeId;
  int? projectId;
  String? projectName;
  DateTime? startDate;
  dynamic endDate;
  dynamic role;

  CurrentProject({
    this.id,
    this.employeeId,
    this.projectId,
    this.projectName,
    this.startDate,
    this.endDate,
    this.role,
  });

  CurrentProject copyWith({
    int? id,
    int? employeeId,
    int? projectId,
    String? projectName,
    DateTime? startDate,
    dynamic endDate,
    dynamic role,
  }) => CurrentProject(
    id: id ?? this.id,
    employeeId: employeeId ?? this.employeeId,
    projectId: projectId ?? this.projectId,
    projectName: projectName ?? this.projectName,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    role: role ?? this.role,
  );

  factory CurrentProject.fromJson(Map<String, dynamic> json) => CurrentProject(
    id: json["id"],
    employeeId: json["employeeId"],
    projectId: json["projectId"],
    projectName: json["projectName"],
    startDate: json["startDate"] == null
        ? null
        : DateTime.parse(json["startDate"]),
    endDate: json["endDate"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employeeId": employeeId,
    "projectId": projectId,
    "projectName": projectName,
    "startDate": startDate?.toIso8601String(),
    "endDate": endDate,
    "role": role,
  };
}

class SalarySlip {
  int? monthId;
  String? month;
  int? year;

  SalarySlip({this.monthId, this.month, this.year});

  SalarySlip copyWith({int? monthId, String? month, int? year}) => SalarySlip(
    monthId: monthId ?? this.monthId,
    month: month ?? this.month,
    year: year ?? this.year,
  );

  factory SalarySlip.fromJson(Map<String, dynamic> json) => SalarySlip(
    monthId: json["monthId"],
    month: json["month"],
    year: json["year"],
  );

  Map<String, dynamic> toJson() => {
    "monthId": monthId,
    "month": month,
    "year": year,
  };
}
