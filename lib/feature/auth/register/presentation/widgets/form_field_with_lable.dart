import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';
import 'package:hotelapp/core/widgets/app_text_form_field.dart';

class FormFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final bool isSecure;

  const FormFieldWithLabel({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.validator,
    this.suffixIcon,
    this.isSecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        AppTextFormField(
          controller: controller,
          borderRadius: 8.r,
          focusedBorderColor: AppColors.buttonColorBabyBlue,
          enabledBorderColor: AppColors.unSelectedItemColorGrey,
          hintText: hintText,
          validator: validator,
          suffixIcon: suffixIcon,
          obscureText: isSecure,
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.normalTextBlack,
          fontSize: 15.sp,
          fontWeight: FontWeightHelper.medium,
        ),
      ),
    );
  }
}

class PasswordFieldWithLabel extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;

  const PasswordFieldWithLabel({
    super.key,
    required this.label,
    required this.controller,
    required this.hintText,
    this.validator,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel(label),
        AppTextFormField(
          controller: controller,
          borderRadius: 8.r,
          focusedBorderColor: AppColors.buttonColorBabyBlue,
          enabledBorderColor: AppColors.unSelectedItemColorGrey,
          hintText: hintText,
          obscureText: !isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: AppColors.unSelectedItemColorGrey,
            ),
            onPressed: onToggleVisibility,
          ),
          validator: validator,
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.normalTextBlack,
          fontSize: 15.sp,
          fontWeight: FontWeightHelper.medium,
        ),
      ),
    );
  }
}

class CountryCodeDropdown extends StatelessWidget {
  final String selectedCode;
  final ValueChanged<String> onChanged;
  final List<String> countryCodes;

  const CountryCodeDropdown({
    super.key,
    required this.selectedCode,
    required this.onChanged,
    this.countryCodes = const ['+1', '+20', '+44', '+91', '+971'],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.unSelectedItemColorGrey,
          width: 1.3.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        value: selectedCode,
        underline: const SizedBox(),
        items: countryCodes
            .map((code) => DropdownMenuItem(value: code, child: Text(code)))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
      ),
    );
  }
}
