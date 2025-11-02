import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotelapp/core/routing/app_route.dart';
import 'package:hotelapp/core/routing/routes.dart';
import 'package:hotelapp/hotel_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      child: HotelApp(appRouter: AppRoute(), initialRoute: Routes.startScreen),
    ),
  );
}
