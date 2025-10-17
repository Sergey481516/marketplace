import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/config/routes.dart';

import 'package:marketplace/config/theme/app_typography.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/bloc.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/event.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/state.dart';
import 'package:marketplace/features/presentation/components/app_dialog/show_dialog_mixin.dart';
import 'package:marketplace/features/presentation/widgets/app_email_field/app_email_field.dart';
import 'package:marketplace/features/presentation/widgets/app_text_field/app_text_field.dart';
import 'package:marketplace/features/presentation/widgets/app_password_field/app_password_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with ShowDialogMixin {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final String fullName = _nameController.text;
      final String email = _emailController.text;
      final String password = _passwordController.text;

      context.read<RemoteAuthBloc>().add(
        Register(fullName: fullName, email: email, password: password),
      );
    }
  }

  Widget _agreement() {
    return RichText(
      text: TextSpan(
        text: 'By signing up you agree to our ',
        style: AppTypography.body2Regular,
        children: [
          TextSpan(
            text: 'Terms',
            style: AppTypography.body2Medium.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),

          const TextSpan(text: ', '),

          TextSpan(
            text: 'Privacy Policy',
            style: AppTypography.body2Medium.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),

          const TextSpan(text: ', and '),

          TextSpan(
            text: 'Cookie Use',
            style: AppTypography.body2Medium.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RemoteAuthBloc, RemoteAuthState>(
      listener: (context, state) {
        if (state is RemoteAuthError) {
          showErrorDialog(
            description: 'An error occurred, please try again later.',
            okButtonText: 'Ok',
            onOk: () {
              Navigator.of(context).pop();
            },
          );
        }

        if (state is RemoteAuthDone) {
          context.go(Routes.home);
        }
      },
      builder: (context, state) {
        final isLoading = state is RemoteAuthLoading;

        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppTextField(
                    label: 'Full name',
                    child: TextFormField(
                      enabled: !isLoading,
                      controller: _nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your full name',
                      ),
                      validator: ValidationBuilder()
                          .required('Full name is required.')
                          .maxLength(
                            100,
                            'Full name must be less than 100 characters.',
                          )
                          .build(),
                    ),
                  ),

                  AppEmailField(
                    enabled: !isLoading,
                    controller: _emailController,
                  ),

                  AppPasswordField(
                    enabled: !isLoading,
                    controller: _passwordController,
                  ),

                  _agreement(),
                ],
              ),

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
                        ? Text('Create an Account')
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
        );
      },
    );
  }
}
