import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/themes/font_weight_helper.dart';

class UserTypeToggle extends StatelessWidget {
  final String selectedType;
  final ValueChanged<String> onTypeChanged;

  const UserTypeToggle({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I am signing up as a:",
          style: TextStyle(
            color: AppColors.normalTextBlack,
            fontSize: 15.sp,
            fontWeight: FontWeightHelper.medium,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildToggleButton(
                label: "Guest",
                icon: Icons.person,
                value: "guest",
                isSelected: selectedType == "guest",
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildToggleButton(
                label: "Manager",
                icon: Icons.business_center,
                value: "manager",
                isSelected: selectedType == "manager",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildToggleButton({
    required String label,
    required IconData icon,
    required String value,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => onTypeChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: isSelected ? AppColors.buttonColorBabyBlue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? AppColors.buttonColorBabyBlue
                : AppColors.unSelectedItemColorGrey,
            width: isSelected ? 2.w : 1.w,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: isSelected
                  ? AppColors.buttonColorBabyBlue
                  : AppColors.unSelectedItemColorGrey,
            ),
            SizedBox(width: 8.w),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? AppColors.buttonColorBabyBlue
                    : AppColors.normalTextBlack,
                fontSize: 15.sp,
                fontWeight: isSelected
                    ? FontWeightHelper.semiBold
                    : FontWeightHelper.medium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}