import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/core/widgets/custom_shimmer_list.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_cubit.dart';
import 'package:salla_app/features/checkout/logic/cubit/checkout_state.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_address_item.dart';
import 'package:salla_app/features/checkout/ui/widgets/checkout_cart.dart';
import 'package:salla_app/generated/l10n.dart';

class CheckoutAddresses extends StatefulWidget {
  const CheckoutAddresses({super.key});

  @override
  State<CheckoutAddresses> createState() => _CheckoutAddressesState();
}

class _CheckoutAddressesState extends State<CheckoutAddresses> {
  int radioSelected = 0;
  @override
  Widget build(BuildContext context) {
    return CheckoutCart(
      child: BlocBuilder<CheckoutCubit, CheckoutState>(
        builder: (context, state) {
          CheckoutCubit cubit = context.read<CheckoutCubit>();
          if (cubit.addresses == null) {
            return const CustomShimmerList(
              itemCount: 3,
              height: 50.0,
            );
          }
          if (cubit.addresses!.isEmpty) {
            return Center(
              child: Text(
                S.of(context).noAddressTitle,
                style: AppTexts.text16WhiteLatoBold,
              ),
            );
          }
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CheckoutAddressItem(
                onChanged: (p0) {
                  setState(() {
                    radioSelected = p0!;
                  });
                },
                value: index,
                radioSelected: radioSelected,
              );
            },
            separatorBuilder: (context, index) => verticalSpace(10.0),
            itemCount: cubit.addresses?.length ?? 0,
          );
        },
      ),
    );
  }
}
