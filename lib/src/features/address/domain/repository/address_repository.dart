import 'package:nammkart/src/features/address/domain/entities/address.dart';

abstract class AddressRepository {
  Future<String> addAddress(userId, address);
  Future<AddressEntity> getAddressById(userId);
  Future<String> updateAddressById(userId, address);
}
