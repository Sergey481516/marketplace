import 'package:go_router/go_router.dart';
import 'package:marketplace/features/presentation/pages/account/account_page.dart';

import 'package:marketplace/features/presentation/pages/enter_code/enter_code.dart';
import 'package:marketplace/features/presentation/pages/home/home.dart';
import 'package:marketplace/features/presentation/pages/notifications/notifications.dart';
import 'package:marketplace/features/presentation/pages/product/product.dart';
import 'package:marketplace/features/presentation/pages/reset_password/reset_password.dart';
import 'package:marketplace/features/presentation/pages/search/search.dart';
import 'package:marketplace/features/presentation/pages/splash/splash.dart';
import 'package:marketplace/features/presentation/pages/onboarding/onboarding.dart';
import 'package:marketplace/features/presentation/pages/register/register.dart';
import 'package:marketplace/features/presentation/pages/login/login.dart';
import 'package:marketplace/features/presentation/pages/forgot_password/forgot_password.dart';

import 'fade_transition_page.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String register = '/register';
  static const String login = '/login';
  static const String forgotPassword = '/forgot-password';
  static const String enterCode = '/enter-code';
  static const String resetPassword = '/reset-password';

  static const String home = '/home';
  static const String product = '/product/:id';
  static const String comments = '/product/:id/comments';
  static const String search = '/search';
  static const String saved = '/saved';
  static const String cart = '/cart';
  static const String account = '/account';
  static const String notifications = '/notifications';
}

List<RouteBase> loadingRoutes = [
  GoRoute(path: Routes.splash, builder: (context, state) => const SplashPage()),
];

List<RouteBase> authRoutes = [
  GoRoute(
    path: Routes.onboarding,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const OnboardingPage(), state: state),
  ),
  GoRoute(
    path: Routes.register,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const RegisterPage(), state: state),
  ),
  GoRoute(
    path: Routes.login,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const LoginPage(), state: state),
  ),
  GoRoute(
    path: Routes.forgotPassword,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const ForgotPasswordPage(), state: state),
  ),
  GoRoute(
    path: Routes.enterCode,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const EnterCodePage(), state: state),
  ),
  GoRoute(
    path: Routes.resetPassword,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const ResetPasswordPage(), state: state),
  ),
];

List<RouteBase> appRoutes = [
  GoRoute(
    path: Routes.home,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const HomePage(), state: state),
  ),
  GoRoute(
    path: Routes.product,
    pageBuilder: (context, state) => FadeTransitionPage(
      child: ProductPage(id: state.pathParameters['id'] as String),
      state: state,
    ),
  ),
  GoRoute(
    path: Routes.notifications,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const NotificationsPage(), state: state),
  ),
  GoRoute(
    path: Routes.search,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const SearchPage(), state: state),
  ),
  GoRoute(
    path: Routes.account,
    pageBuilder: (context, state) =>
        FadeTransitionPage(child: const AccountPage(), state: state),
  ),
];
