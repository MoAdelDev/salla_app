import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/generated/l10n.dart';

class SettingsEditProfileButton extends StatelessWidget {
  final VoidCallback onListen;
  const SettingsEditProfileButton({super.key, required this.onListen});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        context.push(Routes.editProfile).then((value) {
          onListen();
        });
      },
      text: S.of(context).updateProfileTitle,
    );
  }
}
