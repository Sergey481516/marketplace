import 'dart:convert';

import 'package:drift/drift.dart';

import 'package:marketplace/features/data/models/product/product_rating_model.dart';

@DataClassName('ProductData')
class Products extends Table {
  TextColumn get id => text()();

  @override
  Set<Column> get primaryKey => {id};

  TextColumn get name => text()();
  RealColumn get price => real()();
  // TextColumn get category => text()();
  IntColumn get discount => integer().nullable()();
  TextColumn get image => text()();
  TextColumn get description => text().nullable()();
  // TextColumn get size => text().nullable()();
  TextColumn get rating => text().map(const RatingConverter()).nullable()();

  TextColumn get cursor => text().nullable()();
}

class RatingConverter extends TypeConverter<ProductRatingModel, String> {
  const RatingConverter();

  @override
  ProductRatingModel fromSql(String fromDb) =>
      ProductRatingModel.fromJson(jsonDecode(fromDb));

  @override
  String toSql(ProductRatingModel rating) => jsonEncode(rating.toJson());
}
