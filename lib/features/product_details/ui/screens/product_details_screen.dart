import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:salla_app/features/product_details/logic/cubit/product_details_state.dart';
import 'package:salla_app/features/product_details/ui/widgets/add_to_cart_submit.dart';
import 'package:salla_app/features/product_details/ui/widgets/description_title.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_details_description.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_details_name.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_details_price.dart';
import 'package:salla_app/features/product_details/ui/widgets/product_sliver_app_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({
    super.key,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is Loading || state is Failure) {
              return const Center(
                child: CustomLoadingIndicator(
                  size: 70.0,
                ),
              );
            }
            final ProductModel productModel =
                context.read<ProductDetailsCubit>().productModel;
            return Column(
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
                  product: productModel,
                ),
                verticalSpace(8.0),
              ],
            );
          },
        ),
      ),
    );
  }
}
