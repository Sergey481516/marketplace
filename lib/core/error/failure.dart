import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final String? code;

  const Failure({this.message, this.code});

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class AuthFailure extends Failure {
  const AuthFailure(String? message, String? code)
    : super(message: message, code: code);
}

class CacheFailure extends Failure {
  final String? message;

  const CacheFailure(this.message);
}
