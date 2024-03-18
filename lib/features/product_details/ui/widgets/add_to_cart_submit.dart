import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/home_body/data/models/products_response.dart';
import 'package:salla_app/features/product_details/logic/cubit/product_details_cubit.dart';
import 'package:salla_app/features/product_details/logic/cubit/product_details_state.dart';
import 'package:salla_app/generated/l10n.dart';

class AddToCartSubmit extends StatefulWidget {
  final ProductModel product;
  const AddToCartSubmit({super.key, required this.product});

  @override
  State<AddToCartSubmit> createState() => _AddToCartSubmitState();
}

class _AddToCartSubmitState extends State<AddToCartSubmit> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsCubit>().inCart = widget.product.inCart;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {
      state.whenOrNull(
        addToCartError: (error) => context.showSnackBar(error),
      );
    }, builder: (context, state) {
      if (state is AddToCartLoading) {
        return const Center(
          child: CustomLoadingIndicator(),
        );
      }
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0.w,
        ),
        child: SizedBox(
          width: double.infinity,
          child: CustomButton(
            onPressed: () {
              context
                  .read<ProductDetailsCubit>()
                  .emitAddToCartState(productId: widget.product.id);
            },
            text: context.read<ProductDetailsCubit>().inCart
                ? S.of(context).removeFromCartTitle
                : S.of(context).addToCartTitle,
          ),
        ),
      );
    });
  }
}
