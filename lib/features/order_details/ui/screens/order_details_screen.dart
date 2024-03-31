import 'package:flutter/material.dart';
import 'package:salla_app/features/order_details/ui/widgets/order_details_app_bar.dart';
import 'package:salla_app/features/order_details/ui/widgets/order_details_body.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OrderDetailsAppBar(),
            Expanded(
              child: OrderDetailsBody(),
            ),
          ],
        ),
      ),
    );
  }
}
