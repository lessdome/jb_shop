import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.cid,
    required this.price,
    required this.oldPrice,
    required this.pic,
    required this.sPic,
  });

  final String id;
  final String title;
  final String cid;
  final int price;
  final String oldPrice;
  final String pic;
  final String sPic;

  ProductModel copyWith({
    required String id,
    required String title,
    required String cid,
    required int price,
    required String oldPrice,
    required String pic,
    required String sPic,
  }) =>
      ProductModel(
        id: id,
        title: title,
        cid: cid,
        price: price,
        oldPrice: oldPrice,
        pic: pic,
        sPic: sPic,
      );

  factory ProductModel.fromJson(String str) =>
      ProductModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["_id"],
        title: json["title"],
        cid: json["cid"],
        price: json["price"],
        oldPrice: json["old_price"],
        pic: json["pic"],
        sPic: json["s_pic"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "title": title,
        "cid": cid,
        "price": price,
        "old_price": oldPrice,
        "pic": pic,
        "s_pic": sPic,
      };
}
