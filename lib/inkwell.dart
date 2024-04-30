import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

extension FlutterComposeUiModifierEvent on Widget {
  Widget click(VoidCallback onTap) {
    return InkWell(onTap: onTap, child: this);
  }
}

extension FlutterComposeUiModifierCustom on Widget {
  Widget modifier(Widget modifier) {
    if (this is Row) {
      final rowModifier = this as Row;
      return rowModifier.set([...rowModifier.children, modifier]);
    }
    return this;
  }
}
