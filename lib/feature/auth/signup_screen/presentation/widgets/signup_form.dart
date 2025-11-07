import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:hotelapp/core/themes/app_colors.dart';
import 'package:hotelapp/core/widgets/app_button.dart';
import 'signup_pages.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Form keys for each step
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();

  // Controllers
  final _firstNameCtrl = TextEditingController();
  final _lastNameCtrl = TextEditingController();
  final _userNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _countryCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _pageController.dispose();
    _firstNameCtrl.dispose();
    _lastNameCtrl.dispose();
    _userNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _countryCtrl.dispose();
    _cityCtrl.dispose();
    _addressCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  void _nextPage() {
    GlobalKey<FormState> currentFormKey;

    switch (_currentPage) {
      case 0:
        currentFormKey = _formKey1;
        break;
      case 1:
        currentFormKey = _formKey2;
        break;
      case 2:
        currentFormKey = _formKey3;
        break;
      case 3:
        currentFormKey = _formKey4;
        break;
      default:
        return;
    }

    if (currentFormKey.currentState?.validate() ?? false) {
      if (_currentPage < 3) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      } else {
        _submitForm();
      }
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _submitForm() {
    // Handle signup logic here
    print('Form submitted!');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        SmoothPageIndicator(
          controller: _pageController,
          count: 4,
          effect: WormEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            activeDotColor: AppColors.blackColor,
            dotColor: AppColors.greyColor,
          ),
        ),
        SizedBox(height: 30.h),

        SizedBox(
          height: 400.h,
          child: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            children: [
              SignupPage1(
                formKey: _formKey1,
                firstNameCtrl: _firstNameCtrl,
                lastNameCtrl: _lastNameCtrl,
                userNameCtrl: _userNameCtrl,
              ),
              SignupPage2(
                formKey: _formKey2,
                emailCtrl: _emailCtrl,
                phoneCtrl: _phoneCtrl,
              ),
              SignupPage3(
                formKey: _formKey3,
                countryCtrl: _countryCtrl,
                cityCtrl: _cityCtrl,
                addressCtrl: _addressCtrl,
              ),
              SignupPage4(
                formKey: _formKey4,
                passwordCtrl: _passwordCtrl,
                confirmPasswordCtrl: _confirmPasswordCtrl,
                obscurePassword: _obscurePassword,
                obscureConfirm: _obscureConfirm,
                onTogglePassword: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
                onToggleConfirm: () {
                  setState(() => _obscureConfirm = !_obscureConfirm);
                },
              ),
            ],
          ),
        ),

        SizedBox(height: 30.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_currentPage > 0)
              AppButton(
                onPressed: _previousPage,
                backgroundColor: Colors.white,
                borderSide: BorderSide(color: AppColors.blackColor),
                radius: 25,
                buttonWidth: 120.w,
                child: Text(
                  "Back",
                  style: TextStyle(color: AppColors.blackColor, fontSize: 16),
                ),
              ),
            if (_currentPage > 0) SizedBox(width: 20.w),
            AppButton(
              onPressed: _nextPage,
              backgroundColor: Colors.black,
              borderSide: const BorderSide(color: Colors.white),
              radius: 25,
              buttonWidth: _currentPage > 0 ? 120.w : 280.w,
              child: Text(
                _currentPage == 3 ? "Sign Up" : "Next",
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
