import 'package:jb_shop/model/focus_model.dart';

import 'http_request.dart';

class FocusRequest {
  static const String url = "/api/focus";

  static Future<List<FocusModel>> getData() async {
    try {
      // 1. 发送网络请求
      final result = await HttpRequest.request(
        url,
      );

      // 2. json 转 modal
      final focusArray = result["result"];

      List<FocusModel> foucsList = [];

      for (var item in focusArray) {
        foucsList.add(FocusModel.fromMap(item));
      }

      return foucsList;
    } catch (e) {
      return [];
    }
  }
}
