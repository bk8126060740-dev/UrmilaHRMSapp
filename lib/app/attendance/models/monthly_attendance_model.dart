// To parse this JSON data, do
//
//     final monthlyAttendanceModel = monthlyAttendanceModelFromJson(jsonString);

import 'dart:convert';

MonthlyAttendanceModel monthlyAttendanceModelFromJson(String str) =>
    MonthlyAttendanceModel.fromJson(json.decode(str));

String monthlyAttendanceModelToJson(MonthlyAttendanceModel data) =>
    json.encode(data.toJson());

class MonthlyAttendanceModel {
  Status? status;
  List<MonthlyCalendarReport>? calendarReport;

  MonthlyAttendanceModel({this.status, this.calendarReport});

  MonthlyAttendanceModel copyWith({
    Status? status,
    List<MonthlyCalendarReport>? calendarReport,
  }) => MonthlyAttendanceModel(
    status: status ?? this.status,
    calendarReport: calendarReport ?? this.calendarReport,
  );

  factory MonthlyAttendanceModel.fromJson(Map<String, dynamic> json) =>
      MonthlyAttendanceModel(
        status: json["status"] == null ? null : Status.fromJson(json["status"]),
        calendarReport: json["calendarReport"] == null
            ? []
            : List<MonthlyCalendarReport>.from(
                json["calendarReport"]!.map(
                  (x) => MonthlyCalendarReport.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "status": status?.toJson(),
    "calendarReport": calendarReport == null
        ? []
        : List<dynamic>.from(calendarReport!.map((x) => x.toJson())),
  };
}

class MonthlyCalendarReport {
  DateTime? date;
  int? statusId;
  String? colorCode;
  String? name;
  bool? isHoliday;

  MonthlyCalendarReport({
    this.date,
    this.statusId,
    this.colorCode,
    this.name,
    this.isHoliday,
  });

  MonthlyCalendarReport copyWith({
    DateTime? date,
    int? statusId,
    String? colorCode,
    String? name,
    bool? isHoliday,
  }) => MonthlyCalendarReport(
    date: date ?? this.date,
    statusId: statusId ?? this.statusId,
    colorCode: colorCode ?? this.colorCode,
    name: name ?? this.name,
    isHoliday: isHoliday ?? this.isHoliday,
  );

  factory MonthlyCalendarReport.fromJson(Map<String, dynamic> json) =>
      MonthlyCalendarReport(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        statusId: json["statusId"],
        colorCode: json["colorCode"],
        name: json["name"],
        isHoliday: json["isHoliday"],
      );

  Map<String, dynamic> toJson() => {
    "date": date?.toIso8601String(),
    "statusId": statusId,
    "colorCode": colorCode,
    "name": name,
    "isHoliday": isHoliday,
  };
}

class Status {
  int? presentDays;
  int? absentDays;
  int? onLeaveDays;

  Status({this.presentDays, this.absentDays, this.onLeaveDays});

  Status copyWith({int? presentDays, int? absentDays, int? onLeaveDays}) =>
      Status(
        presentDays: presentDays ?? this.presentDays,
        absentDays: absentDays ?? this.absentDays,
        onLeaveDays: onLeaveDays ?? this.onLeaveDays,
      );

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    presentDays: json["presentDays"],
    absentDays: json["absentDays"],
    onLeaveDays: json["onLeaveDays"],
  );

  Map<String, dynamic> toJson() => {
    "presentDays": presentDays,
    "absentDays": absentDays,
    "onLeaveDays": onLeaveDays,
  };
}
