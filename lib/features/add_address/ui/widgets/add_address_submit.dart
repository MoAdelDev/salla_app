import 'package:flutter/material.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/generated/l10n.dart';

class AddAddressSubmit extends StatelessWidget {
  const AddAddressSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {},
      text: S.of(context).saveTitle,
    );
  }
}
