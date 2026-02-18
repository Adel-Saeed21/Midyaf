import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelapp/feature/auth/login/data/models/login_request_body.dart';
import 'package:hotelapp/feature/auth/login/domain/use_case/login_use_case.dart';
import 'package:hotelapp/feature/auth/login/presentation/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> login(LoginRequestBody loginRequest) async {
    emit(LoginLoading());
    try {
      final result = await loginUseCase(loginRequest);
      result.when(
        onSuccess: (_) => emit(LoginLoaded()),
        onError: (error) => emit(LoginFailuer(errMessage: error.message)),
      );
    } catch (e) {
      emit(LoginFailuer(errMessage: e.toString()));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
