import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_entity.freezed.dart';

@freezed
abstract class NotificationEntity with _$NotificationEntity {
  const factory NotificationEntity({
    required String label,
    required String description,
    required String icon,
    required DateTime createdAt,
  }) = _NotificationEntity;
}
