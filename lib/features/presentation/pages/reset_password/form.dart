import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/config/router/routes.dart';

import 'package:marketplace/features/presentation/bloc/auth/auth_bloc.dart';
// import 'package:marketplace/features/presentation/bloc/auth/event.dart';
// import 'package:marketplace/features/presentation/bloc/auth/state.dart';
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

    // context.read<AuthBloc>().add(
    //   ResetPasswordEvent(resetId: resetId, password: password),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // if (state is AuthError) {
        //   showErrorDialog(onOk: () => Navigator.of(context).pop());
        // }

        // if (state is AuthPasswordUpdated) {
        //   showSuccessDialog(
        //     title: 'Password Changed!',
        //     description:
        //         'Your can now use your new password to login to your account.',
        //     okButtonText: 'Login',
        //     onOk: () {
        //       context.go(Routes.login);
        //     },
        //   );
        // }
      },
      builder: (context, state) {
        // final isLoading = state is AuthLoading;
        final isLoading = false;

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
