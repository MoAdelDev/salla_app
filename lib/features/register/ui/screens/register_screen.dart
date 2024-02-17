import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/register/ui/widgets/register_form.dart';
import 'package:salla_app/features/register/ui/widgets/register_login_text.dart';
import 'package:salla_app/features/register/ui/widgets/register_submit.dart';
import 'package:salla_app/features/register/ui/widgets/register_welcome_text.dart';
import 'package:salla_app/generated/l10n.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                onTap1: () => context.pop(),
                icon1: Icons.chevron_left,
                title: S.of(context).registerTitle,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0.w,
                    vertical: 10.0.h,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const RegisterWelcomeText(),
                        verticalSpace(20.0),
                        const RegisterForm(),
                        verticalSpace(20.0),
                        const RegisterSubmit(),
                      ],
                    ),
                  ),
                ),
              ),
              const RegisterLoginText(),
            ],
          ),
        ),
      ),
    );
  }
}
