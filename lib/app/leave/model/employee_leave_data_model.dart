// To parse this JSON data, do
//
//     final employeeLeaveDataModel = employeeLeaveDataModelFromJson(jsonString);

import 'dart:convert';

EmployeeLeaveDataModel employeeLeaveDataModelFromJson(String str) =>
    EmployeeLeaveDataModel.fromJson(json.decode(str));

String employeeLeaveDataModelToJson(EmployeeLeaveDataModel data) =>
    json.encode(data.toJson());

class EmployeeLeaveDataModel {
  List<EmpLeaveDataItem>? empLeaveData;

  EmployeeLeaveDataModel({this.empLeaveData});

  EmployeeLeaveDataModel copyWith({List<EmpLeaveDataItem>? empLeaveData}) =>
      EmployeeLeaveDataModel(empLeaveData: empLeaveData ?? this.empLeaveData);

  factory EmployeeLeaveDataModel.fromJson(Map<String, dynamic> json) =>
      EmployeeLeaveDataModel(
        empLeaveData: json["list"] == null
            ? []
            : List<EmpLeaveDataItem>.from(
                json["list"]!.map((x) => EmpLeaveDataItem.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "list": empLeaveData == null
        ? []
        : List<dynamic>.from(empLeaveData!.map((x) => x.toJson())),
  };
}

EmpLeaveDataItem empLeaveDataItemFromJson(String str) =>
    EmpLeaveDataItem.fromJson(json.decode(str));

String empLeaveDataItemToJson(EmpLeaveDataItem data) =>
    json.encode(data.toJson());

class EmpLeaveDataItem {
  int? id;
  bool? isDeleted;
  DateTime? createdDate;
  int? createdBy;
  dynamic updatedDate;
  dynamic updatedBy;
  int? employeeId;
  int? leaveTypeId;
  DateTime? startDate;
  DateTime? endDate;
  num? noOfDays;
  String? leaveReason;
  String? attachmentPath;
  int? status;
  DateTime? appliedDate;
  dynamic firstLevelApprover;
  dynamic secondLevelApprover;
  int? firstLevelStatus;
  int? secondLevelStatus;
  String? firstLevelRemark;
  String? secondLevelRemark;
  int? projectId;
  dynamic departmentId;
  String? leaveTypeName;
  String? shortName;
  dynamic department;
  dynamic employee;
  dynamic leaveType;
  dynamic project;
  List<dynamic>? leaveApprovalLogs;

  EmpLeaveDataItem({
    this.id,
    this.isDeleted,
    this.createdDate,
    this.createdBy,
    this.updatedDate,
    this.updatedBy,
    this.employeeId,
    this.leaveTypeId,
    this.startDate,
    this.endDate,
    this.noOfDays,
    this.leaveReason,
    this.attachmentPath,
    this.status,
    this.appliedDate,
    this.firstLevelApprover,
    this.secondLevelApprover,
    this.firstLevelStatus,
    this.secondLevelStatus,
    this.firstLevelRemark,
    this.secondLevelRemark,
    this.projectId,
    this.departmentId,
    this.leaveTypeName,
    this.shortName,
    this.department,
    this.employee,
    this.leaveType,
    this.project,
    this.leaveApprovalLogs,
  });

  EmpLeaveDataItem copyWith({
    int? id,
    bool? isDeleted,
    DateTime? createdDate,
    int? createdBy,
    dynamic updatedDate,
    dynamic updatedBy,
    int? employeeId,
    int? leaveTypeId,
    DateTime? startDate,
    DateTime? endDate,
    num? noOfDays,
    String? leaveReason,
    String? attachmentPath,
    int? status,
    DateTime? appliedDate,
    dynamic firstLevelApprover,
    dynamic secondLevelApprover,
    int? firstLevelStatus,
    int? secondLevelStatus,
    dynamic firstLevelRemark,
    dynamic secondLevelRemark,
    int? projectId,
    dynamic departmentId,
    String? leaveTypeName,
    String? shortName,
    dynamic department,
    dynamic employee,
    dynamic leaveType,
    dynamic project,
    List<dynamic>? leaveApprovalLogs,
  }) => EmpLeaveDataItem(
    id: id ?? this.id,
    isDeleted: isDeleted ?? this.isDeleted,
    createdDate: createdDate ?? this.createdDate,
    createdBy: createdBy ?? this.createdBy,
    updatedDate: updatedDate ?? this.updatedDate,
    updatedBy: updatedBy ?? this.updatedBy,
    employeeId: employeeId ?? this.employeeId,
    leaveTypeId: leaveTypeId ?? this.leaveTypeId,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    noOfDays: noOfDays ?? this.noOfDays,
    leaveReason: leaveReason ?? this.leaveReason,
    attachmentPath: attachmentPath ?? this.attachmentPath,
    status: status ?? this.status,
    appliedDate: appliedDate ?? this.appliedDate,
    firstLevelApprover: firstLevelApprover ?? this.firstLevelApprover,
    secondLevelApprover: secondLevelApprover ?? this.secondLevelApprover,
    firstLevelStatus: firstLevelStatus ?? this.firstLevelStatus,
    secondLevelStatus: secondLevelStatus ?? this.secondLevelStatus,
    firstLevelRemark: firstLevelRemark ?? this.firstLevelRemark,
    secondLevelRemark: secondLevelRemark ?? this.secondLevelRemark,
    projectId: projectId ?? this.projectId,
    departmentId: departmentId ?? this.departmentId,
    leaveTypeName: leaveTypeName ?? this.leaveTypeName,
    shortName: shortName ?? this.shortName,
    department: department ?? this.department,
    employee: employee ?? this.employee,
    leaveType: leaveType ?? this.leaveType,
    project: project ?? this.project,
    leaveApprovalLogs: leaveApprovalLogs ?? this.leaveApprovalLogs,
  );

  factory EmpLeaveDataItem.fromJson(Map<String, dynamic> json) =>
      EmpLeaveDataItem(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        createdBy: json["createdBy"],
        updatedDate: json["updatedDate"],
        updatedBy: json["updatedBy"],
        employeeId: json["employeeId"],
        leaveTypeId: json["leaveTypeId"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null
            ? null
            : DateTime.parse(json["endDate"]),
        noOfDays: json["noOfDays"],
        leaveReason: json["leaveReason"],
        attachmentPath: json["attachmentPath"],
        status: json["status"],
        appliedDate: json["appliedDate"] == null
            ? null
            : DateTime.parse(json["appliedDate"]),
        firstLevelApprover: json["firstLevelApprover"],
        secondLevelApprover: json["secondLevelApprover"],
        firstLevelStatus: json["firstLevelStatus"],
        secondLevelStatus: json["secondLevelStatus"],
        firstLevelRemark: json["firstLevelRemark"],
        secondLevelRemark: json["secondLevelRemark"],
        projectId: json["projectId"],
        departmentId: json["departmentId"],
        leaveTypeName: json["leaveTypeName"],
        shortName: json["shortName"],
        department: json["department"],
        employee: json["employee"],
        leaveType: json["leaveType"],
        project: json["project"],
        leaveApprovalLogs: json["leaveApprovalLogs"] == null
            ? []
            : List<dynamic>.from(json["leaveApprovalLogs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isDeleted": isDeleted,
    "createdDate": createdDate?.toIso8601String(),
    "createdBy": createdBy,
    "updatedDate": updatedDate,
    "updatedBy": updatedBy,
    "employeeId": employeeId,
    "leaveTypeId": leaveTypeId,
    "startDate":
        "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "endDate":
        "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "noOfDays": noOfDays,
    "leaveReason": leaveReason,
    "attachmentPath": attachmentPath,
    "status": status,
    "appliedDate": appliedDate?.toIso8601String(),
    "firstLevelApprover": firstLevelApprover,
    "secondLevelApprover": secondLevelApprover,
    "firstLevelStatus": firstLevelStatus,
    "secondLevelStatus": secondLevelStatus,
    "firstLevelRemark": firstLevelRemark,
    "secondLevelRemark": secondLevelRemark,
    "projectId": projectId,
    "departmentId": departmentId,
    "leaveTypeName": leaveTypeName,
    "shortName": shortName,
    "department": department,
    "employee": employee,
    "leaveType": leaveType,
    "project": project,
    "leaveApprovalLogs": leaveApprovalLogs == null
        ? []
        : List<dynamic>.from(leaveApprovalLogs!.map((x) => x)),
  };
}
