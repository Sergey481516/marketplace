import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marketplace/features/presentation/bloc/favorite/favorite_cubit.dart';
import 'package:marketplace/features/presentation/components/product/product_card.dart';

class SavedList extends StatelessWidget {
  const SavedList({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteCubit = context.read<FavoriteCubit>();

    return StreamBuilder(
      stream: favoriteCubit.watchFavorites(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Text('Empty');
        }

        final products = snapshot.data!;

        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            mainAxisExtent: 224,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(
              name: product.name,
              price: product.price,
              image: product.image,
              isFavorite: true,
              onLikeTap: () {
                favoriteCubit.toggleFavorite(product);
              },
            );
          },
        );
      },
    );
  }
}
