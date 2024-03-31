import 'package:flutter/material.dart';
import 'package:salla_app/features/orders/ui/widgets/orders_app_bar.dart';
import 'package:salla_app/features/orders/ui/widgets/orders_list.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            OrdersAppBar(),
            Expanded(
              child: OrdersList(),
            ),
          ],
        ),
      ),
    );
  }
}
