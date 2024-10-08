import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/order_details/data/models/order_details_response_body.dart';

class OrderDetailsPayment extends StatelessWidget {
  final OrderDetailsData order;
  const OrderDetailsPayment({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.paymentTitle,
            style: AppTexts.text16BlackLatoBold,
          ),
          verticalSpace(5.0),
          Text(
            '${context.locale.paymentMethodTitle}: ${order.paymentMethod}',
            style: AppTexts.text14BlackLatoRegular,
          ),
          verticalSpace(3.0),
          const Divider(
            color: Colors.grey,
            thickness: 0.5,
          ),
          verticalSpace(5.0),
          Text(
            '${context.locale.itemTotalTitle}: ${order.cost.toStringAsFixed(2)} EGP',
            style: AppTexts.text14BlackLatoRegular,
          ),
          verticalSpace(5.0),
          Text(
            '${context.locale.tax}: ${order.tax.toStringAsFixed(2)} EGP',
            style: AppTexts.text14BlackLatoRegular,
          ),
          verticalSpace(5.0),
          Text(
            '${context.locale.deliveryFeesTitle}: Free',
            style: AppTexts.text14BlackLatoRegular,
          ),
          verticalSpace(5.0),
          Text(
            '${context.locale.totalTitle}: ${order.total.toStringAsFixed(2)} EGP',
            style: AppTexts.text14BlackLatoRegular,
          ),
        ],
      ),
    );
  }
}
