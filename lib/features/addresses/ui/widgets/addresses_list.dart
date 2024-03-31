import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/widgets/custom_shimmer_list.dart';
import 'package:salla_app/features/addresses/logic/cubit/addresses_cubit.dart';
import 'package:salla_app/features/addresses/logic/cubit/addresses_state.dart';
import 'package:salla_app/features/addresses/ui/widgets/address_tile.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:salla_app/generated/l10n.dart';

class AddressesList extends StatelessWidget {
  const AddressesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressesCubit, AddressesState>(
      builder: (context, state) {
        AddressesCubit cubit = context.read<AddressesCubit>();
        if (cubit.addresses == null) {
          return const CustomShimmerList();
        }
        if (cubit.addresses!.isEmpty) {
          return Center(
            child: Text(
              S.of(context).noAddressTitle,
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
                    // An action can be bigger than the others.
                    onPressed: (context) {},
                    backgroundColor: AppColor.primaryColor,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: S.of(context).editTitle,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  SlidableAction(
                    onPressed: (context) {},
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
