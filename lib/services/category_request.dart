import 'package:jb_shop/model/category_model.dart';

import 'http_request.dart';

class CategoryRequest {
  static const String url = "/api/pcate";

  static Future<List<CategoryModel>> getData(
      [Map<String, dynamic>? params]) async {
    try {
      // 1. 发送网络请求
      final result = await HttpRequest.request(url, params: params);

      // 2. json 转 modal
      final categoryArray = result["result"];

      List<CategoryModel> categoryList = [];

      for (var item in categoryArray) {
        categoryList.add(CategoryModel.fromMap(item));
      }

      return categoryList;
    } catch (e) {
      return [];
    }
  }
}
