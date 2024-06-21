import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';

class MConfig {
  static TextStyle userInfoTitleStyle2 =
      TextStyle(color: Colors.white, fontSize: 16.px, height: 22.px / 16.px);
  static Function(String message)? showCustomToastValue;
  static Function(String message, String content, Function() onConfirm)?
      mCustomConfirmDialogValue;

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

  static String? assetImageWhenError;

  static String? assetImageWhenLoading;

  static RxBool isChildDataLoading = false.obs;

  static int pageLimit = 20;

  static Color imageDefBgColor = Colors.grey[200]!;

  static String noDataText = 'No data yet';

  static String refreshText = "Refresh";
}

void mShowCustomToast(String value) {
  if (MConfig.showCustomToastValue == null) {
    mLogger.e("Please set MConfig.showCustomToastValue");
  } else {
    MConfig.showCustomToastValue!(value);
  }
}
