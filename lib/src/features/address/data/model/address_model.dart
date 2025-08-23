import 'package:nammkart/src/features/address/domain/entities/address.dart';

class AddressModel extends AddressEntity {
  AddressModel(
      {required super.userId,
      super.city,
      super.street,
      required super.postalcode,
      required super.state,
      required super.country});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        userId: json['userId'],
        street: json['street'],
        city: json['city'],
        state: json['state'],
        postalcode: json['postalcode'],
        country: json['country']);
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'street': street,
      'city': city,
      'state': state,
      'postalcode': postalcode,
      'country': country,
    };
  }
}
