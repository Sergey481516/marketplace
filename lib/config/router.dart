import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:marketplace/config/routes.dart';
import 'package:marketplace/features/presentation/pages/enter_code/enter_code.dart';
import 'package:marketplace/features/presentation/pages/home/home.dart';
import 'package:marketplace/features/presentation/pages/reset_password/reset_password.dart';
import 'package:marketplace/features/presentation/pages/splash/splash.dart';
import 'package:marketplace/features/presentation/pages/onboarding/onboarding.dart';
import 'package:marketplace/features/presentation/pages/register/register.dart';
import 'package:marketplace/features/presentation/pages/login/login.dart';
import 'package:marketplace/features/presentation/pages/forgot_password/forgot_password.dart';

import 'default_page_transition.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.login,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),
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

    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) =>
          FadeTransitionPage(child: const HomePage(), state: state),
    ),
  ],
);
