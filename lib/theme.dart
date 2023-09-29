import 'package:flutter/material.dart';

class ColorThemes {
  static const primary = Color(0xff456638);
  static const primarygray = Color(0xffDFE6E0);
  static const lightgray = Color(0xffE0E0E0);
  static const silver = Color(0xffCCCCCC);
  static const gray = Colors.grey;
  static const darkgray = Color(0xff666666);
  static const black = Color(0xff070D01);
  static const red = Colors.red;
  static const white = Colors.white;
  static const appBackground = Color(0xffF9FAF5);
  static const colorFilterGrayScale = ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);
  static const colorFilterNone =
      ColorFilter.mode(Colors.transparent, BlendMode.saturation);
}
