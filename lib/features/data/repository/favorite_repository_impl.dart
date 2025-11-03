import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/core/error/exception.dart';

import 'package:marketplace/core/error/failure.dart';

import 'package:marketplace/features/data/data_sources/local/favorite/favorite_local_datasource.dart';
import 'package:marketplace/features/data/models/product/product_short_model.dart';
import 'package:marketplace/features/domain/entities/product/product_short_entity.dart';
import 'package:marketplace/features/domain/repository/favorite_repository.dart';

@LazySingleton(as: FavoriteRepository)
class FavoriteRepositoryImpl extends FavoriteRepository {
  final FavoriteLocalDatasource datasource;

  FavoriteRepositoryImpl(this.datasource);

  @override
  Stream<List<ProductShortEntity>> watchFavorites() {
    try {
      final products = datasource.watchFavorites();

      return products.map((list) => list.map((p) => p.toEntity()).toList());
    } on CacheException catch (err) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, void>> addToFavorite(
    ProductShortEntity product,
  ) async {
    try {
      await datasource.addToFavorites(ProductShortModel.fromEntity(product));

      return Right(null);
    } on CacheException catch (err) {
      return Left(CacheFailure(err.message));
    }
  }
}
