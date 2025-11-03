import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketplace/config/theme/app_colors.dart';
import 'package:marketplace/config/theme/app_typography.dart';
import 'package:marketplace/core/resources/sort_by.dart';
import 'package:marketplace/features/domain/entities/product/product_entity.dart';
import 'package:marketplace/features/domain/entities/product/product_filter_entity.dart';
import 'package:marketplace/features/presentation/components/app_horizotal_filter/app_horizontal_filter.dart';
import 'package:marketplace/features/presentation/components/app_price_range/app_price_range.dart';
import 'package:marketplace/features/presentation/components/app_size_select/app_size_select.dart';

List<Filter> filters = [
  Filter(label: 'Relevance', value: 'relevance'),
  Filter(label: 'Price: Low - High', value: 'asc'),
  Filter(label: 'Price: High - Low', value: 'desc'),
];

class SearchFilter extends StatefulWidget {
  final void Function(ProductFilterEntity) onApplyFilter;

  const SearchFilter({super.key, required this.onApplyFilter});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  Filter sortBy = filters[0];
  RangeValues? priceRange;
  String? size;

  void _applyFilters() {
    final filter = ProductFilterEntity(
      minPrice: priceRange?.start.toInt(),
      maxPrice: priceRange?.end.toInt(),
      // size: size,
      sortBy: SortBy('price', sortBy.value),
    );

    widget.onApplyFilter(filter);
  }

  Widget _indicator() {
    return Center(
      child: Container(width: 64, height: 6, color: AppColors.primary[100]!),
    );
  }

  Widget _header(BuildContext context) {
    return _container(
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Filters',
            style: AppTypography.h4.copyWith(
              color: AppColors.primary[900]!,
              fontWeight: FontWeight.w700,
            ),
          ),

          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(
              'assets/icons/Cancel.svg',
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _container(Widget child) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 24), child: child);
  }

  Widget _divider() {
    return _container(Divider(height: 1, color: AppColors.primary[200]!));
  }

  void showFilters(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10),

              _indicator(),

              _header(context),

              _divider(),

              const SizedBox(height: 14),
              _container(Text('Sort By', style: AppTypography.body1Semibold)),
              const SizedBox(height: 14),

              AppHorizontalFilter(
                initialSelected: sortBy,
                filters: filters,
                onFilterChange: (Filter filter) {
                  setState(() {
                    sortBy = filter;
                  });
                },
              ),

              const SizedBox(height: 20),
              _divider(),
              const SizedBox(height: 20),

              _container(
                AppPriceRange(
                  onChanged: (values) {
                    setState(() {
                      priceRange = values;
                    });
                  },
                ),
              ),
              const SizedBox(height: 20),

              _divider(),
              const SizedBox(height: 7),

              _container(
                AppSizeSelect(
                  onChanged: (newSize) {
                    setState(() {
                      size = newSize;
                    });
                  },
                ),
              ),

              _container(
                FilledButton(
                  onPressed: () {
                    _applyFilters();
                  },
                  child: const Text('Apply Filters'),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        padding: EdgeInsets.all(14),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        showFilters(context);
      },
      icon: SvgPicture.asset(
        'assets/icons/Filter.svg',
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
