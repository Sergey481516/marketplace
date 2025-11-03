import 'package:equatable/equatable.dart';

import 'package:marketplace/features/domain/entities/product/product_entity.dart';

abstract class ProductListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductListInitial extends ProductListState {}

class ProductListLoading extends ProductListState {}

class ProductListDone extends ProductListState {}

class ProductListError extends ProductListState {}

abstract class ProductState {
  final ProductEntity? product;
  final String? error;

  const ProductState({this.product, this.error});
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductDone extends ProductState {
  const ProductDone({super.product});
}

class ProductError extends ProductState {
  const ProductError({super.error});
}
