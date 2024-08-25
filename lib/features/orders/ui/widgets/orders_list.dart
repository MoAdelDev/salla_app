import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_shimmer_vertical.dart';
import 'package:salla_app/features/orders/data/models/orders_response_body.dart';
import 'package:salla_app/features/orders/logic/cubit/orders_cubit.dart';
import 'package:salla_app/features/orders/ui/widgets/order_tile.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        OrdersCubit cubit = context.read<OrdersCubit>();
        if (cubit.orders == null) {
          return ListView.separated(
            itemBuilder: (context, index) => const ProductShimmerVertical(),
            separatorBuilder: (context, index) => verticalSpace(10.0),
            itemCount: 30,
            physics: const NeverScrollableScrollPhysics(),
          );
        }
        if (cubit.orders!.isEmpty) {
          return Center(
            child: Text(
              context.locale.noOrders,
              style: AppTexts.text18BlackLatoBold,
            ),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            OrderModel order = cubit.orders![index];
            return OrderTile(order: order);
          },
          separatorBuilder: (context, index) => verticalSpace(10.0),
          itemCount: cubit.orders!.length,
        );
      },
    );
  }
}
