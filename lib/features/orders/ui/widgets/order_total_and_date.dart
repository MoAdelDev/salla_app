import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/orders/data/models/orders_response_body.dart';

class OrderTotalAndDate extends StatelessWidget {
  final OrderModel order;
  const OrderTotalAndDate({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${double.parse(order.total.toString()).toStringAsFixed(2)} EGP',
          style: AppTexts.text16BlackLatoBold,
        ),
        verticalSpace(5.0),
        Text(
          order.date,
          style: AppTexts.text16BlackLatoBold,
        ),
      ],
    );
  }
}
