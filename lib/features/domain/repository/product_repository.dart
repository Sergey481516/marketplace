import 'package:dartz/dartz.dart';

import 'package:marketplace/core/error/failure.dart';

import 'package:marketplace/features/domain/entities/product/product_entity.dart';
import 'package:marketplace/features/domain/entities/product/product_filter_entity.dart';

abstract class ProductRepository {
  Stream<List<ProductEntity>> watchProducts();

  Future<Either<Failure, String?>> fetchProducts(ProductFilterEntity? filter);

  Future<Either<Failure, ProductEntity?>> getProductById(String id);
}
