import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/order_details/logic/cubit/order_details_cubit.dart';

class OrderDetailsStatus extends StatelessWidget {
  final String status;
  const OrderDetailsStatus({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 2000),
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 3.0.h),
          decoration: BoxDecoration(
            color:
                status == 'New' || status == 'جديد' ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            status,
            style: AppTexts.text14WhiteLatoBold,
          ),
        );
      },
    );
  }
}
