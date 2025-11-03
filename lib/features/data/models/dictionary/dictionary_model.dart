import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marketplace/features/data/models/category/category_model.dart';
import 'package:marketplace/features/domain/repository/dictionary_repository.dart';

part 'dictionary_model.freezed.dart';
part 'dictionary_model.g.dart';

@freezed
abstract class DictionaryModel with _$DictionaryModel {
  const DictionaryModel._();
  const factory DictionaryModel({required List<CategoryModel> categories}) =
      _DictionaryModel;

  factory DictionaryModel.fromJson(Map<String, dynamic> json) =>
      _$DictionaryModelFromJson(json);

  DictionaryRecord toRecord() =>
      (categories: categories.map((c) => c.toEntity()).toList());
}
