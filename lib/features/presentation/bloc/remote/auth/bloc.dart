import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:marketplace/core/resources/data_state.dart';
import 'package:marketplace/features/domain/entities/auth.dart';
import 'package:marketplace/features/domain/usecases/auth/forgot_password.dart';

import 'package:marketplace/features/domain/usecases/auth/login.dart';
import 'package:marketplace/features/domain/usecases/auth/logout.dart';
import 'package:marketplace/features/domain/usecases/auth/refresh_token.dart';
import 'package:marketplace/features/domain/usecases/auth/register.dart';
import 'package:marketplace/features/domain/usecases/auth/resend_code.dart';
import 'package:marketplace/features/domain/usecases/auth/reset_password.dart';
import 'package:marketplace/features/domain/usecases/auth/verify_code.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/event.dart';
import 'package:marketplace/features/presentation/bloc/remote/auth/state.dart';

@injectable
class RemoteAuthBloc extends Bloc<RemoteAuthEvent, RemoteAuthState> {
  final RegisterUseCase registerUseCase;
  final LoginUseCase loginUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final ResendCodeUseCase resendCodeUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final LogoutUseCase logoutUseCase;

  RemoteAuthBloc(
    this.registerUseCase,
    this.loginUseCase,
    this.forgotPasswordUseCase,
    this.resendCodeUseCase,
    this.verifyCodeUseCase,
    this.resetPasswordUseCase,
    this.refreshTokenUseCase,
    this.logoutUseCase,
  ) : super(RemoteAuthInitial()) {
    on<Register>(_onRegister);
    on<Login>(_onLogin);
    on<ForgotPassword>(_onForgotPassword);
    on<ResendCode>(_onResendCode);
    on<VerifyCode>(_onVerifyCode);
    on<ResetPassword>(_onResetPassword);
    on<RefreshToken>(_onRefreshToken);
    on<Logout>(_onLogout);
  }

  Future<void> _onRegister(
    Register event,
    Emitter<RemoteAuthState> emit,
  ) async {
    emit(RemoteAuthLoading());

    final result = await registerUseCase(
      params: RegisterParams(
        fullName: event.fullName,
        email: event.email,
        password: event.password,
      ),
    );

    if (result is DataSuccess) {
      emit(RemoteAuthDone(result.data!));
    }

    if (result is DataFailed) {
      emit(RemoteAuthError(result.error!));
    }
  }

  Future<void> _onLogin(Login event, Emitter<RemoteAuthState> emit) async {
    emit(RemoteAuthLoading());

    final result = await loginUseCase(
      params: LoginParams(email: event.email, password: event.password),
    );

    if (result is DataSuccess) {
      emit(RemoteAuthDone(result.data!));
    }

    if (result is DataFailed) {
      emit(RemoteAuthError(result.error!));
    }
  }

  Future<void> _onForgotPassword(
    ForgotPassword event,
    Emitter<RemoteAuthState> emit,
  ) async {
    emit(RemoteAuthLoading());

    final result = await forgotPasswordUseCase(
      params: ForgotPasswordParams(email: event.email),
    );

    if (result is DataSuccess<ForgotPasswordEntity>) {
      emit(RemoteAuthForgotPasswordDone(result.data!));
    }

    if (result is DataFailed) {
      emit(RemoteAuthError(result.error!));
    }
  }

  Future<void> _onResendCode(
    ResendCode event,
    Emitter<RemoteAuthState> emit,
  ) async {
    emit(RemoteAuthLoading());

    final result = await resendCodeUseCase(
      params: ResendCodeParams(resetId: event.resetId),
    );

    if (result is DataSuccess) {
      emit(RemoteAuthCodeResent());
    }

    if (result is DataFailed) {
      emit(RemoteAuthError(result.error!));
    }
  }

  Future<void> _onVerifyCode(
    VerifyCode event,
    Emitter<RemoteAuthState> emit,
  ) async {
    emit(RemoteAuthLoading());

    final result = await verifyCodeUseCase(
      params: VerifyCodeParams(resetId: event.resetId, code: event.code),
    );

    if (result is DataSuccess) {
      emit(RemoteAuthCodeVerified());
    }

    if (result is DataFailed) {
      emit(RemoteAuthError(result.error!));
    }
  }

  Future<void> _onResetPassword(
    ResetPassword event,
    Emitter<RemoteAuthState> emit,
  ) async {
    emit(RemoteAuthLoading());

    final result = await resetPasswordUseCase(
      params: ResetPasswordParams(
        resetId: event.resetId,
        password: event.password,
      ),
    );

    if (result is DataSuccess) {
      emit(RemoteAuthPasswordUpdated());
    }

    if (result is DataFailed) {
      emit(RemoteAuthError(result.error!));
    }
  }

  Future<void> _onRefreshToken(
    RefreshToken event,
    Emitter<RemoteAuthState> emit,
  ) async {
    // todo
  }

  Future<void> _onLogout(Logout event, Emitter<RemoteAuthState> emit) async {
    emit(RemoteAuthLoading());

    final result = logoutUseCase(params: {});

    // todo
  }
}
