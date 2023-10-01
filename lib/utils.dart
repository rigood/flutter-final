import 'package:flutter/material.dart';

void clsoeKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);

  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

Color getColorByIndex(int index) {
  switch (index) {
    case 0:
      return Colors.red;
    case 1:
      return Colors.brown;
    case 2:
      return const Color(0xffFBC02D);
    case 3:
      return Colors.lightGreen;
    case 4:
      return Colors.green;
    default:
      return Colors.grey;
  }
}

String getColorLabelByIndex(int index) {
  switch (index) {
    case 0:
      return "최악의 하루";
    case 1:
      return "기분 안좋은 날";
    case 2:
      return "보통날";
    case 3:
      return "기분 좋은 날";
    case 4:
      return "최고의 하루";
    default:
      return "기억 안나";
  }
}
