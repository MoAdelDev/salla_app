import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/add_or_edit_address/logic/cubit/add_or_edit_address_cubit.dart';
import 'package:salla_app/features/add_or_edit_address/logic/cubit/add_or_edit_address_state.dart';
import 'package:salla_app/features/checkout/data/models/addresses_response_body.dart';

class AddAddressForm extends StatelessWidget {
  final AddressModel? address;
  const AddAddressForm({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrEditAddressCubit, AddOrEditAddressState>(
      builder: (context, state) {
        AddOrEditAddressCubit cubit = context.read<AddOrEditAddressCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: cubit.fullNameController,
                hintText: context.locale.fullNameHintTitle,
                errorMsg: context.locale.fullNameHintTitle,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              verticalSpace(10.0),
              CustomTextField(
                controller: cubit.addressController,
                hintText: context.locale.addressHintTitle,
                errorMsg: context.locale.addressHintTitle,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              verticalSpace(10.0),
              CustomTextField(
                controller: cubit.noteController,
                hintText: context.locale.noteHintTitle,
                errorMsg: context.locale.noteHintTitle,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
              ),
              verticalSpace(10.0),
              CustomTextField(
                controller: cubit.cityController,
                hintText: context.locale.cityHintTitle,
                errorMsg: context.locale.cityHintTitle,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              verticalSpace(10.0),
              CustomTextField(
                controller: cubit.regionController,
                hintText: context.locale.regionHintTitle,
                errorMsg: context.locale.regionHintTitle,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onSubmit: (value) {
                  if (address == null) {
                    cubit.emitAddAddressState();
                  } else {
                    cubit.emitEditAddressState(address!.id);
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
