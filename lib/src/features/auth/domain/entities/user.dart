class UserEntity {
  final String username;
  final String userId;
  final String? phoneNumber;
  final String email;
  final String password;
  final String? profileUrl;
  final String? role;

  UserEntity(
      {required this.username,
      required this.email,
      required this.password,
      this.phoneNumber,
      required this.userId,
      this.profileUrl,
      this.role});
}
