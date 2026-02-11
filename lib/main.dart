import 'package:flutter/material.dart';
import 'package:hotelapp/core/Di/get_it.dart';
import 'package:hotelapp/core/routing/app_route.dart';
import 'package:hotelapp/core/routing/routes.dart';
import 'package:hotelapp/midyaf_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initializeApp();

  final initialRoute = await _determineInitialRoute();

  runApp(MidyafApp(appRouter: AppRoute(), initialRoute: initialRoute));
}

Future<void> _initializeApp() async {
  setupDi();
}

Future<String> _determineInitialRoute() async {
  return Routes.onboardingScreen;
}
