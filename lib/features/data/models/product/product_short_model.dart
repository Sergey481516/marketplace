import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marketplace/core/module/database/drift_database.dart';
import 'package:marketplace/features/domain/entities/product/product_short_entity.dart';

part 'product_short_model.freezed.dart';
part 'product_short_model.g.dart';

@freezed
abstract class ProductShortModel with _$ProductShortModel {
  const ProductShortModel._();
  const factory ProductShortModel({
    required String id,
    required String name,
    required double price,
    @Default(false) bool isFavorite,
    int? discount,
    required String image,
    required String? cursor,
  }) = _ProductShortModel;

  factory ProductShortModel.fromJson(Map<String, dynamic> json) =>
      _$ProductShortModelFromJson(json);

  factory ProductShortModel.fromEntity(ProductShortEntity product) =>
      ProductShortModel(
        id: product.id,
        name: product.name,
        price: product.price,
        image: product.image,
        cursor: null,
      );

  factory ProductShortModel.fromDB(ProductData product) {
    return ProductShortModel(
      id: product.id,
      name: product.name,
      price: product.price,
      // category: ,
      image: product.image,
      cursor: product.cursor,
    );
  }

  ProductData toDB() =>
      ProductData(id: id, name: name, price: price, image: image);

  factory ProductShortModel.fromFavoriteData(FavoriteData data) =>
      ProductShortModel(
        id: data.id,
        name: data.name,
        price: data.price,
        image: data.image,
        cursor: null,
      );

  FavoriteData toFavoriteData() =>
      FavoriteData(id: id, name: name, price: price, image: image);

  ProductShortEntity toEntity() => ProductShortEntity(
    id: id,
    name: name,
    price: price,
    // category: category,
    image: image,
  );
}
