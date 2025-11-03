import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/entities/product/product_filter_entity.dart';
import 'package:marketplace/features/domain/repository/product_repository.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

@lazySingleton
class FetchProductList extends UseCase<String?, ProductFilterEntity?> {
  final ProductRepository productRepository;

  FetchProductList({required this.productRepository});

  @override
  Future<Either<Failure, String?>> call({ProductFilterEntity? params}) {
    return productRepository.fetchProducts(params);
  }
}
