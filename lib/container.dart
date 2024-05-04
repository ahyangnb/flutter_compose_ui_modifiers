import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

/// Container(Text(""), Modifier())
// class CContainer extends StatelessWidget {
//   final Widget child;
//   final Widget modifier;
//
//   CContainer(this.child, this.modifier);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(child: child).apply(modifier);
//   }
// }

/// Contains the modifier members of the [Container] class.
///
/// The reason that [FlutterUIModifiersContainer] resides inside this file is
/// because it provides the `rebase()` method of which is fileprivate.
extension FlutterUIModifiersContainer on Container {
  Container set(Widget? child) {
    return rebase(child: child);
  }

  // Widget apply(Widget modifier) {
  //   return modifier.apply(this);
  // }

  Container setAlignment(AlignmentGeometry? alignment) {
    return rebase(alignment: alignment);
  }

  Container marginTop(double topMargin) {
    return rebase(margin: EdgeInsets.only(top: topMargin));
  }

  Container alignment(AlignmentGeometry? alignment) {
    return rebase(alignment: alignment);
  }

  Container setSize(double size) {
    return rebase(width: size, height: size);
  }

  Container setWidth(double value) {
    return rebase(width: value);
  }

  Container width(double value) {
    return rebase(width: value);
  }

  /// A modifier that sets its widget's background color
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Black text')
  ///     .backgroundColor(Colors.white)
  ///```
  Container backgroundColor(Color color) {
    return rebase(color: color);
  }

  Container cornerRadius(double radius) {
    return corner(radius);
  }

  /// A modifier that clips its widget's corners to the specified radius.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .corner(12);
  /// ```
  Container corner(double radius) {
    var border = BorderRadius.circular(radius);
    var decoration = BoxDecoration(borderRadius: border, color: this.color);
    if (this.decoration is BoxDecoration) {
      decoration = (this.decoration as BoxDecoration)
          .rebase(borderRadius: border, color: this.color);
    }
    return rebase(
      decoration: decoration,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  /// A modifier that sets its widget's frame size.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .frame(width: 50, height: 25);
  /// ```
  Container frame({double? width, double? height}) {
    return rebase(width: width, height: height);
  }

  /// A modifier that casts a box shadow under its widget.
  ///
  /// `.shadow()` can cast non-rectangular shadows if the box is non-rectangular
  /// (e.g., has a border radius or a circular shape).
  ///
  /// This modifier is similar to CSS box-shadow.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .shadow(4, blur: 40);
  /// ```
  Widget shadow(
    double radius, {
    Color color = const Color.fromRGBO(0, 0, 0, .5),
    double blur = 25,
    double x = 0,
    double y = 0,
  }) {
    var shadow = BoxShadow(
      color: color,
      spreadRadius: radius,
      blurRadius: blur,
      offset: Offset(x, y),
    );
    var decoration = BoxDecoration(boxShadow: [shadow]);
    if (this.decoration is BoxDecoration) {
      decoration = (this.decoration as BoxDecoration).rebase(
        boxShadow: [shadow],
      );
    }
    return rebase(decoration: decoration);
  }

  /// Internal modifier for modifying final properties.
  Container rebase({
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip? clipBehavior,
    Widget? child,
  }) {
    final Decoration? decorationNew = decoration ?? this.decoration;
    final colorNew = color ?? this.color;
    if (decorationNew is BoxDecoration) {
      decorationNew.copyWith(color: colorNew);
    }
    return Container(
      key: this.key,
      alignment: alignment ?? this.alignment,
      padding: padding ?? this.padding,
      color: decorationNew == null ? colorNew : null,
      decoration: decorationNew,
      foregroundDecoration: foregroundDecoration ?? this.foregroundDecoration,
      width: width,
      height: height,
      constraints: constraints ?? this.constraints,
      margin: margin ?? this.margin,
      transform: transform ?? this.transform,
      transformAlignment: transformAlignment ?? this.transformAlignment,
      child: child ?? this.child,
      clipBehavior: clipBehavior ?? this.clipBehavior,
    );
  }
}
