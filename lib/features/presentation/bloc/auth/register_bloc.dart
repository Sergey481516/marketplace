import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:marketplace/features/domain/usecases/auth/register.dart';

part 'register_bloc.freezed.dart';

@freezed
abstract class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.start({
    required String fullName,
    required String email,
    required String password,
  }) = RegisterStartEvent;
}

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitialState;
  const factory RegisterState.loading() = RegisterLoadingState;
  const factory RegisterState.done() = RegisterDoneState;
  const factory RegisterState.fail({required String message}) =
      RegisterFailState;
}

@lazySingleton
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final Register register;

  RegisterBloc(this.register) : super(const RegisterState.initial()) {
    on<RegisterStartEvent>(_onRegister);
  }

  Future<void> _onRegister(RegisterStartEvent event, Emitter<void> emit) async {
    emit(const RegisterState.loading());

    final failureOrSuccess = await register(
      params: RegisterParams(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
      ),
    );

    failureOrSuccess.fold(
      (err) {
        emit(RegisterState.fail(message: err.toString()));
      },
      (entity) {
        emit(RegisterState.done());
      },
    );
  }
}
