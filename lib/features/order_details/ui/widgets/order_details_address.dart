import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/order_details/data/models/order_details_response_body.dart';
import 'package:salla_app/generated/l10n.dart';

class OrderDetailsAddress extends StatelessWidget {
  final OrderDetailsData order;
  const OrderDetailsAddress({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomContainerTile(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).shippingAddressTitle,
              style: AppTexts.text16BlackLatoBold,
            ),
            verticalSpace(5.0),
            Text(
              order.address.name,
              style: AppTexts.text14BlackLatoRegular,
            ),
            verticalSpace(5.0),
            Text(
              '${order.address.city}, ${order.address.region}\n${order.address.details}',
              style: AppTexts.text14BlackLatoRegular,
            ),
          ],
        ),
      ),
    );
  }
}
