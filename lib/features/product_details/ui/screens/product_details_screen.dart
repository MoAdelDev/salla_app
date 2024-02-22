import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/product_details/ui/widgets/add_to_cart_submit.dart';
import 'package:salla_app/features/product_details/ui/widgets/description_title.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_details_description.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_details_name.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_details_price.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_sliver_app_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductDetailsScreenArgs args;
  const ProductDetailsScreen({super.key, required this.args});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final ProductModel productModel = widget.args.productModel;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  ProductSliverAppBar(
                    product: productModel,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductDetailsName(name: productModel.name),
                              verticalSpace(10.0),
                              ProductDetailsPrice(product: productModel),
                            ],
                          ),
                        ),
                        const DescriptionTitle(),
                        verticalSpace(10.0),
                        ProductDetailsDescription(
                          description: productModel.description,
                        ),
                        verticalSpace(300)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(10.0),
            AddToCartSubmit(
              product: widget.args.productModel,
            ),
            verticalSpace(8.0),
          ],
        ),
      ),
    );
  }
}
