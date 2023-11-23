import 'package:aplicativo/app/modules/cinema/cubit/cinema_cubit.dart';
import 'package:aplicativo/app/modules/cinema/widgets/cinema_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CinemaPage extends StatefulWidget {
  const CinemaPage({super.key});

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  @override
  void initState() {
    super.initState();

    context.read<CinemaCubit>().listenSeats();
    context.read<CinemaCubit>().getSeats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<CinemaCubit, CinemaState>(builder: (context, state) {
      return switch (state) {
        CinemaInitial() => const SizedBox(),
        CinemaLoading() => const CircularProgressIndicator.adaptive(),
        CinemaLoaded() => SingleChildScrollView(child: CinemaList(seats: state.seats)),
        CinemaError() => Text(state.error),
      };
    }));
  }
}
