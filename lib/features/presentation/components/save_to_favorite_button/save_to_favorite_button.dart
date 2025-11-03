import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveToFavoriteButton extends StatelessWidget {
  const SaveToFavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: SvgPicture.asset('assets/icons/Heart.svg'),
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
