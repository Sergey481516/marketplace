import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_rating_model.freezed.dart';
part 'product_rating_model.g.dart';

@freezed
abstract class ProductRatingModel with _$ProductRatingModel {
  const ProductRatingModel._();
  const factory ProductRatingModel({
    required double value,
    required int length,
  }) = _ProductRatingModel;

  factory ProductRatingModel.fromJson(Map<String, dynamic> json) =>
      _$ProductRatingModelFromJson(json);
}
