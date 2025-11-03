import 'package:dartz/dartz.dart';

import 'package:marketplace/core/error/failure.dart';

abstract class AppLaunchRepository {
  Future<Either<Failure, void>> setOnboardingSeen();
  Future<Either<Failure, bool>> checkSeenOnboarding();
}
