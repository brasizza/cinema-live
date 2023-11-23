import 'package:aplicativo/app/data/repositories/cinema_repository.dart';
import 'package:aplicativo/app/data/repositories/cinema_repository_impl.dart';
import 'package:aplicativo/app/modules/cinema/cinema_page.dart';
import 'package:aplicativo/app/modules/cinema/cubit/cinema_cubit.dart';
import 'package:aplicativo/app/routes/route_base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CinemaRoute implements RouteBase {
  @override
  Widget page(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CinemaRepository>(
          create: (context) => CinemaRepositoryImpl(rest: context.read()),
        ),
        Provider(
          create: (context) => CinemaCubit(repository: context.read(), socket: context.read()),
        ),
      ],
      builder: (context, _) => const CinemaPage(),
    );
  }
}
