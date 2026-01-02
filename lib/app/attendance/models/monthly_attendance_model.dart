// To parse this JSON data, do
//
//     final monthlyAttendanceModel = monthlyAttendanceModelFromJson(jsonString);

import 'dart:convert';

MonthlyAttendanceModel monthlyAttendanceModelFromJson(String str) =>
    MonthlyAttendanceModel.fromJson(json.decode(str));

String monthlyAttendanceModelToJson(MonthlyAttendanceModel data) =>
    json.encode(data.toJson());

class MonthlyAttendanceModel {
  Summary? summary;
  List<MonthlyAttendanceData>? days;

  MonthlyAttendanceModel({this.summary, this.days});

  MonthlyAttendanceModel copyWith({
    Summary? summary,
    List<MonthlyAttendanceData>? days,
  }) => MonthlyAttendanceModel(
    summary: summary ?? this.summary,
    days: days ?? this.days,
  );

  factory MonthlyAttendanceModel.fromJson(Map<String, dynamic> json) =>
      MonthlyAttendanceModel(
        summary: json["summary"] == null
            ? null
            : Summary.fromJson(json["summary"]),
        days: json["days"] == null
            ? []
            : List<MonthlyAttendanceData>.from(
                json["days"]!.map((x) => MonthlyAttendanceData.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "summary": summary?.toJson(),
    "days": days == null
        ? []
        : List<dynamic>.from(days!.map((x) => x.toJson())),
  };
}

class MonthlyAttendanceData {
  String? date;
  String? status;
  String? color;
  String? tooltip;

  MonthlyAttendanceData({this.date, this.status, this.color, this.tooltip});

  MonthlyAttendanceData copyWith({
    String? date,
    String? status,
    String? color,
    String? tooltip,
  }) => MonthlyAttendanceData(
    date: date ?? this.date,
    status: status ?? this.status,
    color: color ?? this.color,
    tooltip: tooltip ?? this.tooltip,
  );

  factory MonthlyAttendanceData.fromJson(Map<String, dynamic> json) =>
      MonthlyAttendanceData(
        date: json["date"],
        status: json["status"],
        color: json["color"],
        tooltip: json["tooltip"],
      );

  Map<String, dynamic> toJson() => {
    "date": date,
    "status": status,
    "color": color,
    "tooltip": tooltip,
  };
}

class Summary {
  int? totalDaysInMonth;
  int? totalWorkingDays;
  int? presentDays;
  int? absentDays;
  int? leaveDays;
  int? pendingApprovals;
  int? holidayDays;
  int? weeklyOffDays;
  int? holidayPresentDays;

  Summary({
    this.totalDaysInMonth,
    this.totalWorkingDays,
    this.presentDays,
    this.absentDays,
    this.leaveDays,
    this.pendingApprovals,
    this.holidayDays,
    this.weeklyOffDays,
    this.holidayPresentDays,
  });

  Summary copyWith({
    int? totalDaysInMonth,
    int? totalWorkingDays,
    int? presentDays,
    int? absentDays,
    int? leaveDays,
    int? pendingApprovals,
    int? holidayDays,
    int? weeklyOffDays,
    int? holidayPresentDays,
  }) =>
      Summary(
        totalDaysInMonth: totalDaysInMonth ?? this.totalDaysInMonth,
        totalWorkingDays: totalWorkingDays ?? this.totalWorkingDays,
        presentDays: presentDays ?? this.presentDays,
        absentDays: absentDays ?? this.absentDays,
        leaveDays: leaveDays ?? this.leaveDays,
        pendingApprovals: pendingApprovals ?? this.pendingApprovals,
        holidayDays: holidayDays ?? this.holidayDays,
        weeklyOffDays: weeklyOffDays ?? this.weeklyOffDays,
        holidayPresentDays: holidayPresentDays ?? this.holidayPresentDays,
      );

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    totalDaysInMonth: json["totalDaysInMonth"],
    totalWorkingDays: json["totalWorkingDays"],
    presentDays: json["presentDays"],
    absentDays: json["absentDays"],
    leaveDays: json["leaveDays"],
    pendingApprovals: json["pendingApprovals"],
    holidayDays: json["holidayDays"],
    weeklyOffDays: json["weeklyOffDays"],
    holidayPresentDays: json["holidayPresentDays"],
  );

  Map<String, dynamic> toJson() => {
    "totalDaysInMonth": totalDaysInMonth,
    "totalWorkingDays": totalWorkingDays,
    "presentDays": presentDays,
    "absentDays": absentDays,
    "leaveDays": leaveDays,
    "pendingApprovals": pendingApprovals,
    "holidayDays": holidayDays,
    "weeklyOffDays": weeklyOffDays,
    "holidayPresentDays": holidayPresentDays,
  };
}
