class AddressEntity{
  final String userId;
  final String? street;
  final String? city;
  final String state;
  final String postalcode;
  final String country;

  AddressEntity({required this.userId, this.city,this.street,required this.postalcode,required this.state,required this.country});

}