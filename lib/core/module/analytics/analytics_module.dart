import 'package:injectable/injectable.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

@module
abstract class AnalyticsModule {
  @lazySingleton
  FirebaseAnalytics get analytics => FirebaseAnalytics.instance;
}
