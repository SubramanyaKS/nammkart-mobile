import 'package:flutter/material.dart';
import 'package:nammkart/src/features/address/domain/entities/address.dart';
import 'package:nammkart/src/features/address/domain/repository/address_repository.dart';

class AddressProvider with ChangeNotifier {
  final AddressRepository addressRepository;

  AddressProvider(this.addressRepository);

  AddressEntity _address= AddressEntity(userId: '', postalcode: '', state: '', country: '');
  String _message='';

  AddressEntity get address=>_address;
  String get message=>_message;

  Future<void> addAddress(userId,address) async{
    var data=await addressRepository.addAddress(userId, address);
    _message=data;
    notifyListeners();
  }

  Future<void> getAddress(userId) async{
    var data= await addressRepository.getAddressById(userId);
    _address=data;
    notifyListeners();
  }

  Future<void> updateAddress(userId,address) async{
    var data= await addressRepository.updateAddressById(userId, address);
    _address=address;
    _message=data;
    notifyListeners();
  }

}