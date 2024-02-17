import 'package:flutter/material.dart';

class ColorPalette {
  static ColorScheme colorScheme = const ColorScheme.light(
    primary: neonPurple,
    secondary: neonPink,
  );
  static const Color neonPurple = Color(0xff8F00FF);
  static const Color neonPink = Color(0xffD335F5);
  static const Color pink = Color(0xffC750FF);
  static const Color whiteGray = Color(0xffBDBDBD);

  static const purplePinkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      neonPurple,
      neonPink,
    ],
  );
}