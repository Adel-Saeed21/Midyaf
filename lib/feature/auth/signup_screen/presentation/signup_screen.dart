import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/extensions.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign up",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeightHelper.semiBold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 20.w, left: 20.w, top: 20.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(10.h),
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.sp,
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ),

              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeightHelper.regular,
                  fontSize: 12.sp,
                ),
              ),

              verticalSpace(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
