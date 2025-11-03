import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:marketplace/core/error/exception.dart';

import 'package:marketplace/features/data/models/dictionary/dictionary_model.dart';

abstract class DictionaryRemoteDatasource {
  Future<DictionaryModel> getDictionary();
}

@LazySingleton(as: DictionaryRemoteDatasource)
class DictionaryRemoteDatasourceImpl implements DictionaryRemoteDatasource {
  final Dio api;

  DictionaryRemoteDatasourceImpl(@Named('DictionaryApiClient') this.api);

  @override
  Future<DictionaryModel> getDictionary() async {
    try {
      final response = await api.get('/dictionary');

      return DictionaryModel.fromJson(response.data);
    } on DioException catch (err) {
      throw ServerException.fromDio(err);
    } catch (err) {
      rethrow;
    }
  }
}
