import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

import 'package:marketplace/features/data/models/product/product_rating_model.dart';

import 'package:marketplace/features/data/data_sources/local/product/product_table.dart';
import 'package:marketplace/features/data/data_sources/local/product/product_dao.dart';
import 'package:marketplace/features/data/data_sources/local/favorite/favorite_table.dart';
import 'package:marketplace/features/data/data_sources/local/favorite/favorite_dao.dart';

part 'drift_database.g.dart';

@lazySingleton
@DriftDatabase(tables: [Products, Favorites], daos: [ProductDao, FavoriteDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'marketplace_database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
