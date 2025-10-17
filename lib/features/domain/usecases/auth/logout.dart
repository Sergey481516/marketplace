import 'package:injectable/injectable.dart';

import 'package:marketplace/features/domain/repository/auth_repository.dart';

import '../usecase.dart';

@lazySingleton
class LogoutUseCase extends UseCase<void, void> {
  final AuthRepository authRepository;

  LogoutUseCase({required this.authRepository});

  @override
  Future<void> call({required void params}) {
    return authRepository.logout();
  }
}
