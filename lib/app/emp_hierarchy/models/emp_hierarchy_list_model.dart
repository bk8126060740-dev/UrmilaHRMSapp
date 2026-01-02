// To parse this JSON data, do
//
//     final employeeHierarchyListModel = employeeHierarchyListModelFromJson(jsonString);

import 'dart:convert';

EmployeeHierarchyListModel employeeHierarchyListModelFromJson(String str) =>
    EmployeeHierarchyListModel.fromJson(json.decode(str));

String employeeHierarchyListModelToJson(EmployeeHierarchyListModel data) =>
    json.encode(data.toJson());

class EmployeeHierarchyListModel {
  List<EmployeeHierarchyItem>? hierarchyList;

  EmployeeHierarchyListModel({this.hierarchyList});

  EmployeeHierarchyListModel copyWith({
    List<EmployeeHierarchyItem>? hierarchyList,
  }) => EmployeeHierarchyListModel(
    hierarchyList: hierarchyList ?? this.hierarchyList,
  );

  factory EmployeeHierarchyListModel.fromJson(Map<String, dynamic> json) =>
      EmployeeHierarchyListModel(
        hierarchyList: json["hierarchyList"] == null
            ? []
            : List<EmployeeHierarchyItem>.from(
                json["hierarchyList"]!.map(
                  (x) => EmployeeHierarchyItem.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
    "hierarchyList": hierarchyList == null
        ? []
        : List<dynamic>.from(hierarchyList!.map((x) => x.toJson())),
  };
}

EmployeeHierarchyItem employeeHierarchyItemFromJson(String str) =>
    EmployeeHierarchyItem.fromJson(json.decode(str));

String employeeHierarchyItemToJson(EmployeeHierarchyItem data) =>
    json.encode(data.toJson());

class EmployeeHierarchyItem {
  int? id;
  bool? isDeleted;
  DateTime? createdDate;
  int? createdBy;
  DateTime? updatedDate;
  int? updatedBy;

  int? employeeId;
  int? projectId;
  int? departmentId;

  int? firstLevelManagerId;
  int? secondLevelManagerId;

  bool? isActive;
  String? purpose;

  String? employeeName;
  String? departmentName;
  String? projectName;
  String? firstLevelManagerName;
  String? secondLevelManagerName;

  dynamic employee;
  dynamic department;
  dynamic project;
  dynamic firstLevelManager;
  dynamic secondLevelManager;

  EmployeeHierarchyItem({
    this.id,
    this.isDeleted,
    this.createdDate,
    this.createdBy,
    this.updatedDate,
    this.updatedBy,
    this.employeeId,
    this.projectId,
    this.departmentId,
    this.firstLevelManagerId,
    this.secondLevelManagerId,
    this.isActive,
    this.purpose,
    this.employeeName,
    this.departmentName,
    this.projectName,
    this.firstLevelManagerName,
    this.secondLevelManagerName,
    this.employee,
    this.department,
    this.project,
    this.firstLevelManager,
    this.secondLevelManager,
  });

  EmployeeHierarchyItem copyWith({
    int? id,
    bool? isDeleted,
    DateTime? createdDate,
    int? createdBy,
    DateTime? updatedDate,
    int? updatedBy,
    int? employeeId,
    int? projectId,
    int? departmentId,
    int? firstLevelManagerId,
    int? secondLevelManagerId,
    bool? isActive,
    String? purpose,
    String? employeeName,
    String? departmentName,
    String? projectName,
    String? firstLevelManagerName,
    String? secondLevelManagerName,
    dynamic employee,
    dynamic department,
    dynamic project,
    dynamic firstLevelManager,
    dynamic secondLevelManager,
  }) => EmployeeHierarchyItem(
    id: id ?? this.id,
    isDeleted: isDeleted ?? this.isDeleted,
    createdDate: createdDate ?? this.createdDate,
    createdBy: createdBy ?? this.createdBy,
    updatedDate: updatedDate ?? this.updatedDate,
    updatedBy: updatedBy ?? this.updatedBy,
    employeeId: employeeId ?? this.employeeId,
    projectId: projectId ?? this.projectId,
    departmentId: departmentId ?? this.departmentId,
    firstLevelManagerId: firstLevelManagerId ?? this.firstLevelManagerId,
    secondLevelManagerId: secondLevelManagerId ?? this.secondLevelManagerId,
    isActive: isActive ?? this.isActive,
    purpose: purpose ?? this.purpose,
    employeeName: employeeName ?? this.employeeName,
    departmentName: departmentName ?? this.departmentName,
    projectName: projectName ?? this.projectName,
    firstLevelManagerName: firstLevelManagerName ?? this.firstLevelManagerName,
    secondLevelManagerName:
        secondLevelManagerName ?? this.secondLevelManagerName,
    employee: employee ?? this.employee,
    department: department ?? this.department,
    project: project ?? this.project,
    firstLevelManager: firstLevelManager ?? this.firstLevelManager,
    secondLevelManager: secondLevelManager ?? this.secondLevelManager,
  );

  factory EmployeeHierarchyItem.fromJson(Map<String, dynamic> json) =>
      EmployeeHierarchyItem(
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        createdBy: json["createdBy"],
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
        updatedBy: json["updatedBy"],
        employeeId: json["employeeId"],
        projectId: json["projectId"],
        departmentId: json["departmentId"],
        firstLevelManagerId: json["firstLevel"],
        secondLevelManagerId: json["secondLevel"],
        isActive: json["isActive"],
        purpose: json["purpose"],
        employeeName: json["employeeName"],
        departmentName: json["departmentName"],
        projectName: json["projectName"],
        firstLevelManagerName: json["firstLevelManagerName"],
        secondLevelManagerName: json["secondLevelManagerName"],
        employee: json["employee"],
        department: json["department"],
        project: json["project"],
        firstLevelManager: json["firstLevelManager"],
        secondLevelManager: json["secondLevelManager"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "isDeleted": isDeleted,
    "createdDate": createdDate?.toIso8601String(),
    "createdBy": createdBy,
    "updatedDate": updatedDate?.toIso8601String(),
    "updatedBy": updatedBy,
    "employeeId": employeeId,
    "projectId": projectId,
    "departmentId": departmentId,
    "firstLevel": firstLevelManagerId,
    "secondLevel": secondLevelManagerId,
    "isActive": isActive,
    "purpose": purpose,
    "employeeName": employeeName,
    "departmentName": departmentName,
    "projectName": projectName,
    "firstLevelManagerName": firstLevelManagerName,
    "secondLevelManagerName": secondLevelManagerName,
    "employee": employee,
    "department": department,
    "project": project,
    "firstLevelManager": firstLevelManager,
    "secondLevelManager": secondLevelManager,
  };
}
