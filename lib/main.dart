import 'package:flutter/material.dart';
import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/core/routing/app_route.dart';
import 'package:hotelapp/core/routing/routes.dart';
import 'package:hotelapp/midyaf_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDi();
  runApp(
    MidyafApp(appRouter: AppRoute(), initialRoute: Routes.onboardingScreen),
  );
}
