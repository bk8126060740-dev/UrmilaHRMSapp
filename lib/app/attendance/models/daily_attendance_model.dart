// To parse this JSON data, do
//
//     final fetchAttendanceModel = fetchAttendanceModelFromJson(jsonString);

import 'dart:convert';

DailyAttendanceModel fetchAttendanceModelFromJson(String str) =>
    DailyAttendanceModel.fromJson(json.decode(str));

String fetchAttendanceModelToJson(DailyAttendanceModel data) =>
    json.encode(data.toJson());

class DailyAttendanceModel {
  List<DailyAttendanceData>? list;
  int? totalCount;

  DailyAttendanceModel({this.list, this.totalCount});

  DailyAttendanceModel copyWith({
    List<DailyAttendanceData>? list,
    int? totalCount,
  }) => DailyAttendanceModel(
    list: list ?? this.list,
    totalCount: totalCount ?? this.totalCount,
  );

  factory DailyAttendanceModel.fromJson(Map<String, dynamic> json) =>
      DailyAttendanceModel(
        list: json["list"] == null
            ? []
            : List<DailyAttendanceData>.from(
                json["list"]!.map((x) => DailyAttendanceData.fromJson(x)),
              ),
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
    "list": list == null
        ? []
        : List<dynamic>.from(list!.map((x) => x.toJson())),
    "totalCount": totalCount,
  };
}

class DailyAttendanceData {
  int? id;
  int? employeeId;
  DateTime? attendanceDate;
  String? inTime;
  String? inTimePicCapture;
  String? outTime;
  String? outTimePicCapture;
  bool? outOnDutyStatus;
  String? duration;
  String? inTimeLocation;
  String? intimeLatitude;
  String? intimeLongitude;
  String? outTimeLocation;
  String? outTimeLatitude;
  String? outTimeLongitude;

  DailyAttendanceData({
    this.id,
    this.employeeId,
    this.attendanceDate,
    this.inTime,
    this.inTimePicCapture,
    this.outTime,
    this.outTimePicCapture,
    this.outOnDutyStatus,
    this.duration,
    this.inTimeLocation,
    this.intimeLatitude,
    this.intimeLongitude,
    this.outTimeLocation,
    this.outTimeLatitude,
    this.outTimeLongitude,
  });

  DailyAttendanceData copyWith({
    int? id,
    int? employeeId,
    DateTime? attendanceDate,
    String? inTime,
    String? inTimePicCapture,
    String? outTime,
    String? outTimePicCapture,
    bool? outOnDutyStatus,
    String? duration,
    String? inTimeLocation,
    String? intimeLatitude,
    String? intimeLongitude,
    String? outTimeLocation,
    String? outTimeLatitude,
    String? outTimeLongitude,
  }) => DailyAttendanceData(
    id: id ?? this.id,
    employeeId: employeeId ?? this.employeeId,
    attendanceDate: attendanceDate ?? this.attendanceDate,
    inTime: inTime ?? this.inTime,
    inTimePicCapture: inTimePicCapture ?? this.inTimePicCapture,
    outTime: outTime ?? this.outTime,
    outTimePicCapture: outTimePicCapture ?? this.outTimePicCapture,
    outOnDutyStatus: outOnDutyStatus ?? this.outOnDutyStatus,
    duration: duration ?? this.duration,
    inTimeLocation: inTimeLocation ?? this.inTimeLocation,
    intimeLatitude: intimeLatitude ?? this.intimeLatitude,
    intimeLongitude: intimeLongitude ?? this.intimeLongitude,
    outTimeLocation: outTimeLocation ?? this.outTimeLocation,
    outTimeLatitude: outTimeLatitude ?? this.outTimeLatitude,
    outTimeLongitude: outTimeLongitude ?? this.outTimeLongitude,
  );

  factory DailyAttendanceData.fromJson(Map<String, dynamic> json) =>
      DailyAttendanceData(
        id: json["id"],
        employeeId: json["employeeId"],
        attendanceDate: json["attendanceDate"] == null
            ? null
            : DateTime.parse(json["attendanceDate"]),
        inTime: json["inTime"],
        inTimePicCapture: json["inTimePicCapture"],
        outTime: json["outTime"],
        outTimePicCapture: json["outTimePicCapture"],
        outOnDutyStatus: json["outOnDutyStatus"],
        duration: json["duration"],
        inTimeLocation: json["inTimeLocation"],
        intimeLatitude: json["intimeLatitude"],
        intimeLongitude: json["intimeLongitude"],
        outTimeLocation: json["outTimeLocation"],
        outTimeLatitude: json["outTimeLatitude"],
        outTimeLongitude: json["outTimeLongitude"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employeeId": employeeId,
    "attendanceDate": attendanceDate?.toIso8601String(),
    "inTime": inTime,
    "inTimePicCapture": inTimePicCapture,
    "outTime": outTime,
    "outTimePicCapture": outTimePicCapture,
    "outOnDutyStatus": outOnDutyStatus,
    "duration": duration,
    "inTimeLocation": inTimeLocation,
    "intimeLatitude": intimeLatitude,
    "intimeLongitude": intimeLongitude,
    "outTimeLocation": outTimeLocation,
    "outTimeLatitude": outTimeLatitude,
    "outTimeLongitude": outTimeLongitude,
  };
}
