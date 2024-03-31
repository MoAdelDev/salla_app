import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/core/widgets/custom_text_button.dart';
import 'package:salla_app/features/orders/data/models/orders_response_body.dart';
import 'package:salla_app/features/orders/logic/cubit/orders_cubit.dart';
import 'package:salla_app/features/orders/ui/widgets/order_status.dart';
import 'package:salla_app/features/orders/ui/widgets/order_total_and_date.dart';
import 'package:salla_app/generated/l10n.dart';

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
          child: GestureDetector(
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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: OrderTotalAndDate(
                          order: order,
                        ),
                      ),
                      if (order.status == 'New' || order.status == 'جديد')
                        CustomTextButton(
                          onPressed: () => cubit.emitCancelOrderState(order.id),
                          text: S.of(context).cancelOrder,
                          textStyle: AppTexts.text14WhiteLatoBold,
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
