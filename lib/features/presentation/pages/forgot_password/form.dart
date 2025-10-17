import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marketplace/config/routes.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/bloc.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/state.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/event.dart';
import 'package:marketplace/features/presentation/components/app_dialog/show_dialog_mixin.dart';
import 'package:marketplace/features/presentation/widgets/app_email_field/app_email_field.dart';
import 'package:marketplace/features/presentation/widgets/app_layout/app_layout.dart';
import 'package:marketplace/features/presentation/components/login_header/login_header.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm>
    with ShowDialogMixin {
  final _emailController = TextEditingController();

  void _sendCode() {
    final String email = _emailController.text;

    context.read<RemoteAuthBloc>().add(ForgotPassword(email: email));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoteAuthBloc, RemoteAuthState>(
      listener: (context, state) {
        if (state is RemoteAuthError) {
          showErrorDialog(onOk: () => Navigator.of(context).pop());
        }

        if (state is RemoteAuthForgotPasswordDone) {
          context.push(
            Routes.enterCode,
            extra: {'resetId': state.data?.resetId},
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is RemoteAuthLoading;

        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(),
          body: AppLayout(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const LoginHeader(
                        title: 'Forgot password',
                        subTitle:
                            'Enter your email for the verification process. We will send 4 digits code to your email.',
                      ),

                      AppEmailField(
                        enabled: !isLoading,
                        controller: _emailController,
                      ),
                    ],
                  ),
                ),

                // todo loading
                FilledButton(
                  onPressed: !isLoading
                      ? () {
                          _sendCode();
                        }
                      : null,
                  child: Text('Send Code'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
