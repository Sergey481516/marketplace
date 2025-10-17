import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import 'package:marketplace/config/routes.dart';
import 'package:marketplace/config/theme/app_typography.dart';
import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/bloc.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/event.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/state.dart';
import 'package:marketplace/features/presentation/components/app_dialog/show_dialog_mixin.dart';
import 'package:marketplace/features/presentation/components/login_header/login_header.dart';
import 'package:marketplace/features/presentation/components/login_double_rich_text/login_double_rich_text.dart';

class EnterCodeForm extends StatefulWidget {
  const EnterCodeForm({super.key});

  @override
  State<EnterCodeForm> createState() => _EnterCodeFormState();
}

class _EnterCodeFormState extends State<EnterCodeForm> with ShowDialogMixin {
  final _codeController = TextEditingController();

  void _resendCode() {
    final String resetId = (GoRouterState.of(context).extra as Map)['resetId'];

    context.read<RemoteAuthBloc>().add(ResendCode(resetId: resetId));
  }

  void _verifyCode() {
    final String resetId = (GoRouterState.of(context).extra as Map)['resetId'];
    final String code = _codeController.text;

    context.read<RemoteAuthBloc>().add(
      VerifyCode(resetId: resetId, code: code),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoteAuthBloc, RemoteAuthState>(
      listener: (context, state) {
        if (state is RemoteAuthError) {
          showErrorDialog(
            description: 'Invalid code, please try again',
            onOk: () => Navigator.of(context).pop(),
          );
        }

        if (state is RemoteAuthCodeVerified) {
          context.go(
            Routes.resetPassword,
            extra: {
              'resetId': (GoRouterState.of(context).extra as Map)['resetId'],
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
                    title: 'Enter 4 Digit Code',
                    subTitle:
                        'Enter 4 digit code that your receive on your email (cody.fisher45@example.com).',
                  ),

                  Pinput(
                    controller: _codeController,
                    enabled: !isLoading,
                    length: 4,
                    defaultPinTheme: PinTheme(
                      width: 64,
                      height: 60,
                      textStyle: AppTypography.h2,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary[100]!),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  LoginDoubleRichText(
                    text: 'Email not received?',
                    linkText: 'Resend code',
                    onTap: () {
                      _resendCode();
                    },
                  ),
                ],
              ),
            ),

            FilledButton(
              onPressed: !isLoading
                  ? () {
                      _verifyCode();
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
