import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/m_str.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:get/get.dart';

mCustomConfirmDialog(String title, String content, Function() onConfirm) {
  if (MConfig.mCustomConfirmDialogValue != null) {
    MConfig.mCustomConfirmDialogValue!(title, content, onConfirm);
    return;
  }
  mLogger.d(
      "If you want custom the confirm dialog, please set MConfig.mCustomConfirmDialogValue");
  showDialog(
    context: Get.context!,
    builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(MStr.cancel),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(MStr.ok),
          ),
        ],
      );
    },
  );
}

Future<T?> mCupertinoConfirm<T>({
  required String title,
  required VoidCallback onYes,
}) {
  return showCupertinoDialog(
    context: Get.context!,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        // title: const Text('Confirm'),
        content: Text(
          title,
          style: TextStyle(
            color: Color(0xff111111),
            fontSize: 17.px,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text('No', style: MThemeConfig.noTextStyle),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: Text('Yes', style: MThemeConfig.yesTextStyle),
            onPressed: () async {
              onYes();
            },
          ),
        ],
      );
    },
  );
}
