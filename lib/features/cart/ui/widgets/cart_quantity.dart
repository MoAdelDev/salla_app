import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/cart/data/models/cart_response_body.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_cubit.dart';
import 'package:salla_app/features/cart/logic/cubit/cart_state.dart';

class CartQuantity extends StatelessWidget {
  final CartProductModel cartProduct;
  const CartQuantity({
    super.key,
    required this.cartProduct,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        CartCubit cubit = context.read<CartCubit>();
        return Container(
          height: 30.h,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: context.colorScheme.primary,
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                ),
                child: CustomInkwell(
                  onTap: () {
                    if (cubit.cartQuantities[cartProduct.id] == 1) {
                      cubit.emitDeleteCartState(
                        cartId: cartProduct.id,
                        price: -cartProduct.product.price + 0.0,
                      );
                    } else {
                      cubit.emitUpdateCartState(
                        cartProduct.id,
                        (cubit.cartQuantities[cartProduct.id] ?? 1) - 1,
                        -cartProduct.product.price + 0.0,
                      );
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.onPrimary,
                ),
                child: Center(
                  child: cubit.isCartUpdateLoading
                      ? const CustomLoadingIndicator(
                          size: 20.0,
                        )
                      : Text(
                          '${cubit.cartQuantities[cartProduct.id]}',
                        ),
                ),
              ),
              Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 6.0.w),
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                ),
                child: CustomInkwell(
                  onTap: () {
                    cubit.emitUpdateCartState(
                      cartProduct.id,
                      (cubit.cartQuantities[cartProduct.id] ?? 1) + 1,
                      cartProduct.product.price + 0.0,
                    );
                  },
                  child: Icon(
                    Icons.add,
                    color: context.colorScheme.onPrimary,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
