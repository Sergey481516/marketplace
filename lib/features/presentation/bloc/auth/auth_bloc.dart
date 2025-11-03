import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketplace/features/domain/usecases/app_launch/check_seen_onboarding.dart';
import 'package:marketplace/features/domain/usecases/app_launch/set_onboarding_seen.dart';

import 'package:marketplace/features/domain/usecases/auth/logout.dart';

part 'auth_bloc.freezed.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.start() = AuthStartEvent;
  const factory AuthEvent.userChanged([User? user]) = AuthUserChangedEvent;
  const factory AuthEvent.setOnboardingSeen() = AuthSetOnboardingSeenEvent;
  const factory AuthEvent.logout() = AuthLogoutEvent;
}

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitialState;
  const factory AuthState.authenticated() = AuthAuthenticatedState;
  const factory AuthState.unAuthenticated({required bool hasSeenOnboarding}) =
      AuthUnauthenticatedState;
  const factory AuthState.logoutDone() = AuthLogoutDoneState;
  const factory AuthState.logoutFail({String? message}) = AuthLogoutFailState;
}

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth auth;
  final Logout logout;

  final CheckSeenOnboarding checkSeenOnboarding;
  final SetOnboardingSeen setOnboardingSeen;

  bool isInitialized = false;
  late final StreamSubscription<User?> _authSub;

  static const minDelay = 2000;

  AuthBloc(
    this.auth,
    this.logout,
    this.checkSeenOnboarding,
    this.setOnboardingSeen,
  ) : super(const AuthState.initial()) {
    final stopwatch = Stopwatch()..start();

    _authSub = auth.authStateChanges().listen((user) async {
      if (!isInitialized && stopwatch.elapsedMilliseconds < minDelay) {
        await Future.delayed(
          Duration(milliseconds: minDelay - stopwatch.elapsedMilliseconds),
        );
      }

      add(AuthUserChangedEvent(user));
    });

    on<AuthUserChangedEvent>(_onUserChanged);
    on<AuthLogoutEvent>(_onLogout);
  }

  Future<void> _onUserChanged(
    AuthUserChangedEvent event,
    Emitter<AuthState> emit,
  ) async {
    late final bool hasSeenOnboarding;
    final failureOrSuccess = await checkSeenOnboarding();

    failureOrSuccess.fold(
      (_) {
        hasSeenOnboarding = true;
      },
      (value) {
        hasSeenOnboarding = value;
      },
    );

    if (event.user != null) {
      emit(const AuthState.authenticated());
    } else {
      emit(AuthState.unAuthenticated(hasSeenOnboarding: hasSeenOnboarding));
    }
  }

  Future<void> setSeenOnboarding() async {
    final failureOrSuccess = await setOnboardingSeen();

    failureOrSuccess.fold((err) {
      // log
    }, (_) {});
  }

  Future<void> _onLogout(AuthLogoutEvent event, Emitter<AuthState> emit) async {
    final failureOrSuccess = await logout();

    failureOrSuccess.fold(
      (err) {
        emit(AuthState.logoutFail(message: err.toString()));
      },
      (_) {
        emit(AuthState.logoutDone());
      },
    );
  }

  @override
  Future<void> close() {
    _authSub.cancel();
    return super.close();
  }
}
