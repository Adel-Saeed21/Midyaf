import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/core/utils/app_assets.dart';
import 'package:hotelapp/core/widgets/app_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              Assets.assetsImagesOnboardingBackground,
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    verticalSpace(70.h),
                    Text(
                      "Find the\nBest Hotel",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeightHelper.bold,
                        fontSize: 40.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Welcome To Stay App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeightHelper.regular,
                        fontSize: 16.sp,
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                    verticalSpace(300.h),
                    AppButton(
                      buttonHeight: 40.h,
                      buttonWidth: 280.w,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                      ),
                      onPressed: () {
                        //  context.pushNamed(Routes.signupScreen);
                      },
                      backgroundColor: AppColors.buttonColorBabyBlue,
                      radius: 20.r,
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          color: AppColors.textButtonWhite,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
