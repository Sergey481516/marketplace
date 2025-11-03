import 'package:dartz/dartz.dart';

import 'package:marketplace/core/error/failure.dart';
import 'package:marketplace/features/domain/entities/category/category_entity.dart';

typedef DictionaryRecord = ({List<CategoryEntity> categories});

abstract class DictionaryRepository {
  Future<Either<Failure, DictionaryRecord>> getDictionary();
}
