import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_container_tile.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_payment_method_item.dart';

class CheckoutPaymentMethods extends StatelessWidget {
  const CheckoutPaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        CheckoutCubit cubit = context.read<CheckoutCubit>();
        return CustomContainerTile(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.locale.paymentMethodTitle,
                style: AppTexts.text16BlackCairoBold,
              ),
              verticalSpace(5.0),
              CheckoutPaymentMethodItem(
                onChanged: (p0) => state is AddOrderLoading
                    ? null
                    : cubit.emitSelectPaymentState(1),
                radioSelected: cubit.paymentMethodSelected,
                radioValue: 1,
                title: context.locale.cashOnDeliveryTitle,
                subtitle: context.locale.cashOnDeliveryBody,
                icon: Icons.clean_hands,
              ),
              verticalSpace(10.0),
              CheckoutPaymentMethodItem(
                onChanged: (p0) => state is AddOrderLoading
                    ? null
                    : cubit.emitSelectPaymentState(2),
                radioSelected: cubit.paymentMethodSelected,
                radioValue: 2,
                title: context.locale.paymentTitle,
                subtitle: context.locale.paymentBody,
                icon: Icons.credit_card,
              ),
            ],
          ),
        );
      },
    );
  }
}
