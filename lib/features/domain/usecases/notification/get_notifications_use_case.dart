import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/entities/notification/notification_entity.dart';
import 'package:marketplace/features/domain/repository/notification_repository.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

@lazySingleton
class GetNotifications extends UseCase<List<NotificationEntity>, void> {
  final NotificationRepository notificationRepository;

  GetNotifications(this.notificationRepository);

  @override
  Future<Either<Failure, List<NotificationEntity>>> call({void params}) {
    return notificationRepository.getNotifications();
  }
}
