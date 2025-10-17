import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key, required this.title, required this.subTitle});

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.h2),

        const SizedBox(height: 8),

        Text(
          subTitle,
          style: AppTypography.body1Regular.copyWith(
            color: AppColors.primary[500],
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}
