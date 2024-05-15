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
  final EdgeInsets? valuePadding;
  final EdgeInsets? valueMargin;
  final VoidCallback? valueOnTap;
  final Color? valueBackgroundColor;
  final BorderRadiusGeometry? valueBorderRadius;
  final bool? valueCenterAlign;
  final double? valueWidth;
  final double? valueHeight;
  final BoxShadow? valueShadow;
  final Matrix4? valueTransform;
  final BoxConstraints? valueConstraints;
  final double? valueAspectRatio;
  final int? valueFlex;
  final String? valueHelp;
  final double? valueOpacity;
  final double? valueRotate;
  final double? valueScale;
  final Gradient? valueGradient;
  final Border? valueBorder;
  final BoxShape? valueShape;

  /// Use the Positioned widget.
  final double? valueLeft;
  final double? valueRight;
  final double? valueTop;
  final double? valueBottom;

  const MGeneralModifier({
    this.valuePadding,
    this.valueMargin,
    this.valueOnTap,
    this.valueBackgroundColor,
    this.valueBorderRadius,
    this.valueCenterAlign,
    this.valueWidth,
    this.valueHeight,
    this.valueShadow,
    this.valueTransform,
    this.valueConstraints,
    this.valueAspectRatio,
    this.valueFlex,
    this.valueHelp,
    this.valueOpacity,
    this.valueRotate,
    this.valueScale,
    this.valueGradient,
    this.valueBorder,
    this.valueShape,

    /// Use the Positioned widget.
    this.valueLeft,
    this.valueRight,
    this.valueTop,
    this.valueBottom,
  });
}

/// if you want to ignore some modifier in general, you can add it here.
enum IgnoreModifierInGeneral { padding, width, height, backgroundColor }

/// [ignoreList]: ignore some modifier in general.
class MGeneralLayoutModifierWidget extends StatelessWidget {
  final MGeneralModifier? generalModifier;
  final List<IgnoreModifierInGeneral> ignoreList;
  final Widget child;

  MGeneralLayoutModifierWidget({
    this.generalModifier,
    required this.child,
    this.ignoreList = const [],
  });

  @override
  Widget build(BuildContext context) {
    Widget child = this.child;
    if (generalModifier == null) {
      return child;
    }
    if (generalModifier?.valuePadding != null ||
        generalModifier?.valueMargin != null ||
        generalModifier?.valueBorderRadius != null ||
        generalModifier?.valueBackgroundColor != null ||
        generalModifier?.valueWidth != null ||
        generalModifier?.valueHeight != null ||
        generalModifier?.valueTransform != null ||
        generalModifier?.valueShadow != null ||
        generalModifier?.valueGradient != null ||
        generalModifier?.valueBorder != null ||
        generalModifier?.valueShape != null) {
      child = Container(
        width: ignoreList.contains(IgnoreModifierInGeneral.width)
            ? null
            : generalModifier?.valueWidth,
        height: ignoreList.contains(IgnoreModifierInGeneral.height)
            ? null
            : generalModifier?.valueHeight,
        transform: generalModifier?.valueTransform,
        decoration: BoxDecoration(
          color: ignoreList.contains(IgnoreModifierInGeneral.backgroundColor)
              ? null
              : generalModifier?.valueBackgroundColor,
          borderRadius: generalModifier?.valueBorderRadius,
          boxShadow: generalModifier?.valueShadow != null
              ? [generalModifier!.valueShadow!]
              : null,
          gradient: generalModifier?.valueGradient,
          border: generalModifier?.valueBorder,
          shape: generalModifier?.valueShape ?? BoxShape.rectangle,
        ),
        padding: ignoreList.contains(IgnoreModifierInGeneral.padding)
            ? null
            : generalModifier?.valuePadding,
        margin: generalModifier?.valueMargin,
        child: child,
      );
    }
    if (generalModifier?.valueCenterAlign != null &&
        generalModifier!.valueCenterAlign!) {
      child = Center(child: child);
    }

    /// Must use the InkWell in before last one.
    /// otherwise the event will not be triggered in some area such as margin.
    if (generalModifier?.valueOnTap != null) {
      child = InkWell(
        onTap: generalModifier!.valueOnTap,
        child: child,
      );
    }

    if (generalModifier?.valueLeft != null ||
        generalModifier?.valueRight != null ||
        generalModifier?.valueTop != null ||
        generalModifier?.valueBottom != null) {
      child = Positioned(
        left: generalModifier?.valueLeft,
        right: generalModifier?.valueRight,
        top: generalModifier?.valueTop,
        bottom: generalModifier?.valueBottom,
        child: child,
      );
    }

    /// Must use it in last one.
    if (generalModifier?.valueFlex != null) {
      if (child is Positioned) {
        throw Exception('The Positioned widget can not use Expanded widget');
      }
      child = Expanded(flex: generalModifier!.valueFlex!, child: child);
    }
    return child;
  }
}
