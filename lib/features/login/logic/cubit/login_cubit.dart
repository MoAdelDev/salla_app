import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:salla_app/features/login/data/models/login_request_body.dart';
import 'package:salla_app/features/login/data/models/login_response_body.dart';
import 'package:salla_app/features/login/data/repos/login_repo.dart';
import 'package:salla_app/features/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(
    this.loginRepo,
  ) : super(const LoginState.initial());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  void emitLoginState() async {
    if (_formKey.currentState!.validate()) {
      emit(const LoginState.loading());
      final result = await loginRepo.login(
        LoginRequestBody(
          _emailController.text,
          _passwordController.text,
        ),
      );
      result.when(
        success: (data) {
          final LoginResponseBody loginResponseBody = data;
          emit(LoginState.success(loginResponseBody));
        },
        failure: (error) => emit(LoginState.failure(error.message)),
      );
    }
  }
}
