import 'package:flutter/material.dart';

extension FlutterUIModifiersRow on Row {
  Row childrenSet(List<Widget> children) {
    return rebase(children: children);
  }

  Row set(List<Widget> children) {
    return rebase(children: children);
  }

  /// Internal modifier for modifying final properties.
  Row rebase({
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    List<Widget> children = const <Widget>[],
    TextDirection? textDirection,
    VerticalDirection? verticalDirection,
    TextBaseline? textBaseline,
  }) {
    return Row(
      key: key,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      mainAxisSize: mainAxisSize ?? this.mainAxisSize,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      textDirection: textDirection ?? this.textDirection,
      verticalDirection: verticalDirection ?? this.verticalDirection,
      textBaseline: textBaseline ?? this.textBaseline,
      children: children,
    );
  }
}
