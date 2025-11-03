import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketplace/config/theme/app_typography.dart';

class SearchProductCard extends StatelessWidget {
  const SearchProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: SizedBox(
        width: 56,
        height: 53,
        child: Image.asset('assets/images/p1.png'),
      ),
      title: Text('Regular Fit Slogan', style: AppTypography.body1Semibold),
      subtitle: Text('\$ 1,190'),
      trailing: IconButton(
        onPressed: () {},
        icon: Transform.rotate(
          angle: 180 * pi / 225,
          child: SvgPicture.asset(
            'assets/icons/Arrow.svg',
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
