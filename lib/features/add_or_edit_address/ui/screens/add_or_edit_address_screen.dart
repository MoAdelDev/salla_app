import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/add_or_edit_address/ui/widgets/add_address_app_bar.dart';
import 'package:salla_app/features/add_or_edit_address/ui/widgets/add_address_form.dart';
import 'package:salla_app/features/add_or_edit_address/ui/widgets/add_address_submit.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class AddOrEditAddressScreen extends StatelessWidget {
  final AddressModel? address;
  const AddOrEditAddressScreen({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddAddressAppBar(
              address: address,
            ),
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0.w,
                vertical: 10.0.h,
              ),
              child: Column(
                children: [
                  const AddAddressForm(),
                  verticalSpace(10.0),
                  AddAddressSubmit(
                    address: address,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
