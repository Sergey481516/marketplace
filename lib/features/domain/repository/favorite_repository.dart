import 'package:dartz/dartz.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/entities/product/product_short_entity.dart';

abstract class FavoriteRepository {
  Stream<List<ProductShortEntity>> watchFavorites();

  Future<Either<Failure, void>> addToFavorite(ProductShortEntity product);
}
