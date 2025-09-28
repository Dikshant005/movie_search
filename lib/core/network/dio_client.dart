import 'package:dio/dio.dart';
import 'api_constants.dart';

Dio buildDioClient() {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      queryParameters: {'api_key': ApiConstants.apiKey},
      connectTimeout: const Duration(seconds: 65),
      receiveTimeout: const Duration(seconds: 65),
    )
    ..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  return dio;
}