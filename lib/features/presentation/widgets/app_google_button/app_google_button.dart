import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppGoogleButton extends StatelessWidget {
  const AppGoogleButton({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/logos_google-icon.svg',
            width: 24,
            height: 24,
          ),

          const SizedBox(width: 10),

          Text(label),
        ],
      ),
      onPressed: () {},
    );
  }
}
