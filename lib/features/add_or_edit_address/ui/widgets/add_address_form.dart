import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/features/add_or_edit_address/logic/cubit/add_or_edit_address_cubit.dart';
import 'package:salla_app/features/add_or_edit_address/logic/cubit/add_or_edit_address_state.dart';
import 'package:salla_app/generated/l10n.dart';

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({super.key});

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
                hintText: S.of(context).fullNameHintTitle,
                errorMsg: S.of(context).fullNameHintTitle,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              verticalSpace(10.0),
              CustomTextField(
                controller: cubit.addressController,
                hintText: S.of(context).addressHintTitle,
                errorMsg: S.of(context).addressHintTitle,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              verticalSpace(10.0),
              CustomTextField(
                controller: cubit.noteController,
                hintText: S.of(context).noteHintTitle,
                errorMsg: S.of(context).noteHintTitle,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.next,
              ),
              verticalSpace(10.0),
              CustomTextField(
                controller: cubit.cityController,
                hintText: S.of(context).cityHintTitle,
                errorMsg: S.of(context).cityHintTitle,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              verticalSpace(10.0),
              CustomTextField(
                controller: cubit.regionController,
                hintText: S.of(context).regionHintTitle,
                errorMsg: S.of(context).regionHintTitle,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                onSubmit: (value) {},
              ),
            ],
          ),
        );
      },
    );
  }
}
