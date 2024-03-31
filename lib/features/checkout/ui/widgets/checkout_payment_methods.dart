import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_cart.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_payment_method_item.dart';
import 'package:salla_app/generated/l10n.dart';

class CheckoutPaymentMethods extends StatelessWidget {
  const CheckoutPaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        CheckoutCubit cubit = context.read<CheckoutCubit>();
        return CheckoutCart(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).paymentMethodTitle,
                style: AppTexts.text16WhiteLatoBold,
              ),
              verticalSpace(5.0),
              CheckoutPaymentMethodItem(
                onChanged: (p0) => state is AddOrderLoading
                    ? null
                    : cubit.emitSelectPaymentState(1),
                radioSelected: cubit.paymentMethodSelected,
                radioValue: 1,
                title: S.of(context).cashOnDeliveryTitle,
                subtitle: S.of(context).cashOnDeliveryBody,
                icon: Icons.clean_hands,
              ),
              verticalSpace(10.0),
              CheckoutPaymentMethodItem(
                onChanged: (p0) => state is AddOrderLoading
                    ? null
                    : cubit.emitSelectPaymentState(2),
                radioSelected: cubit.paymentMethodSelected,
                radioValue: 2,
                title: S.of(context).paymentTitle,
                subtitle: S.of(context).paymentBody,
                icon: Icons.credit_card,
              ),
            ],
          ),
        );
      },
    );
  }
}
