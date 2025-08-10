import 'package:flutter/material.dart';
import 'package:nammkart/src/config/utils/helper.dart';
import 'package:nammkart/src/features/auth/domain/entities/user.dart';
import 'package:nammkart/src/features/auth/domain/repository/user_repository.dart';

class UserProvider with ChangeNotifier{

  final UserRepository userRepository;

  UserProvider(this.userRepository);

  UserEntity _users= UserEntity(username: '', email: '', password: '', userId: '');
  String _authenticate='';
  String userEmail='';
  String _errors='';

  UserEntity get users => _users;
  String get authenticate=> _authenticate;
  String get errors =>_errors;

  Future<void> userRegister (user) async{
    await userRepository.userSignup(user);
    notifyListeners();
  }


  Future<void> userLogin(user) async{
      var data =await userRepository.userLogin(user);
      _authenticate=data;
      var res = Helper.extractTokenContent(data);
      userEmail=res;
    notifyListeners();
    
  }

  Future<void> userByEmail() async {
    var data = await userRepository.userByEmail(authenticate);
    _users=data;
    notifyListeners();
  }

  Future<void> userLogout() async{
    _authenticate='';
    userEmail='';
    _users== UserEntity(username: '', email: '', password: '', userId: '');

  }

}