import 'package:flutter/material.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';

class CheckoutCart extends StatelessWidget {
  final Widget child;
  const CheckoutCart({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomContainerTile(
      child: child,
    );
  }
}
