import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/core/error/failure.dart';

import 'package:marketplace/features/domain/repository/app_launch_repositoty.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

@lazySingleton
class CheckSeenOnboarding extends UseCase<bool, void> {
  final AppLaunchRepository repository;

  CheckSeenOnboarding(this.repository);

  @override
  Future<Either<Failure, bool>> call({void params}) {
    return repository.checkSeenOnboarding();
  }
}
