import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/order_details/data/models/order_details_response_body.dart';
import 'package:salla_app/features/order_details/ui/widgets/order_details_product_tile.dart';

class OrderDetailsProducts extends StatelessWidget {
  final OrderDetailsData order;
  const OrderDetailsProducts({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.locale.productsTitle,
            style: AppTexts.text16BlackLatoBold,
          ),
          verticalSpace(5.0),
          ListView.separated(
            itemBuilder: (context, index) {
              return OrderDetailsProductTile(
                product: order.products[index],
              );
            },
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) => verticalSpace(10.0),
            itemCount: order.products.length,
          ),
        ],
      ),
    );
  }
}
