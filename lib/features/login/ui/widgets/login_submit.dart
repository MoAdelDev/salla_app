import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/helpers/toasts.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/features/login/logic/cubit/login_cubit.dart';
import 'package:salla_app/features/login/logic/cubit/login_state.dart';
import 'package:salla_app/generated/l10n.dart';

class LoginSubmit extends StatelessWidget {
  const LoginSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          state.whenOrNull(success: (data) {
            showToast(data.message);
            if (context.mounted) context.pushAndRemoveUntil(Routes.home);
          }, failure: (error) {
            showToast(error, isError: true);
          });
        },
        builder: (context, state) {
          return CustomButton(
            onPressed: () {
              context.read<LoginCubit>().emitLoginState();
            },
            text: S.of(context).loginTitle,
            isLoading: state is LoginLoading,
          );
        },
      ),
    );
  }
}
