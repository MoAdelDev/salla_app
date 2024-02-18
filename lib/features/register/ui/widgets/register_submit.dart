import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla_app/core/helpers/extensions.dart';
import 'package:salla_app/core/router/routes.dart';
import 'package:salla_app/core/widgets/custom_button.dart';
import 'package:salla_app/core/widgets/custom_loading_indicator.dart';
import 'package:salla_app/features/register/logic/cubit/register_cubit.dart';
import 'package:salla_app/features/register/logic/cubit/register_state.dart';
import 'package:salla_app/generated/l10n.dart';

class RegisterSubmit extends StatelessWidget {
  const RegisterSubmit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            context.showSnackBar(data.message);
            if (context.mounted) context.pushAndRemoveUntil(Routes.home);
          },
          error: (message) {
            context.showSnackBar(message, isError: true);
          },
        );
      },
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const Center(
            child: CustomLoadingIndicator(),
          );
        }
        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: CustomButton(
            onPressed: () => context.read<RegisterCubit>().emitRegisterState(),
            text: S.of(context).registerTitle,
          ),
        );
      },
    );
  }
}
