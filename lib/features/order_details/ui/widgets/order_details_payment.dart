import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/order_details/data/models/order_details_response_body.dart';
import 'package:salla_app/generated/l10n.dart';

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
            S.of(context).paymentTitle,
            style: AppTexts.text16WhiteLatoBold,
          ),
          verticalSpace(5.0),
          Text(
            '${S.of(context).paymentMethodTitle}: ${order.paymentMethod}',
            style: AppTexts.text14WhiteLatoRegular,
          ),
          verticalSpace(3.0),
          const Divider(
            color: Colors.white,
            thickness: 0.5,
          ),
          verticalSpace(5.0),
          Text(
            '${S.of(context).itemTotalTitle}: ${order.cost.toStringAsFixed(2)} EGP',
            style: AppTexts.text14WhiteLatoRegular,
          ),
          verticalSpace(5.0),
          Text(
            '${S.of(context).tax}: ${order.tax.toStringAsFixed(2)} EGP',
            style: AppTexts.text14WhiteLatoRegular,
          ),
          verticalSpace(5.0),
          Text(
            '${S.of(context).deliveryFeesTitle}: Free',
            style: AppTexts.text14WhiteLatoRegular,
          ),
          verticalSpace(5.0),
          Text(
            '${S.of(context).totalTitle}: ${order.total.toStringAsFixed(2)} EGP',
            style: AppTexts.text14WhiteLatoRegular,
          ),
        ],
      ),
    );
  }
}
