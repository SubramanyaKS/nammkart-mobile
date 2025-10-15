import 'package:nammkart/src/features/auth/domain/entities/user.dart';

abstract class UserRepository {
  Future<String> userSignup(user);
  Future<String> userLogin(user);
  Future<UserEntity> userByEmail(token);
  Future<String> userUpdate(user,token);
}
