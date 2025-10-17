import 'package:injectable/injectable.dart';

import 'package:marketplace/core/resources/data_state.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';
import 'package:marketplace/features/domain/entities/auth.dart';
import '../usecase.dart';

class RefreshTokenParams {
  final String refreshToken;

  const RefreshTokenParams({required this.refreshToken});
}

@lazySingleton
class RefreshTokenUseCase
    extends UseCase<DataState<AccessTokenEntity>, RefreshTokenParams> {
  final AuthRepository authRepository;

  RefreshTokenUseCase({required this.authRepository});

  @override
  Future<DataState<AccessTokenEntity>> call({
    required RefreshTokenParams params,
  }) {
    return authRepository.refreshToken(refreshToken: params.refreshToken);
  }
}
