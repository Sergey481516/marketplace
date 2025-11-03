import 'package:go_router/go_router.dart';

import 'package:marketplace/features/presentation/components/fade_transition_container/fade_transition_container.dart';

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage({required super.child, required GoRouterState state})
    : super(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 400),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransitionContainer(animation: animation, child: child);
        },
      );
}
