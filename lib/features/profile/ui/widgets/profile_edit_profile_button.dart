import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/generated/l10n.dart';

class ProfileEditProfileButton extends StatelessWidget {
  final VoidCallback onListen;
  const ProfileEditProfileButton({super.key, required this.onListen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: CustomButton(
        onPressed: () {
          context.push(Routes.editProfile).then((value) {
            onListen();
          });
        },
        text: S.of(context).updateProfileTitle,
      ),
    );
  }
}
