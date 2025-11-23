import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

import 'package:marketplace/features/presentation/components/save_to_favorite_button/save_to_favorite_button.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final bool isFavorite;
  final VoidCallback? onLikeTap;
  final VoidCallback? onCardTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.isFavorite,
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
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 174,
                  fit: BoxFit.cover,
                ),
              ),

              if (onLikeTap != null)
                Positioned(
                  right: 4,
                  top: 4,
                  child: SaveToFavoriteButton(
                    selected: isFavorite,
                    onTap: () {
                      if (onLikeTap != null) {
                        onLikeTap!();
                      }
                    },
                  ),
                ),
            ],
          ),

          const SizedBox(height: 8),

          Text(name, style: AppTypography.body1Semibold),

          Text(
            '\$ $price',
            style: AppTypography.body3Medium.copyWith(
              color: AppColors.primary[400]!,
            ),
          ),
        ],
      ),
    );
  }
}
