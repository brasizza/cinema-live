import 'package:flutter/material.dart';

sealed class ColorConstants {
  static Color get normal => Colors.green;
  static Color get special => Colors.orangeAccent;
  static Color get vip => const Color.fromARGB(255, 121, 110, 12);
  static Color get occupied => Colors.black;
  static Color get hold => Colors.deepPurple;
}
