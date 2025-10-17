import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

class LoginDoubleRichText extends StatelessWidget {
  final String text;
  final String linkText;
  final VoidCallback onTap;

  const LoginDoubleRichText({
    super.key,
    required this.text,
    required this.linkText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text,
        style: AppTypography.body2Regular.copyWith(
          color: AppColors.primary[900]!,
        ),
        children: [
          const TextSpan(text: ' '),

          TextSpan(
            text: linkText,
            style: AppTypography.body2Semibold.copyWith(
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                onTap();
              },
          ),
        ],
      ),
    );
  }
}
