// To parse this JSON data, do
//
//     final approvalMissedPunchModel = approvalMissedPunchModelFromJson(jsonString);

import 'dart:convert';

ApprovalMissedPunchModel approvalMissedPunchModelFromJson(String str) => ApprovalMissedPunchModel.fromJson(json.decode(str));

String approvalMissedPunchModelToJson(ApprovalMissedPunchModel data) => json.encode(data.toJson());

class ApprovalMissedPunchModel {
  List<ApprovalMissingPunchItem>? swipeRequestList;

  ApprovalMissedPunchModel({
    this.swipeRequestList,
  });

  ApprovalMissedPunchModel copyWith({
    List<ApprovalMissingPunchItem>? swipeRequestList,
  }) =>
      ApprovalMissedPunchModel(
        swipeRequestList: swipeRequestList ?? this.swipeRequestList,
      );

  factory ApprovalMissedPunchModel.fromJson(Map<String, dynamic> json) => ApprovalMissedPunchModel(
    swipeRequestList: json["swipeRequestList"] == null ? [] : List<ApprovalMissingPunchItem>.from(json["swipeRequestList"]!.map((x) => ApprovalMissingPunchItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "swipeRequestList": swipeRequestList == null ? [] : List<dynamic>.from(swipeRequestList!.map((x) => x.toJson())),
  };
}

class ApprovalMissingPunchItem {
  int? id;
  int? employeeId;
  int? swipeType;
  String? swipeTypeName;
  DateTime? swipeDate;
  dynamic requestedInTime;
  dynamic requestedOutTime;
  String? employeeRemarks;
  String? requestStatus;
  dynamic approvedBy;
  dynamic approvedDate;
  String? managerRemarks;
  DateTime? createdDate;
  bool? isDeleted;
  String? employeeName;

  ApprovalMissingPunchItem({
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
    this.managerRemarks,
    this.createdDate,
    this.isDeleted,
    this.employeeName,
  });

  ApprovalMissingPunchItem copyWith({
    int? id,
    int? employeeId,
    int? swipeType,
    String? swipeTypeName,
    DateTime? swipeDate,
    dynamic requestedInTime,
    dynamic requestedOutTime,
    String? employeeRemarks,
    String? requestStatus,
    dynamic approvedBy,
    dynamic approvedDate,
    String? managerRemarks,
    DateTime? createdDate,
    bool? isDeleted,
    String? employeeName,
  }) =>
      ApprovalMissingPunchItem(
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
        managerRemarks: managerRemarks ?? this.managerRemarks,
        createdDate: createdDate ?? this.createdDate,
        isDeleted: isDeleted ?? this.isDeleted,
        employeeName: employeeName ?? this.employeeName,
      );

  factory ApprovalMissingPunchItem.fromJson(Map<String, dynamic> json) => ApprovalMissingPunchItem(
    id: json["id"],
    employeeId: json["employeeId"],
    swipeType: json["swipeType"],
    swipeTypeName: json["swipeTypeName"],
    swipeDate: json["swipeDate"] == null ? null : DateTime.parse(json["swipeDate"]),
    requestedInTime: json["requestedInTime"],
    requestedOutTime: json["requestedOutTime"],
    employeeRemarks: json["employeeRemarks"],
    requestStatus: json["requestStatus"],
    approvedBy: json["approvedBy"],
    approvedDate: json["approvedDate"],
    managerRemarks: json["managerRemarks"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    isDeleted: json["isDeleted"],
    employeeName: json["employeeName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employeeId": employeeId,
    "swipeType": swipeType,
    "swipeTypeName": swipeTypeName,
    "swipeDate": "${swipeDate!.year.toString().padLeft(4, '0')}-${swipeDate!.month.toString().padLeft(2, '0')}-${swipeDate!.day.toString().padLeft(2, '0')}",
    "requestedInTime": requestedInTime,
    "requestedOutTime": requestedOutTime,
    "employeeRemarks": employeeRemarks,
    "requestStatus": requestStatus,
    "approvedBy": approvedBy,
    "approvedDate": approvedDate,
    "managerRemarks": managerRemarks,
    "createdDate": createdDate?.toIso8601String(),
    "isDeleted": isDeleted,
    "employeeName": employeeName,
  };
}
