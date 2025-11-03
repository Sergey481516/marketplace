import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marketplace/features/domain/entities/product/product_size_entity.dart';

part 'product_size_model.freezed.dart';
part 'product_size_model.g.dart';

@freezed
abstract class ProductSizeModel with _$ProductSizeModel {
  const ProductSizeModel._();
  const factory ProductSizeModel({required String id, required String name}) =
      _ProductSizeModel;

  factory ProductSizeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductSizeModelFromJson(json);

  ProductSizeEntity toEntity() => ProductSizeEntity(id: id, name: name);

  factory ProductSizeModel.fromEntity(ProductSizeModel size) =>
      ProductSizeModel(id: size.id, name: size.name);
}
