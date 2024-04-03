import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/router/screen_args.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/style/texts.dart';
import 'package:salla_app/features/addresses/logic/cubit/addresses_cubit.dart';
import 'package:salla_app/features/addresses/logic/cubit/addresses_state.dart';
import 'package:salla_app/features/addresses/ui/widgets/address_tile.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:salla_app/features/home_body/ui/widgets/product_shimmer_vertical.dart';
import 'package:salla_app/generated/l10n.dart';

class AddressesList extends StatelessWidget {
  const AddressesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesCubit, AddressesState>(
      builder: (context, state) {
        AddressesCubit cubit = context.read<AddressesCubit>();
        if (cubit.addresses == null) {
          return ListView.separated(
            itemBuilder: (context, index) => const ProductShimmerVertical(),
            separatorBuilder: (context, index) => verticalSpace(10.0),
            itemCount: 30,
            physics: const NeverScrollableScrollPhysics(),
          );
        }
        if (cubit.addresses!.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noAddressTitle,
              style: AppTexts.text18BlackLatoBold,
            ),
          );
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            AddressModel addressModel = cubit.addresses![index];
            return Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      AddOrEditScreenArgs args = AddOrEditScreenArgs(
                        address: addressModel,
                      );
                      context
                          .push(Routes.addAddress, arguments: args)
                          .then((value) {
                        cubit.emitAddressState();
                      });
                    },
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: S.of(context).editTitle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  SlidableAction(
                    onPressed: (context) =>
                        cubit.emitDeleteAddress(addressModel.id),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    icon: Icons.save,
                    label: S.of(context).deleteTitle,
                  ),
                ],
              ),
              child: AddressTile(address: addressModel),
            );
          },
          separatorBuilder: (context, index) => verticalSpace(10.0),
          itemCount: cubit.addresses!.length,
        );
      },
    );
  }
}
