import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marketplace/features/domain/entities/product/product_filter_entity.dart';

part 'product_filter_model.freezed.dart';

@freezed
abstract class ProductFilterModel with _$ProductFilterModel {
  const ProductFilterModel._();
  const factory ProductFilterModel({
    int? minPrice,
    int? maxPrice,
    int? category,
    String? sortBy,
    String? cursor,
  }) = _ProductFilterModel;

  Map<String, dynamic> toJson() => {
    '_next_cursor': cursor,
    'minPrice': minPrice,
    'maxPrice': maxPrice,
    'category': category,
    'sort_by': sortBy,
  };

  factory ProductFilterModel.fromEntity(ProductFilterEntity filter) {
    return ProductFilterModel(
      minPrice: filter.minPrice,
      maxPrice: filter.maxPrice,
      // category: filter.category?.id,
      sortBy: filter.sortBy.toString(),
    );
  }
}
