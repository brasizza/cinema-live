import 'package:aplicativo/app/modules/cinema/cinema_route.dart';
import 'package:aplicativo/app/modules/splash/splash_route.dart';
import 'package:flutter/material.dart';

sealed class Routes {
  static Route<dynamic> routes(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case '/':
        builder = SplashRoute().page;
        break;

      case '/cinema':
        builder = CinemaRoute().page;

      default:
        throw Exception('Route not found');
    }

    return MaterialPageRoute(builder: builder);
  }
}
