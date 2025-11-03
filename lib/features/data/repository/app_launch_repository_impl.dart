import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/core/error/exception.dart';
import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/data/data_sources/local/app_launch/app_launch_datasource.dart';

import 'package:marketplace/features/domain/repository/app_launch_repositoty.dart';

@LazySingleton(as: AppLaunchRepository)
class AppLaunchRepositoryImpl extends AppLaunchRepository {
  final AppLaunchDatasource appLaunchDatasource;

  AppLaunchRepositoryImpl(this.appLaunchDatasource);

  @override
  Future<Either<Failure, void>> setOnboardingSeen() async {
    try {
      await appLaunchDatasource.setOnboardingSeen();

      return Right(null);
    } on CacheException catch (err) {
      return Left(CacheFailure(err.message));
    }
  }

  @override
  Future<Either<Failure, bool>> checkSeenOnboarding() async {
    try {
      final hasSeenOnboarding = await appLaunchDatasource.checkSeenOnboarding();

      return Right(hasSeenOnboarding);
    } on CacheException catch (err) {
      return Left(CacheFailure(err.message));
    }
  }
}
