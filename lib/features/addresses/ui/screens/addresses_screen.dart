import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/style/colors.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/addresses/ui/widgets/add_new_address_button.dart';
import 'package:salla_app/features/addresses/ui/widgets/addresses_list.dart';
import 'package:salla_app/generated/l10n.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGreyColor,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: S.of(context).myAddressesTitle,
              onTap1: () => context.pop(),
              icon1: Icons.chevron_left,
            ),
            const Expanded(
              child: AddressesList(),
            ),
            verticalSpace(10.0),
            const AddNewAddressButton(),
          ],
        ),
      ),
    );
  }
}
