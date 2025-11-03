import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:marketplace/config/injection/injection_container.dart';
import 'package:marketplace/config/router/routes.dart';
import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';
import 'package:marketplace/features/domain/entities/product/product_entity.dart';
import 'package:marketplace/features/presentation/bloc/product/bloc.dart';
import 'package:marketplace/features/presentation/bloc/product/event.dart';
import 'package:marketplace/features/presentation/bloc/product/state.dart';
import 'package:marketplace/features/presentation/components/app_dialog/show_dialog_mixin.dart';
import 'package:marketplace/features/presentation/components/notifications_button/notifications_button.dart';
import 'package:marketplace/features/presentation/components/rating_info/rating_info.dart';
import 'package:marketplace/features/presentation/components/save_to_favorite_button/save_to_favorite_button.dart';
import 'package:marketplace/features/presentation/widgets/app_layout/app_layout.dart';
import 'package:shimmer/shimmer.dart';

class ProductPage extends StatefulWidget {
  final String id;

  const ProductPage({super.key, required this.id});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with ShowDialogMixin {
  Widget _renderRating(ProductEntity product, bool isLoading) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: AppColors.primary[400]!,
        highlightColor: AppColors.primary[100]!,
        child: SizedBox(height: 22),
      );
    }

    return RatingInfo(
      rating: product.rating,
      onTap: () {
        context.push(Routes.comments);
      },
    );
  }

  Widget _renderDescription(String? description, bool isLoading) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: AppColors.primary[400]!,
        highlightColor: AppColors.primary[100]!,
        child: SizedBox(height: 66),
      );
    }

    return Text(description!, style: AppTypography.body1Regular);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = getIt<ProductBloc>()..add(GetProductEvent(id: widget.id));

    return BlocProvider(
      create: (_) => bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Details', style: AppTypography.h3),
          centerTitle: false,
          actions: [
            NotificationsButton(
              onPressed: () {
                context.push(Routes.notifications);
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            bloc.add(GetProductEvent(id: widget.id));
          },
          child: BlocConsumer<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductError) {
                return Center(
                  child: FilledButton(
                    onPressed: () {
                      bloc.add(GetProductEvent(id: widget.id));
                    },
                    child: Text('Try again'),
                  ),
                );
              }

              final isLoading = state is ProductLoading;

              final product = state.product!;

              return AppLayout(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: 'assets/images/p1.png',
                          fit: BoxFit.contain,
                        ),

                        SaveToFavoriteButton(),
                      ],
                    ),

                    Text(product.name, style: AppTypography.h3),

                    _renderRating(product, isLoading),

                    _renderDescription(product.description, isLoading),
                  ],
                ),
              );
            },
            listener: (context, state) {
              if (state is ProductError) {
                showErrorDialog(onOk: () => Navigator.of(context).pop());
              }
            },
          ),
        ),
      ),
    );
  }
}
