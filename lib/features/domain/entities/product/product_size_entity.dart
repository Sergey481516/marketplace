import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_size_entity.freezed.dart';

@freezed
abstract class ProductSizeEntity with _$ProductSizeEntity {
  const factory ProductSizeEntity({required String id, required String name}) =
      _ProductSizeEntity;
}
