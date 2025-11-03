import 'package:flutter/material.dart';

class Filter {
  final String label;
  final String value;

  const Filter({required this.label, required this.value});
}

class AppHorizontalFilter extends StatefulWidget {
  final Filter? initialSelected;
  final List<Filter> filters;
  final void Function(Filter filter) onFilterChange;

  const AppHorizontalFilter({
    super.key,
    this.initialSelected,
    required this.filters,
    required this.onFilterChange,
  });

  @override
  State<AppHorizontalFilter> createState() => _AppHorizontalFilterState();
}

class _AppHorizontalFilterState extends State<AppHorizontalFilter> {
  Filter? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 36,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 24),
            itemBuilder: (context, index) {
              final Filter filter = widget.filters[index];
              final isSelected = filter.value == selected?.value;

              return FilterChip(
                selected: isSelected,
                label: Text(filter.label),
                onSelected: (_) {
                  setState(() {
                    selected = filter;
                  });
                  widget.onFilterChange(filter);
                },
              );
            },
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemCount: widget.filters.length,
          ),
        ),
      ],
    );
  }
}
