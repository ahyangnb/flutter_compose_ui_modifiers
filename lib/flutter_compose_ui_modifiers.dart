import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/container.dart';

export 'Button.dart';
export 'Icon.dart';
export 'ListView.dart';
export 'Text.dart';
export 'TextField.dart';
export 'image.dart';
export 'layout.dart';
export 'inkwell.dart';
export 'column.dart';
export 'row.dart';
export 'container.dart';
export 'm/m_scaffold.dart';
export 'm/m_appbar.dart';
export 'm/m_general.dart';
export 'm/m_listview.dart';
export 'm/m_text.dart';
export 'm/m_column.dart';
export 'manager/modifer_manager.dart';

/// Contains the modifier members of the [Widget] class.
///
/// The reason that [FlutterUIModifiersWidget] resides inside this file is
/// because it depends on the `_rebase()` method of
/// [FlutterUIModifiersContainer] which is fileprivate.
extension FlutterUIModifiersWidget on Widget {
  /// A modifier that aligns its widget within itself and optionally sizes itself
  /// based on the widget's size.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Hello, World!')
  ///     .align(Alignment.topRight);
  /// ```
  Widget align(Alignment alignment) {
    return Align(child: this, alignment: alignment);
  }

  /// A modifier that attempts to size the widget to a specific aspect ratio.
  Widget aspectRatio(double ratio) {
    return AspectRatio(child: this, aspectRatio: ratio);
  }

  /// A modifier that assigns its widget to a given [List].
  ///
  /// ## Example:
  ///
  /// ```dart
  /// List<Widget> list = [];
  /// Text('Item 1')
  ///     .frame(width: 20, height: 10)
  ///     .padding()
  ///     .bind(list);
  /// Text('Item 2')
  ///     .frame(width: 20, height: 10)
  ///     .padding()
  ///     .bind(list);
  ///```
  Widget assign(List<Widget> list) {
    list.add(this);
    return this;
  }

  /// A modifier that aligns its widget within itself and optionally sizes itself
  /// based on the widget's size.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Item 1')
  ///     .centered()
  ///```
  Widget centered() {
    return Center(
      child: this,
    );
  }

  /// A modifier that sets its widget's backgruond color
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Black text')
  ///     .backgroundColor(Colors.white)
  ///```
  Widget backgroundColor(Color color, {bool handover = true}) {
    if (handover && this is Container) {
      return (this as Container).backgroundColor(color);
    }
    return Container(child: this, color: color);
  }

  /// A modifier that clips its widget to an oval shape.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .clipOval();
  /// ```
  Widget clipOval({
    CustomClipper<Rect>? clipper,
    Clip behavior: Clip.antiAlias,
  }) {
    return ClipOval(child: this, clipper: clipper, clipBehavior: behavior);
  }

  /// A modifier that clips its widget to a path.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .clipPath();
  /// ```
  Widget clipPath({
    CustomClipper<Path>? clipper,
    Clip behavior: Clip.antiAlias,
  }) {
    return ClipPath(child: this, clipper: clipper, clipBehavior: behavior);
  }

  /// A modifier that clips its widget to a rectangular shape.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .clipRect();
  /// ```
  Widget clipRect({
    CustomClipper<Rect>? clipper,
    Clip behavior: Clip.hardEdge,
  }) {
    return ClipRect(child: this, clipper: clipper, clipBehavior: behavior);
  }

  Widget borderRadiusSet(double radius, {bool handover = true}) {
    return corner(radius, handover: handover);
  }

