import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_constants.dart';
import 'package:movie_app/core/network/api_services.dart';

class DioApiService implements ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl, 
      connectTimeout: const Duration(seconds: 5), 
      receiveTimeout: const Duration(seconds: 3), 
    ),
  );

  @override
  Future<Response> getRequest(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return response;
    } on DioException catch (e) {
      
      return e.response!;
    }
  }

  @override
  Future<Response> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      
      return e.response!;
    }
  }
}
