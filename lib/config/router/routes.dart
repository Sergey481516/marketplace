import 'package:go_router/go_router.dart';
import 'package:marketplace/features/presentation/pages/account/account_page.dart';

import 'package:marketplace/features/presentation/pages/enter_code/enter_code.dart';
import 'package:marketplace/features/presentation/pages/home/home.dart';
import 'package:marketplace/features/presentation/pages/notifications/notifications.dart';
import 'package:marketplace/features/presentation/pages/product/product.dart';
import 'package:marketplace/features/presentation/pages/reset_password/reset_password.dart';
import 'package:marketplace/features/presentation/pages/saved/saved_page.dart';
import 'package:marketplace/features/presentation/pages/search/search.dart';
import 'package:marketplace/features/presentation/pages/splash/splash.dart';
import 'package:marketplace/features/presentation/pages/onboarding/onboarding.dart';
import 'package:marketplace/features/presentation/pages/register/register.dart';
import 'package:marketplace/features/presentation/pages/login/login.dart';
import 'package:marketplace/features/presentation/pages/forgot_password/forgot_password.dart';
import 'package:marketplace/features/presentation/widgets/app_shell/app_shell.dart';

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
    builder: (context, state) => const OnboardingPage(),
  ),
  GoRoute(
    path: Routes.register,
    builder: (context, state) => const RegisterPage(),
  ),
  GoRoute(path: Routes.login, builder: (context, state) => const LoginPage()),
  GoRoute(
    path: Routes.forgotPassword,
    builder: (context, state) => const ForgotPasswordPage(),
  ),
  GoRoute(
    path: Routes.enterCode,
    builder: (context, state) => const EnterCodePage(),
  ),
  GoRoute(
    path: Routes.resetPassword,
    builder: (context, state) => const ResetPasswordPage(),
  ),
];

List<RouteBase> appRoutes = [
  ShellRoute(
    builder: (context, state, child) {
      return AppShell(child: child);
    },
    routes: [
      GoRoute(path: Routes.home, builder: (context, state) => const HomePage()),
      GoRoute(
        path: Routes.product,
        builder: (context, state) =>
            ProductPage(id: state.pathParameters['id'] as String),
      ),
      GoRoute(
        path: Routes.notifications,
        builder: (context, state) => const NotificationsPage(),
      ),
      GoRoute(
        path: Routes.search,
        builder: (context, state) => const SearchPage(),
      ),
      GoRoute(
        path: Routes.saved,
        builder: (context, state) => const SavedPage(),
      ),
      GoRoute(
        path: Routes.account,
        builder: (context, state) => const AccountPage(),
      ),
    ],
  ),
];
