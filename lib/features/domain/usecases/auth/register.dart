import 'package:injectable/injectable.dart';

import 'package:marketplace/core/resources/data_state.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';
import 'package:marketplace/features/domain/entities/auth.dart';
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
class RegisterUseCase extends UseCase<DataState<AuthEntity>, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  @override
  Future<DataState<AuthEntity>> call({required RegisterParams params}) {
    return authRepository.registerByPassword(
      fullName: params.fullName,
      email: params.email,
      password: params.password,
    );
  }
}
