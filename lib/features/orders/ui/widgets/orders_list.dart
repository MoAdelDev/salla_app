import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_shimmer_list.dart';
import 'package:salla_app/features/orders/data/models/orders_response_body.dart';
import 'package:salla_app/features/orders/logic/cubit/orders_cubit.dart';
import 'package:salla_app/features/orders/ui/widgets/order_tile.dart';
import 'package:salla_app/generated/l10n.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        OrdersCubit cubit = context.read<OrdersCubit>();
        if (cubit.orders == null) {
          return const CustomShimmerList();
        }
        if (cubit.orders!.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noOrders,
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
