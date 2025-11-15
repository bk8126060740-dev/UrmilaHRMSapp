// To parse this JSON data, do
//
//     final approveAttendanceModel = approveAttendanceModelFromJson(jsonString);

import 'dart:convert';

ApproveAttendanceModel approveAttendanceModelFromJson(String str) =>
    ApproveAttendanceModel.fromJson(json.decode(str));

String approveAttendanceModelToJson(ApproveAttendanceModel data) =>
    json.encode(data.toJson());

class ApproveAttendanceModel {
  List<AttendecList>? attendecList;

  ApproveAttendanceModel({this.attendecList});

  ApproveAttendanceModel copyWith({List<AttendecList>? attendecList}) =>
      ApproveAttendanceModel(attendecList: attendecList ?? this.attendecList);

  factory ApproveAttendanceModel.fromJson(Map<String, dynamic> json) =>
      ApproveAttendanceModel(
        attendecList: json["attendecList"] == null
            ? []
            : List<AttendecList>.from(
                json["attendecList"]!.map((x) => AttendecList.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "attendecList": attendecList == null
        ? []
        : List<dynamic>.from(attendecList!.map((x) => x.toJson())),
  };
}

class AttendecList {
  int? id;
  bool? isDeleted;
  DateTime? createdDate;
  dynamic createdBy;
  dynamic updatedDate;
  dynamic updatedBy;
  int? employeeId;
  String? employeeName;
  DateTime? attendanceDate;
  dynamic inTime;
  dynamic outTime;
  dynamic outOnDutyStatus;
  dynamic duration;
  dynamic checkOutType;
  int? projectId;
  dynamic inTimeLocation;
  dynamic intimeLatitude;
  dynamic intimeLongitude;
  dynamic inTimePicCapture;
  dynamic outTimeLocation;
  dynamic outTimeLatitude;
  dynamic outTimeLongitude;
  dynamic outTimePicCapture;
  String? checkinApproval;
  String? checkoutAproval;
  dynamic checkinApprovalBy;
  DateTime? checkinApprovalDate;
  dynamic checkoutApprovalBy;
  DateTime? checkoutApprovalDate;

  AttendecList({
    this.id,
    this.isDeleted,
    this.createdDate,
    this.createdBy,
    this.updatedDate,
    this.updatedBy,
    this.employeeId,
    this.employeeName,
    this.attendanceDate,
    this.inTime,
    this.outTime,
    this.outOnDutyStatus,
    this.duration,
    this.checkOutType,
    this.projectId,
    this.inTimeLocation,
    this.intimeLatitude,
    this.intimeLongitude,
    this.inTimePicCapture,
    this.outTimeLocation,
    this.outTimeLatitude,
    this.outTimeLongitude,
    this.outTimePicCapture,
    this.checkinApproval,
    this.checkoutAproval,
    this.checkinApprovalBy,
    this.checkinApprovalDate,
    this.checkoutApprovalBy,
    this.checkoutApprovalDate,
  });

  AttendecList copyWith({
    int? id,
    bool? isDeleted,
    DateTime? createdDate,
    dynamic createdBy,
    dynamic updatedDate,
    dynamic updatedBy,
    int? employeeId,
    String? employeeName,
    DateTime? attendanceDate,
    dynamic inTime,
    dynamic outTime,
    dynamic outOnDutyStatus,
    dynamic duration,
    dynamic checkOutType,
    int? projectId,
    dynamic inTimeLocation,
    dynamic intimeLatitude,
    dynamic intimeLongitude,
    dynamic inTimePicCapture,
    dynamic outTimeLocation,
    dynamic outTimeLatitude,
    dynamic outTimeLongitude,
    dynamic outTimePicCapture,
    String? checkinApproval,
    String? checkoutAproval,
    dynamic checkinApprovalBy,
    DateTime? checkinApprovalDate,
    dynamic checkoutApprovalBy,
    DateTime? checkoutApprovalDate,
  }) => AttendecList(
    id: id ?? this.id,
    isDeleted: isDeleted ?? this.isDeleted,
    createdDate: createdDate ?? this.createdDate,
    createdBy: createdBy ?? this.createdBy,
    updatedDate: updatedDate ?? this.updatedDate,
    updatedBy: updatedBy ?? this.updatedBy,
    employeeId: employeeId ?? this.employeeId,
    employeeName: employeeName ?? this.employeeName,
    attendanceDate: attendanceDate ?? this.attendanceDate,
    inTime: inTime ?? this.inTime,
    outTime: outTime ?? this.outTime,
    outOnDutyStatus: outOnDutyStatus ?? this.outOnDutyStatus,
    duration: duration ?? this.duration,
    checkOutType: checkOutType ?? this.checkOutType,
    projectId: projectId ?? this.projectId,
    inTimeLocation: inTimeLocation ?? this.inTimeLocation,
    intimeLatitude: intimeLatitude ?? this.intimeLatitude,
    intimeLongitude: intimeLongitude ?? this.intimeLongitude,
    inTimePicCapture: inTimePicCapture ?? this.inTimePicCapture,
    outTimeLocation: outTimeLocation ?? this.outTimeLocation,
    outTimeLatitude: outTimeLatitude ?? this.outTimeLatitude,
    outTimeLongitude: outTimeLongitude ?? this.outTimeLongitude,
    outTimePicCapture: outTimePicCapture ?? this.outTimePicCapture,
    checkinApproval: checkinApproval ?? this.checkinApproval,
    checkoutAproval: checkoutAproval ?? this.checkoutAproval,
    checkinApprovalBy: checkinApprovalBy ?? this.checkinApprovalBy,
    checkinApprovalDate: checkinApprovalDate ?? this.checkinApprovalDate,
    checkoutApprovalBy: checkoutApprovalBy ?? this.checkoutApprovalBy,
    checkoutApprovalDate: checkoutApprovalDate ?? this.checkoutApprovalDate,
  );

  factory AttendecList.fromJson(Map<String, dynamic> json) => AttendecList(
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
    attendanceDate: json["attendanceDate"] == null
        ? null
        : DateTime.parse(json["attendanceDate"]),
    inTime: json["inTime"],
    outTime: json["outTime"],
    outOnDutyStatus: json["outOnDutyStatus"],
    duration: json["duration"],
    checkOutType: json["checkOutType"],
    projectId: json["projectId"],
    inTimeLocation: json["inTimeLocation"],
    intimeLatitude: json["intimeLatitude"],
    intimeLongitude: json["intimeLongitude"],
    inTimePicCapture: json["inTimePicCapture"],
    outTimeLocation: json["outTimeLocation"],
    outTimeLatitude: json["outTimeLatitude"],
    outTimeLongitude: json["outTimeLongitude"],
    outTimePicCapture: json["outTimePicCapture"],
    checkinApproval: json["checkinApproval"],
    checkoutAproval: json["checkoutAproval"],
    checkinApprovalBy: json["checkinApprovalBy"],
    checkinApprovalDate: json["checkinApprovalDate"] == null
        ? null
        : DateTime.parse(json["checkinApprovalDate"]),
    checkoutApprovalBy: json["checkoutApprovalBy"],
    checkoutApprovalDate: json["checkoutApprovalDate"] == null
        ? null
        : DateTime.parse(json["checkoutApprovalDate"]),
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
    "attendanceDate": attendanceDate?.toIso8601String(),
    "inTime": inTime,
    "outTime": outTime,
    "outOnDutyStatus": outOnDutyStatus,
    "duration": duration,
    "checkOutType": checkOutType,
    "projectId": projectId,
    "inTimeLocation": inTimeLocation,
    "intimeLatitude": intimeLatitude,
    "intimeLongitude": intimeLongitude,
    "inTimePicCapture": inTimePicCapture,
    "outTimeLocation": outTimeLocation,
    "outTimeLatitude": outTimeLatitude,
    "outTimeLongitude": outTimeLongitude,
    "outTimePicCapture": outTimePicCapture,
    "checkinApproval": checkinApproval,
    "checkoutAproval": checkoutAproval,
    "checkinApprovalBy": checkinApprovalBy,
    "checkinApprovalDate": checkinApprovalDate?.toIso8601String(),
    "checkoutApprovalBy": checkoutApprovalBy,
    "checkoutApprovalDate": checkoutApprovalDate?.toIso8601String(),
  };
}
