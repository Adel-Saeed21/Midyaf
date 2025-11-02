import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotelapp/core/functions/show_toast.dart';
import 'package:hotelapp/core/helpers/app_regex.dart';
import 'package:hotelapp/core/helpers/extensions.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/routing/routes.dart';
import 'package:hotelapp/core/widgets/app_button.dart';
import 'package:hotelapp/core/widgets/app_text_form_field.dart';
import 'package:hotelapp/feature/auth/login_screen/presentation/logic/login_cubit.dart';
import 'package:hotelapp/feature/auth/login_screen/presentation/logic/login_state.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool isSecured = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          verticalSpace(30.h),
          AppTextFormField(
            controller: context.read<LoginCubit>().loginEmail,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'invalid';
              }
              return null;
            },
            label: const Text("Email"),
            labelStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
            radius: 16,
            textStyle: const TextStyle(color: Colors.black),
            focusBorderColor: Colors.black,
            enableBorderColor: Colors.grey,
          ),
          verticalSpace(16.h),
          AppTextFormField(
            controller: context.read<LoginCubit>().loginPassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'invalid';
              }
              return null;
            },
            label: const Text("Password"),
            labelStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
            radius: 16,

            isSecure: isSecured,
            suffixIcon: IconButton(
              iconSize: 25,
              onPressed: () {
                setState(() {
                  isSecured = !isSecured;
                });
              },

              icon: isSecured
                  ? const Icon(Icons.visibility_off, color: Colors.black)
                  : const Icon(Icons.visibility, color: Colors.black),
            ),
            textStyle: const TextStyle(color: Colors.black),
            focusBorderColor: Colors.black,
            enableBorderColor: Colors.grey,
          ),
          verticalSpace(5.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
               // context.pushNamed(Routes.startScreen);
               
              },
              child: Text(
                "Forget Password ?",

                style: TextStyle(color: Colors.black, fontSize: 14.sp),
              ),
            ),
          ),
          verticalSpace(5.h),

          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                showToast("Login succesffuly");
                context.pushReplacmentNamed(Routes.startScreen);
              } else if (state is LoginError) {
                showToast(state.errorMessage);
              }
            },
            builder: (context, state) {
              return AppButton(
                onPressed: () {},
                backgroundColor: Colors.black,
                borderSide: const BorderSide(color: Colors.white),
                radius: 25,
                buttonWidth: 280.w,
                child: state is LoginLoading
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 24.0,
                        ),
                      )
                    : const Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
              );
            },
          ),
        ],
      ),
    );
  }
}
