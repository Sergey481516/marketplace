import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/core/error/exception.dart';

import 'package:marketplace/core/module/database/drift_database.dart';
import 'favorite_table.dart';

part 'favorite_dao.g.dart';

@lazySingleton
@DriftAccessor(tables: [Favorites])
class FavoriteDao extends DatabaseAccessor<AppDatabase>
    with _$FavoriteDaoMixin {
  FavoriteDao(super.db);

  Stream<List<FavoriteData>> watchFavorites() {
    try {
      return select(favorites).watch();
    } on DriftWrappedException catch (err) {
      throw CacheException(err.message);
    }
  }

  Future<void> insertOne(FavoriteData product) async {
    try {
      await into(favorites).insert(product);
    } on DriftWrappedException catch (err) {
      throw CacheException(err.message);
    }
  }
}
