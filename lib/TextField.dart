import 'package:flutter/material.dart';

extension FlutterUIModifiersTextField on TextField {
  /// A modifier that sets its Text's style.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// TextField()
  ///     .style(TextStyle(color: Colors.blue));
  /// ```
  TextField style(TextStyle? style) {
    return _rebase(style: style);
  }

  /// Internal modifier for modifying final properties.
  TextField _rebase({
    TextAlign? align,
    TextDirection? direction,
    TextStyle? style,
  }) {
    return TextField(
      key: key,
      textAlign: align ?? textAlign,
      textDirection: direction ?? textDirection,
      style: style ?? this.style,
    );
  }
}
