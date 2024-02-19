import 'package:flutter/material.dart';

class ColorPalette {
  static ColorScheme colorScheme = const ColorScheme.light(
    primary: neonPurple,
    secondary: neonPink,
  );
  static const Color neonPurple = Color(0xff8F00FF);
  static const Color neonPink = Color(0xffD335F5);
  static const Color pink = Color(0xffC750FF);
  static const Color darkPink = Color(0xffB414FF);
  static const Color whiteGray = Color(0xffE0E0E0);
  static const Color lightGray = Color(0xffBDBDBD);
  static const Color grey = Color(0xff9E9E9E);

  static const purplePinkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      neonPurple,
      neonPink,
    ],
  );
}
