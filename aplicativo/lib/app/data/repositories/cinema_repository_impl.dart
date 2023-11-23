import 'package:aplicativo/app/data/models/seat.dart';
import 'package:aplicativo/app/data/repositories/cinema_repository.dart';
import 'package:dio/dio.dart';

class CinemaRepositoryImpl implements CinemaRepository {
  final Dio _rest;

  CinemaRepositoryImpl({required Dio rest}) : _rest = rest;

  @override
  Future<List<Seat>?> getSeats() async {
    final response = await _rest.get('http://192.168.5.52:8080/seats');
    if (response.statusCode == 200) {
      return (response.data as List).map((seat) => Seat.fromMap(seat)).toList();
    }

    return null;
  }

  @override
  Future<bool> holdOrRelaseSeat(int id, bool hold) async {
    _rest.options.headers['socket-channel'] = "/seats/";
    final response = await _rest.put('http://192.168.5.52:8080/seats/$id', data: {'hold': hold});
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> buySeat(int id, bool occupied) async {
    _rest.options.headers['socket-channel'] = "/seats/";

    final response = await _rest.put('http://192.168.5.52:8080/seats/$id', data: {'occupied': occupied, 'hold': false});

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
