// To parse this JSON data, do
//
//     final holidayListModel = holidayListModelFromJson(jsonString);

import 'dart:convert';

HolidayListModel holidayListModelFromJson(String str) =>
    HolidayListModel.fromJson(json.decode(str));

String holidayListModelToJson(HolidayListModel data) =>
    json.encode(data.toJson());

class HolidayListModel {
  List<HolidayData>? holiday;

  HolidayListModel({this.holiday});

  HolidayListModel copyWith({List<HolidayData>? holiday}) =>
      HolidayListModel(holiday: holiday ?? this.holiday);

  factory HolidayListModel.fromJson(Map<String, dynamic> json) =>
      HolidayListModel(
        holiday: json["list"] == null
            ? []
            : List<HolidayData>.from(
                json["list"]!.map((x) => HolidayData.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "list": holiday == null
        ? []
        : List<dynamic>.from(holiday!.map((x) => x.toJson())),
  };
}

class HolidayData {
  final int? id;
  final DateTime? date;
  final String? name;
  final bool? isHalfDay;

  HolidayData({
    this.id,
    this.date,
    this.name,
    this.isHalfDay,
  });

  HolidayData copyWith({
    int? id,
    DateTime? date,
    String? name,
    bool? isHalfDay,
  }) =>
      HolidayData(
        id: id ?? this.id,
        date: date ?? this.date,
        name: name ?? this.name,
        isHalfDay: isHalfDay ?? this.isHalfDay,
      );

  /// 🛡 SAFE JSON PARSING
  factory HolidayData.fromJson(Map<String, dynamic> json) => HolidayData(
    id: json["id"],
    date: json["date"] != null
        ? DateTime.tryParse(json["date"])
        : null,
    name: json["name"]?.toString(),
    isHalfDay: json["isHalfDay"] == true,
  );

  /// 🛡 SAFE JSON OUTPUT
  Map<String, dynamic> toJson() => {
    "id": id,
    "date": date != null
        ? "${date!.year.toString().padLeft(4, '0')}-"
        "${date!.month.toString().padLeft(2, '0')}-"
        "${date!.day.toString().padLeft(2, '0')}"
        : null,
    "name": name,
    "isHalfDay": isHalfDay,
  };

  /// Normalize today
  DateTime get _today =>
      DateTime.now().copyWith(hour: 0, minute: 0, second: 0, millisecond: 0);

  DateTime? get _holidayDate => date != null
      ? DateTime(date!.year, date!.month, date!.day)
      : null;

  /// 🧠 STATUS HELPERS (NULL SAFE)
  bool get isPast =>
      _holidayDate != null && _holidayDate!.isBefore(_today);

  bool get isToday =>
      _holidayDate != null &&
          _holidayDate!.year == _today.year &&
          _holidayDate!.month == _today.month &&
          _holidayDate!.day == _today.day;

  bool get isUpcoming =>
      _holidayDate != null && _holidayDate!.isAfter(_today);

  /// 🎨 UI HELPERS (NEVER CRASH)
  String get day => date?.day.toString().padLeft(2, '0') ?? "--";
  String get month => date != null ? _months[date!.month - 1] : "--";
  String get year => date?.year.toString() ?? "----";
  String get dayName =>
      date != null ? _weekDays[date!.weekday - 1] : "--";

  /// FALLBACK DISPLAY NAME
  String get displayName => name?.isNotEmpty == true ? name! : "Holiday";

  /// HALF DAY FLAG
  bool get isHalfDaySafe => isHalfDay ?? false;

  static const _weekDays = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  static const _months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
}

