import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:marketplace/features/domain/entities/auth/user_entity.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserShortModel with _$UserShortModel {
  const UserShortModel._();
  const factory UserShortModel({
    required String id,
    required String fullName,
    required String email,
  }) = _UserShortModel;

  factory UserShortModel.fromJson(Map<String, dynamic> json) =>
      _$UserShortModelFromJson(json);

  factory UserShortModel.fromFirebaseCredential(UserCredential cred) =>
      UserShortModel(
        id: cred.user?.uid ?? '',
        fullName: cred.additionalUserInfo?.username ?? '',
        email: cred.user?.email ?? '',
      );

  UserShortEntity toEntity() =>
      UserShortEntity(id: id, fullName: fullName, email: email);
}

@freezed
abstract class UserModel with _$UserModel {
  const UserModel._();
  const factory UserModel({
    required String id,
    required String fullName,
    required String email,
    DateTime? birthDate,
    String? gender,
    String? phoneNumber,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirebaseCredential(UserCredential credential) =>
      UserModel(
        id: credential.user?.uid ?? '',
        fullName: credential.additionalUserInfo?.username ?? '',
        email: credential.user?.email ?? '',
      );

  UserEntity toEntity() => UserEntity(id: id, fullName: fullName, email: email);
}
