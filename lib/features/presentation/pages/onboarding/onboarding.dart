import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace/config/injection/injection_container.dart';

import 'package:marketplace/config/router/routes.dart';
import 'package:marketplace/config/theme/app_typography.dart';
import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/features/presentation/bloc/auth/auth_bloc.dart';

import 'animation_gradient_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void _goLogin(BuildContext context) {
    context.go(Routes.register);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<AuthBloc>()..add(const AuthEvent.setOnboardingSeen()),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/graphic1-onboarding-page.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        'Define yourself in your unique way.',
                        style: AppTypography.h1,
                      ),
                    ),

                    Positioned(
                      bottom: -MediaQuery.of(context).size.height * 0.08,
                      right: 0,
                      child: Image.asset(
                        'assets/images/onboarding-man.png',
                        height: 697,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(height: 1, color: AppColors.primary[100]!),

              _buttonContainer(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonContainer(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 24, right: 24, top: 22, bottom: 4),
      alignment: Alignment.bottomCenter,
      child: SizedBox(width: double.infinity, child: _button(context)),
    );
  }

  Widget _button(BuildContext context) {
    // return AnimatedGradientButton(text: 'Get started', onPressed: () {});

    return FilledButton(
      onPressed: () => _goLogin(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Get Started'),
          SizedBox(width: 10),
          Transform.rotate(
            angle: 180 * pi / 180,
            child: SvgPicture.asset(
              'assets/icons/Arrow.svg',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
