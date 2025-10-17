import 'package:equatable/equatable.dart';

class UserShortEntity extends Equatable {
  final String id;
  final String fullName;
  final String email;

  const UserShortEntity({
    required this.id,
    required this.fullName,
    required this.email,
  });

  @override
  List<Object?> get props => [id, fullName, email];
}

class UserEntity extends UserShortEntity {
  final DateTime? birthDate;
  final String? gender;
  final String? phoneNumber;

  const UserEntity({
    required super.id,
    required super.fullName,
    required super.email,
    this.birthDate,
    this.gender,
    this.phoneNumber,
  });

  @override
  List<Object?> get props {
    return [id, fullName, email, birthDate, gender, phoneNumber];
  }
}
