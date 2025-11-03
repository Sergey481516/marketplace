import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/config/injection/injection_container.dart';

import 'package:marketplace/config/theme/theme.dart';
import 'package:marketplace/config/router/router.dart';
import 'package:marketplace/features/presentation/bloc/auth/auth_bloc.dart';

class AppRoot extends StatefulWidget {
  const AppRoot({super.key});

  @override
  State<AppRoot> createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          late final GoRouter router;

          if (state is AuthUnauthenticatedState) {
            router = createAuthRouter(state.hasSeenOnboarding);
          } else if (state is AuthAuthenticatedState) {
            router = createAppRouter();
          } else {
            router = createLoadingRouter();
          }

          return MaterialApp.router(
            title: 'Marketplace',
            theme: theme,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
