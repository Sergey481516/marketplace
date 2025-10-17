import 'package:marketplace/features/domain/entities/auth.dart';
import 'user.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.accessToken,
    required super.refreshToken,
    required super.user,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'] as Map<String, dynamic>;

    return AuthModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      user: UserShortModel.fromJson(userJson),
    );
  }
}

class RegisterRequest {
  final String fullName;
  final String email;
  final String password;

  const RegisterRequest({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'full_name': fullName, 'email': email, 'password': password};
  }
}

class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}

class ForgotPasswordRequest {
  final String email;

  const ForgotPasswordRequest({required this.email});

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}

class ResendCodeRequest {
  final String resetId;

  const ResendCodeRequest({required this.resetId});

  Map<String, dynamic> toJson() {
    return {'resetId': resetId};
  }
}

class VerifyCodeRequest {
  final String resetId;
  final String code;

  const VerifyCodeRequest({required this.resetId, required this.code});

  Map<String, dynamic> toJson() {
    return {'resetId': resetId, 'code': code};
  }
}

class ResetPasswordRequest {
  final String resetId;
  final String password;

  const ResetPasswordRequest({required this.resetId, required this.password});

  Map<String, dynamic> toJson() {
    return {'resetId': resetId, 'password': password};
  }
}

class RefreshTokenRequest {
  final String refreshToken;

  const RefreshTokenRequest({required this.refreshToken});

  Map<String, dynamic> toJson() {
    return {'refresh_token': refreshToken};
  }
}
