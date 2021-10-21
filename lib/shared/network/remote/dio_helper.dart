import 'package:dio/dio.dart';

// url: base/{method - path}/queries

class DioHelper {
  static late Dio _dio;

  static void init() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(String path,
      Map<String, dynamic>? query) async {
    return await _dio.get(path, queryParameters: query);
  }
}
