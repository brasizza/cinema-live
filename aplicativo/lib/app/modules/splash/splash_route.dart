import 'package:aplicativo/app/modules/splash/cubit/splash_cubit.dart';
import 'package:aplicativo/app/modules/splash/splash_page.dart';
import 'package:aplicativo/app/routes/route_base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashRoute implements RouteBase {
  @override
  Widget page(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => SplashCubit()),
      ],
      builder: (context, widget) => const SplashPage(),
    );
  }
}
