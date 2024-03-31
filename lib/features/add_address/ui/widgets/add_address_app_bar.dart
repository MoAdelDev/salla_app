import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/generated/l10n.dart';

class AddAddressAppBar extends StatelessWidget {
  const AddAddressAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: S.of(context).addNewAddress,
      icon1: Icons.chevron_left,
      onTap1: () => context.pop(),
    );
  }
}
