import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_state.dart';
import 'package:salla_app/generated/l10n.dart';

class CartRemove extends StatelessWidget {
  final int cartId;
  const CartRemove({super.key, required this.cartId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (context.read<CartCubit>().isCartUpdateLoading) {
          return const CustomLoadingIndicator();
        }
        return CustomTextButton(
          onPressed: () =>
              context.read<CartCubit>().emitDeleteCartState(cartId: cartId),
          text: S.of(context).removeTitle,
        );
      },
    );
  }
}
