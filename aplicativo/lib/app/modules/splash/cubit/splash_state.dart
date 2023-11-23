part of 'splash_cubit.dart';

sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashLoading extends SplashState {
  final String step;
  SplashLoading({required this.step});
}

final class SplashLoaded extends SplashState {}
