import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_rating_entity.freezed.dart';

@freezed
abstract class ProductRatingEntity with _$ProductRatingEntity {
  const factory ProductRatingEntity({
    required double value,
    required int length,
  }) = _ProductRatingEntity;
}
