import 'package:flutter/material.dart';

class MThemeConfig {
  static var textFieldStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 22.5 / 16,
  );

  static var bgWhite22 = Colors.white.withOpacity(0.22);

  static TextStyle textFieldHintStyle = MThemeConfig.textFieldStyle.copyWith(
      color:
          (MThemeConfig.textFieldStyle.color ?? Colors.white).withOpacity(0.7),
      fontWeight: FontWeight.w400);
}
