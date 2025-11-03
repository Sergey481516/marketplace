import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/exception.dart';
import 'package:marketplace/core/error/failure.dart';

import 'package:marketplace/features/data/data_sources/local/secure_storage/auth_secure_storage.dart';
import 'package:marketplace/features/data/data_sources/remote/auth_datasource.dart';
import 'package:marketplace/features/data/models/auth/auth_model.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';
import 'package:marketplace/features/domain/entities/auth/auth_entity.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource authDatasource;
  final AuthSecureStorage _authSecureStorage;

  AuthRepositoryImpl(this.authDatasource, this._authSecureStorage);

  @override
  Future<Either<AuthFailure, AuthEntity>> registerByPassword({
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

      final authModel = await authDatasource.registerByPassword(request);

      await _authSecureStorage.setAccessToken(authModel.accessToken);
      await _authSecureStorage.setRefreshToken(authModel.refreshToken);

      return Right(authModel.toEntity());
    } on AuthException catch (err) {
      return Left(AuthFailure(err.message, err.code));
    }
  }

  @override
  Future<Either<AuthFailure, AuthEntity>> loginByPassword({
    required String email,
    required String password,
  }) async {
    try {
      final request = LoginRequest(email: email, password: password);

      final authModel = await authDatasource.loginByPassword(request);

      await _authSecureStorage.setAccessToken(authModel.accessToken);
      await _authSecureStorage.setRefreshToken(authModel.refreshToken);

      return Right(authModel.toEntity());
    } on AuthException catch (err) {
      return Left(AuthFailure(err.message, err.code));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String email}) async {
    try {
      await authDatasource.sendPasswordResetEmail(
        ForgotPasswordRequest(email: email),
      );

      return Right(null);
    } on ServerException catch (err) {
      return Left(ServerFailure());
    }
  }

  // @override
  // Future<Either<Failure, void>> resetPassword({
  //   required String resetId,
  //   required String password,
  // }) async {
  //   try {
  //     final response = await authDatasource.resetPassword(
  //       ResetPasswordRequest(resetId: resetId, password: password),
  //     );
  //
  //     return Right(null);
  //   } on ServerException catch (err) {
  //     return Left(ServerFailure());
  //   }
  // }

  @override
  Future<Either<AuthFailure, void>> logout() async {
    try {
      await authDatasource.logout();

      return Right(null);
    } on AuthException catch (err) {
      return Left(AuthFailure(err.message, err.code));
    }
  }
}
