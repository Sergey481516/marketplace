import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/exception.dart';
import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/data/data_sources/remote/notification_datasource.dart';
import 'package:marketplace/features/domain/entities/notification/notification_entity.dart';
import 'package:marketplace/features/domain/repository/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  final NotificationDatasource notificationDatasource;

  NotificationRepositoryImpl(this.notificationDatasource);

  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotifications() async {
    try {
      final notificationList = await notificationDatasource.getNotifications();
      final notificationEntityList = notificationList
          .map((n) => n.toEntity())
          .toList();

      return Right(notificationEntityList);
    } on ServerException catch (err) {
      return Left(ServerFailure());
    }
  }
}
