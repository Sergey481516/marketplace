import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/features/domain/entities/notification/notification_entity.dart';
import 'package:marketplace/features/domain/usecases/notification/get_notifications_use_case.dart';

class NotificationState {
  List<NotificationEntity>? notifications;

  NotificationState({this.notifications});
}

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  final GetNotifications getNotificationsUseCase;

  NotificationCubit(this.getNotificationsUseCase) : super(NotificationState());

  Future<void> getNotifications() async {
    final failureOrSuccess = await getNotificationsUseCase();

    failureOrSuccess.fold((err) {}, (notifications) {
      emit(NotificationState(notifications: notifications));
    });
  }
}
