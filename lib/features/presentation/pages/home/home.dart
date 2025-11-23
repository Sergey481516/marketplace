import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/config/injection/injection_container.dart';

import 'package:marketplace/config/router/routes.dart';
import 'package:marketplace/config/theme/app_typography.dart';
import 'package:marketplace/features/domain/entities/category/category_entity.dart';
import 'package:marketplace/features/domain/entities/product/product_entity.dart';
import 'package:marketplace/features/presentation/bloc/init/init_bloc.dart';
import 'package:marketplace/features/presentation/bloc/product/bloc.dart';
import 'package:marketplace/features/presentation/bloc/product/product_list_cubit.dart';
import 'package:marketplace/features/presentation/bloc/product/state.dart';
import 'package:marketplace/features/presentation/bloc/product_filter/cubit.dart';
import 'package:marketplace/features/presentation/components/app_horizotal_filter/app_horizontal_filter.dart';
import 'package:marketplace/features/presentation/components/app_search_bar/search_bar.dart';
import 'package:marketplace/features/presentation/components/notifications_button/notifications_button.dart';
import 'package:marketplace/features/presentation/pages/home/widgets/product_list_container.dart';
import 'package:marketplace/features/presentation/pages/home/widgets/search_filter.dart';

List<Filter> categories = [
  Filter(label: 'All', value: 'all'),
  Filter(label: 'Tshirts', value: 'tshirts'),
  Filter(label: 'Jeans', value: 'jeans'),
  Filter(label: 'Shoes', value: 'shoes'),
  Filter(label: 'Hats', value: 'hats'),
  Filter(label: 'Accessories', value: 'accessories'),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<InitBloc>()..add(const InitEvent.start()),
        ),
        BlocProvider(create: (_) => getIt<ProductFilterCubit>()),
        BlocProvider(create: (_) => getIt<ProductListCubit>()),
      ],
      child: BlocBuilder<InitBloc, InitState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<ProductListCubit>().fetchInitialProducts();
            },
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 24,
                        right: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discover', style: AppTypography.h2),

                          NotificationsButton(
                            onPressed: () {
                              context.push(Routes.notifications);
                            },
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Form(
                        child: Row(
                          spacing: 8,
                          children: [
                            Expanded(child: const AppSearchBar()),

                            SearchFilter(
                              onApplyFilter: (filter) {
                                context.read<ProductFilterCubit>().setFilter(
                                  filter,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    AppHorizontalFilter(
                      filters: categories,
                      onFilterChange: (filter) {
                        context.read<ProductFilterCubit>().setCategory(
                          CategoryEntity(id: filter.value, name: filter.label),
                        );
                      },
                    ),

                    const SizedBox(height: 24),

                    const ProductListContainer(),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
