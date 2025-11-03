import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/core/error/failure.dart';

import 'package:marketplace/features/domain/entities/auth/auth_entity.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';

import '../usecase.dart';

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

@lazySingleton
class Login extends UseCase<AuthEntity, LoginParams> {
  final AuthRepository authRepository;

  Login({required this.authRepository});

  @override
  Future<Either<AuthFailure, AuthEntity>> call({required LoginParams params}) {
    return authRepository.loginByPassword(
      email: params.email,
      password: params.password,
    );
  }
}
