import 'package:jb_shop/model/product_model.dart';

import 'http_request.dart';

class ProductRequest {
  static const String url = "/api/plist";

  static Future<List<ProductModel>> getData([Map<String, dynamic>? params]) async {
    try {
      // Map<String, String> params = {};
      // if (type == "is_hot") {
      //   params["is_hot"] = "1";
      // }
      // if (type == "is_best") {
      //   params["is_best"] = "1";
      // }

      // 1. 发送网络请求
      final result = await HttpRequest.request(url, params: params);

      // 2. json 转 modal
      final productArray = result["result"];

      List<ProductModel> productList = [];

      for (var item in productArray) {
        productList.add(ProductModel.fromMap(item));
      }

      return productList;
    } catch (e) {
      return [];
    }
  }
}
