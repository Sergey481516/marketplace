import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/resources/data_state.dart';
import 'package:marketplace/features/data/data_sources/local/auth_secure_storage.dart';
import 'package:marketplace/features/data/data_sources/remote/auth_api_service.dart';
import 'package:marketplace/features/data/models/auth.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';

import 'package:marketplace/features/domain/entities/auth.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthApiService _authApiService;
  final AuthSecureStorage _authSecureStorage;

  AuthRepositoryImpl(this._authApiService, this._authSecureStorage);

  @override
  Future<DataState<AuthEntity>> registerByPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final request = RegisterRequest(
        fullName: fullName,
        email: email,
        password: password,
      );

      final response = await _authApiService.register(request);
      final authData = AuthModel.fromJson(response.data);

      await _authSecureStorage.setAccessToken(authData.accessToken);
      await _authSecureStorage.setRefreshToken(authData.refreshToken);

      return DataSuccess(authData);
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }

  @override
  Future<DataState<AuthEntity>> loginByPassword({
    required String email,
    required String password,
  }) async {
    try {
      final request = LoginRequest(email: email, password: password);

      final response = await _authApiService.login(request);
      final authData = AuthModel.fromJson(response.data);

      await _authSecureStorage.setAccessToken(authData.accessToken);
      await _authSecureStorage.setRefreshToken(authData.refreshToken);

      return DataSuccess(authData);
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }

  @override
  Future<DataState<AccessTokenEntity>> refreshToken({
    required String refreshToken,
  }) async {
    try {
      final request = RefreshTokenRequest(refreshToken: refreshToken);

      final response = await _authApiService.refresh(request);
      final data = response.data as Map<String, dynamic>;
      final parsed = AccessTokenEntity(
        accessToken: data['access_token'] as String,
      );

      return DataSuccess(parsed);
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }

  @override
  Future<DataState<ForgotPasswordEntity>> forgotPassword({
    required String email,
  }) async {
    try {
      final response = await _authApiService.forgotPassword(
        ForgotPasswordRequest(email: email),
      );
      final data = ForgotPasswordEntity(
        resetId: response.data['resetId'] as String,
      );

      return DataSuccess(data);
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }

  @override
  Future<DataState> resendCode({required String resetId}) async {
    try {
      await _authApiService.resendCode(ResendCodeRequest(resetId: resetId));

      return DataSuccess({});
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }

  @override
  Future<DataState> verifyCode({
    required String resetId,
    required String code,
  }) async {
    try {
      final response = await _authApiService.verifyCode(
        VerifyCodeRequest(resetId: resetId, code: code),
      );

      return DataSuccess(response);
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }

  @override
  Future<DataState> resetPassword({
    required String resetId,
    required String password,
  }) async {
    try {
      final response = await _authApiService.resetPassword(
        ResetPasswordRequest(resetId: resetId, password: password),
      );

      return DataSuccess(response);
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }

  @override
  Future<DataState> logout() async {
    try {
      final response = await _authApiService.logout();

      return DataSuccess({});
    } on DioException catch (err) {
      return DataFailed(err);
    }
  }
}
