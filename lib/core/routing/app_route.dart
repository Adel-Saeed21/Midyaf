import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/core/Di/login_screen_di.dart';
import 'package:hotelapp/core/Di/register_screen_di.dart';
import 'package:hotelapp/core/routing/routes.dart';
import 'package:hotelapp/feature/auth/login/presentation/login_screen.dart';
import 'package:hotelapp/feature/auth/register/presentation/logic/register_cubit.dart';
import 'package:hotelapp/feature/auth/register/presentation/register_screen.dart';
import 'package:hotelapp/feature/onboarding/onboarding_screen.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case Routes.onboardingScreen:
        page = const OnboardingScreen();
        break;

      case Routes.registerScreen:
        registerScreenDi();
        page = BlocProvider(
          create: (context) => getIt<RegisterCubit>(),
          child: const RegisterScreen(),
        );
        break;
      case Routes.loginScreen:
        loginScreenDi();
        page = const LoginScreen();
        break;
      default:
        page = const Scaffold(body: Center(child: Text('Route not found')));
    }

    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 280),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.05, 0),
            end: Offset.zero,
          ).animate(animation),
          child: FadeTransition(opacity: animation, child: child),
        );
      },
    );
  }
}
