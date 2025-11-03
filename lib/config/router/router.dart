import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:marketplace/config/router/routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createLoadingRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.splash,
    routes: loadingRoutes,
  );
}

GoRouter createAuthRouter(bool hasSeenOnboarding) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: hasSeenOnboarding ? Routes.login : Routes.onboarding,
    routes: authRoutes,
  );
}

GoRouter createAppRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: Routes.home,
    routes: appRoutes,
  );
}
