import 'package:dartz/dartz.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/entities/auth/auth_entity.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, AuthEntity>> registerByPassword({
    required String fullName,
    required String email,
    required String password,
  });

  Future<Either<AuthFailure, AuthEntity>> loginByPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> forgotPassword({required String email});

  // Future<Either<Failure, void>> resetPassword({
  //   required String resetId,
  //   required String password,
  // });

  Future<Either<AuthFailure, void>> logout();
}
