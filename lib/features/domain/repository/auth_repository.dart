import 'package:dio/dio.dart';
import 'package:marketplace/core/resources/data_state.dart';
import 'package:marketplace/features/domain/entities/auth.dart';

abstract class AuthRepository {
  Future<DataState<AuthEntity>> registerByPassword({
    required String fullName,
    required String email,
    required String password,
  });

  Future<DataState<AuthEntity>> loginByPassword({
    required String email,
    required String password,
  });

  Future<DataState<AccessTokenEntity>> refreshToken({
    required String refreshToken,
  });

  Future<DataState<ForgotPasswordEntity>> forgotPassword({
    required String email,
  });

  Future<DataState> resendCode({required String resetId});

  Future<DataState> verifyCode({required String resetId, required String code});

  Future<DataState> resetPassword({
    required String resetId,
    required String password,
  });

  Future<DataState> logout();
}
