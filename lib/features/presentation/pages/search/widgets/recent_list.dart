import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'recent_item.dart';
import 'search_product_card.dart';

class RecentList extends StatelessWidget {
  const RecentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 4,
      itemBuilder: (context, index) => const SearchProductCard(),
      separatorBuilder: (_, __) =>
          Divider(height: 1, color: AppColors.primary[100]!),
    );
  }
}
