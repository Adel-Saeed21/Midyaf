import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelapp/feature/auth/forget_password/data/models/reset_password_model.dart';
import 'package:hotelapp/feature/auth/forget_password/domain/use_cases/forget_password_use_case.dart';
import 'package:hotelapp/feature/auth/forget_password/domain/use_cases/reset_password_use_case.dart';
import 'package:hotelapp/feature/auth/forget_password/presentation/logic/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUseCase forgetPasswordUseCase;
  final ResetPasswordUseCase resetPasswordUseCase;

  ForgetPasswordCubit(this.forgetPasswordUseCase, this.resetPasswordUseCase)
      : super(ForgetPasswordInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String userEmail = '';

  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoading());
    final result = await forgetPasswordUseCase(emailController.text);
    result.when(
      onSuccess: (_) {
        userEmail = emailController.text;
        emit(ForgetPasswordSuccess());
      },
      onError: (error) => emit(ForgetPasswordError(error.message)),
    );
  }

  Future<void> resetPassword() async {
    emit(ResetPasswordLoading());
    final result = await resetPasswordUseCase(
      ResetPasswordModel(
        email: userEmail,
        otp: otpController.text,
        newPassword: newPasswordController.text,
        confirmNewPassword: confirmPasswordController.text,
      ),
    );
    result.when(
      onSuccess: (_) => emit(ResetPasswordSuccess()),
      onError: (error) => emit(ResetPasswordError(error.message)),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    otpController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}