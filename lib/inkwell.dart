import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

extension FlutterComposeUiModifierEvent on Widget {
  InkWell click(VoidCallback onTap) {
    return InkWell(onTap: onTap, child: this);
  }
}
