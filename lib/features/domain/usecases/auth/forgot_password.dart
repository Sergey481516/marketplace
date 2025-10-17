import 'package:injectable/injectable.dart';

import 'package:marketplace/core/resources/data_state.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';
import 'package:marketplace/features/domain/entities/auth.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';

class ForgotPasswordParams {
  final String email;

  const ForgotPasswordParams({required this.email});
}

@lazySingleton
class ForgotPasswordUseCase
    extends UseCase<DataState<ForgotPasswordEntity>, ForgotPasswordParams> {
  final AuthRepository authRepository;

  ForgotPasswordUseCase({required this.authRepository});

  @override
  Future<DataState<ForgotPasswordEntity>> call({
    required ForgotPasswordParams params,
  }) {
    return authRepository.forgotPassword(email: params.email);
  }
}
