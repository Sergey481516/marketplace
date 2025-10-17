import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import 'package:marketplace/core/http_client/http_client.dart';

@module
abstract class ApiClientFactory {
  @lazySingleton
  @Named('authApiClient')
  Dio authApiClient() => createApiClient('/api/v1/auth');
}
