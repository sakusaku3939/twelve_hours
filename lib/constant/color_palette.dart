import 'package:flutter/material.dart';

class ColorPalette {
  static ColorScheme colorScheme = const ColorScheme.light(
    primary: purple,
    secondary: pink,
  );
  static const Color purple = Color(0xff8F00FF);
  static const Color pink = Color(0xffD335F5);

  static const purplePinkGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: <Color>[
      purple,
      pink,
    ],
  );
}