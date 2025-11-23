import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

import 'package:marketplace/core/error/exception.dart';

import 'package:marketplace/features/data/models/product/product_model.dart';
import 'package:marketplace/features/data/models/product/product_short_model.dart';
import 'package:marketplace/features/data/models/product/product_filter_model.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductShortModel>> getList(ProductFilterModel? filter);

  Future<ProductModel> getById(String id);
}

@LazySingleton(as: ProductRemoteDatasource)
class ProductRemoteDataSourceImpl implements ProductRemoteDatasource {
  ProductRemoteDataSourceImpl();

  @override
  Future<List<ProductShortModel>> getList(ProductFilterModel? filter) async {
    try {
      final collectionRef = FirebaseFirestore.instance.collection('products');
      final snapshot = await collectionRef.get();
      final List<ProductShortModel> products = [];

      for (var product in snapshot.docs) {
        final json = product.data();

        json['id'] = product.id;

        products.add(ProductShortModel.fromJson(json));
      }

      return products.toList();
    } on DioException catch (err) {
      throw ServerException.fromDio(err);
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<ProductModel> getById(String id) async {
    try {
      // final response = await api.get('/product/$id');

      // return ProductModel.fromJson(response.data);
      return ProductModel(id: 'dwa', name: 'dwa', price: 22, image: 'dwa');
    } on DioException catch (err) {
      throw ServerException.fromDio(err);
    } catch (err) {
      rethrow;
    }
  }
}
