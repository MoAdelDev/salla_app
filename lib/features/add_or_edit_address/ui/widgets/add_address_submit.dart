import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/add_or_edit_address/logic/cubit/add_or_edit_address_cubit.dart';
import 'package:salla_app/features/add_or_edit_address/logic/cubit/add_or_edit_address_state.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';
import 'package:salla_app/generated/l10n.dart';

class AddAddressSubmit extends StatelessWidget {
  final AddressModel? address;
  const AddAddressSubmit({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrEditAddressCubit, AddOrEditAddressState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (message) {
            showToast(message);
            context.pop();
          },
          error: (message) => showToast(message, isError: true),
        );
      },
      builder: (context, state) {
        AddOrEditAddressCubit cubit = context.read<AddOrEditAddressCubit>();
        if (state is Loading) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
        return CustomButton(
          onPressed: () {
            if (address == null) {
              cubit.emitAddAddressState();
            } else {
              cubit.emitEditAddressState(address!.id);
            }
          },
          text: S.of(context).saveTitle,
        );
      },
    );
  }
}
