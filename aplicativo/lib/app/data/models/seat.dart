// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aplicativo/app/core/enum/seat_enum.dart';

class Seat {
  final int id;
  final String seat;
  final double price;
  final bool hold;
  final bool occupied;
  final SeatType type;
  Seat({
    required this.id,
    required this.seat,
    required this.price,
    required this.hold,
    required this.occupied,
    required this.type,
  });

  Seat copyWith({
    int? id,
    String? seat,
    double? price,
    bool? hold,
    bool? occupied,
    SeatType? type,
  }) {
    return Seat(
      id: id ?? this.id,
      seat: seat ?? this.seat,
      price: price ?? this.price,
      hold: hold ?? this.hold,
      occupied: occupied ?? this.occupied,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'seat': seat,
      'price': price,
      'hold': hold,
      'occupied': occupied,
      'type': type.typeName,
    };
  }

  factory Seat.fromMap(Map<String, dynamic> map) {
    return Seat(
      id: map['id'] as int,
      seat: map['seat'] as String,
      price: map['price'] as double,
      hold: map['hold'] as bool,
      occupied: map['occupied'] as bool,
      type: SeatType.values.firstWhere((seatType) => seatType.typeName == map['type'], orElse: () => SeatType.normal),
    );
  }

  String toJson() => json.encode(toMap());

  factory Seat.fromJson(String source) => Seat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Seat(id: $id, seat: $seat, price: $price, hold: $hold, occupied: $occupied, type: $type)';
  }

  @override
  bool operator ==(covariant Seat other) {
    if (identical(this, other)) return true;

    return other.id == id && other.seat == seat && other.price == price && other.hold == hold && other.occupied == occupied && other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ seat.hashCode ^ price.hashCode ^ hold.hashCode ^ occupied.hashCode ^ type.hashCode;
  }
}
