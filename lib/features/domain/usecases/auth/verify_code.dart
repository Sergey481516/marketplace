import 'package:injectable/injectable.dart';
import 'package:marketplace/core/resources/data_state.dart';

import 'package:marketplace/features/domain/repository/auth_repository.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

class VerifyCodeParams {
  final String resetId;
  final String code;

  const VerifyCodeParams({required this.resetId, required this.code});
}

@lazySingleton
class VerifyCodeUseCase extends UseCase<DataState, VerifyCodeParams> {
  final AuthRepository authRepository;

  VerifyCodeUseCase({required this.authRepository});

  @override
  Future<DataState> call({required VerifyCodeParams params}) {
    return authRepository.verifyCode(
      resetId: params.resetId,
      code: params.code,
    );
  }
}
