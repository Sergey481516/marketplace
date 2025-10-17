import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marketplace/config/injection/injection_container.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/bloc.dart';
import 'form.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RemoteAuthBloc>(),
      child: const ForgotPasswordForm(),
    );
  }
}
