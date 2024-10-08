import 'package:flutter/material.dart';

/// Generic button, supports FlutterUI Modifiers.
///
/// Note: This class actually belongs to the FlutterUI package.
///
/// ignore: must_be_immutable
class Button extends TextButton {
  Button(
    Widget Function()? child, {
    Key? key,
  }) : super(
          key: key,
          onPressed: null,
          child: child != null ? child() : const SizedBox(),
        ) {
    _disabled = false;
  }

  bool? _disabled;

  Button._private({
    Key? key,
    bool? disabled,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    Clip clipBehavior = Clip.none,
    required Widget child,
  }) : super(
          key: key,
          onPressed: true == disabled ? null : onPressed,
          onLongPress: onLongPress,
          style: style,
          focusNode: focusNode,
          autofocus: autofocus,
          clipBehavior: clipBehavior,
          child: child,
        ) {
    _disabled = disabled ?? false;
  }

  /// A modifier that sets its Button's background color
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Button(() => Text('Beautiful colors!'))
  ///     .backgroundColor(Colors.red)
  ///```
  Button backgroundColor(Color? color) {
    return _rebase(
      style: FlutterUIButtonStyle.rebase(
        style,
        backgroundColor: MaterialStateProperty.all(color),
      ),
    );
  }

  /// A modifier that disabled the Button, making it unable for the user to press
  /// it.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Button(() => Text("Tap me if you can"))
  ///     .disabled(true);
  /// ``
  Button disabled(bool? disabled) {
    return _rebase(disabled: disabled ?? true);
  }

  /// A modifier that sets its Button's onLongPress handler.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Button(() => Text("Tap me for long"))
  ///     .onLongTap(() => print("Tapped!"));
  /// ```
  Button onLongTap(VoidCallback perform) {
    return _rebase(onLongPress: perform);
  }

  /// A modifier that sets its Button's onPress handler.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Button(() => Text("Tap me"))
  ///     .onTap(() => print("Tapped!"));
  /// ```
  Button onTap(VoidCallback perform) {
    return _rebase(onPressed: perform);
  }

  Button _rebase({
    bool? disabled,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool? autofocus,
    Clip? clipBehavior,
    Widget? child,
  }) {
    return Button._private(
      key: key,
      disabled: disabled ?? _disabled,
      onPressed: onPressed ?? this.onPressed,
      onLongPress: onLongPress ?? this.onLongPress,
      style: style ?? this.style,
      focusNode: focusNode ?? this.focusNode,
      autofocus: autofocus ?? this.autofocus,
      clipBehavior: clipBehavior ?? this.clipBehavior!,
      child: child ?? this.child ?? const SizedBox(),
    );
  }
}

extension FlutterUIButtonStyle on ButtonStyle {
  /// Method for modifying final properties.
  static ButtonStyle rebase(
    ButtonStyle? style, {
    MaterialStateProperty<Color?>? backgroundColor,
  }) {
    return ButtonStyle(
      backgroundColor: backgroundColor ?? style?.backgroundColor,
    );
  }
}