  /// A modifier that clips its widget's corners to the specified radius.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .corner(12);
  /// ```
  Widget corner(double radius, {bool handover = true}) {
    if (handover && this is Container) {
      return (this as Container).corner(radius);
    }
    return Container(
      child: this,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  /// A modifier that wraps its widget in an [Expanded] view.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .flex(1);
  /// ```
  Widget flex(int? flex) {
    return Expanded(child: this, flex: flex ?? 1);
  }

  /// A modifier that sets its widget's frame size.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .frame(width: 50, height: 25);
  /// ```
  Widget frame({double? width, double? height, bool handover = true}) {
    if (handover && this is Container) {
      return (this as Container).frame(width: width, height: height);
    }
    return Container(child: this, width: width, height: height);
  }

  /// A modifier that sets its widget's frame size.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.settings)
  ///     .help('App settings');
  /// ```
  Widget help(String? text, {bool? below}) {
    return text == null
        ? this
        : Tooltip(child: this, message: text, preferBelow: below);
  }

  /// A modifier that insets margin around its widget by the given value(s).
  ///
  /// ## Example:
  ///
  /// This snippet creates "Hello World!" [Text] inside a [Card] that has margin
  /// around it by sixteen pixels in each direction.
  ///
  /// ```dart
  /// Card(child:
  ///   Text('Hello World!')
  ///       .padding(all: 16),
  /// )
  /// ```
  Widget margin({
    double? all,
    double? top,
    double? bottom,
    double? leading,
    double? trailing,
    double? horizontal,
    double? vertical,
    bool handover = true,
  }) {
    final insets = _insets(
      all: all,
      top: top,
      bottom: bottom,
      leading: leading,
      trailing: trailing,
      horizontal: horizontal,
      vertical: vertical,
    );
    if (handover && this is Container) {
      return (this as Container).rebase(margin: insets);
    }
    return Container(child: this, margin: insets);
  }

  /// A modifier that insets its widget by the given padding.
  ///
  /// ## Example:
  ///
  /// This snippet creates "Hello World!" [Text] inside a [Card] that is indented
  /// by sixteen pixels in each direction.
  ///
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/widgets/padding.png)
  ///
  /// ```dart
  /// Card(child:
  ///   Text('Hello World!')
  ///       .padding(all: 16),
  /// )
  /// ```
  Widget padding({
    double? all,
    double? top,
    double? bottom,
    double? leading,
    double? trailing,
    double? horizontal,
    double? vertical,
    bool handover = true,
  }) {
    final insets = _insets(
      all: all,
      top: top,
      bottom: bottom,
      leading: leading,
      trailing: trailing,
      horizontal: horizontal,
      vertical: vertical,
    );
    if (handover && this is Container) {
      return (this as Container).rebase(padding: insets);
    }
    return Padding(child: this, padding: insets);
  }

  /// A modifier that makes its widget (partially) transparent.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// bool hovering = false;
  ///
  /// Text('Whoosh!')
  ///     .onHover((state) => hovering = state));
  /// ```
  Widget onHover(void Function(bool) event, {bool handover = true}) {
    if (handover && this is InkWell) {
      if ((this as InkWell).onTap == null) {
        return (this as InkWell).rebase(onHover: event, onTap: () => null);
      } else {
        return (this as InkWell).rebase(onHover: event);
      }
    }
    return InkWell(child: this, onHover: event, onTap: () => null);
  }

  /// A modifier that makes its widget (partially) transparent.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// bool hovering = false;
  ///
  /// Text('Tap! tap!')
  ///     .onTap(() {}));
  /// ```
  Widget onTap(void Function() event, {bool handover = true}) {
    if (handover && this is InkWell) {
      return (this as InkWell).rebase(onTap: event);
    }
    return InkWell(child: this, onTap: event);
  }

  /// A modifier that makes its widget (partially) transparent.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Do you see me?')
  ///     .opacity(0.5);
  /// ```
  Widget opacity(double opacity) {
    return Opacity(child: this, opacity: opacity);
  }

  /// Creates a modifier that transforms its widget using a rotation around the
  /// center.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('I am crooked?!')
  ///     .rotate(28);
  /// ```
  Transform rotate(double angle) {
    return Transform.rotate(child: this, angle: angle);
  }

  /// A modifier that scales its widget uniformly.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Text('Minime')
  ///     .scale(0.5);
  /// ```
  Transform scale(
    double scale, {
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) {
    return Transform.scale(
      child: this,
      scale: scale,
      origin: origin,
      transformHitTests: transformHitTests,
    );
  }

  /// A modifier that sets its widget's frame size.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .shadow(4, color: Colors.grey);
  /// ```
  Widget shadow(
    double radius, {
    Color color = const Color.fromRGBO(0, 0, 0, .5),
    double blur = 25,
    double x = 0,
    double y = 0,
    bool handover = true,
  }) {
    if (handover && this is Container) {
      return (this as Container).shadow(radius, blur: blur, x: x, y: y);
    }
    return Container(
      child: this,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color,
            spreadRadius: radius,
            blurRadius: blur,
            offset: Offset(x, y),
          ),
        ],
      ),
    );
  }

  /// A modifier that transforms its widget.
  Transform transform(
    Matrix4 transform, {
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests: true,
  }) {
    return Transform(
      child: this,
      transform: transform,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
    );
  }

  /// A modifier that translates its widget to the specified offset.
  ///
  /// ## Example:
  ///
  /// ```dart
  /// Icon(Icons.person)
  ///     .offset(x: 12, y: 12);
  /// ```
  Widget offset({double x = 0, double y = 0, bool transformHitTests = true}) {
    return Transform.translate(
      child: this,
      offset: Offset(x, y),
      transformHitTests: transformHitTests,
    );
  }

  /// Internal modifier for composing edge insets in a proper manner.
  EdgeInsets _insets({
    double? all,
    double? top,
    double? bottom,
    double? leading,
    double? trailing,
    double? horizontal,
    double? vertical,
  }) {
    double _top = top ?? 0;
    double _bottom = bottom ?? 0;
    double _leading = leading ?? 0;
    double _trailing = trailing ?? 0;
    _top += all ?? 0;
    _bottom += all ?? 0;
    _leading += all ?? 0;
    _trailing += all ?? 0;
    _leading += horizontal ?? 0;
    _trailing += horizontal ?? 0;
    _top += vertical ?? 0;
    _bottom += vertical ?? 0;
    if (all == null &&
        top == null &&
        bottom == null &&
        leading == null &&
        trailing == null &&
        horizontal == null &&
        vertical == null) {
      _top = 12;
      _bottom = 12;
      _leading = 12;
      _trailing = 12;
    }
    return EdgeInsets.only(
      top: _top,
      bottom: _bottom,
      left: _leading,
      right: _trailing,
    );
  }
}

