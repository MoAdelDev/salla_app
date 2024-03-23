import 'package:flutter/material.dart';
import 'package:salla_app/core/helpers/base_safe_cubit.dart';
import 'package:salla_app/features/register/data/models/register_body_request.dart';
import 'package:salla_app/features/register/data/repos/register_repo.dart';
import 'package:salla_app/features/register/logic/cubit/register_state.dart';

class RegisterCubit extends BaseSafeCubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit(this.registerRepo) : super(const RegisterState.initial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  void emitRegisterState() async {
    safeEmit(const RegisterState.loading());
    final response = await registerRepo.register(
      registerBodyRequest: RegisterBodyRequest(
        nameController.text,
        emailController.text,
        phoneController.text,
        '',
        passwordController.text,
      ),
    );
    response.when(
      success: (data) {
        safeEmit(RegisterState.success(data));
      },
      failure: (error) {
        safeEmit(RegisterState.error(error));
      },
    );
  }
}
