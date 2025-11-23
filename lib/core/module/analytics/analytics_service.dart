import 'package:injectable/injectable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

@singleton
class AnalyticsService {
  final FirebaseAnalytics _fa;

  AnalyticsService(this._fa);

  Future<void> userRegistered(String userId) async {
    _fa.logEvent(name: 'user_registered', parameters: {'user_id': userId});
  }

  Future<void> userRegisterFailed(String email, String fullName) async {
    _fa.logEvent(
      name: 'user_register_failed',
      parameters: {'email': email, 'full_name': fullName},
    );
  }
}
