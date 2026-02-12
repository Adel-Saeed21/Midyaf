import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';

class TermsAndConditionsText extends StatelessWidget {
  final VoidCallback? onTermsTapped;
  final VoidCallback? onPrivacyTapped;

  const TermsAndConditionsText({
    super.key,
    this.onTermsTapped,
    this.onPrivacyTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: AppColors.unSelectedItemColorGrey,
            fontSize: 12.sp,
            fontWeight: FontWeightHelper.regular,
          ),
          children: [
            const TextSpan(text: "By selecting Create Account, you agree to our "),
            TextSpan(
              text: "Terms of Service",
              style: TextStyle(
                color: AppColors.buttonColorBabyBlue,
                fontWeight: FontWeightHelper.medium,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onTermsTapped ?? () {
                  // TODO: Navigate to Terms of Service
                  print("Terms of Service tapped");
                },
            ),
            const TextSpan(text: " and "),
            TextSpan(
              text: "Privacy Policy",
              style: TextStyle(
                color: AppColors.buttonColorBabyBlue,
                fontWeight: FontWeightHelper.medium,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = onPrivacyTapped ?? () {
                  print("Privacy Policy tapped");
                },
            ),
            const TextSpan(text: "."),
          ],
        ),
      ),
    );
  }
}