import 'dart:math';

import 'package:flutter/material.dart';

abstract class Palette {
  static const Color primary = Color(0xffFCE900);
  static const Color first = Color(0xff5F6F65);
  static const Color second = Color(0xff808D7C);
  static const Color thrid = Color(0xff9CA986);
  static const Color four = Color(0xffC9BABF);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color cream = Color(0xffEDE8DC);
  static const Color blue = Color(0xff55679c);
  static const Color red = Color(0xffFF0000);
  static const Color violet = Color(0xff461959);
  static const Color grey = Colors.grey;
  static const Color grey1 = Color(0xff43405D);
  static const Color blue1 = Color(0xff161D6F);
  static const Color blue2 = Color(0xff1572A1);

  static const Color brown = Color(0xff424242);

  static const Color green = Color(0xffECFFE6);
  static const Color green1 = Color(0xff629584);

  static const Color scaffoldBackgroundColor = Color(0xffFFFFFF);
}

MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) {
  return max(0, min((value + ((255 - value) * factor)).round(), 255));
}

Color tintColor(Color color, double factor) {
  return Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1,
  );
}

int shadeValue(int value, double factor) {
  return max(0, min(value - (value * factor).round(), 255));
}

Color shadeColor(Color color, double factor) {
  return Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1,
  );
}
