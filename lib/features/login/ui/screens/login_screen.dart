import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/spacing.dart';
import 'package:salla_app/core/widgets/custom_app_bar.dart';
import 'package:salla_app/features/login/ui/widgets/login_form.dart';
import 'package:salla_app/features/login/ui/widgets/login_register_text.dart';
import 'package:salla_app/features/login/ui/widgets/login_submit.dart';
import 'package:salla_app/features/login/ui/widgets/login_welcome_text.dart';
import 'package:salla_app/generated/l10n.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                title: S.of(context).loginTitle,
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
                        const LoginWelcomeText(),
                        verticalSpace(20.0),
                        const LoginForm(),
                        verticalSpace(20.0),
                        const LoginSubmit(),
                      ],
                    ),
                  ),
                ),
              ),
              const LoginRegisterText(),
            ],
          ),
        ),
      ),
    );
  }
}
