
import 'package:flutter/material.dart';
import 'package:siketan/shared/view/not_found.dart';
import 'package:siketan/shared/view/splash_screen.dart';
import 'package:siketan/app/routes/route_name.dart';

class MyRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundPage(),
        );
    }
  }
}