import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

import 'package:marketplace/features/domain/entities/product/product_rating_entity.dart';

class RatingInfo extends StatelessWidget {
  final ProductRatingEntity? rating;
  final VoidCallback? onTap;

  const RatingInfo({super.key, this.rating, this.onTap});

  @override
  Widget build(BuildContext context) {
    if (rating == null) {
      return Text(
        'No reviews',
        style: AppTypography.body1Regular.copyWith(
          color: AppColors.primary[500]!,
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Row(
        spacing: 5,
        children: [
          Icon(Icons.star, color: Color(0xFFFFA928)),

          Text(
            '${rating!.value}/5',
            style: AppTypography.body1Medium.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),

          Text(
            '(${rating!.length} reviews)',
            style: AppTypography.body1Regular.copyWith(
              color: AppColors.primary[500]!,
            ),
          ),
        ],
      ),
    );
  }
}
