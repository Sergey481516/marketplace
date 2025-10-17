import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_typography.dart';

class AppTextField extends StatelessWidget {
  final String label;

  final Widget child;

  const AppTextField({super.key, required this.label, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTypography.body1Medium),

        const SizedBox(height: 4),

        child,
      ],
    );
  }
}
