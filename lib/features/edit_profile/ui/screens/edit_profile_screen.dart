import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/features/edit_profile/ui/widgets/edit_profile_app_bar.dart';
import 'package:salla_app/features/edit_profile/ui/widgets/edit_profile_avatar.dart';
import 'package:salla_app/features/edit_profile/ui/widgets/edit_profile_button.dart';
import 'package:salla_app/features/edit_profile/ui/widgets/edit_profile_form.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.0.h),
          child: Center(
            child: Column(
              children: [
                const EditProfileAppBar(),
                const EditProfileAvatar(),
                verticalSpace(20.0),
                const EditProfileForm(),
                verticalSpace(10.0),
                const EditProfileButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
