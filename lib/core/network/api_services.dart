import 'package:dio/dio.dart';

abstract class ApiService {
  Future<Response> getRequest(String endpoint);
  Future<Response> postRequest(String endpoint, Map<String, dynamic> data);
}
