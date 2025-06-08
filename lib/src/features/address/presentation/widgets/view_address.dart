import 'package:flutter/material.dart';
import 'package:nammkart/src/features/address/presentation/provider/address_provider.dart';
import 'package:nammkart/src/features/address/presentation/widgets/address_card.dart';
import 'package:provider/provider.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final address = Provider.of<AddressProvider>(context,listen: false).address;
    return AddressCard(street:address.street!,city:address.city!,state:address.state,country:address.country,
          postalCode:address.postalcode,
    );
  }
}
