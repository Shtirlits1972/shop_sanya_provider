import 'package:flutter/material.dart';
import 'package:shop_sanya/CardForm.dart';
import 'package:shop_sanya/main.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => MyApp(),
        );
      case '/CardForm':
        return MaterialPageRoute(
          builder: (context) => CardForm(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => MyApp(),
        );
    }
  }
}
