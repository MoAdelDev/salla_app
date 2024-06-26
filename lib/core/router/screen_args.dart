import 'package:flutter/material.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class ScreenArgs {}

class ProductDetailsScreenArgs extends ScreenArgs {
  final int productId;
  ProductDetailsScreenArgs({required this.productId});
}

class CheckoutScreenArgs extends ScreenArgs {
  final List<CartProductModel> products;
  final int totalItems;
  final double totalPrice;
  CheckoutScreenArgs({
    required this.products,
    required this.totalItems,
    required this.totalPrice,
  });
}

class SearchScreenArgs extends ScreenArgs {
  final BuildContext context;
  SearchScreenArgs({required this.context});
}

class AddOrEditScreenArgs extends ScreenArgs {
  final AddressModel? address;
  AddOrEditScreenArgs({required this.address});
}

class OrderDetailsScreenArgs extends ScreenArgs {
  final int orderId;
  OrderDetailsScreenArgs({required this.orderId});
}
