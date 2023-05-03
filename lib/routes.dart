import 'package:flutter/material.dart';

import 'home.dart';
import 'login.dart';

class RouteName {
  static const String login = "/login";
  static const String home = "/home";
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = settings.name;

    switch (route) {
      case RouteName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case RouteName.home:
        return MaterialPageRoute(
          builder: (context) => const Home(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
    }
  }
}
