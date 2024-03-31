import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/order_details/logic/cubit/order_details_cubit.dart';
import 'package:salla_app/features/order_details/ui/widgets/order_details_address.dart';
import 'package:salla_app/features/order_details/ui/widgets/order_details_info.dart';
import 'package:salla_app/features/order_details/ui/widgets/order_details_payment.dart';
import 'package:salla_app/features/order_details/ui/widgets/order_details_products.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        OrderDetailsCubit cubit = context.read<OrderDetailsCubit>();
        if (cubit.order == null) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(5.0),
              OrderDetailsInfo(
                order: cubit.order!,
              ),
              verticalSpace(10.0),
              OrderDetailsPayment(
                order: cubit.order!,
              ),
              verticalSpace(10.0),
              OrderDetailsAddress(
                order: cubit.order!,
              ),
              verticalSpace(10.0),
              OrderDetailsProducts(
                order: cubit.order!,
              ),
            ],
          ),
        );
      },
    );
  }
}
