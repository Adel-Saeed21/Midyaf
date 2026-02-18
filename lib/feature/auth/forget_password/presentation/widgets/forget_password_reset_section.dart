import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/helpers/validation_helpers.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/core/widgets/app_button.dart';
import 'package:hotelapp/feature/auth/forget_password/presentation/logic/forget_password_cubit.dart';
import 'package:hotelapp/feature/auth/register/presentation/widgets/form_field_with_lable.dart';

class ForgetPasswordResetSection extends StatefulWidget {
  final ForgetPasswordCubit cubit;
  final bool isLoading;
  final GlobalKey<FormState> formKey;

  const ForgetPasswordResetSection({
    super.key,
    required this.cubit,
    required this.isLoading,
    required this.formKey,
  });

  @override
  State<ForgetPasswordResetSection> createState() =>
      _ForgetPasswordResetSectionState();
}

class _ForgetPasswordResetSectionState
    extends State<ForgetPasswordResetSection> {
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Reset Password",
          style: TextStyle(
            color: AppColors.normalTextBlack,
            fontSize: 26.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        verticalSpace(10),
        Text(
          "Enter the OTP sent to your email\nand set your new password.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.unSelectedItemColorGrey,
            fontSize: 14.sp,
          ),
        ),
        verticalSpace(32),
        Form(
          key: widget.formKey,
          child: Column(
            children: [
              FormFieldWithLabel(
                label: "OTP Code",
                controller: widget.cubit.otpController,
                hintText: "123456",
                suffixIcon: Icon(
                  Icons.pin_rounded,
                  color: AppColors.unSelectedItemColorGrey,
                  size: 20.sp,
                ),
                validator: (value) =>
                    ValidationHelper.validateRequired(value, 'OTP'),
              ),
              verticalSpace(16),
              PasswordFieldWithLabel(
                label: "New Password",
                controller: widget.cubit.newPasswordController,
                hintText: "••••••••",
                isPasswordVisible: _isNewPasswordVisible,
                onToggleVisibility: () => setState(
                    () => _isNewPasswordVisible = !_isNewPasswordVisible),
                validator: ValidationHelper.validatePassword,
              ),
              verticalSpace(16),
              PasswordFieldWithLabel(
                label: "Confirm Password",
                controller: widget.cubit.confirmPasswordController,
                hintText: "••••••••",
                isPasswordVisible: _isConfirmPasswordVisible,
                onToggleVisibility: () => setState(() =>
                    _isConfirmPasswordVisible = !_isConfirmPasswordVisible),
                validator: (value) => ValidationHelper.validateConfirmPassword(
                  value,
                  widget.cubit.newPasswordController.text,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(24),
        AppButton(
          onPressed: widget.isLoading
              ? null
              : () {
                  if (widget.formKey.currentState!.validate()) {
                    widget.cubit.resetPassword();
                  }
                },
          backgroundColor: AppColors.buttonColorBabyBlue,
          radius: 12,
          verticalPadding: 16,
          child: widget.isLoading
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Reset Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.check_rounded, color: Colors.white, size: 20.sp),
                  ],
                ),
        ),
      ],
    );
  }
}