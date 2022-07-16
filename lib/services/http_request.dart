import 'package:dio/dio.dart';
import './config.dart';

class HttpRequest {
  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseUrl,
    connectTimeout: HttpConfig.timeout,
  );

  static final Dio dio = Dio(
    baseOptions,
  );

  static InterceptorsWrapper defaultInterceptors =
      InterceptorsWrapper(onRequest: (options, handler) {
    return handler.next(options);
  }, onResponse: (response, handle) {
    handle.next(response);
  }, onError: (err, handle) {
    handle.next(err);
  });

  static Future<T?> request<T>(
    String url, {
    String method = "get",
    Map<String, dynamic>? params,
    dynamic data,
    Map<String, dynamic>? headers,
    Interceptor? inter,
    ResponseType? responseType = ResponseType.json,
  }) async {
    Options options = Options(
      method: method,
      headers: headers,
      responseType: responseType,
    );

    List<Interceptor> inters = [defaultInterceptors];

    if (inter != null) {
      inters.add(inter);
    }

    dio.interceptors.addAll(inters);

    try {
      Response<T> response = await dio.request(
        url,
        queryParameters: params,
        data: data,
        options: options,
      );
      return response.data;
    } on DioError catch (e) {
      return Future.error(e);
    }
  }
}
