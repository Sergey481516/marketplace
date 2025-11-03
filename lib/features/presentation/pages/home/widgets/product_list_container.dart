import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:marketplace/config/injection/injection_container.dart';

import 'package:marketplace/config/router/routes.dart';
import 'package:marketplace/features/presentation/bloc/product/product_list_cubit.dart';

import 'package:marketplace/features/presentation/components/product/product_card.dart';
import 'package:marketplace/features/presentation/components/product/product_list.dart';

class ProductListContainer extends StatelessWidget {
  const ProductListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final productListCubit = getIt<ProductListCubit>();

    return StreamBuilder(
      stream: productListCubit.watchProducts(),
      builder: (context, snapshot) {
        if (snapshot.data == null) {
          return Text('Empty');
        }

        final products = snapshot.data!;

        return ProductList(
          products: products,
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(
              product: product,
              onLikeTap: () {
                // onLikeTap(product);
              },
              onCardTap: () {
                context.push(Routes.product.replaceFirst(':id', product.id));
              },
            );
          },
        );
      },
    );
  }
}
