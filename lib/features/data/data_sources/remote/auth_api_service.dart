import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/features/data/models/auth.dart';

@lazySingleton
class AuthApiService {
  final Dio api;

  AuthApiService(@Named('authApiClient') this.api);

  Future<Response> register(RegisterRequest request) async {
    return await api.post('/register', data: request.toJson());
  }

  Future<Response> login(LoginRequest request) async {
    return await api.post('/login', data: request.toJson());
  }

  Future<Response> forgotPassword(ForgotPasswordRequest request) async {
    return await api.post('/forgot-password', data: request.toJson());
  }

  Future<Response> resendCode(ResendCodeRequest request) async {
    return await api.post('/resend-code', data: request.toJson());
  }

  Future<Response> verifyCode(VerifyCodeRequest request) async {
    return await api.post('/verify-code', data: request.toJson());
  }

  Future<Response> resetPassword(ResetPasswordRequest request) async {
    return await api.post('/reset-password', data: request.toJson());
  }

  Future<Response> refresh(RefreshTokenRequest request) async {
    return await api.post('/logout', data: request.toJson());
  }

  Future<Response> logout() async {
    return await api.post('/logout');
  }
}
