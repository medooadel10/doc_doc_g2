import 'package:dio/dio.dart';
import 'package:docdoc_app/core/networking/api_constants.dart';

class DioFactory {
  static late Dio dio;

  static void init() {
    dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  }

  static Future<Response<dynamic>> postData(
    String endpoint, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
    );
    return response;
  }

  static Future<Response<dynamic>> getData(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    final response = await dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: Options(headers: {'Authorization': "Bearer $token"}),
    );
    return response;
  }
}
