// To parse this JSON data, do
//
//     final employeesMissedPunchModel = employeesMissedPunchModelFromJson(jsonString);

import 'dart:convert';

EmployeesMissedPunchModel employeesMissedPunchModelFromJson(String str) =>
    EmployeesMissedPunchModel.fromJson(json.decode(str));

String employeesMissedPunchModelToJson(EmployeesMissedPunchModel data) =>
    json.encode(data.toJson());

class EmployeesMissedPunchModel {
  List<EmployeesMissedPunchData>? swipeRequestList;

  EmployeesMissedPunchModel({this.swipeRequestList});

  EmployeesMissedPunchModel copyWith({
    List<EmployeesMissedPunchData>? swipeRequestList,
  }) => EmployeesMissedPunchModel(
    swipeRequestList: swipeRequestList ?? this.swipeRequestList,
  );

  factory EmployeesMissedPunchModel.fromJson(Map<String, dynamic> json) =>
      EmployeesMissedPunchModel(
        swipeRequestList: json["swipeRequestList"] == null
            ? []
            : List<EmployeesMissedPunchData>.from(
                json["swipeRequestList"]!.map(
                  (x) => EmployeesMissedPunchData.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "swipeRequestList": swipeRequestList == null
        ? []
        : List<dynamic>.from(swipeRequestList!.map((x) => x.toJson())),
  };
}

class EmployeesMissedPunchData {
  int? id;
  int? employeeId;
  int? swipeType;
  String? swipeTypeName;
  DateTime? swipeDate;
  dynamic requestedInTime;
  dynamic requestedOutTime;
  String? employeeRemarks;
  String? requestStatus;
  int? approvedBy;
  DateTime? approvedDate;
  String? approverName;
  String? managerRemarks;
  DateTime? createdDate;
  bool? isDeleted;
  String? employeeName;

  EmployeesMissedPunchData({
    this.id,
    this.employeeId,
    this.swipeType,
    this.swipeTypeName,
    this.swipeDate,
    this.requestedInTime,
    this.requestedOutTime,
    this.employeeRemarks,
    this.requestStatus,
    this.approvedBy,
    this.approvedDate,
    this.approverName,
    this.managerRemarks,
    this.createdDate,
    this.isDeleted,
    this.employeeName,
  });

  EmployeesMissedPunchData copyWith({
    int? id,
    int? employeeId,
    int? swipeType,
    String? swipeTypeName,
    DateTime? swipeDate,
    dynamic requestedInTime,
    dynamic requestedOutTime,
    String? employeeRemarks,
    String? requestStatus,
    int? approvedBy,
    DateTime? approvedDate,
    String? approverName,
    String? managerRemarks,
    DateTime? createdDate,
    bool? isDeleted,
    String? employeeName,
  }) => EmployeesMissedPunchData(
    id: id ?? this.id,
    employeeId: employeeId ?? this.employeeId,
    swipeType: swipeType ?? this.swipeType,
    swipeTypeName: swipeTypeName ?? this.swipeTypeName,
    swipeDate: swipeDate ?? this.swipeDate,
    requestedInTime: requestedInTime ?? this.requestedInTime,
    requestedOutTime: requestedOutTime ?? this.requestedOutTime,
    employeeRemarks: employeeRemarks ?? this.employeeRemarks,
    requestStatus: requestStatus ?? this.requestStatus,
    approvedBy: approvedBy ?? this.approvedBy,
    approvedDate: approvedDate ?? this.approvedDate,
    approverName: approverName ?? this.approverName,
    managerRemarks: managerRemarks ?? this.managerRemarks,
    createdDate: createdDate ?? this.createdDate,
    isDeleted: isDeleted ?? this.isDeleted,
    employeeName: employeeName ?? this.employeeName,
  );

  factory EmployeesMissedPunchData.fromJson(Map<String, dynamic> json) =>
      EmployeesMissedPunchData(
        id: json["id"],
        employeeId: json["employeeId"],
        swipeType: json["swipeType"],
        swipeTypeName: json["swipeTypeName"],
        swipeDate: json["swipeDate"] == null
            ? null
            : DateTime.parse(json["swipeDate"]),
        requestedInTime: json["requestedInTime"],
        requestedOutTime: json["requestedOutTime"],
        employeeRemarks: json["employeeRemarks"],
        requestStatus: json["requestStatus"],
        approvedBy: json["approvedBy"],
        approverName: json["approverName"],
        approvedDate: json["approvedDate"] == null
            ? null
            : DateTime.parse(json["approvedDate"]),
        managerRemarks: json["managerRemarks"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        isDeleted: json["isDeleted"],
        employeeName: json["employeeName"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employeeId": employeeId,
    "swipeType": swipeType,
    "swipeTypeName": swipeTypeName,
    "swipeDate":
        "${swipeDate!.year.toString().padLeft(4, '0')}-${swipeDate!.month.toString().padLeft(2, '0')}-${swipeDate!.day.toString().padLeft(2, '0')}",
    "requestedInTime": requestedInTime,
    "requestedOutTime": requestedOutTime,
    "employeeRemarks": employeeRemarks,
    "requestStatus": requestStatus,
    "approvedBy": approvedBy,
    "approverName": approverName,
    "approvedDate": approvedDate?.toIso8601String(),
    "managerRemarks": managerRemarks,
    "createdDate": createdDate?.toIso8601String(),
    "isDeleted": isDeleted,
    "employeeName": employeeName,
  };
}
