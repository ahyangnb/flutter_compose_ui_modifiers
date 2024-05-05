// import 'package:flutter/material.dart';
// import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

// extension FlutterComposeUiModifierMGeneral on Widget {
//   setBackgroundColor(Color backgroundColor) {
//     if (this is MAppBar) {
//       return setAppBarBackgroundColor(backgroundColor);
//     } else if (this is MScaffold) {
//       return setScaffoldBackgroundColor(backgroundColor);
//     }
//     throw Exception('This widget have no xxx method');
//   }
// }

import 'package:flutter/material.dart';

class MGeneralModifier {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final BorderRadiusGeometry? borderRadius;
  final bool? centerAlign;
  final Size? size;
  final BoxShadow? shadow;
  final Matrix4? transform;
  final BoxConstraints? constraints;
  final double? aspectRatio;
  final int? flex;
  final String? help;
  final double? opacity;
  final double? rotate;
  final double? scale;

  const MGeneralModifier({
    this.padding,
    this.margin,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.centerAlign,
    this.size,
    this.shadow,
    this.transform,
    this.constraints,
    this.aspectRatio,
    this.flex,
    this.help,
    this.opacity,
    this.rotate,
    this.scale,
  });

  /// Create a copyWith().
  MGeneralModifier copyWith({
    EdgeInsets? padding,
    EdgeInsets? margin,
    VoidCallback? onTap,
    Color? backgroundColor,
    BorderRadiusGeometry? borderRadius,
    bool? centerAlign,
    Size? size,
    BoxShadow? shadow,
    Matrix4? transform,
    BoxConstraints? constraints,
    double? aspectRatio,
    int? flex,
    String? help,
    double? opacity,
    double? rotate,
    double? scale,
  }) {
    return MGeneralModifier(
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      onTap: onTap ?? this.onTap,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderRadius: borderRadius ?? this.borderRadius,
      centerAlign: centerAlign ?? this.centerAlign,
      size: size ?? this.size,
      shadow: shadow ?? this.shadow,
      transform: transform ?? this.transform,
      constraints: constraints ?? this.constraints,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      flex: flex ?? this.flex,
      help: help ?? this.help,
      opacity: opacity ?? this.opacity,
      rotate: rotate ?? this.rotate,
      scale: scale ?? this.scale,
    );
  }
}

class MGeneralLayoutModifierWidget extends StatelessWidget {
  final MGeneralModifier? generalModifier;
  final Widget child;

  MGeneralLayoutModifierWidget({this.generalModifier, required this.child});

  @override
  Widget build(BuildContext context) {
    Widget child = this.child;
    print("generalModifier::$generalModifier");
    if (generalModifier == null) {
      return child;
    }
    if (generalModifier?.onTap != null) {
      child = InkWell(
        onTap: generalModifier!.onTap,
        child: child,
      );
    }
    return child;
  }
}
