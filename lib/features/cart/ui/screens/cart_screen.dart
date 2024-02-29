import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/core/widgets/custom_no_products.dart';
import 'package:salla_app/core/widgets/custom_shimmer_list.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_state.dart';
import 'package:salla_app/features/cart/ui/widgets/cart_list.dart';
import 'package:salla_app/generated/l10n.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartCubit>()..emitCartState(),
      child: Column(
        children: [
          CustomAppBar(
            title: S.of(context).cartTitle,
            icon2: Icons.clear_all,
            onTap2: () {},
          ),
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                List<CartProductModel> products =
                    context.read<CartCubit>().cartProducts;
                if (state is Loading) {
                  return const CustomShimmerList();
                }
                if (products.isEmpty) {
                  return const CustomNoProducts();
                }
                return Column(
                  children: [
                    Expanded(
                      child: CartList(
                        cartProducts: products,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
