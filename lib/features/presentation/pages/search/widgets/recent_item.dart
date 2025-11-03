import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecentItem extends StatelessWidget {
  const RecentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text('Jeans'),
      trailing: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/Cancel-circle.svg',
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
