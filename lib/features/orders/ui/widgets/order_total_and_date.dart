import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/orders/data/models/orders_response_body.dart';
import 'package:salla_app/features/orders/logic/cubit/orders_cubit.dart';
import 'package:salla_app/generated/l10n.dart';

class OrderTotalAndDate extends StatelessWidget {
  final OrderModel order;
  const OrderTotalAndDate({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${double.parse(order.total.toString()).toStringAsFixed(2)} EGP',
              style: AppTexts.text16BlackLatoBold,
            ),
            verticalSpace(5.0),
            Row(
              children: [
                Expanded(
                  child: Text(
                    order.date,
                    style: AppTexts.text16BlackLatoBold,
                  ),
                ),
                if (order.status == 'New' || order.status == 'جديد')
                  CustomInkwell(
                    onTap: () => context
                        .read<OrdersCubit>()
                        .emitCancelOrderState(order.id),
                    child: Text(
                      S.of(context).cancelOrder,
                      style: AppTexts.text14BlackCairoBold,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
