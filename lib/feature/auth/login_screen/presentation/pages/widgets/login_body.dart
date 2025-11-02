import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/auth/login_screen/presentation/pages/widgets/log_in_form.dart';
import 'package:hotelapp/feature/auth/login_screen/presentation/pages/widgets/social_button.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(25.h),
          Text(
            "Welcome Back!",
            style: TextStyle(
              color: Colors.black,
              fontSize: 25.sp,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
          Text(
            "Enter your login information",
            style: TextStyle(color: Colors.grey, fontSize: 14.sp),
          ),

          verticalSpace(20.h),

          Row(
            children: [
              Expanded(
                child: SocialButton(
                  text: "Google",
                  icon: Image.asset(
                    "assets/icons/google.png",
                    height: 20,
                    width: 20,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: SocialButton(
                  text: "Facebook",
                  icon: Image.asset(
                    "assets/icons/faceBook.png",
                    height: 20,
                    width: 20,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          const LogInForm(),
        ],
      ),
    );
  }
}
