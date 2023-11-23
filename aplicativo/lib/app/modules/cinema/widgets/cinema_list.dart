import 'package:aplicativo/app/core/color_constsnts.dart';
import 'package:aplicativo/app/core/enum/seat_enum.dart';
import 'package:aplicativo/app/data/models/seat.dart';
import 'package:aplicativo/app/modules/cinema/widgets/seat_widget.dart';
import 'package:flutter/material.dart';

class CinemaList extends StatelessWidget {
  final List<Seat>? seats;

  const CinemaList({super.key, required this.seats});

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: seats!.map((seat) {
      Color colorSeat = Colors.green;

      if (seat.hold) {
        colorSeat = ColorConstants.hold;
      } else if (seat.occupied) {
        colorSeat = ColorConstants.occupied;
      } else {
        colorSeat = switch (seat.type) {
          SeatType.normal => ColorConstants.normal,
          SeatType.special => ColorConstants.special,
          SeatType.vip => ColorConstants.vip,
        };
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SeatWidget(
          colorSeat: colorSeat,
          seat: seat,
        ),
      );
    }).toList());
  }
}
