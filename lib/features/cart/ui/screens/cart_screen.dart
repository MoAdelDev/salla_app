import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/di/dependency_injection.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
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
                return Stack(
                  children: [
                    CartList(
                      cartProducts: products,
                    ),
                    Positioned(
                      left: 20.w,
                      right: 20.w,
                      bottom: 16.h,
                      child: CustomButton(
                        onPressed: () {
                          int totalItems = 0;
                          for (var item
                              in context.read<CartCubit>().cartProducts) {
                            totalItems += context
                                    .read<CartCubit>()
                                    .cartQuantities[item.id] ??
                                0;
                          }
                          context.push(
                            Routes.checkout,
                            arguments: CheckoutScreenArgs(
                              products: context.read<CartCubit>().cartProducts,
                              totalItems: totalItems,
                              totalPrice: context.read<CartCubit>().totalPrice,
                            ),
                          );
                        },
                        text:
                            '${S.of(context).checkoutTitle} ${context.read<CartCubit>().totalPrice} EGP',
                      ),
                    )
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
