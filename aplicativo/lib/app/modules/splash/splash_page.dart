import 'package:aplicativo/app/modules/splash/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashCubit>().loading();
    });

    return Scaffold(
        body: Column(
      children: [
        Lottie.asset('assets/lottie/splash.json'),
        BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
              Navigator.of(context).pushReplacementNamed('/cinema');
            }
          },
          builder: (context, state) {
            return switch (state) {
              SplashInitial() => const CircularProgressIndicator.adaptive(),
              SplashLoading() => Text(state.step),
              SplashLoaded() => const SizedBox(),
            };
          },
        ),
      ],
    ));
  }
}
