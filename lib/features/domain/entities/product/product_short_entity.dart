import 'package:freezed_annotation/freezed_annotation.dart';

// import 'package:marketplace/features/domain/entities/category/category_entity.dart';

part 'product_short_entity.freezed.dart';

@freezed
abstract class ProductShortEntity with _$ProductShortEntity {
  const factory ProductShortEntity({
    required String id,
    required String name,
    required double price,
    // required CategoryEntity category,
    int? discount,
    required String image,
    @Default(false) bool isFavorite,
  }) = _ProductShortEntity;
}
