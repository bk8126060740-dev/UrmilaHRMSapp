import 'package:animated_custom_dropdown/custom_dropdown.dart';

class DropdownModel with CustomDropdownListFilter {
  final String title;
  final String id;

  DropdownModel({required this.id, required this.title});

  @override
  String toString() {
    return title;
  }

  @override
  bool filter(String query) {
    return title.toLowerCase().contains(query.toLowerCase());
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropdownModel &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  Map<String, dynamic> toJson() => {'id': id, 'title': title};

  factory DropdownModel.fromJson(Map<String, dynamic> json) {
    return DropdownModel(
      id: json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
    );
  }
}
