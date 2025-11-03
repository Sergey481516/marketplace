import 'package:dartz/dartz.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/entities/notification/notification_entity.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getNotifications();
}
