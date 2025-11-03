import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marketplace/features/domain/entities/category/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel with _$CategoryModel {
  const CategoryModel._();
  const factory CategoryModel({required String id, required String name}) =
      _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryEntity toEntity() => CategoryEntity(id: id, name: name);

  factory CategoryModel.fromEntity(CategoryEntity category) =>
      CategoryModel(id: category.id, name: category.name);
}
