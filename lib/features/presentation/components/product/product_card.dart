import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';
import 'package:marketplace/features/domain/entities/product/product_entity.dart';

import 'package:marketplace/features/presentation/components/save_to_favorite_button/save_to_favorite_button.dart';

class ProductCard extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCardTap;

  const ProductCard({
    super.key,
    required this.product,
    this.onLikeTap,
    this.onCardTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (onCardTap != null) {
          onCardTap!();
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(product.image, fit: BoxFit.cover),
              ),

              if (onLikeTap != null)
                Positioned(right: 4, top: 4, child: SaveToFavoriteButton()),
            ],
          ),

          const SizedBox(height: 8),

          Text(product.name, style: AppTypography.body1Semibold),

          Text(
            '\$ ${product.price}',
            style: AppTypography.body3Medium.copyWith(
              color: AppColors.primary[400]!,
            ),
          ),
        ],
      ),
    );
  }
}
