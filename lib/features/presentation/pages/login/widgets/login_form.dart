import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:marketplace/config/router/routes.dart';
import 'package:marketplace/config/theme/app_typography.dart';
import 'package:marketplace/features/presentation/bloc/auth/login_bloc.dart';
import 'package:marketplace/features/presentation/components/app_dialog/show_dialog_mixin.dart';
import 'package:marketplace/features/presentation/widgets/app_email_field/app_email_field.dart';
import 'package:marketplace/features/presentation/widgets/app_password_field/app_password_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with ShowDialogMixin {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;

      context.read<LoginBloc>().add(
        LoginEvent.start(email: email, password: password),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginDoneState) {
          context.go(Routes.home);
        }

        if (state is LoginFailState) {
          showErrorDialog(
            description: state.message,
            onOk: () => Navigator.of(context).pop(),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is LoginLoadingState;

        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppEmailField(
                    enabled: !isLoading,
                    controller: _emailController,
                  ),

                  AppPasswordField(
                    enabled: !isLoading,
                    controller: _passwordController,
                  ),

                  RichText(
                    text: TextSpan(
                      text: 'Forgot your password?',
                      style: AppTypography.body2Regular,
                      children: [
                        const TextSpan(text: ' '),
                        TextSpan(
                          text: 'Reset your password',
                          style: AppTypography.body2Medium.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.push(Routes.forgotPassword);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  FilledButton(
                    onPressed: !isLoading
                        ? () {
                            _submitForm();
                          }
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        !isLoading
                            ? Text('Login')
                            : const SizedBox(
                                width: 21,
                                height: 21,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
