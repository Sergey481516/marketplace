import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/core/error/failure.dart';

import 'package:marketplace/features/domain/entities/product/product_entity.dart';
import 'package:marketplace/features/domain/repository/product_repository.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

class GetProductParams {
  final String id;

  const GetProductParams({required this.id});
}

@lazySingleton
class GetProduct extends UseCase<ProductEntity?, GetProductParams> {
  final ProductRepository productRepository;

  GetProduct({required this.productRepository});

  @override
  Future<Either<Failure, ProductEntity?>> call({
    required GetProductParams params,
  }) {
    return productRepository.getProductById(params.id);
  }
}
