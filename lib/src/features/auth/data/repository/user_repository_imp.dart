import 'package:nammkart/src/features/auth/data/datasource/user_remote_datasource.dart';
import 'package:nammkart/src/features/auth/domain/entities/user.dart';
import 'package:nammkart/src/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserRemoteDatasource userRemoteDatasource;

  UserRepositoryImp(this.userRemoteDatasource);

  @override
  Future<String> userSignup(user) => userRemoteDatasource.userSignup(user);

  @override
  Future<String> userLogin(user) => userRemoteDatasource.userLogin(user);

  @override
  Future<UserEntity> userByEmail(token) =>
      userRemoteDatasource.userByEmail(token);
}
