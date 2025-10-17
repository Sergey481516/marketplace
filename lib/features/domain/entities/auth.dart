import 'package:equatable/equatable.dart';

import 'user.dart';

class AuthEntity extends Equatable {
  final String accessToken;
  final String refreshToken;
  final UserShortEntity user;

  const AuthEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  @override
  List<Object?> get props {
    return [accessToken, refreshToken, user];
  }
}

class AccessTokenEntity extends Equatable {
  final String accessToken;

  const AccessTokenEntity({required this.accessToken});

  @override
  List<Object?> get props => [accessToken];
}

class ForgotPasswordEntity extends Equatable {
  final String resetId;

  const ForgotPasswordEntity({required this.resetId});

  @override
  List<Object?> get props => [resetId];
}