extension FlutterUIInkWell on InkWell {
  /// Internal modifier for modifying final properties.
  InkWell rebase({
    Widget? child,
    GestureTapCallback? onTap,
    GestureTapCallback? onDoubleTap,
    GestureLongPressCallback? onLongPress,
    GestureTapDownCallback? onTapDown,
    GestureTapCancelCallback? onTapCancel,
    ValueChanged<bool>? onHighlightChanged,
    ValueChanged<bool>? onHover,
    MouseCursor? mouseCursor,
    Color? focusColor,
    Color? hoverColor,
    Color? highlightColor,
    MaterialStateProperty<Color?>? overlayColor,
    Color? splashColor,
    InteractiveInkFeatureFactory? splashFactory,
    double? radius,
    BorderRadius? borderRadius,
    ShapeBorder? customBorder,
    bool? enableFeedback,
    bool? excludeFromSemantics,
    FocusNode? focusNode,
    bool? canRequestFocus,
    ValueChanged<bool>? onFocusChange,
    bool? autofocus,
  }) {
    return InkWell(
      key: this.key,
      child: child ?? this.child,
      onTap: onTap ?? this.onTap,
      onDoubleTap: onDoubleTap ?? this.onDoubleTap,
      onLongPress: onLongPress ?? this.onLongPress,
      onTapDown: onTapDown ?? this.onTapDown,
      onTapCancel: onTapCancel ?? this.onTapCancel,
      onHighlightChanged: onHighlightChanged ?? this.onHighlightChanged,
      onHover: onHover ?? this.onHover,
      mouseCursor: mouseCursor ?? this.mouseCursor,
      focusColor: focusColor ?? this.focusColor,
      hoverColor: hoverColor ?? this.hoverColor,
      highlightColor: highlightColor ?? this.highlightColor,
      overlayColor: overlayColor ?? this.overlayColor,
      splashColor: splashColor ?? this.splashColor,
      splashFactory: splashFactory ?? this.splashFactory,
      radius: radius ?? this.radius,
      borderRadius: borderRadius ?? this.borderRadius,
      customBorder: customBorder ?? this.customBorder,
      enableFeedback: enableFeedback ?? this.enableFeedback,
      excludeFromSemantics: excludeFromSemantics ?? this.excludeFromSemantics,
      focusNode: focusNode ?? this.focusNode,
      canRequestFocus: canRequestFocus ?? this.canRequestFocus,
      onFocusChange: onFocusChange ?? this.onFocusChange,
      autofocus: autofocus ?? this.autofocus,
    );
  }
}

extension FlutterUIBoxDecoration on BoxDecoration {
  /// Internal modifier for modifying final properties.
  BoxDecoration rebase({
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape? shape,
  }) {
    return BoxDecoration(
      color: color ?? this.color,
      image: image ?? this.image,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      gradient: gradient ?? this.gradient,
      backgroundBlendMode: backgroundBlendMode ?? this.backgroundBlendMode,
      shape: shape ?? this.shape,
    );
  }
}
