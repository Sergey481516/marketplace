import 'package:flutter/material.dart';

import 'package:marketplace/features/domain/entities/product/product_entity.dart';

typedef ProductListItemBuilderFunc = Widget? Function(BuildContext, int);

class ProductList extends StatelessWidget {
  final List<ProductEntity> products;
  final ProductListItemBuilderFunc itemBuilder;

  const ProductList({
    super.key,
    required this.products,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
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
      itemBuilder: itemBuilder,
    );
  }
}
