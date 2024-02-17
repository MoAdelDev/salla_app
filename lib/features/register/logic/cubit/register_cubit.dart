import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/features/register/data/models/register_body_request.dart';
import 'package:salla_app/features/register/data/repos/register_repo.dart';
import 'package:salla_app/features/register/logic/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit(this.registerRepo) : super(const RegisterState.initial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  void emitRegisterState() async {
    emit(const RegisterState.loading());
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
        AppData.userModel = data.data!;
        emit(RegisterState.success(data));
      },
      failure: (error) {
        emit(RegisterState.error(error.message));
      },
    );
  }
}
