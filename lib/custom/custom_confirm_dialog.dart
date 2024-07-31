import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/m_str.dart';
import 'package:flutter_compose_ui_modifiers/config/m_theme_config.dart';
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
