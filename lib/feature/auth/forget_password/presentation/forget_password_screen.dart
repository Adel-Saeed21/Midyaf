import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/core/helpers/extensions.dart';
import 'package:hotelapp/core/helpers/spacing.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/feature/auth/forget_password/presentation/logic/forget_password_cubit.dart';
import 'package:hotelapp/feature/auth/forget_password/presentation/logic/forget_password_state.dart';
import 'package:hotelapp/feature/auth/forget_password/presentation/widgets/forget_password_email_section.dart';
import 'package:hotelapp/feature/auth/forget_password/presentation/widgets/forget_password_header_icon.dart';
import 'package:hotelapp/feature/auth/forget_password/presentation/widgets/forget_password_reset_section.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(getIt(), getIt()),
      child: const _ForgetPasswordView(),
    );
  }
}

class _ForgetPasswordView extends StatefulWidget {
  const _ForgetPasswordView();

  @override
  State<_ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<_ForgetPasswordView> {
  final GlobalKey<FormState> _emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _resetFormKey = GlobalKey<FormState>();

  bool _showResetFields = false;

  void _triggerTransition() {
    setState(() => _showResetFields = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackgroundOffWhite,
      appBar: AppBar(
        backgroundColor: AppColors.authBackgroundOffWhite,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.normalTextBlack),
        ),
      ),
      body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            _triggerTransition();
          } else if (state is ForgetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            context.pop();
          } else if (state is ResetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();
          final isLoading =
              state is ForgetPasswordLoading || state is ResetPasswordLoading;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            child: Column(
              children: [
                const ForgetPasswordHeaderIcon(),
                verticalSpace(32),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0, 0.15),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                  child: _showResetFields
                      ? ForgetPasswordResetSection(
                          key: const ValueKey('reset'),
                          cubit: cubit,
                          isLoading: isLoading,
                          formKey: _resetFormKey,
                        )
                      : ForgetPasswordEmailSection(
                          key: const ValueKey('email'),
                          cubit: cubit,
                          isLoading: isLoading,
                          formKey: _emailFormKey,
                        ),
                ),
                verticalSpace(32),
                const _BottomLoginLink(),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _BottomLoginLink extends StatelessWidget {
  const _BottomLoginLink();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Remember Password? ",
          style: TextStyle(
            color: AppColors.unSelectedItemColorGrey,
            fontSize: 14.sp,
          ),
        ),
        GestureDetector(
          onTap: () => context.pop(),
          child: Text(
            "Login",
            style: TextStyle(
              color: AppColors.buttonColorBabyBlue,
              fontSize: 14.sp,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
      ],
    );
  }
}
