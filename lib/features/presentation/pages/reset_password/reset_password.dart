import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/config/injection/injection_container.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/bloc.dart';

import 'package:marketplace/features/presentation/widgets/app_layout/app_layout.dart';
import 'form.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RemoteAuthBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(),
        body: AppLayout(child: const ResetPasswordForm()),
      ),
    );
  }
}
