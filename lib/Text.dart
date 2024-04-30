import 'dart:ui';

import 'package:flutter/material.dart';

import 'TextStyle.dart';

extension FlutterUIModifiersText on Text {
  /// A modifier that sets its Text's font to bold.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Hello, World!')
  ///     .bold();
  /// ```
  Text bold() {
    return font(weight: FontWeight.bold);
  }

  /// A modifier that sets its Text's color.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Hello, World!')
  ///     .color(Colors.red);
  /// ```
  Text color(Color? color) {
    return _rebase(
      style: FlutterUITextStyle.rebase(this.style, color: color),
    );
  }

  Text fontSize(double fontSize) {
    return _rebase(
      style: FlutterUITextStyle.rebase(this.style, fontSize: fontSize),
    );
  }

  Text heightSize(double lineHeight) {
    return _rebase(
      style: FlutterUITextStyle.rebase(this.style, height: lineHeight),
    );
  }

  /// A modifier that overrides its Text's layout direction.
  ///
  /// If set to `TextDirection.rtl` the leading side will be right instead of left.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Hello, World!')
  ///     .direction(TextDirection.rtl);
  /// ```
  Text direction(TextDirection? direction) {
    return _rebase(direction: direction);
  }

  /// A modifier that sets its Text's font.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Hello, World!')
  ///     .font(size: 18);
  /// ```
  Text font({
    double? size,
    FontWeight? weight,
    FontStyle? style,
    String? family,
    List<String>? familyFallback,
  }) {
    return _rebase(
      style: FlutterUITextStyle.rebase(
        this.style,
        fontSize: size,
        fontWeight: weight,
        fontStyle: style,
        fontFamily: family,
        fontFamilyFallback: familyFallback,
      ),
    );
  }

  /// A modifier that modifies whether and how to align text horizontally.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Hello, World!')
  ///     .multilineTextAlignment(TextAlign.start);
  /// ```
  Text multilineTextAlignment(TextAlign? alignment) {
    return _rebase(align: alignment);
  }

  /// A modifier that sets its Text's style.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Hello, World!')
  ///     .style(TextStyle(color: Colors.blue));
  /// ```
  Text style(TextStyle? style) {
    return _rebase(style: style);
  }

  /// Internal modifier for modifying final properties.
  Text _rebase({
    TextAlign? align,
    TextDirection? direction,
    TextStyle? style,
  }) {
    return Text(
      data ?? '',
      key: key,
      textAlign: align ?? textAlign,
      textDirection: direction ?? textDirection,
      style: style ?? this.style,
    );
  }
}
