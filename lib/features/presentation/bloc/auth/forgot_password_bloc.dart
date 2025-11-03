import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/features/domain/usecases/auth/forgot_password.dart';

part 'forgot_password_bloc.freezed.dart';

@freezed
abstract class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.start({required String email}) =
      ForgotPasswordStartEvent;
}

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState.initial() = ForgotPasswordInitialState;
  const factory ForgotPasswordState.loading() = ForgotPasswordLoadingState;
  const factory ForgotPasswordState.done() = ForgotPasswordDoneState;
  const factory ForgotPasswordState.fail() = ForgotPasswordFailState;
}

@injectable
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPassword forgotPassword;

  ForgotPasswordBloc(this.forgotPassword)
    : super(const ForgotPasswordState.initial()) {
    on<ForgotPasswordStartEvent>(_onForgotPassword);
  }

  Future<void> _onForgotPassword(
    ForgotPasswordStartEvent event,
    Emitter emit,
  ) async {
    emit(const ForgotPasswordState.loading());

    final failureOrSuccess = await forgotPassword(
      params: ForgotPasswordParams(email: event.email),
    );

    failureOrSuccess.fold(
      (err) {
        emit(const ForgotPasswordState.fail());
      },
      (_) {
        emit(const ForgotPasswordState.done());
      },
    );
  }
}
