import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/core/error/exception.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/data/data_sources/remote/dictionary_datasource.dart';

import 'package:marketplace/features/domain/repository/dictionary_repository.dart';

@LazySingleton(as: DictionaryRepository)
class DictionaryRepositoryImpl extends DictionaryRepository {
  final DictionaryRemoteDatasource dictionaryRemoteDatasource;

  DictionaryRepositoryImpl(this.dictionaryRemoteDatasource);

  @override
  Future<Either<Failure, DictionaryRecord>> getDictionary() async {
    try {
      final dictionaryModel = await dictionaryRemoteDatasource.getDictionary();

      // todo записать в бд

      return Right(dictionaryModel.toRecord());
    } on ServerException catch (err) {
      return Left(ServerFailure());
    }
  }
}
