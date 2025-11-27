// To parse this JSON data, do
//
//     final missingPunchListModel = missingPunchListModelFromJson(jsonString);

import 'dart:convert';

ApprovalMissedPunchModel missingPunchListModelFromJson(String str) =>
    ApprovalMissedPunchModel.fromJson(json.decode(str));

String missingPunchListModelToJson(ApprovalMissedPunchModel data) =>
    json.encode(data.toJson());

class ApprovalMissedPunchModel {
  List<ApprovalMissingPunchItem>? missingPunchList;

  ApprovalMissedPunchModel({this.missingPunchList});

  ApprovalMissedPunchModel copyWith({List<ApprovalMissingPunchItem>? missingPunchList}) =>
      ApprovalMissedPunchModel(
        missingPunchList: missingPunchList ?? this.missingPunchList,
      );

  factory ApprovalMissedPunchModel.fromJson(Map<String, dynamic> json) =>
      ApprovalMissedPunchModel(
        missingPunchList: json["missingPunchList"] == null
            ? []
            : List<ApprovalMissingPunchItem>.from(
                json["missingPunchList"]!.map(
                  (x) => ApprovalMissingPunchItem.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "missingPunchList": missingPunchList == null
        ? []
        : List<dynamic>.from(missingPunchList!.map((x) => x.toJson())),
  };
}

// Single item
ApprovalMissingPunchItem missingPunchItemFromJson(String str) =>
    ApprovalMissingPunchItem.fromJson(json.decode(str));

String missingPunchItemToJson(ApprovalMissingPunchItem data) =>
    json.encode(data.toJson());

class ApprovalMissingPunchItem {
  int? id;
  bool? isDeleted;
  DateTime? createdDate;
  int? createdBy;
  dynamic updatedDate;
  dynamic updatedBy;

  int? employeeId;
  String? employeeName;
  String? employeeCode;

  DateTime? date;
  String? missingType; // "In" / "Out"
  String? reason;
  String? attachmentPath;

  int? status; // 0 Pending | 1 Approved | -1 Rejected

  dynamic approverName;
  DateTime? approvedDate;

  String? remark;
  List<dynamic>? logs;

  ApprovalMissingPunchItem({
    this.id,
    this.isDeleted,
    this.createdDate,
    this.createdBy,
    this.updatedDate,
    this.updatedBy,
    this.employeeId,
    this.employeeName,
    this.employeeCode,
    this.date,
    this.missingType,
    this.reason,
    this.attachmentPath,
    this.status,
    this.approverName,
    this.approvedDate,
    this.remark,
    this.logs,
  });

  ApprovalMissingPunchItem copyWith({
    int? id,
    bool? isDeleted,
    DateTime? createdDate,
    int? createdBy,
    dynamic updatedDate,
    dynamic updatedBy,
    int? employeeId,
    String? employeeName,
    String? employeeCode,
    DateTime? date,
    String? missingType,
    String? reason,
    String? attachmentPath,
    int? status,
    dynamic approverName,
    DateTime? approvedDate,
    String? remark,
    List<dynamic>? logs,
  }) => ApprovalMissingPunchItem(
    id: id ?? this.id,
    isDeleted: isDeleted ?? this.isDeleted,
    createdDate: createdDate ?? this.createdDate,
    createdBy: createdBy ?? this.createdBy,
    updatedDate: updatedDate ?? this.updatedDate,
    updatedBy: updatedBy ?? this.updatedBy,
    employeeId: employeeId ?? this.employeeId,
    employeeName: employeeName ?? this.employeeName,
    employeeCode: employeeCode ?? this.employeeCode,
    date: date ?? this.date,
    missingType: missingType ?? this.missingType,
    reason: reason ?? this.reason,
    attachmentPath: attachmentPath ?? this.attachmentPath,
    status: status ?? this.status,
    approverName: approverName ?? this.approverName,
    approvedDate: approvedDate ?? this.approvedDate,
    remark: remark ?? this.remark,
    logs: logs ?? this.logs,
  );

  factory ApprovalMissingPunchItem.fromJson(Map<String, dynamic> json) =>
      ApprovalMissingPunchItem(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        createdBy: json["createdBy"],
        updatedDate: json["updatedDate"],
        updatedBy: json["updatedBy"],
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        employeeCode: json["employeeCode"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        missingType: json["missingType"],
        reason: json["reason"],
        attachmentPath: json["attachmentPath"],
        status: json["status"],
        approverName: json["approverName"],
        approvedDate: json["approvedDate"] == null
            ? null
            : DateTime.parse(json["approvedDate"]),
        remark: json["remark"],
        logs: json["logs"] == null
            ? []
            : List<dynamic>.from(json["logs"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isDeleted": isDeleted,
    "createdDate": createdDate?.toIso8601String(),
    "createdBy": createdBy,
    "updatedDate": updatedDate,
    "updatedBy": updatedBy,
    "employeeId": employeeId,
    "employeeName": employeeName,
    "employeeCode": employeeCode,
    "date": date == null
        ? null
        : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "missingType": missingType,
    "reason": reason,
    "attachmentPath": attachmentPath,
    "status": status,
    "approverName": approverName,
    "approvedDate": approvedDate?.toIso8601String(),
    "remark": remark,
    "logs": logs == null ? [] : List<dynamic>.from(logs!.map((x) => x)),
  };
}
