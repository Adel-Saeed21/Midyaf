import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/helpers/validation_helpers.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/auth/login/data/models/login_request_body.dart';
import 'package:hotelapp/feature/auth/login/presentation/logic/login_cubit.dart';
import 'package:hotelapp/feature/auth/login/presentation/logic/login_state.dart';
import 'package:hotelapp/feature/auth/register/presentation/widgets/form_field_with_lable.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          _buildEmailField(cubit),
          verticalSpace(10),
          _buildPasswordField(cubit),
          _buildForgetPassword(),
          verticalSpace(5),
          _buildSubmitButton(cubit),
        ],
      ),
    );
  }

  Widget _buildEmailField(LoginCubit cubit) {
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

  Widget _buildForgetPassword() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Forget password?",
            style: TextStyle(
              color: AppColors.buttonColorBabyBlue,
              fontSize: 15.sp,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField(LoginCubit cubit) {
    return PasswordFieldWithLabel(
      label: "Password",
      controller: cubit.passwordController,
      hintText: "••••••••",
      isPasswordVisible: isVisible,
      onToggleVisibility: () {
        setState(() {
          isVisible = !isVisible;
        });
      },
      validator: ValidationHelper.validatePassword,
    );
  }

  Widget _buildSubmitButton(LoginCubit cubit) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        final isLoading = state is LoginLoading;
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.login(
                        LoginRequestBody(
                          email: cubit.emailController.text,
                          password: cubit.passwordController.text,
                        ),
                      );
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
                    "Login",
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
}
