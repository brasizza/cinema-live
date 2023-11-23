part of 'cinema_cubit.dart';

sealed class CinemaState {}

final class CinemaInitial extends CinemaState {}

final class CinemaLoading extends CinemaState {}

final class CinemaLoaded extends CinemaState {
  final List<Seat>? seats;
  CinemaLoaded({required this.seats});
}

final class CinemaError extends CinemaState {
  final String error;

  CinemaError({required this.error});
}
