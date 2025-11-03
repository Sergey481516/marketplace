import 'package:flutter/material.dart';
import 'package:marketplace/config/theme/app_typography.dart';

class AppSizeSelect extends StatefulWidget {
  final void Function(String?) onChanged;

  const AppSizeSelect({super.key, required this.onChanged});

  @override
  State<AppSizeSelect> createState() => _AppSizeSelectState();
}

class _AppSizeSelectState extends State<AppSizeSelect> {
  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL'];
  String? selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Size', style: AppTypography.body1Semibold),
        DropdownButtonHideUnderline(
          child: DropdownButton(
            value: selectedSize,
            items: sizes.map((s) {
              return DropdownMenuItem(value: s, child: Text(s));
            }).toList(),
            onChanged: (String? newSize) {
              setState(() {
                selectedSize = newSize;
              });

              widget.onChanged(newSize);
            },
          ),
        ),
      ],
    );
  }
}
