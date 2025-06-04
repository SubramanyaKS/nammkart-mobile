import 'package:nammkart/src/features/auth/domain/entities/user.dart';

class UserModel extends UserEntity{
  UserModel({
    required super.userId,
    required super.email,
    required super.password,
    required super.username,
    super.phoneNumber,
    super.profileUrl,
    super.role,
});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      profileUrl: json['profileUrl'],
      password: json['password'],
      role: json['role'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileUrl': profileUrl,
      'password': password,
      'role': role,
    };
  }
}