import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/order_details/data/models/order_details_response_body.dart';
import 'package:salla_app/features/order_details/ui/widgets/order_details_status.dart';
import 'package:salla_app/generated/l10n.dart';

class OrderDetailsInfo extends StatelessWidget {
  final OrderDetailsData order;
  const OrderDetailsInfo({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          child: CustomContainerTile(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${S.of(context).orderTitle} #${order.id}',
                  style: AppTexts.text16BlackLatoBold,
                ),
                verticalSpace(5.0),
                Text(
                  '${S.of(context).placedOnTitle}: ${order.date}',
                  style: AppTexts.text14BlackLatoRegular,
                ),
                verticalSpace(5.0),
                Text(
                  '${S.of(context).nOfItemsTitle}: ${order.products.map((e) => e.quantity).reduce((value, element) => value + element)}',
                  style: AppTexts.text14BlackLatoRegular,
                ),
                verticalSpace(5.0),
                Text(
                  '${S.of(context).totalTitle}: ${double.parse(order.total.toString()).toStringAsFixed(2)} EGP',
                  style: AppTexts.text14BlackLatoRegular,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: AppData.isArabic ? null : 20.0.w,
          left: AppData.isArabic ? 20.0.w : null,
          top: -3.h,
          child: OrderDetailsStatus(
            status: order.status,
          ),
        ),
      ],
    );
  }
}
