import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/module/database/drift_database.dart';
import 'package:marketplace/core/error/exception.dart';
import 'product_table.dart';
import '../favorite/favorite_table.dart';

part 'product_dao.g.dart';

class ProductDataWithFavorite {
  final ProductData product;
  final bool isFavorite;

  const ProductDataWithFavorite({
    required this.product,
    required this.isFavorite,
  });
}

@lazySingleton
@DriftAccessor(tables: [Products, Favorites])
class ProductDao extends DatabaseAccessor<AppDatabase> with _$ProductDaoMixin {
  ProductDao(super.db);

  Stream<List<ProductDataWithFavorite>> watchProducts() {
    try {
      final query = select(
        products,
      ).join([leftOuterJoin(favorites, favorites.id.equalsExp(products.id))]);

      return query.watch().map((rows) {
        return rows.map((row) {
          final product = row.readTable(products);
          final favoriteRow = row.readTableOrNull(favorites);

          return ProductDataWithFavorite(
            product: product,
            isFavorite: favoriteRow != null,
          );
        }).toList();
      });
    } on DriftWrappedException catch (err) {
      throw CacheException(err.message);
    }
  }

  Future<ProductData?> getProductById(String id) async {
    try {
      return (select(
        products,
      )..where((p) => p.id.equals(id))).getSingleOrNull();
    } on DriftWrappedException catch (err) {
      throw CacheException(err.message);
    }
  }

  Future<void> updateProduct(ProductData product) async {
    try {
      (update(
        products,
      )..where((tbl) => tbl.id.equals(product.id))).write(product);
    } on DriftWrappedException catch (err) {
      throw CacheException(err.message);
    }
  }

  Future<void> upsertAll(List<ProductData> productList, bool? replace) async {
    try {
      await batch((b) {
        if (replace == true) {
          b.deleteWhere(products, (_) => const Constant(true));
        }

        b.insertAllOnConflictUpdate(
          products,
          productList.map((p) => p.toCompanion(false)).toList(),
        );
      });
    } on DriftWrappedException catch (err) {
      throw CacheException(err.message);
    }
  }
}
