import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/core/widgets/app_text_form_field.dart';
import 'package:hotelapp/feature/auth/signup_screen/presentation/widgets/signup_validator.dart';

// Page 1: Name & Username
class SignupPage1 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController firstNameCtrl;
  final TextEditingController lastNameCtrl;
  final TextEditingController userNameCtrl;

  const SignupPage1({
    super.key,
    required this.formKey,
    required this.firstNameCtrl,
    required this.lastNameCtrl,
    required this.userNameCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          verticalSpace(10.h),
          AppTextFormField(
            controller: firstNameCtrl,
            label: _buildLabel('First Name'),
            radius: 16.r,
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: SignupValidators.validateName,
          ),
          verticalSpace(15.h),
          AppTextFormField(
            controller: lastNameCtrl,
            label: _buildLabel('Last Name'),
            radius: 16.r,
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: SignupValidators.validateName,
          ),
          SizedBox(height: 15.h),
          AppTextFormField(
            controller: userNameCtrl,
            label: _buildLabel('Username'),
            radius: 16.r,
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: SignupValidators.validateUserName,
          ),
        ],
      ),
    );
  }

  Text _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        height: 1.4,
      ),
    );
  }
}

// Page 2: Contact Info
class SignupPage2 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailCtrl;
  final TextEditingController phoneCtrl;

  const SignupPage2({
    super.key,
    required this.formKey,
    required this.emailCtrl,
    required this.phoneCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: emailCtrl,
            label: _buildLabel('Email'),
            radius: 16.r,
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: SignupValidators.validateEmail,
          ),
          SizedBox(height: 15.h),
          AppTextFormField(
            controller: phoneCtrl,
            label: _buildLabel('Phone Number'),
            radius: 16.r,
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: SignupValidators.validatePhone,
          ),
        ],
      ),
    );
  }

  Text _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        height: 1.4,
      ),
    );
  }
}

// Page 3: Location
class SignupPage3 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController countryCtrl;
  final TextEditingController cityCtrl;
  final TextEditingController addressCtrl;

  const SignupPage3({
    super.key,
    required this.formKey,
    required this.countryCtrl,
    required this.cityCtrl,
    required this.addressCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: countryCtrl,
            label: _buildLabel('Country'),
            radius: 16.r,
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: SignupValidators.validateName,
          ),
          SizedBox(height: 15.h),
          AppTextFormField(
            controller: cityCtrl,
            label: _buildLabel('City'),
            radius: 16.r,
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: SignupValidators.validateName,
          ),
          SizedBox(height: 15.h),
          AppTextFormField(
            controller: addressCtrl,
            label: _buildLabel('Address'),
            radius: 16.r,
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: SignupValidators.validateRequired,
          ),
        ],
      ),
    );
  }

  Text _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        height: 1.4,
      ),
    );
  }
}

// Page 4: Password
class SignupPage4 extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordCtrl;
  final TextEditingController confirmPasswordCtrl;
  final bool obscurePassword;
  final bool obscureConfirm;
  final VoidCallback onTogglePassword;
  final VoidCallback onToggleConfirm;

  const SignupPage4({
    super.key,
    required this.formKey,
    required this.passwordCtrl,
    required this.confirmPasswordCtrl,
    required this.obscurePassword,
    required this.obscureConfirm,
    required this.onTogglePassword,
    required this.onToggleConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: passwordCtrl,
            label: _buildLabel('Password'),
            radius: 16.r,
            isSecure: obscurePassword,
            suffixIcon: IconButton(
              onPressed: onTogglePassword,
              icon: Icon(
                obscurePassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: SignupValidators.validatePassword,
          ),
          SizedBox(height: 15.h),
          AppTextFormField(
            controller: confirmPasswordCtrl,
            label: _buildLabel('Confirm Password'),
            radius: 16.r,
            isSecure: obscureConfirm,
            suffixIcon: IconButton(
              onPressed: onToggleConfirm,
              icon: Icon(
                obscureConfirm ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            focusBorderColor: AppColors.blackColor,
            enableBorderColor: AppColors.greyColor,
            validator: (value) =>
                SignupValidators.validateConfirmPassword(value, passwordCtrl.text),
          ),
        ],
      ),
    );
  }

  Text _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.blackColor,
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        height: 1.4,
      ),
    );
  }
}