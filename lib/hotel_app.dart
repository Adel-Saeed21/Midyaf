import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelapp/core/routing/app_route.dart';
import 'package:hotelapp/feature/riverpod_test/river_home.dart';

class HotelApp extends StatelessWidget {
  const HotelApp({
    super.key,
    required this.appRouter,
    required this.initialRoute,
  });
  final AppRoute appRouter;
  final String initialRoute;
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize:  Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        // initialRoute: initialRoute,
        // onGenerateRoute: appRouter.generateRoute,
        home: RiverHome(),
      ),
    );
  }
}
