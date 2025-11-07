import 'package:hotelapp/core/helpers/app_regex.dart';

class SignupValidators {
  static final RegExp _userNameReg = RegExp(r'^[a-zA-Z0-9._-]{3,30}$');

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required';
    if (!AppRegex.isNameValid(value.trim())) return 'Invalid name';
    return null;
  }

  static String? validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required';
    if (!_userNameReg.hasMatch(value.trim())) {
      return '3–30 chars (letters, numbers, . _ -)';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required';
    if (!AppRegex.isEmailValid(value.trim())) return 'Invalid email';
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required';
    if (!AppRegex.isPhoneNumberValid(value.trim())) return 'Invalid phone';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    if (!AppRegex.isPasswordValid(value)) {
      return 'At least 8 chars, upper, lower, number & special char';
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return 'Required';
    if (value != password) return 'Passwords do not match';
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) return 'Required';
    return null;
  }
}
