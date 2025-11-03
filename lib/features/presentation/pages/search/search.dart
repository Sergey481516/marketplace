import 'package:flutter/material.dart';

import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';
import 'package:marketplace/features/presentation/components/app_search_bar/search_bar.dart';
import 'package:marketplace/features/presentation/widgets/app_layout/app_layout.dart';
import 'widgets/recent_list.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Builder(
            builder: (context) {
              final width = MediaQuery.of(context).size.width;
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: width - (24 * 2),
                  height: 1,
                  color: AppColors.primary[100]!,
                  margin: const EdgeInsets.only(left: 24),
                ),
              );
            },
          ),
        ),
      ),
      body: AppLayout(
        child: Column(
          children: [
            AppSearchBar(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recent Searches', style: AppTypography.h4),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Clear all',
                    style: AppTypography.body2Semibold.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // const Empty(
            // icon: 'assets/icons/Search-duotone.svg',
            // title: 'No Results Found!',
            // subTitle: 'Try a similar word or something more general.')
            Expanded(child: RecentList()),
          ],
        ),
      ),
    );
  }
}
