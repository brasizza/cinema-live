import 'package:aplicativo/app/core/socket/socket_rest.dart';
import 'package:aplicativo/app/data/models/seat.dart';
import 'package:aplicativo/app/data/repositories/cinema_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cinema_state.dart';

class CinemaCubit extends Cubit<CinemaState> {
  final SocketRest _socket;
  final CinemaRepository _repository;

  CinemaCubit({required CinemaRepository repository, required SocketRest socket})
      : _repository = repository,
        _socket = socket,
        super(CinemaInitial());

  Future<void> getSeats({bool showLoading = true}) async {
    if (showLoading) {
      emit(CinemaLoading());
    }

    final seats = await _repository.getSeats();

    emit(CinemaLoaded(seats: seats));
  }

  void holdOrRelaseSeat(Seat seat) async {
    final changed = await _repository.holdOrRelaseSeat(seat.id, !seat.hold);
    if (changed) {
      getSeats();
    }
  }

  Future<void> buySeat(Seat seat) async {
    if (await _repository.buySeat(seat.id, true)) {
      getSeats();
    }
  }

  void listenSeats() {
    _socket.addChannel('/seats/', (data) {
      getSeats(showLoading: false);
    });
  }
}
