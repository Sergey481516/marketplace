import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/features/domain/usecases/auth/login.dart';

part 'login_bloc.freezed.dart';

@freezed
abstract class LoginEvent with _$LoginEvent {
  const factory LoginEvent.start({
    required String email,
    required String password,
  }) = LoginStartEvent;
}

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitialState;
  const factory LoginState.loading() = LoginLoadingState;
  const factory LoginState.done() = LoginDoneState;
  const factory LoginState.fail({String? message}) = LoginFailState;
}

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Login login;

  LoginBloc(this.login) : super(LoginState.initial()) {
    on<LoginStartEvent>(_onLogin);
  }

  Future<void> _onLogin(LoginStartEvent event, Emitter<void> emit) async {
    emit(const LoginState.loading());

    final failureOrSuccess = await login(
      params: LoginParams(email: event.email, password: event.password),
    );

    failureOrSuccess.fold(
      (err) {
        emit(LoginState.fail(message: err.message));
      },
      (entity) {
        emit(LoginState.done());
      },
    );
  }
}
