import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_colors.dart';

class TextDivider extends StatelessWidget {
  final String text;

  const TextDivider({super.key, required this.text});

  Widget _divider() {
    return Divider(color: AppColors.primary[200]!);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _divider()),
        Padding(
          padding: EdgeInsets.only(top: 24, bottom: 24, right: 8, left: 8),
          child: Text(text),
        ),
        Expanded(child: _divider()),
      ],
    );
  }
}
