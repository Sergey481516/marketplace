import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:marketplace/features/domain/repository/product_repository.dart';

import 'event.dart';
import 'state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductInitial()) {
    on<GetProductEvent>(_getProduct);
  }

  Future<void> _getProduct(
    GetProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());

    final failureOrSuccess = await productRepository.getProductById(event.id);

    failureOrSuccess.fold(
      (err) {
        emit(ProductError(error: err.toString()));
      },
      (product) {
        emit(ProductDone(product: product));
      },
    );
  }
}
