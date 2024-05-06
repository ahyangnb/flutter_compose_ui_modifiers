import 'package:flutter/material.dart';

extension FlutterUIModifiersWidgetLayout on Widget {
  Widget marginRight(double right) =>
      Container(margin: EdgeInsets.only(right: right), child: this);

  Positioned leftSet(double value) {
    if (this is Positioned) {
      final thisWidget = this as Positioned;
      return Positioned(
        child: thisWidget.child,
        left: value,
        right: thisWidget.right,
        bottom: thisWidget.bottom,
        top: thisWidget.top,
      );
    }
    return Positioned(left: value, child: this);
  }

  Positioned rightSet(double value) {
    if (this is Positioned) {
      final thisWidget = this as Positioned;
      return Positioned(
        child: thisWidget.child,
        left: thisWidget.left,
        right: value,
        bottom: thisWidget.bottom,
        top: thisWidget.top,
      );
    }
    return Positioned(right: value, child: this);
  }

  Positioned topSet(double value) {
    if (this is Positioned) {
      final thisWidget = this as Positioned;
      return Positioned(
        child: thisWidget.child,
        left: thisWidget.left,
        right: thisWidget.right,
        bottom: thisWidget.bottom,
        top: value,
      );
    }
    return Positioned(top: value, child: this);
  }

  Positioned bottomSet(double value) {
    if (this is Positioned) {
      final thisWidget = this as Positioned;
      return Positioned(
        child: thisWidget.child,
        left: thisWidget.left,
        right: thisWidget.right,
        bottom: value,
        top: thisWidget.top,
      );
    }
    return Positioned(bottom: value, child: this);
  }
}
