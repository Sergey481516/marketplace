import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/features/domain/entities/product/product_short_entity.dart';
import 'package:marketplace/features/domain/repository/favorite_repository.dart';
import 'package:marketplace/features/domain/usecases/favorite/toggle_favorite_use_case.dart';

class State {}

@injectable
class FavoriteCubit extends Cubit<State> {
  final FavoriteRepository favoriteRepository;

  final ToggleFavorite toggleFavoriteUseCase;

  FavoriteCubit(this.favoriteRepository, this.toggleFavoriteUseCase)
    : super(State());

  Stream<List<ProductShortEntity>> watchFavorites() {
    return favoriteRepository.watchFavorites();
  }

  Future<void> toggleFavorite(ProductShortEntity product) async {
    await toggleFavoriteUseCase(params: product);
  }
}
