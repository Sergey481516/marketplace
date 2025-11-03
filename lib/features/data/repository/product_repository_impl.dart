import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/exception.dart';
import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/core/platform/network_info.dart';

import 'package:marketplace/features/data/data_sources/local/product/product_local_datasource.dart';
import 'package:marketplace/features/data/data_sources/remote/product_datasource.dart';
import 'package:marketplace/features/data/models/product/product_filter_model.dart';
import 'package:marketplace/features/domain/entities/product/product_entity.dart';
import 'package:marketplace/features/domain/entities/product/product_filter_entity.dart';
import 'package:marketplace/features/domain/repository/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  final NetworkInfo networkInfo;
  final ProductRemoteDatasource productDatasource;
  final ProductLocalDatasource productLocalDatasource;

  ProductRepositoryImpl(
    this.networkInfo,
    this.productDatasource,
    this.productLocalDatasource,
  );

  @override
  Stream<List<ProductEntity>> watchProducts() {
    var products = productLocalDatasource.watchProducts();

    return products.map((list) => list.map((p) => p.toEntity()).toList());
  }

  @override
  Future<Either<Failure, String?>> fetchProducts(
    ProductFilterEntity? filter,
  ) async {
    final isConnected = await networkInfo.isConnected;

    try {
      if (isConnected) {
        final filterModel = filter != null
            ? ProductFilterModel.fromEntity(filter)
            : null;
        final productResponseList = await productDatasource.getList(
          filterModel,
        );
        final replace = filterModel?.cursor != null;

        await productLocalDatasource.upsertAll(
          productResponseList.list,
          replace,
        );

        return Right(productResponseList.nextCursor);
      }

      return Right(null);
    } on ServerException catch (err) {
      return Left(ServerFailure());
    } on CacheException catch (err) {
      return Left(CacheFailure(err.message));
    }
  }

  @override
  Future<Either<Failure, ProductEntity?>> getProductById(String id) async {
    final isConnected = await networkInfo.isConnected;

    try {
      if (isConnected) {
        final product = await productDatasource.getById(id);

        await productLocalDatasource.update(product);

        return Right(product.toEntity());
      } else {
        final cacheProduct = await productLocalDatasource.getProductById(id);

        return Right(cacheProduct?.toEntity());
      }
    } on ServerException catch (err) {
      return Left(ServerFailure());
    } on CacheException catch (err) {
      return Left(CacheFailure(err.message));
    }
  }
}
