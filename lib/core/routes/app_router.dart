import 'package:currency_converter/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import '../../presentation/screens/settings/settings_screen.dart';

class AppRouter {

  static const String home = "/";
  static const String settings = "/settings";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

      case AppRouter.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Route not found"),
            ),
          ),
        );
    }
  }
}