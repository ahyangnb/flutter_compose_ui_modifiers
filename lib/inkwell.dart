import 'package:flutter/material.dart';

extension FlutterComposeUiModifierEvent on Widget {
  InkWell click(VoidCallback onTap) {
    return InkWell(onTap: onTap, child: this);
  }
}
