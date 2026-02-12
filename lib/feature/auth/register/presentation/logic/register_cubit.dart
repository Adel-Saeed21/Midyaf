import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelapp/feature/auth/register/data/models/register_request_body.dart';
import 'package:hotelapp/feature/auth/register/domain/use_cases/register_use_case.dart';
import 'package:hotelapp/feature/auth/register/presentation/logic/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  // Controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // State variables
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  String selectedCountryCode = '+1';
  String selectedUserType = 'guest'; // guest or manager

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(RegisterPasswordVisibilityChanged());
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(RegisterPasswordVisibilityChanged());
  }

  void changeCountryCode(String code) {
    selectedCountryCode = code;
    emit(RegisterCountryCodeChanged());
  }

  void changeUserType(String type) {
    selectedUserType = type;
    emit(RegisterUserTypeChanged());
  }

  Future<void> register() async {
    emit(RegisterLoading());

    try {
      final requestBody = RegisterRequestBody(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        userName: userNameController.text,
        email: emailController.text,
        phoneNumber: "$selectedCountryCode${phoneNumberController.text}",
        country: countryController.text,
        city: cityController.text,
        address: addressController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );

      await registerUseCase.register(requestBody);
      emit(RegisterSuccess());
    } catch (error) {
      emit(RegisterError(error.toString()));
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    countryController.dispose();
    cityController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}