import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marketplace/core/module/database/drift_database.dart';
import 'package:marketplace/features/domain/entities/product/product_entity.dart';
import 'package:marketplace/features/domain/entities/product/product_short_entity.dart';

import 'product_rating_model.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
abstract class ProductModel with _$ProductModel {
  const ProductModel._();
  const factory ProductModel({
    required String id,
    required String name,
    String? description,
    required double price,
    // required CategoryEntity category,
    int? discount,
    required String image,
    ProductRatingModel? rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromDB(ProductData product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      price: product.price,
      // category: product.category,
      image: product.image,
      description: product.description,
      // size: product.size,
      rating: product.rating,
    );
  }

  ProductData toDB() =>
      ProductData(id: id, name: name, price: price, image: image);

  ProductEntity toEntity() => ProductEntity(
    id: id,
    name: name,
    price: price,
    image: image,
    description: description,
    // rating: rating,
  );

  ProductShortEntity toShort() =>
      ProductShortEntity(id: id, name: name, price: price, image: image);
}
