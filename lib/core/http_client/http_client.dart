import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Dio createApiClient(String servicePrefix) {
  final baseUrl = Uri.parse(
    dotenv.env['API_URL'] as String,
  ).resolve(servicePrefix).toString();

  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'APP_ID': dotenv.env['APP_ID'] as String,
        Headers.contentTypeHeader: 'application/json',
      },
    ),
  );

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
}
