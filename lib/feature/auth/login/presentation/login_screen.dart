import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/core/helpers/extensions.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/core/utils/app_assets.dart';
import 'package:hotelapp/feature/auth/login/presentation/logic/login_cubit.dart';
import 'package:hotelapp/feature/auth/login/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt()),
      child: Scaffold(
        backgroundColor: AppColors.authBackgroundOffWhite,
        appBar: AppBar(
          backgroundColor: AppColors.authBackgroundOffWhite,
          title: Text(
            "Midyaf",
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

        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    Assets.assetsImagesLogin,
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                verticalSpace(10),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: AppColors.normalTextBlack,
                    fontWeight: FontWeightHelper.semiBold,
                    fontSize: 28.sp,
                  ),
                ),

                verticalSpace(5),
                Text(
                  "sign in to manage your booking and stays",
                  style: TextStyle(
                    color: AppColors.unSelectedItemColorGrey,
                    fontWeight: FontWeightHelper.regular,
                    fontSize: 14.sp,
                  ),
                ),
                verticalSpace(10),
                const LoginForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
