import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/helpers/validation_helpers.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/core/widgets/app_button.dart';
import 'package:hotelapp/core/widgets/app_text_form_field.dart';
import 'package:hotelapp/feature/auth/forget_password/presentation/logic/forget_password_cubit.dart';

class ForgetPasswordEmailSection extends StatelessWidget {
  final ForgetPasswordCubit cubit;
  final bool isLoading;
  final GlobalKey<FormState> formKey;

  const ForgetPasswordEmailSection({
    super.key,
    required this.cubit,
    required this.isLoading,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Forgot Password?",
          style: TextStyle(
            color: AppColors.normalTextBlack,
            fontSize: 26.sp,
            fontWeight: FontWeightHelper.bold,
          ),
        ),
        verticalSpace(10),
        Text(
          "Don't worry! It happens. Please enter\nthe email address linked to your account.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.unSelectedItemColorGrey,
            fontSize: 14.sp,
          ),
        ),
        verticalSpace(32),
        Form(
          key: formKey,
          child: AppTextFormField(
            controller: cubit.emailController,
            borderRadius: 8.r,
            focusedBorderColor: AppColors.buttonColorBabyBlue,
            enabledBorderColor: AppColors.unSelectedItemColorGrey,
            hintText: "example@email.com",
            suffixIcon: Icon(
              Icons.alternate_email_rounded,
              color: AppColors.unSelectedItemColorGrey,
              size: 20.sp,
            ),
            validator: ValidationHelper.validateEmail,
          ),
        ),
        verticalSpace(24),
        AppButton(
          onPressed: isLoading
              ? null
              : () {
                  if (formKey.currentState!.validate()) {
                    cubit.forgetPassword();
                  }
                },
          backgroundColor: AppColors.buttonColorBabyBlue,
          radius: 12,
          verticalPadding: 16,
          child: isLoading
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
                      "Send OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.arrow_forward_rounded,
                        color: Colors.white, size: 20.sp),
                  ],
                ),
        ),
      ],
    );
  }
}