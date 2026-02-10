import 'package:flutter/material.dart';
import 'package:hotelapp/core/routing/routes.dart';
import 'package:hotelapp/feature/onboarding/onboarding_screen.dart';

class AppRoute {
  Route generateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case Routes.onboardingScreen:
        page = const OnboardingScreen();
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
