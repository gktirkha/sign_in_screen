import 'package:flutter/material.dart';

import 'screen/logged_in_home.dart';
import 'screen/login.dart';

abstract class RouteName {
  static const String login = "/login";
  static const String loggedInHome = "/loggedInHome";
  static const String blank = "/blank";
}

abstract class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = settings.name;

    switch (route) {
      case RouteName.login:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case RouteName.loggedInHome:
        return MaterialPageRoute(
          builder: (context) => const LoggedInHome(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
    }
  }
}
