import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

class ForgotPasswordParams {
  final String email;

  const ForgotPasswordParams({required this.email});
}

@lazySingleton
class ForgotPassword extends UseCase<void, ForgotPasswordParams> {
  final AuthRepository authRepository;

  ForgotPassword(this.authRepository);

  @override
  Future<Either<Failure, void>> call({required ForgotPasswordParams params}) {
    return authRepository.forgotPassword(email: params.email);
  }
}
