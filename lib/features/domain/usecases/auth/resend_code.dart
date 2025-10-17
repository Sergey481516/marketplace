import 'package:injectable/injectable.dart';
import 'package:marketplace/core/resources/data_state.dart';

import 'package:marketplace/features/domain/repository/auth_repository.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

class ResendCodeParams {
  final String resetId;

  const ResendCodeParams({required this.resetId});
}

@lazySingleton
class ResendCodeUseCase extends UseCase<DataState, ResendCodeParams> {
  final AuthRepository authRepository;

  ResendCodeUseCase({required this.authRepository});

  @override
  Future<DataState> call({required ResendCodeParams params}) {
    return authRepository.resendCode(resetId: params.resetId);
  }
}
