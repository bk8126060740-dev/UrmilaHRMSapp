// To parse this JSON data, do
//
//     final missedPunchListModel = missedPunchListModelFromJson(jsonString);

import 'dart:convert';

MissedPunchTypeListModel missedPunchListModelFromJson(String str) =>
    MissedPunchTypeListModel.fromJson(json.decode(str));

String missedPunchListModelToJson(MissedPunchTypeListModel data) =>
    json.encode(data.toJson());

class MissedPunchTypeListModel {
  List<MissedPunchTypeData>? missedPunchList;

  MissedPunchTypeListModel({this.missedPunchList});

  MissedPunchTypeListModel copyWith({List<MissedPunchTypeData>? missedPunchList}) =>
      MissedPunchTypeListModel(
        missedPunchList: missedPunchList ?? this.missedPunchList,
      );

  factory MissedPunchTypeListModel.fromJson(Map<String, dynamic> json) =>
      MissedPunchTypeListModel(
        missedPunchList: json["list"] == null
            ? []
            : List<MissedPunchTypeData>.from(
                json["list"]!.map((x) => MissedPunchTypeData.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "list": missedPunchList == null
        ? []
        : List<dynamic>.from(missedPunchList!.map((x) => x.toJson())),
  };
}

class MissedPunchTypeData {
  int? id;
  String? name;

  MissedPunchTypeData({this.id, this.name});

  MissedPunchTypeData copyWith({int? id, String? name}) =>
      MissedPunchTypeData(id: id ?? this.id, name: name ?? this.name);

  factory MissedPunchTypeData.fromJson(Map<String, dynamic> json) =>
      MissedPunchTypeData(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
