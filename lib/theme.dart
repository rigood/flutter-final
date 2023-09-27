import 'package:flutter/material.dart';
import 'package:flutter_final/constants/sizes.dart';

class ColorThemes {
  static const primary = Color(0xff456638);
  static const primarygray = Color(0xffDFE6E0);
  static const gray = Colors.grey;
  static const lightgray = Color(0xffE0E0E0);
  static const black = Color(0xff070D01);
  static const red = Colors.red;
  static const white = Colors.white;
  static const secondary = Color(0xffFF6453);
  static const appBackground = Color(0xffF9FAF5);
}

class TextThemes {
  static const authTitle = TextStyle(
    fontSize: Sizes.size24,
    fontWeight: FontWeight.w400,
    color: ColorThemes.black,
  );
}
