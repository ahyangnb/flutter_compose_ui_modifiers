import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

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

  Positioned positioned({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (this is Positioned) {
      final thisWidget = this as Positioned;
      return Positioned(
        child: thisWidget.child,
        left: left ?? thisWidget.left,
        right: right ?? thisWidget.right,
        bottom: bottom ?? thisWidget.bottom,
        top: top ?? thisWidget.top,
      );
    }
    return Positioned(
        left: left, top: top, right: right, bottom: bottom, child: this);
  }

  Container heightSet(double value) => setHeight(value);

  Container setHeight(double value) {
    if (this is SizedBox) {
      final thisWidget = this as SizedBox;
      return Container(
          child: thisWidget.child, width: thisWidget.width, height: value);
    }
    if (this is Container) {
      return (this as Container).setHeight(value);
    }
    return Container(height: value, child: this);
  }

  Container widthSet(double value) => setWidth(value);

  Container setWidth(double value) {
    if (this is SizedBox) {
      final thisWidget = this as SizedBox;
      return Container(
          child: thisWidget.child, width: value, height: thisWidget.height);
    }
    if (this is Container) {
      return (this as Container).setWidth(value);
    }
    return Container(width: value, child: this);
  }

  SafeArea safeArea({
    final bool left = true,
    final bool top = true,
    final bool right = true,
    final bool bottom = true,
    final EdgeInsets minimum = EdgeInsets.zero,
    final bool maintainBottomViewPadding = false,
  }) {
    return SafeArea(
      child: this,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      minimum: minimum,
      maintainBottomViewPadding: maintainBottomViewPadding,
    );
  }

  GestureDetector autoHideKeyboard(BuildContext context) {
    return GestureDetector(
      child: this,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
    );
  }

  Material material() {
    return Material(child: this, type: MaterialType.transparency);
  }
}
