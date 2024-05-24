import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

class MConfig {
  static TextStyle userInfoTitleStyle2 =
      TextStyle(color: Colors.white, fontSize: 16.px, height: 22.px / 16.px);

  static var textFieldStyle = TextStyle(
    fontSize: 16.px,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 22.5.px / 16.px,
  );

  static var bgWhite22 = Colors.white.withOpacity(0.22);

  static TextStyle textFieldHintStyle = MConfig.textFieldStyle.copyWith(
      color: (MConfig.textFieldStyle.color ?? Colors.white).withOpacity(0.7),
      fontWeight: FontWeight.w400);

  static Widget? defNoDataImage;

  static RxBool isChildDataLoading = false.obs;

  static int pageLimit = 20;
}
