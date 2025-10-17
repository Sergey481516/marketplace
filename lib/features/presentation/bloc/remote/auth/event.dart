import 'package:equatable/equatable.dart';

abstract class RemoteAuthEvent extends Equatable {
  const RemoteAuthEvent();
}

class Register extends RemoteAuthEvent {
  final String fullName;
  final String email;
  final String password;

  const Register({
    required this.fullName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [fullName, email, password];
}

class Login extends RemoteAuthEvent {
  final String email;
  final String password;

  const Login({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class ForgotPassword extends RemoteAuthEvent {
  final String email;

  const ForgotPassword({required this.email});

  @override
  List<Object?> get props => [email];
}

class ResendCode extends RemoteAuthEvent {
  final String resetId;

  const ResendCode({required this.resetId});

  @override
  List<Object?> get props => [resetId];
}

class VerifyCode extends RemoteAuthEvent {
  final String resetId;
  final String code;

  const VerifyCode({required this.resetId, required this.code});

  @override
  List<Object?> get props => [resetId, code];
}

class ResetPassword extends RemoteAuthEvent {
  final String resetId;
  final String password;

  const ResetPassword({required this.resetId, required this.password});

  @override
  List<Object?> get props => [resetId, password];
}

class RefreshToken extends RemoteAuthEvent {
  final String refreshToken;

  const RefreshToken({required this.refreshToken});

  @override
  List<Object?> get props => [refreshToken];
}

class Logout extends RemoteAuthEvent {
  const Logout();

  @override
  List<Object?> get props => [];
}
