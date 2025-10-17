import 'package:marketplace/features/domain/entities/user.dart';

class UserShortModel extends UserShortEntity {
  const UserShortModel({
    required super.id,
    required super.fullName,
    required super.email,
  });

  factory UserShortModel.fromJson(Map<String, dynamic> json) {
    return UserShortModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
    );
  }
}

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.fullName,
    required super.email,
    super.birthDate,
    super.gender,
    super.phoneNumber,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      phoneNumber: json['phone_number'] as String,
    );
  }
}
