import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/failure.dart';

import 'package:marketplace/features/domain/entities/product/product_short_entity.dart';
import 'package:marketplace/features/domain/repository/favorite_repository.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

@lazySingleton
class ToggleFavorite extends UseCase<void, ProductShortEntity> {
  final FavoriteRepository favoriteRepository;

  ToggleFavorite(this.favoriteRepository);

  @override
  Future<Either<Failure, void>> call({
    required ProductShortEntity params,
  }) async {
    return favoriteRepository.toggleFavorite(params);
  }
}
