import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_inkwell.dart';
import 'package:salla_app/features/orders/data/models/orders_response_body.dart';
import 'package:salla_app/features/orders/logic/cubit/orders_cubit.dart';
import 'package:salla_app/features/orders/ui/widgets/order_status.dart';
import 'package:salla_app/features/orders/ui/widgets/order_total_and_date.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;
  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        OrdersCubit cubit = context.read<OrdersCubit>();
        return Padding(
          padding: EdgeInsets.only(top: 8.h),
          child: CustomInkwell(
            onTap: () => context
                .push(Routes.orderDetails,
                    arguments: OrderDetailsScreenArgs(orderId: order.id))
                .then((value) {
              cubit.emitOrdersState();
            }),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CustomContainerTile(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        order.status == 'New' || order.status == 'جديد'
                            ? Icons.pending_actions
                            : Icons.cancel,
                        color: order.status == 'New' || order.status == 'جديد'
                            ? Colors.blue
                            : Colors.red,
                        size: 30,
                      ),
                      horizontalSpace(10.0),
                      Expanded(
                        child: OrderTotalAndDate(
                          order: order,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: AppData.isArabic ? null : 20.0.w,
                  left: AppData.isArabic ? 20.0.w : null,
                  top: -3.h,
                  child: OrderStatus(
                    status: order.status,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
