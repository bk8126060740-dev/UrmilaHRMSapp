// To parse this JSON data, do
//
//     final appVersionModel = appVersionModelFromJson(jsonString);

import 'dart:convert';

AppVersionModel appVersionModelFromJson(String str) =>
    AppVersionModel.fromJson(json.decode(str));

String appVersionModelToJson(AppVersionModel data) =>
    json.encode(data.toJson());

class AppVersionModel {
  int? id;
  String? oldVersion;
  String? latestVersion;
  String? storeUrl;
  String? updateMessage;
  String? platform;
  DateTime? updatedDate;
  bool? isActive;

  AppVersionModel({
    this.id,
    this.oldVersion,
    this.latestVersion,
    this.storeUrl,
    this.updateMessage,
    this.platform,
    this.updatedDate,
    this.isActive,
  });

  AppVersionModel copyWith({
    int? id,
    String? oldVersion,
    String? latestVersion,
    String? storeUrl,
    String? updateMessage,
    String? platform,
    DateTime? updatedDate,
    bool? isActive,
  }) => AppVersionModel(
    id: id ?? this.id,
    oldVersion: oldVersion ?? this.oldVersion,
    latestVersion: latestVersion ?? this.latestVersion,
    storeUrl: storeUrl ?? this.storeUrl,
    updateMessage: updateMessage ?? this.updateMessage,
    platform: platform ?? this.platform,
    updatedDate: updatedDate ?? this.updatedDate,
    isActive: isActive ?? this.isActive,
  );

  factory AppVersionModel.fromJson(Map<String, dynamic> json) =>
      AppVersionModel(
        id: json["id"],
        oldVersion: json["oldVersion"],
        latestVersion: json["latestVersion"],
        storeUrl: json["storeUrl"],
        updateMessage: json["updateMessage"],
        platform: json["platform"],
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "oldVersion": oldVersion,
    "latestVersion": latestVersion,
    "storeUrl": storeUrl,
    "updateMessage": updateMessage,
    "platform": platform,
    "updatedDate": updatedDate?.toIso8601String(),
    "isActive": isActive,
  };
}
