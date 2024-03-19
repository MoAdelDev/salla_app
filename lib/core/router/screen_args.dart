import 'package:salla_app/features/cart/data/models/cart_response_body.dart';

class ScreenArgs {}

class ProductDetailsScreenArgs extends ScreenArgs {
  final int productId;
  ProductDetailsScreenArgs({required this.productId});
}

class CheckoutScreenArgs extends ScreenArgs {
  final CartData data;
  CheckoutScreenArgs({required this.data});
}
