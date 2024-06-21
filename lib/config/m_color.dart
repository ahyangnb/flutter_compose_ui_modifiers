import 'package:flutter/material.dart';

class MColor {
  static Color primaryColor = const Color(0xff7DEAFF);

  static Gradient primaryGradient = const LinearGradient(
    colors: [
      Color(0xffFCAE45),
      Color(0xffFD211E),
      Color(0xff8739B1),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static _ButtonColor button = _ButtonColor();

  static Color noDataTextColor = const Color(0xff9B678F);
  static TextStyle? noDataTextStyle;
}

class _ButtonColor {
  Gradient get primaryBackgroundGradient => MColor.primaryGradient;

  Color get primaryBackgroundColor => MColor.primaryColor;

  Color get secondaryBackgroundColor => MColor.primaryColor.withOpacity(.5);

  Color get disableColor => const Color.fromRGBO(255, 255, 255, .3);

  Color get textColor => Colors.white;
}
