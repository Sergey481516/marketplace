import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/features/domain/entities/notification/notification_entity.dart';

part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
abstract class NotificationModel with _$NotificationModel {
  const NotificationModel._();
  const factory NotificationModel({
    required String label,
    required String description,
    required String icon,
    required DateTime createdAt,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  NotificationEntity toEntity() => NotificationEntity(
    label: label,
    description: description,
    icon: icon,
    createdAt: createdAt,
  );
}
