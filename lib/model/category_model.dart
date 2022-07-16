import 'dart:convert';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.title,
    required this.status,
    required this.pic,
    required this.pid,
    required this.sort,
  });

  final String id;
  final String title;
  final int status;
  final String pic;
  final String pid;
  final String sort;

  CategoryModel copyWith({
    required String id,
    required String title,
    required int status,
    required String pic,
    required String pid,
    required String sort,
  }) =>
      CategoryModel(
        id: id,
        title: title,
        status: status,
        pic: pic,
        pid: pid,
        sort: sort,
      );

  factory CategoryModel.fromJson(String str) =>
      CategoryModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        title: json["title"],
        status: int.parse(json["status"].toString()),
        pic: json["pic"],
        pid: json["pid"],
        sort: json["sort"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "status": status,
        "pic": pic,
        "pid": pid,
        "sort": sort,
      };
}
