import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:marketplace/features/domain/entities/product/product_short_entity.dart';

// import '../category/category_entity.dart';

import 'product_rating_entity.dart';
import 'product_size_entity.dart';

part 'product_entity.freezed.dart';

@freezed
abstract class ProductEntity with _$ProductEntity {
  const ProductEntity._();
  const factory ProductEntity({
    required String id,
    required String name,
    String? description,
    required double price,
    ProductSizeEntity? size,
    ProductRatingEntity? rating,
    // required CategoryEntity category,
    int? discount,
    required String image,
    @Default(false) bool isFavorite,
  }) = _ProductEntity;

  ProductShortEntity toShort() => ProductShortEntity(
    id: id,
    name: name,
    price: price,
    image: image,
    isFavorite: isFavorite,
  );

  double calcPrice() {
    if (discount != null) {
      return price - (price * (discount! / 100));
    }

    return price;
  }
}
