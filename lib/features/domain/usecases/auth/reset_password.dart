import 'package:injectable/injectable.dart';
import 'package:marketplace/core/resources/data_state.dart';

import 'package:marketplace/features/domain/repository/auth_repository.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

class ResetPasswordParams {
  final String resetId;
  final String password;

  const ResetPasswordParams({required this.resetId, required this.password});
}

@lazySingleton
class ResetPasswordUseCase extends UseCase<DataState, ResetPasswordParams> {
  final AuthRepository authRepository;

  ResetPasswordUseCase({required this.authRepository});

  @override
  Future<DataState> call({required ResetPasswordParams params}) {
    return authRepository.resetPassword(
      resetId: params.resetId,
      password: params.password,
    );
  }
}
