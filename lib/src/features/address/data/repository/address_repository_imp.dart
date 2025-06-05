import 'package:nammkart/src/features/address/data/datasource/address_remote_datasource.dart';
import 'package:nammkart/src/features/address/domain/entities/address.dart';
import 'package:nammkart/src/features/address/domain/repository/address_repository.dart';

class AddressRepositoryImp implements AddressRepository {

    final AddressRemoteDatasource addressRemoteDatasource;

    AddressRepositoryImp(this.addressRemoteDatasource);

    @override
    Future<String> addAddress(userId,address)=>addressRemoteDatasource.addAddress(userId, address);

    @override
    Future<AddressEntity> getAddressById(userId)=> addressRemoteDatasource.viewAddress(userId);

    @override
    Future<String> updateAddressById(userId,address)=> addressRemoteDatasource.updateAddress(userId, address);
}