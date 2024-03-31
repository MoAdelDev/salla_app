import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_text_field.dart';
import 'package:salla_app/generated/l10n.dart';

class AddAddressForm extends StatelessWidget {
  const AddAddressForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            controller: TextEditingController(),
            hintText: S.of(context).fullNameHintTitle,
            errorMsg: S.of(context).fullNameHintTitle,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: TextEditingController(),
            hintText: S.of(context).addressHintTitle,
            errorMsg: S.of(context).addressHintTitle,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: TextEditingController(),
            hintText: S.of(context).noteHintTitle,
            errorMsg: S.of(context).noteHintTitle,
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: TextEditingController(),
            hintText: S.of(context).cityHintTitle,
            errorMsg: S.of(context).cityHintTitle,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          verticalSpace(10.0),
          CustomTextField(
            controller: TextEditingController(),
            hintText: S.of(context).regionHintTitle,
            errorMsg: S.of(context).regionHintTitle,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            onSubmit: (value) {},
          ),
        ],
      ),
    );
  }
}
