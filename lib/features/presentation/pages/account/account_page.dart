import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketplace/config/injection/injection_container.dart';

import 'package:marketplace/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:marketplace/features/presentation/widgets/app_navbar/app_navbar.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  void _logout(BuildContext context) {
    context.read<AuthBloc>().logout();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AuthBloc>(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Account')),
            body: Column(
              children: [
                FilledButton(
                  onPressed: () {
                    _logout(context);
                  },
                  child: Text('Logout'),
                ),
              ],
            ),
            bottomNavigationBar: const AppNavbar(),
          );
        },
      ),
    );
  }
}
