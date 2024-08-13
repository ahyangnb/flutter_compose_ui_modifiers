import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/m_theme_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:oktoast/oktoast.dart';

void mShowToastMessage(
  String message, {
  IconData? icon,
  Color? color,
  Duration? duration,
  ToastPosition? position,
}) {
  showToastWidget(
    Container(
      constraints: BoxConstraints(maxWidth: 320.px),
      padding: EdgeInsets.symmetric(horizontal: 24.0.px, vertical: 12.0.px),
      decoration: BoxDecoration(
        color: color ?? Colors.black87,
        borderRadius: BorderRadius.circular(25.0.px),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: Colors.white),
          if (icon != null) SizedBox(width: 12.0.px),

          /// Construction box to set the size in 300 width.
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 250.px),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
    duration: duration ?? const Duration(seconds: 2),
    position: position ?? ToastPosition.center,
    dismissOtherToast: true,
  );
}

void mShowSuccessToast(String message) {
  mLogger.d('showSuccessToast::$message');
  mShowToastMessage(message,
      icon: Icons.check, color: MThemeConfig.primaryColor);
}

void mShowErrorToast(String message) {
  mLogger.d('showErrorToast::$message');
  mShowToastMessage(message,
      icon: Icons.close, color: MThemeConfig.primaryColor);
}

String lastMsg = '';
int lastTime = 0;

void mShowCustomToast(String message,
    {Duration? duration, ToastPosition? position}) {
  if (MConfig.showCustomToastValue == null) {
    if (DateTime.now().millisecondsSinceEpoch - 800 < lastTime &&
        lastMsg == message) {
      return;
    }
    lastMsg = message;
    lastTime = DateTime.now().millisecondsSinceEpoch;
    mLogger.d('🍞showCustomToast::$message, duration: ${duration.toString()}');
    mShowToastMessage(message, duration: duration, position: position);
  } else {
    MConfig.showCustomToastValue!(message);
  }
}

int showCustomToastInFiveSecondValue = 0;

void showCustomToastInFiveSecond(String message,
    {Duration? duration, ToastPosition? position}) {
  if (showCustomToastInFiveSecondValue != 0 &&
      DateTime.now().millisecondsSinceEpoch - showCustomToastInFiveSecondValue <
          5000) {
    return;
  }
  showCustomToastInFiveSecondValue = DateTime.now().millisecondsSinceEpoch;
  mLogger.d('showCustomToast::$message, duration: ${duration.toString()}');
  mShowToastMessage(message, duration: duration, position: position);
}

String lastDialogTag = '';

Future<void> mShowSmartDialog({
  required WidgetBuilder builder,
  required String tag,
  SmartDialogController? controller,
  Alignment? alignment,
  bool? bindPage,
  Color? maskColor,
  VoidCallback? onDismiss,
  Duration? animationTime,
  bool? useAnimation,
  SmartAnimationType? animationType,
  bool? clickMaskDismiss,
}) async {
  if (lastDialogTag == tag) {
    return;
  }
  lastDialogTag = tag;

  /// Hide keyboard.
  WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
  if (MConfig.onShowDialog != null) MConfig.onShowDialog!();
  return SmartDialog.show(
    builder: builder,
    controller: controller,
    alignment: alignment,
    tag: tag,
    bindPage: bindPage,
    maskColor: maskColor,
    animationTime: animationTime,
    useAnimation: useAnimation,
    animationType: animationType,
    clickMaskDismiss: clickMaskDismiss,
    debounce: true,
    keepSingle: true,
    onDismiss: () {
      lastDialogTag = '';
      if (onDismiss != null) {
        onDismiss();
      }
    },
  );
}

Future<void> mDismissSmartDialog({required String tag}) {
  lastDialogTag = '';
  return SmartDialog.dismiss<void>(tag: tag);
}
