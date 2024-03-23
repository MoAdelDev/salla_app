import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_state.dart';
import 'package:salla_app/generated/l10n.dart';

class CartCheckoutButton extends StatelessWidget {
  const CartCheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            right: 15.0.w,
            left: 15.0.w,
            top: 5.0.h,
            bottom: 10.0.h,
          ),
          child: CustomButton(
            onPressed: () {
              int totalItems = 0;
              for (var item in context.read<CartCubit>().cartProducts) {
                totalItems +=
                    context.read<CartCubit>().cartQuantities[item.id] ?? 0;
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
        );
      },
    );
  }
}
