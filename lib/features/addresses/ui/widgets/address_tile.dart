import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class AddressTile extends StatelessWidget {
  final AddressModel address;
  const AddressTile({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        leading: const Icon(
          Icons.location_city,
          color: Colors.white,
          size: 30,
        ),
        title: Text(
          address.name,
          style: AppTexts.text16WhiteLatoBold,
        ),
        subtitle: Text(
          '${address.city}, ${address.region}\n${address.details}',
          style: AppTexts.text14WhiteLatoRegular,
        ),
      ),
    );
  }
}
