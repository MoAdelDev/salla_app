import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_state.dart';

class CartRemove extends StatelessWidget {
  final CartProductModel cartProduct;
  const CartRemove({super.key, required this.cartProduct});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (context.read<CartCubit>().isCartUpdateLoading) {
          return const CustomLoadingIndicator(
            size: 30.0,
          );
        }
        return CustomInkwell(
          onTap: () => context.read<CartCubit>().emitDeleteCartState(
                cartId: cartProduct.id,
                price: -cartProduct.product.price *
                        context
                            .read<CartCubit>()
                            .cartQuantities[cartProduct.id] +
                    0.0,
              ),
          child: Icon(
            Icons.delete,
            size: 25.0,
            color: context.colorScheme.primary,
          ),
        );
      },
    );
  }
}
