import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marketplace/core/resources/sort_by.dart';

import '../category/category_entity.dart';

import 'product_size_entity.dart';

part 'product_filter_entity.freezed.dart';

@freezed
abstract class ProductFilterEntity with _$ProductFilterEntity {
  const factory ProductFilterEntity({
    int? minPrice,
    int? maxPrice,
    CategoryEntity? category,
    ProductSizeEntity? size,
    SortBy? sortBy,
    String? nextCursor,
  }) = _ProductFilterEntity;
}
