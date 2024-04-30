import 'package:flutter/material.dart';

extension FlutterUIModifiersWidgetLayout on Widget {
  Widget marginRight(double right) =>
      Container(margin: EdgeInsets.only(right: right), child: this);
}
