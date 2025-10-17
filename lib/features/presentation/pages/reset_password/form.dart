import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/config/routes.dart';

import 'package:marketplace/features/presentation/bloc/remote/auth/bloc.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/event.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/state.dart';
import 'package:marketplace/features/presentation/components/app_dialog/show_dialog_mixin.dart';

import 'package:marketplace/features/presentation/widgets/app_password_field/app_password_field.dart';
import 'package:marketplace/features/presentation/components/login_header/login_header.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm>
    with ShowDialogMixin {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _resetPassword() {
    final String resetId = (GoRouterState.of(context).extra as Map)['resetId'];
    final String password = _passwordController.text;

    context.read<RemoteAuthBloc>().add(
      ResetPassword(resetId: resetId, password: password),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoteAuthBloc, RemoteAuthState>(
      listener: (context, state) {
        if (state is RemoteAuthError) {
          showErrorDialog(onOk: () => Navigator.of(context).pop());
        }

        if (state is RemoteAuthPasswordUpdated) {
          showSuccessDialog(
            title: 'Password Changed!',
            description:
                'Your can now use your new password to login to your account.',
            okButtonText: 'Login',
            onOk: () {
              context.go(Routes.login);
            },
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is RemoteAuthLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                children: [
                  const LoginHeader(
                    title: 'Reset Password',
                    subTitle:
                        'Set the new password for your account so you can login and access all the features.',
                  ),

                  AppPasswordField(
                    controller: _passwordController,
                    enabled: !isLoading,
                    hintText: 'Enter new password',
                  ),

                  const SizedBox(height: 16),

                  AppPasswordField(
                    controller: _confirmPasswordController,
                    enabled: !isLoading,
                    label: 'Confirm password',
                    hintText: 'Confirm your new password',
                  ),
                ],
              ),
            ),

            FilledButton(
              onPressed: !isLoading
                  ? () {
                      _resetPassword();
                    }
                  : null,
              child: Text('Continue'),
            ),
          ],
        );
      },
    );
  }
}
