import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppLaunchDatasource {
  Future<void> setOnboardingSeen();
  Future<bool> checkSeenOnboarding();
}

@LazySingleton(as: AppLaunchDatasource)
class AppLaunchDatasourceImpl extends AppLaunchDatasource {
  static const flagKey = '_has_seen_onboarding';

  final SharedPreferencesWithCache prefs;

  AppLaunchDatasourceImpl(this.prefs);

  @override
  Future<void> setOnboardingSeen() async {
    try {
      return prefs.setBool(flagKey, false);
    } catch (err) {
      throw CacheException(err.toString());
    }
  }

  @override
  Future<bool> checkSeenOnboarding() async {
    try {
      return prefs.getBool(flagKey) ?? true;
    } catch (err) {
      throw CacheException(err.toString());
    }
  }
}
