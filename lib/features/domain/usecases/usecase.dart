import 'package:dartz/dartz.dart';

import 'package:marketplace/core/error/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call({required Params params});
}
