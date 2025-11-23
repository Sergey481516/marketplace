import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveToFavoriteButton extends StatelessWidget {
  final bool selected;
  final VoidCallback? onTap;

  const SaveToFavoriteButton({super.key, this.selected = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    final icon = selected
        ? SvgPicture.asset('assets/icons/Heart-filled.svg')
        : SvgPicture.asset('assets/icons/Heart.svg');

    return IconButton(
      onPressed: () {
        if (onTap != null) {
          onTap!();
        }
      },
      icon: icon,
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
