import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/config/injection/injection_container.dart';
import 'package:marketplace/config/router/routes.dart';

import 'package:marketplace/features/presentation/bloc/favorite/favorite_cubit.dart';

import 'saved_list.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => getIt<FavoriteCubit>())],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Saved Items'),
          leading: IconButton(
            onPressed: () {
              context.push(Routes.home);
            },
            icon: Image.asset('assets/icons/Arrow.svg'),
          ),
        ),
        body: const SavedList(),
      ),
    );
  }
}
