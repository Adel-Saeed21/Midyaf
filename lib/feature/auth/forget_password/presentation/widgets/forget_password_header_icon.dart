import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/themes/app_colors.dart';

class ForgetPasswordHeaderIcon extends StatelessWidget {
  const ForgetPasswordHeaderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: AppColors.buttonColorBabyBlue.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.lock_reset_rounded,
            size: 50.sp,
            color: AppColors.buttonColorBabyBlue,
          ),
        ),
        Positioned(
          top: 0,
          right: -4.w,
          child: Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: AppColors.buttonColorBabyBlue,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.email_rounded,
              size: 14.sp,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}