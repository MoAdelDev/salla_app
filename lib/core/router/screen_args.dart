import 'package:salla_app/features/home_body/data/models/products_response.dart';

class ScreenArgs {}

class ProductDetailsScreenArgs extends ScreenArgs {
  final ProductModel productModel;
  ProductDetailsScreenArgs({required this.productModel});
}
