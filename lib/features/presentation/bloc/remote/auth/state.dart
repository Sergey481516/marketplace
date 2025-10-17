import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:marketplace/features/domain/entities/auth.dart';

abstract class RemoteAuthState<T> extends Equatable {
  final T? data;
  final DioException? error;

  const RemoteAuthState({this.data, this.error});

  @override
  List<Object?> get props => [data, error];
}

class RemoteAuthInitial extends RemoteAuthState {
  const RemoteAuthInitial();
}

class RemoteAuthLoading extends RemoteAuthState {
  const RemoteAuthLoading();
}

class RemoteAuthDone extends RemoteAuthState {
  const RemoteAuthDone(AuthEntity data) : super(data: data);
}

class RemoteAuthForgotPasswordDone
    extends RemoteAuthState<ForgotPasswordEntity> {
  const RemoteAuthForgotPasswordDone(ForgotPasswordEntity data)
    : super(data: data);
}

class RemoteAuthCodeResent extends RemoteAuthState {
  const RemoteAuthCodeResent();
}

class RemoteAuthCodeVerified extends RemoteAuthState {
  const RemoteAuthCodeVerified();
}

class RemoteAuthPasswordUpdated extends RemoteAuthState {
  const RemoteAuthPasswordUpdated();
}

class RemoteAuthError extends RemoteAuthState {
  const RemoteAuthError(DioException error) : super(error: error);
}
