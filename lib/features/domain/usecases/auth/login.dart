import 'package:injectable/injectable.dart';

import 'package:marketplace/core/resources/data_state.dart';
import 'package:marketplace/features/domain/entities/auth.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';

import '../usecase.dart';

class LoginParams {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});
}

@lazySingleton
class LoginUseCase extends UseCase<DataState<AuthEntity>, LoginParams> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<DataState<AuthEntity>> call({required LoginParams params}) {
    return authRepository.loginByPassword(
      email: params.email,
      password: params.password,
    );
  }
}
