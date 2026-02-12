import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/extensions.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/auth/register/presentation/widgets/register_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.authBackgroundOffWhite,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: AppColors.normalTextBlack,
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.normalTextBlack),
        ),
      ),
      backgroundColor: AppColors.authBackgroundOffWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              style: TextStyle(
                color: AppColors.normalTextBlack,
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 30.sp,
              ),
            ),
            verticalSpace(8),
            Text(
              "Join Midyaf to book your stay or manage your\nproperty seamlessly",
              style: TextStyle(color: AppColors.unSelectedItemColorGrey),
            ),
            verticalSpace(12),
            Expanded(child: RegisterFormField(formKey: formKey)),
          ],
        ),
      ),
    );
  }
}
