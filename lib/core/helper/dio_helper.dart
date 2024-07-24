import 'package:dio/dio.dart';

import '../constant/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": bearer + (token ?? ""),
      "Content-Type": "application/json",
    };

    return await dio.get(
      endPoint,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String endPoint,
    Map<String, dynamic>? query,
    required dynamic data,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": bearer + (token ?? ""),
      "Content-Type": "application/json",
    };

    return await dio.post(endPoint, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": bearer + (token ?? ""),
      "Content-Type": "application/json",
    };

    return await dio.put(endPoint, queryParameters: query, data: data);
  }

  static Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? query,
    String lang = "en",
    String? token,
  }) async {
    dio.options.headers = {
      "lang": lang,
      "Authorization": bearer + (token ?? ""),
      "Content-Type": "application/json",
    };

    return await dio.delete(
      endPoint,
      queryParameters: query,
    );
  }
}
