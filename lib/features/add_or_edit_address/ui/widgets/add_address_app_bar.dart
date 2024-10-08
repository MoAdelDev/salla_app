import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class AddAddressAppBar extends StatelessWidget {
  final AddressModel? address;
  const AddAddressAppBar({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: address == null
          ? context.locale.addNewAddress
          : context.locale.editNewAddress,
      icon1: Icons.chevron_left,
      onTap1: () => context.pop(),
    );
  }
}
