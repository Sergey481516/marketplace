import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marketplace/features/domain/entities/auth/auth_entity.dart';

import 'user_model.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const AuthModel._();
  const factory AuthModel({
    required String accessToken,
    required String refreshToken,
    required UserShortModel user,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);

  factory AuthModel.fromFirebaseCredential(UserCredential credential) =>
      AuthModel(
        accessToken: credential.credential?.accessToken ?? '',
        refreshToken: credential.user?.refreshToken ?? '',
        user: UserShortModel.fromFirebaseCredential(credential),
      );

  AuthEntity toEntity() => AuthEntity(
    accessToken: accessToken,
    refreshToken: refreshToken,
    user: user.toEntity(),
  );
}

@freezed
abstract class AccessTokenModel with _$AccessTokenModel {
  const AccessTokenModel._();
  const factory AccessTokenModel({required String accessToken}) =
      _AccessTokenModel;

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenModelFromJson(json);
}

@freezed
abstract class ForgotPasswordModel with _$ForgotPasswordModel {
  const ForgotPasswordModel._();
  const factory ForgotPasswordModel({required String resetId}) =
      _ForgotPasswordModel;

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordModelFromJson(json);
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
