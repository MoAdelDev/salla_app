import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/widgets/custom_button.dart';

class SettingsEditProfileButton extends StatelessWidget {
  const SettingsEditProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () => context.push(Routes.editProfile),
      text: 'Edit Profile',
    );
  }
}
