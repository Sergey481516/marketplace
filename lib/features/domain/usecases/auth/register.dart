import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';
import 'package:marketplace/features/domain/entities/auth/auth_entity.dart';
import '../usecase.dart';

class RegisterParams {
  final String fullName;
  final String email;
  final String password;

  const RegisterParams({
    required this.fullName,
    required this.email,
    required this.password,
  });
}

@lazySingleton
class Register extends UseCase<AuthEntity, RegisterParams> {
  final AuthRepository authRepository;

  Register({required this.authRepository});

  @override
  Future<Either<Failure, AuthEntity>> call({required RegisterParams params}) {
    return authRepository.registerByPassword(
      fullName: params.fullName,
      email: params.email,
      password: params.password,
    );
  }
}
