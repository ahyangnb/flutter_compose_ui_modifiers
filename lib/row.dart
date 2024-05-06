import 'package:flutter/material.dart';

extension FlutterUIModifiersRowList on List {
  Row get row {
    return Row(children: <Widget>[...this]);
  }
}

extension FlutterUIModifiersRow on Row {
  Row childrenSet(List<Widget> children) {
    return rebase(children: children);
  }

  Row set(List<Widget> children) {
    return rebase(children: children);
  }

  Row setMainAxisAlignment(MainAxisAlignment value) {
    return rebase(mainAxisAlignment: value);
  }

  Row setCrossAxisAlignment(CrossAxisAlignment value) {
    return rebase(crossAxisAlignment: value);
  }

  /// Internal modifier for modifying final properties.
  Row rebase({
    MainAxisAlignment? mainAxisAlignment,
    MainAxisSize? mainAxisSize,
    CrossAxisAlignment? crossAxisAlignment,
    List<Widget>? children,
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
      children: children ?? this.children,
    );
  }
}
