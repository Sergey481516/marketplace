import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/repository/app_launch_repositoty.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

@lazySingleton
class SetOnboardingSeen extends UseCase<void, void> {
  final AppLaunchRepository repository;

  SetOnboardingSeen(this.repository);

  @override
  Future<Either<Failure, void>> call({void params}) {
    return repository.setOnboardingSeen();
  }
}
