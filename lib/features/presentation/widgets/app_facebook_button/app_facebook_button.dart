import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:marketplace/config/theme/app_colors.dart';

class AppFacebookButton extends StatelessWidget {
  const AppFacebookButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(backgroundColor: AppColors.facebook),
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/logos_facebook.svg',
            width: 24,
            height: 24,
          ),

          const SizedBox(width: 10),

          Text(label),
        ],
      ),
    );
  }
}
