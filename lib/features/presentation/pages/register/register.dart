import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/config/router/routes.dart';

import 'package:marketplace/config/injection/injection_container.dart';
import 'package:marketplace/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:marketplace/features/presentation/bloc/auth/register_bloc.dart';
import 'package:marketplace/features/presentation/components/login_double_rich_text/login_double_rich_text.dart';
import 'package:marketplace/features/presentation/components/text_divider/text_divider.dart';
import 'package:marketplace/features/presentation/widgets/app_google_button/app_google_button.dart';
import 'package:marketplace/features/presentation/widgets/app_facebook_button/app_facebook_button.dart';
import 'package:marketplace/features/presentation/widgets/app_layout/app_layout.dart';
import 'package:marketplace/features/presentation/components/login_header/login_header.dart';

import 'widgets/form.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterBloc>(),
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
                        title: 'Create an account',
                        subTitle: 'Let’s create your account.',
                      ),

                      const RegisterForm(),

                      const TextDivider(text: 'Or'),

                      Column(
                        spacing: 16,
                        children: [
                          AppGoogleButton(label: 'Sign Up with Google'),
                          AppFacebookButton(label: 'Sign Up with Facebook'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Center(
                child: LoginDoubleRichText(
                  text: 'Already have an account?',
                  linkText: 'Log In',
                  onTap: () {
                    context.replace(Routes.login);
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
