import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NotificationsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed();
      },
      icon: SvgPicture.asset('assets/icons/Bell.svg', width: 24, height: 24),
    );
  }
}
