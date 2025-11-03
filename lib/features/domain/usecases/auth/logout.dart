import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/repository/auth_repository.dart';

import '../usecase.dart';

@lazySingleton
class Logout extends UseCase<void, void> {
  final AuthRepository authRepository;

  Logout({required this.authRepository});

  @override
  Future<Either<Failure, void>> call({void params}) {
    return authRepository.logout();
  }
}
