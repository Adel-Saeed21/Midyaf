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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                Assets.assetsImagesOnboardingBackground,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo Icon
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 176, 167, 156),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.diamond_outlined,
                          color: AppColors.textButtonWhite,
                          size: 24.sp,
                        ),
                      ),
                      horizontalSpace(12),
                      // App Name
                      Text(
                        'Midyaf',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeightHelper.semiBold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(flex: 11),

                  // Main Content (centered)
                  Text(
                    "Discover Your\nPerfect Stay",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 40.sp,
                      color: AppColors.textButtonWhite,
                      height: 1.2,
                    ),
                  ),
                  verticalSpace(16),
                  Text(
                    "Book unique homes and\nexperiences all over the world.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeightHelper.regular,
                      fontSize: 16.sp,
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.9),
                      height: 1.5,
                    ),
                  ),

                  // Flexible spacer to push buttons to bottom
                  const Spacer(flex: 3),

                  // Get Started Button
                  AppButton(
                    buttonHeight: 56.h,
                    onPressed: () {
                      //  context.pushNamed(Routes.signupScreen);
                    },
                    backgroundColor: AppColors.buttonColorBabyBlue,
                    radius: 16.r,
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: AppColors.textButtonWhite,
                        fontSize: 16.sp,
                        fontWeight: FontWeightHelper.semiBold,
                      ),
                    ),
                  ),
                  verticalSpace(20),

                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          fontWeight: FontWeightHelper.regular,
                          fontSize: 14.sp,
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          "Log in",
                          style: TextStyle(
                            color: AppColors.textButtonWhite,
                            fontSize: 14.sp,
                            fontWeight: FontWeightHelper.semiBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(8),

                  // Privacy & Terms
                  Text(
                    'Privacy   •   Terms',
                    style: TextStyle(
                      fontWeight: FontWeightHelper.regular,
                      fontSize: 13.sp,
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  verticalSpace(16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
