// To parse this JSON data, do
//
//     final leaveTypeDataModel = leaveTypeDataModelFromJson(jsonString);

import 'dart:convert';

LeaveTypeBalanceDataModel leaveTypeDataModelFromJson(String str) =>
    LeaveTypeBalanceDataModel.fromJson(json.decode(str));

String leaveTypeDataModelToJson(LeaveTypeBalanceDataModel data) =>
    json.encode(data.toJson());

class LeaveTypeBalanceDataModel {
  List<LeaveTypeBalanceItem>? leaveTypeData;

  LeaveTypeBalanceDataModel({this.leaveTypeData});

  LeaveTypeBalanceDataModel copyWith({
    List<LeaveTypeBalanceItem>? leaveTypeData,
  }) => LeaveTypeBalanceDataModel(
    leaveTypeData: leaveTypeData ?? this.leaveTypeData,
  );

  factory LeaveTypeBalanceDataModel.fromJson(Map<String, dynamic> json) =>
      LeaveTypeBalanceDataModel(
        leaveTypeData: json["list"] == null
            ? []
            : List<LeaveTypeBalanceItem>.from(
                json["list"]!.map((x) => LeaveTypeBalanceItem.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "list": leaveTypeData == null
        ? []
        : List<dynamic>.from(leaveTypeData!.map((x) => x.toJson())),
  };
}

LeaveTypeBalanceItem leaveTypeItemFromJson(String str) =>
    LeaveTypeBalanceItem.fromJson(json.decode(str));

String leaveTypeItemToJson(LeaveTypeBalanceItem data) =>
    json.encode(data.toJson());

class LeaveTypeBalanceItem {
  int? id;
  bool? isDeleted;
  DateTime? createdDate;
  int? employeeId;
  int? leaveTypeId;
  num? openingBalance;
  num? usedLeave;
  num? remainingBalance;
  int? year;
  LeaveTypeBalance? leaveType;

  LeaveTypeBalanceItem({
    this.id,
    this.isDeleted,
    this.createdDate,
    this.employeeId,
    this.leaveTypeId,
    this.openingBalance,
    this.usedLeave,
    this.remainingBalance,
    this.year,
    this.leaveType,
  });

  LeaveTypeBalanceItem copyWith({
    int? id,
    bool? isDeleted,
    DateTime? createdDate,
    int? employeeId,
    int? leaveTypeId,
    num? openingBalance,
    num? usedLeave,
    num? remainingBalance,
    int? year,
    LeaveTypeBalance? leaveType,
  }) => LeaveTypeBalanceItem(
    id: id ?? this.id,
    isDeleted: isDeleted ?? this.isDeleted,
    createdDate: createdDate ?? this.createdDate,
    employeeId: employeeId ?? this.employeeId,
    leaveTypeId: leaveTypeId ?? this.leaveTypeId,
    openingBalance: openingBalance ?? this.openingBalance,
    usedLeave: usedLeave ?? this.usedLeave,
    remainingBalance: remainingBalance ?? this.remainingBalance,
    year: year ?? this.year,
    leaveType: leaveType ?? this.leaveType,
  );

  factory LeaveTypeBalanceItem.fromJson(Map<String, dynamic> json) =>
      LeaveTypeBalanceItem(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        employeeId: json["employeeId"],
        leaveTypeId: json["leaveTypeId"],
        openingBalance: json["openingBalance"],
        usedLeave: json["usedLeave"],
        remainingBalance: json["remainingBalance"],
        year: json["year"],
        leaveType: json["leaveType"] == null
            ? null
            : LeaveTypeBalance.fromJson(json["leaveType"]),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isDeleted": isDeleted,
    "createdDate": createdDate?.toIso8601String(),
    "employeeId": employeeId,
    "leaveTypeId": leaveTypeId,
    "openingBalance": openingBalance,
    "usedLeave": usedLeave,
    "remainingBalance": remainingBalance,
    "year": year,
    "leaveType": leaveType?.toJson(),
  };
}

class LeaveTypeBalance {
  int? id;
  bool? isDeleted;
  DateTime? createdDate;
  int? createdBy;
  dynamic updatedDate;
  dynamic updatedBy;
  String? name;
  String? shortName;
  bool? isPaid;
  bool? isCarryForward;
  num? maxCarryForward;
  num? yearlyLimit;
  List<dynamic>? employeeLeaveBalances;
  List<dynamic>? leaveApplications;

  LeaveTypeBalance({
    this.id,
    this.isDeleted,
    this.createdDate,
    this.createdBy,
    this.updatedDate,
    this.updatedBy,
    this.name,
    this.shortName,
    this.isPaid,
    this.isCarryForward,
    this.maxCarryForward,
    this.yearlyLimit,
    this.employeeLeaveBalances,
    this.leaveApplications,
  });

  LeaveTypeBalance copyWith({
    int? id,
    bool? isDeleted,
    DateTime? createdDate,
    int? createdBy,
    dynamic updatedDate,
    dynamic updatedBy,
    String? name,
    String? shortName,
    bool? isPaid,
    bool? isCarryForward,
    num? maxCarryForward,
    num? yearlyLimit,
    List<dynamic>? employeeLeaveBalances,
    List<dynamic>? leaveApplications,
  }) => LeaveTypeBalance(
    id: id ?? this.id,
    isDeleted: isDeleted ?? this.isDeleted,
    createdDate: createdDate ?? this.createdDate,
    createdBy: createdBy ?? this.createdBy,
    updatedDate: updatedDate ?? this.updatedDate,
    updatedBy: updatedBy ?? this.updatedBy,
    name: name ?? this.name,
    shortName: shortName ?? this.shortName,
    isPaid: isPaid ?? this.isPaid,
    isCarryForward: isCarryForward ?? this.isCarryForward,
    maxCarryForward: maxCarryForward ?? this.maxCarryForward,
    yearlyLimit: yearlyLimit ?? this.yearlyLimit,
    employeeLeaveBalances: employeeLeaveBalances ?? this.employeeLeaveBalances,
    leaveApplications: leaveApplications ?? this.leaveApplications,
  );

  factory LeaveTypeBalance.fromJson(Map<String, dynamic> json) =>
      LeaveTypeBalance(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        createdBy: json["createdBy"],
        updatedDate: json["updatedDate"],
        updatedBy: json["updatedBy"],
        name: json["name"],
        shortName: json["shortName"],
        isPaid: json["isPaid"],
        isCarryForward: json["isCarryForward"],
        maxCarryForward: json["maxCarryForward"],
        yearlyLimit: json["yearlyLimit"],
        employeeLeaveBalances: json["employeeLeaveBalances"] == null
            ? []
            : List<dynamic>.from(json["employeeLeaveBalances"]!.map((x) => x)),
        leaveApplications: json["leaveApplications"] == null
            ? []
            : List<dynamic>.from(json["leaveApplications"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isDeleted": isDeleted,
    "createdDate": createdDate?.toIso8601String(),
    "createdBy": createdBy,
    "updatedDate": updatedDate,
    "updatedBy": updatedBy,
    "name": name,
    "shortName": shortName,
    "isPaid": isPaid,
    "isCarryForward": isCarryForward,
    "maxCarryForward": maxCarryForward,
    "yearlyLimit": yearlyLimit,
    "employeeLeaveBalances": employeeLeaveBalances == null
        ? []
        : List<dynamic>.from(employeeLeaveBalances!.map((x) => x)),
    "leaveApplications": leaveApplications == null
        ? []
        : List<dynamic>.from(leaveApplications!.map((x) => x)),
  };
}
