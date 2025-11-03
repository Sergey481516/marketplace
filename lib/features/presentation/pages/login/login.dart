import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/config/injection/injection_container.dart';

import 'package:marketplace/config/router/routes.dart';
import 'package:marketplace/features/presentation/bloc/auth/login_bloc.dart';
import 'package:marketplace/features/presentation/components/text_divider/text_divider.dart';
import 'package:marketplace/features/presentation/widgets/app_layout/app_layout.dart';
import 'package:marketplace/features/presentation/components/login_double_rich_text/login_double_rich_text.dart';
import 'package:marketplace/features/presentation/components/login_header/login_header.dart';
import 'package:marketplace/features/presentation/pages/login/widgets/login_form.dart';
import 'package:marketplace/features/presentation/widgets/app_google_button/app_google_button.dart';
import 'package:marketplace/features/presentation/widgets/app_facebook_button/app_facebook_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginBloc>(),
      child: Scaffold(
        body: AppLayout(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoginHeader(
                        title: 'Login to your account',
                        subTitle: 'It’s great to see you again.',
                      ),

                      const LoginForm(),

                      const TextDivider(text: 'Or'),

                      const Column(
                        spacing: 16,
                        children: [
                          AppGoogleButton(label: 'Login with Google'),
                          AppFacebookButton(label: 'Login with Facebook'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Center(
                child: LoginDoubleRichText(
                  text: 'Don’t have an account?',
                  linkText: 'Join',
                  onTap: () {
                    context.replace(Routes.register);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
