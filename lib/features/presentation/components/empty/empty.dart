import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

class Empty extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;

  const Empty({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 100),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                width: 64,
                height: 64,
                colorFilter: ColorFilter.mode(
                  AppColors.primary[400]!,
                  BlendMode.srcIn,
                ),
              ),

              const SizedBox(height: 24),

              Text(title, style: AppTypography.h4, textAlign: TextAlign.center),

              const SizedBox(height: 12),

              Text(
                subTitle,
                style: AppTypography.body1Regular,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
