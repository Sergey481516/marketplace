import 'package:flutter/material.dart';
import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';

class AppPriceRange extends StatefulWidget {
  final void Function(RangeValues) onChanged;

  const AppPriceRange({super.key, required this.onChanged});

  @override
  State<AppPriceRange> createState() => _AppPriceRangeState();
}

class _AppPriceRangeState extends State<AppPriceRange> {
  RangeValues _currentRange = const RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Price', style: AppTypography.body1Semibold),
            Text(
              '\$ ${_currentRange.start.toInt()} - \$ ${_currentRange.end.toInt()}',
              style: AppTypography.body1Regular,
            ),
          ],
        ),

        const SizedBox(height: 10),

        RangeSlider(
          values: _currentRange,
          padding: EdgeInsets.all(0),
          min: 0,
          max: 100,
          divisions: 100,
          activeColor: AppColors.primary[900]!,
          inactiveColor: AppColors.primary[400]!,
          onChanged: (RangeValues values) {
            setState(() {
              _currentRange = values;
            });

            widget.onChanged(values);
          },
        ),
      ],
    );
  }
}
