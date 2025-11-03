import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/features/domain/entities/product/product_short_entity.dart';
import 'package:marketplace/features/domain/repository/favorite_repository.dart';

class State {}

@injectable
class FavoriteCubit extends Cubit<State> {
  final FavoriteRepository favoriteRepository;

  FavoriteCubit(this.favoriteRepository) : super(State());

  Stream<List<ProductShortEntity>> watchFavorites() {
    return favoriteRepository.watchFavorites();
  }
}
