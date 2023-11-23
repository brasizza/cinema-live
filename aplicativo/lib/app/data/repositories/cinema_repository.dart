import 'package:aplicativo/app/data/models/seat.dart';

abstract class CinemaRepository {
  Future<List<Seat>?> getSeats();

  Future<bool> holdOrRelaseSeat(int id, bool hold);

  Future<bool> buySeat(int id, bool occupied);
}
