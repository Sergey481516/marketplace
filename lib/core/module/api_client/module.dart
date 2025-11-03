import 'package:injectable/injectable.dart';
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
      validateStatus: (status) => status! < 300,
    ),
  );

  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  return dio;
}

@module
abstract class ApiClientModule {
  @lazySingleton
  @Named('AuthApiClient')
  Dio authApiClient() => createApiClient('/api/v1/auth');

  @lazySingleton
  @Named('ProductApiClient')
  Dio productApiClient() => createApiClient('/api/v1/product-service');

  @lazySingleton
  @Named('DictionaryApiClient')
  Dio dictionaryApiClient() => createApiClient('/api/v1/dictionary');

  @lazySingleton
  @Named('NotificationApiClient')
  Dio notificationApiClient() => createApiClient('/api/v1/notification');
}
