import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salla_app/core/data/app_data.dart';
import 'package:salla_app/features/login/data/models/login_request_body.dart';
import 'package:salla_app/features/login/data/models/login_response_body.dart';
import 'package:salla_app/features/login/data/repos/login_repo.dart';
import 'package:salla_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(
    this.loginRepo,
  ) : super(const LoginState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void emitLoginState() async {
    if (formKey.currentState!.validate()) {
      emit(const LoginState.loading());
      final result = await loginRepo.login(
        LoginRequestBody(
          emailController.text,
          passwordController.text,
        ),
      );
      result.when(
        success: (data) {
          final LoginResponseBody loginResponseBody = data;
          if (loginResponseBody.data != null) {
            AppData.userModel = loginResponseBody.data!;
          }
          emit(LoginState.success(loginResponseBody));
        },
        failure: (error) => emit(LoginState.failure(error.message)),
      );
    }
  }
}
