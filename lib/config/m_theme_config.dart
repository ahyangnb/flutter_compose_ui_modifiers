import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

class MConfig {
  static Function(String message)? showCustomToastValue;
  static Function(String message, String content, Function() onConfirm)?
  mCustomConfirmDialogValue;

  static Widget Function(Image)? customAssetsImage;

  static Widget? defNoDataImage;

  static String? assetImageWhenError;

  static String? assetImageWhenLoading;

  static String? assetImageLabelArrow;

  static RxBool isChildDataLoading = false.obs;

  static int pageLimit = 20;

  static String noDataText = 'No data yet';

  static String refreshText = "Refresh";

  static VoidCallback? onShowDialog;

  static Rx<MKeyZeroEvent> mKeyZeroEvent = Rx<MKeyZeroEvent>(MKeyZeroEvent());

  static String? assetImageIcCloseImage;
}

class MKeyZeroEvent {}

class MThemeConfig {
  static Color imageDefBgColor = Colors.grey[200]!;
  static TextStyle userInfoTitleStyle2 =
  TextStyle(color: Colors.white, fontSize: 16.px, height: 22.px / 16.px);

  static Color white = Colors.white;

  static double miniButtonTextSize = 15.px;

  static Color? progressBgColor;
  static Color? agreementLightColor;

  static BorderRadius miniButtonBorderRadius = buttonBorderRadius8;

  static Color scaffoldBg = Color(0xff00041A);

  static Size miniButtonSize = Size(135.px, 44.px);

  static Size miniButtonSizeInDialog = Size(127.px, 44.px);

  static double heightOfNavigationBar = 82.0.px;

  static double miniButtonTextSizeInDialog = 18.px;

  static double tabBarHeight = 43.5.px;

  /// Some dialog background color use it.
  static Color assistantColor = Color(0xffF86895);

  static final TextStyle yesTextStyle =
  TextStyle(color: mainColor, fontSize: 17.px, fontWeight: FontWeight.w600);
  static final TextStyle noTextStyle = TextStyle(
      color: assistantColor, fontSize: 17.px, fontWeight: FontWeight.w600);

  static Color grey = const Color(0xff999999);

  static Color? dialogBgColor;

  static Color? miniButtonTextColor;

  static var textFieldStyle = TextStyle(
    fontSize: 16.px,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    height: 22.5.px / 16.px,
  );

  static var bgWhite22 = Colors.white.withOpacity(0.22);

  static TextStyle textFieldHintStyle = MThemeConfig.textFieldStyle.copyWith(
      color:
      (MThemeConfig.textFieldStyle.color ?? Colors.white).withOpacity(0.7),
      fontWeight: FontWeight.w400);
  static TextStyle desStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.px,
    height: 22.5.px / 16.px,

    /// it's `-0.05` in design draw.
    letterSpacing: -0.5.px,
  );

  static Color primaryColor = const Color(0xff7DEAFF);
  static Color? toastSuccessTextColor = primaryColor;
  static Color? toastErrorTextColor = primaryColor;

  static Color get mainColor => primaryColor;

  static LinearGradient primaryGradient = const LinearGradient(
    colors: [
      Color(0xffFCAE45),
      Color(0xffFD211E),
      Color(0xff8739B1),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static LinearGradient get gradientMain => primaryGradient;

  static _ButtonColor button = _ButtonColor();
  static Color defButtonTextColor = Colors.white;
  static Color noDataTextColor = mainColor;
  static Color? cupertinoDialogTextColor;
  static TextStyle? noDataTextStyle;
  static const Color titleSecondColor9 = Color(0xff999999);
  static const Color titleColor9 = titleSecondColor9;

  static BorderRadius buttonBorderRadius8 = BorderRadius.circular(8.px);
  static double mediumButtonTextSize = 18.px;

  static Color selfTextMsgColor = Colors.white;

  static TextStyle messageTextStyle(bool isSelf) {
    return TextStyle(

      /// Will not use the `isSelf` to change the color right now.
      color: selfTextMsgColor,
      fontSize: 16.0.px,
      fontWeight: FontWeight.w400,

      /// Will not center look like.
      height: 22.px / 16.0.px,
    );
  }
}

class _ButtonColor {
  Gradient get primaryBackgroundGradient => MThemeConfig.primaryGradient;

  Color get primaryBackgroundColor => MThemeConfig.primaryColor;

  Color get secondaryBackgroundColor =>
      MThemeConfig.primaryColor.withOpacity(.5);

  Color get disableColor => const Color.fromRGBO(255, 255, 255, .3);
}
