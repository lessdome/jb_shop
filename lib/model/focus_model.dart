import 'dart:convert';

class FocusModel {
  FocusModel({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.url,
  });

  final String id;
  final String title;
  final String status;
  final String pic;
  final String url;

  FocusModel copyWith({
    required String id,
    required String title,
    required String status,
    required String pic,
    required String url,
  }) =>
      FocusModel(
        id: id,
        title: title,
        status: status,
        pic: pic,
        url: url,
      );

  factory FocusModel.fromJson(String str) =>
      FocusModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FocusModel.fromMap(Map<String, dynamic> json) => FocusModel(
        id: json["_id"],
        title: json["title"],
        status: json["status"],
        pic: json["pic"],
        url: json["url"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "status": status,
        "pic": pic,
        "url": url,
      };
}
