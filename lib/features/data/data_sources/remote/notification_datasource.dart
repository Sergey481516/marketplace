import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/core/error/exception.dart';

import 'package:marketplace/features/data/models/notification/notification_model.dart';

abstract class NotificationDatasource {
  Future<List<NotificationModel>> getNotifications();
}

@LazySingleton(as: NotificationDatasource)
class NotificationDatasourceImpl extends NotificationDatasource {
  final Dio api;

  NotificationDatasourceImpl(@Named('NotificationApiClient') this.api);

  @override
  Future<List<NotificationModel>> getNotifications() async {
    try {
      final response = await api.get('/list');

      return (response.data as List<dynamic>)
          .map((n) => NotificationModel.fromJson(n))
          .toList();
    } on DioException catch (err) {
      throw ServerException.fromDio(err);
    } catch (err) {
      rethrow;
    }
  }
}
