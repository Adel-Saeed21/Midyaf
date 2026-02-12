import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/helpers/validation_helpers.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/core/widgets/app_text_form_field.dart';
import 'package:hotelapp/feature/auth/register/presentation/logic/register_cubit.dart';
import 'package:hotelapp/feature/auth/register/presentation/logic/register_state.dart';
import 'package:hotelapp/feature/auth/register/presentation/widgets/form_field_with_lable.dart';
import 'package:hotelapp/feature/auth/register/presentation/widgets/terms_and_conditions.dart';
import 'package:hotelapp/feature/auth/register/presentation/widgets/user_type_toggle.dart';

class RegisterFormField extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const RegisterFormField({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Registration successful!'),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate to next screen
        } else if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNameRow(cubit),
              verticalSpace(16),
              _buildUsernameField(cubit),
              verticalSpace(16),
              _buildEmailField(cubit),
              verticalSpace(16),
              _buildPhoneNumberField(cubit),
              verticalSpace(16),
              _buildLocationRow(cubit),
              verticalSpace(16),
              _buildAddressField(cubit),
              verticalSpace(16),
              _buildPasswordField(cubit),
              verticalSpace(16),
              _buildConfirmPasswordField(cubit),
              verticalSpace(24),
              _buildUserTypeToggle(),
              verticalSpace(24),
              _buildSubmitButton(),
              verticalSpace(16),
              const TermsAndConditionsText(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameRow(RegisterCubit cubit) {
    return Row(
      children: [
        Expanded(
          child: FormFieldWithLabel(
            label: "First Name",
            controller: cubit.firstNameController,
            hintText: "Jane",
            validator: (value) =>
                ValidationHelper.validateLettersOnly(value, 'First name'),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: FormFieldWithLabel(
            label: "Last Name",
            controller: cubit.lastNameController,
            hintText: "Doe",
            validator: (value) =>
                ValidationHelper.validateLettersOnly(value, 'Last name'),
          ),
        ),
      ],
    );
  }

  Widget _buildUsernameField(RegisterCubit cubit) {
    return FormFieldWithLabel(
      label: "Username",
      controller: cubit.userNameController,
      hintText: "johndoe",
      validator: (value) =>
          ValidationHelper.validateRequired(value, 'Username'),
    );
  }

  Widget _buildEmailField(RegisterCubit cubit) {
    return FormFieldWithLabel(
      label: "Email",
      controller: cubit.emailController,
      hintText: "name@example.com",
      suffixIcon: Icon(
        Icons.email_outlined,
        size: 22.sp,
        color: AppColors.unSelectedItemColorGrey,
      ),
      validator: ValidationHelper.validateEmail,
    );
  }

  Widget _buildPhoneNumberField(RegisterCubit cubit) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Phone Number"),
            Row(
              children: [
                CountryCodeDropdown(
                  selectedCode: cubit.selectedCountryCode,
                  onChanged: (value) => cubit.changeCountryCode(value),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: AppTextFormField(
                    controller: cubit.phoneNumberController,
                    borderRadius: 8.r,
                    focusedBorderColor: AppColors.buttonColorBabyBlue,
                    enabledBorderColor: AppColors.unSelectedItemColorGrey,
                    hintText: "(555) 000-0000",
                    validator: ValidationHelper.validatePhoneNumber,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildLocationRow(RegisterCubit cubit) {
    return Row(
      children: [
        Expanded(
          child: FormFieldWithLabel(
            label: "Country",
            controller: cubit.countryController,
            hintText: "United States",
            validator: (value) =>
                ValidationHelper.validateLettersOnly(value, 'Country'),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: FormFieldWithLabel(
            label: "City",
            controller: cubit.cityController,
            hintText: "New York",
            validator: (value) =>
                ValidationHelper.validateLettersOnly(value, 'City'),
          ),
        ),
      ],
    );
  }

  Widget _buildAddressField(RegisterCubit cubit) {
    return FormFieldWithLabel(
      label: "Address",
      controller: cubit.addressController,
      hintText: "123 Main Street",
      validator: (value) => ValidationHelper.validateRequired(value, 'Address'),
    );
  }

  Widget _buildPasswordField(RegisterCubit cubit) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return PasswordFieldWithLabel(
          label: "Password",
          controller: cubit.passwordController,
          hintText: "••••••••",
          isPasswordVisible: cubit.isPasswordVisible,
          onToggleVisibility: () => cubit.togglePasswordVisibility(),
          validator: ValidationHelper.validatePassword,
        );
      },
    );
  }

  Widget _buildConfirmPasswordField(RegisterCubit cubit) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return PasswordFieldWithLabel(
          label: "Confirm Password",
          controller: cubit.confirmPasswordController,
          hintText: "••••••••",
          isPasswordVisible: cubit.isConfirmPasswordVisible,
          onToggleVisibility: () => cubit.toggleConfirmPasswordVisibility(),
          validator: (value) => ValidationHelper.validateConfirmPassword(
            value,
            cubit.passwordController.text,
          ),
        );
      },
    );
  }

  Widget _buildUserTypeToggle() {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return UserTypeToggle(
          selectedType: cubit.selectedUserType,
          onTypeChanged: (value) => cubit.changeUserType(value),
        );
      },
    );
  }

  Widget _buildSubmitButton() {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final isLoading = state is RegisterLoading;

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    if (formKey.currentState!.validate()) {
                      context.read<RegisterCubit>().register();
                    }
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColorBabyBlue,
              padding: EdgeInsets.symmetric(vertical: 16.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            child: isLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    "Create Account",
                    style: TextStyle(
                      color: AppColors.textButtonWhite,
                      fontSize: 16.sp,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.normalTextBlack,
          fontSize: 15.sp,
          fontWeight: FontWeightHelper.medium,
        ),
      ),
    );
  }
}
