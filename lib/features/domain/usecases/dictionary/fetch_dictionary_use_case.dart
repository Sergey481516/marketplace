import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/core/error/failure.dart';

import 'package:marketplace/features/domain/repository/dictionary_repository.dart';
import 'package:marketplace/features/domain/usecases/usecase.dart';

@lazySingleton
class FetchDictionary extends UseCase<DictionaryRecord, void> {
  final DictionaryRepository dictionaryRepository;

  FetchDictionary(this.dictionaryRepository);

  @override
  Future<Either<Failure, DictionaryRecord>> call({void params}) {
    return dictionaryRepository.getDictionary();
  }
}
