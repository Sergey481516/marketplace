import 'package:injectable/injectable.dart';

import 'package:marketplace/features/data/data_sources/local/product/product_dao.dart';
import 'package:marketplace/features/data/models/product/product_model.dart';
import 'package:marketplace/features/data/models/product/product_short_model.dart';

abstract class ProductLocalDatasource {
  Stream<List<ProductModel>> watchProducts();
  Future<ProductModel?> getProductById(String id);

  Future<void> update(ProductModel product);
  Future<void> upsertAll(List<ProductShortModel> products, bool? replace);
}

@LazySingleton(as: ProductLocalDatasource)
class ProductLocalDatasourceImpl extends ProductLocalDatasource {
  final ProductDao productDao;

  ProductLocalDatasourceImpl(this.productDao);

  @override
  Stream<List<ProductModel>> watchProducts() {
    var productsData = productDao.watchProducts();

    return productsData.map(
      (products) => products
          .map(
            (p) => ProductModel.fromDB(
              p.product,
            ).copyWith(isFavorite: p.isFavorite),
          )
          .toList(),
    );
  }

  @override
  Future<ProductModel?> getProductById(String id) async {
    var product = await productDao.getProductById(id);

    if (product != null) {
      return ProductModel.fromDB(product);
    }

    return null;
  }

  @override
  Future<void> update(ProductModel product) async {
    await productDao.updateProduct(product.toDB());
  }

  @override
  Future<void> upsertAll(
    List<ProductShortModel> products,
    bool? replace,
  ) async {
    final productsData = products.map((p) => p.toDB()).toList();

    await productDao.upsertAll(productsData, replace);
  }
}
