import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marketplace/features/domain/entities/product/product_entity.dart';

import 'package:marketplace/features/domain/repository/product_repository.dart';
import 'package:marketplace/features/domain/usecases/product/fetch_product_use_case.dart';
import 'package:marketplace/features/presentation/bloc/product_filter/cubit.dart';

import 'state.dart';

@injectable
class ProductListCubit extends Cubit<ProductListState> {
  final ProductRepository productRepository;

  final ProductFilterCubit filterCubit;

  final FetchProductList fetchProductList;

  ProductListCubit({
    required this.productRepository,
    required this.filterCubit,
    required this.fetchProductList,
  }) : super(ProductListInitial());

  Stream<List<ProductEntity>> watchProducts() {
    return productRepository.watchProducts();
  }

  Future<void> fetchInitialProducts() async {
    filterCubit.setCursor(null);

    fetchProducts();
  }

  Future<void> fetchProducts() async {
    emit(ProductListLoading());

    final failureOrSuccess = await fetchProductList(params: filterCubit.state);

    failureOrSuccess.fold((error) {}, (nextCursor) {
      filterCubit.setCursor(nextCursor);

      emit(ProductListDone());
    });
  }
}
