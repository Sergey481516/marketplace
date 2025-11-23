import 'package:injectable/injectable.dart';

import 'package:marketplace/features/data/data_sources/local/favorite/favorite_dao.dart';
import 'package:marketplace/features/data/models/product/product_short_model.dart';

abstract class FavoriteLocalDatasource {
  Stream<List<ProductShortModel>> watchFavorites();
  Future<ProductShortModel?> getFavorite(String id);
  Future<void> addToFavorites(ProductShortModel product);
  Future<void> removeFromFavorites(ProductShortModel product);
}

@LazySingleton(as: FavoriteLocalDatasource)
class FavoriteLocalDatasourceImpl extends FavoriteLocalDatasource {
  final FavoriteDao favoriteDao;

  FavoriteLocalDatasourceImpl(this.favoriteDao);

  @override
  Stream<List<ProductShortModel>> watchFavorites() {
    final favoriteData = favoriteDao.watchFavorites();

    return favoriteData.map(
      (products) =>
          products.map((p) => ProductShortModel.fromFavoriteData(p)).toList(),
    );
  }

  @override
  Future<ProductShortModel?> getFavorite(String id) async {
    final favoriteData = await favoriteDao.getOneById(id);

    return favoriteData != null
        ? ProductShortModel.fromFavoriteData(favoriteData)
        : null;
  }

  @override
  Future<void> addToFavorites(ProductShortModel product) async {
    await favoriteDao.insertOne(product.toFavoriteData());
  }

  @override
  Future<void> removeFromFavorites(ProductShortModel product) async {
    await favoriteDao.removeOne(product.toFavoriteData());
  }
}
