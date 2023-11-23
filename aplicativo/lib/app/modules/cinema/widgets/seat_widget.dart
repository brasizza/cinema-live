import 'package:aplicativo/app/data/models/seat.dart';
import 'package:aplicativo/app/modules/cinema/cubit/cinema_cubit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SeatWidget extends StatelessWidget {
  final Color colorSeat;
  final Seat seat;

  const SeatWidget({super.key, required this.colorSeat, required this.seat});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CinemaCubit>();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (seat.occupied) {
          print("Nao pode fazer nada");
        } else {
          controller.holdOrRelaseSeat(seat);
        }
      },
      onDoubleTap: () {
        if (!seat.hold && !seat.occupied) {
          controller.buySeat(seat);
        }
      },
      child: Column(
        children: [
          Text(seat.seat),
          Image.asset(
            'assets/images/seat.png',
            color: colorSeat,
            width: 100,
          ),
          Visibility(
            visible: !seat.occupied,
            replacement: const Text('----'),
            child: Text(
              seat.price.toString(),
            ),
          ),
        ],
      ),
    );
  }
}
