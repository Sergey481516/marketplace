import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServerException implements Exception {
  final String? message;
  final int? code;
  final String? type;
  final String? url;
  final String? method;
  final dynamic data;

  const ServerException({
    this.message,
    this.code,
    this.type,
    this.url,
    this.method,
    this.data,
  });

  factory ServerException.unknown(Exception e) =>
      ServerException(message: 'Unknown exception: ${e.toString()}');

  factory ServerException.fromDio(DioException e) {
    return ServerException(
      message: e.message,
      code: e.response?.statusCode,
      type: e.type.toString(),
      url: e.requestOptions.uri.toString(),
      method: e.requestOptions.method,
      data: e.response,
    );
  }
}

class CacheException implements Exception {
  final String message;

  const CacheException(this.message);
}

class AuthException implements Exception {
  final String code;
  final String? message;

  const AuthException({required this.code, this.message});

  factory AuthException.fromFirebaseException(FirebaseAuthException e) =>
      AuthException(code: e.code, message: e.message);
}
