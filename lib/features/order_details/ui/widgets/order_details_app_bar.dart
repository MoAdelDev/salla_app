import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/order_details/logic/cubit/order_details_cubit.dart';

class OrderDetailsAppBar extends StatelessWidget {
  const OrderDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        OrderDetailsCubit cubit = context.read<OrderDetailsCubit>();
        return CustomAppBar(
          title: context.locale.orderDetailsTitle,
          onTap1: () => context.pop(),
          icon1: Icons.chevron_left,
          onTap2: cubit.order?.status == 'New' || cubit.order?.status == 'جديد'
              ? () => cubit.emitCancelOrderState(cubit.order!.id)
              : null,
          icon2: Icons.cancel,
        );
      },
    );
  }
}
