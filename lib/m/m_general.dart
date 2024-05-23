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

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/assistant/m_dragble.dart';
import 'package:flutter_compose_ui_modifiers/custom/gradient_box_border.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

enum MGravity { top, center, bottom }

class MGeneralModifier {
  final EdgeInsets? valuePadding;
  final EdgeInsets? valueMargin;
  final VoidCallback? valueOnTap;
  final GestureLongPressCallback? valueOnLongPress;
  final GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate;
  final GestureLongPressUpCallback? valueOnLongPressUp;
  final VoidCallback? valueDragOutToStatusBar;
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
  final String? valueBackgroundImage;
  final BoxFit? valueBackgroundImageFit;
  final MGravity? valueGravity;

  // If it doesn't work, wrap a SizeBox around it and set the width and height.
  final Gradient? valueGradientBorder;
  final double? valueGradientBorderSize;
  final double? valueFullWidth;
  final double? valueFullHeight;

  /// Use the Positioned widget.
  final double? valueLeft;
  final double? valueRight;
  final double? valueTop;
  final double? valueBottom;

  /// Scroll.
  final bool? valueScrollable;

  /// Blur
  final double? valueSigmaX;
  final double? valueSigmaY;
  final Color? valueMaskColor;

  /// Material
  final MaterialType? valueMaterialType;
  final double? valueMaterialElevation;

  const MGeneralModifier({
    this.valuePadding,
    this.valueMargin,
    this.valueOnTap,
    this.valueOnLongPress,
    this.valueOnLongPressMoveUpdate,
    this.valueOnLongPressUp,
    this.valueDragOutToStatusBar,
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
    this.valueBackgroundImage,
    this.valueBackgroundImageFit,
    this.valueGravity,
    this.valueGradientBorder,
    this.valueGradientBorderSize,
    this.valueFullWidth,
    this.valueFullHeight,

    /// Use the Positioned widget.
    this.valueLeft,
    this.valueRight,
    this.valueTop,
    this.valueBottom,

    /// Scroll.
    this.valueScrollable,

    /// Blur.
    this.valueSigmaX,
    this.valueSigmaY,
    this.valueMaskColor,

    /// Material
    this.valueMaterialType,
    this.valueMaterialElevation,
  });
}

/// if you want to ignore some modifier in general, you can add it here.
enum IgnoreModifierInGeneral {
  padding,
  width,
  height,
  backgroundColor,
  alignment
}

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
        generalModifier?.valueGradientBorder != null ||
        generalModifier?.valueBorder != null ||
        // generalModifier?.valueAlignment != null ||
        generalModifier?.valueShape != null ||
        generalModifier?.valueBackgroundImage != null) {
      child = Container(
        width: ignoreList.contains(IgnoreModifierInGeneral.width)
            ? null
            : generalModifier?.valueWidth,
        height: ignoreList.contains(IgnoreModifierInGeneral.height)
            ? null
            : generalModifier?.valueHeight,
        transform: generalModifier?.valueTransform,
        constraints: generalModifier?.valueConstraints,
        // alignment: ignoreList.contains(IgnoreModifierInGeneral.alignment)
        //     ? null
        //     : generalModifier.valueAlignment,
        decoration: BoxDecoration(
          color: ignoreList.contains(IgnoreModifierInGeneral.backgroundColor)
              ? null
              : generalModifier?.valueBackgroundColor,
          borderRadius: generalModifier?.valueBorderRadius,
          boxShadow: generalModifier?.valueShadow != null
              ? [generalModifier!.valueShadow!]
              : null,
          gradient: generalModifier?.valueGradient,
          border: generalModifier?.valueGradientBorder != null
              ? GradientBoxBorder(
                  gradient: generalModifier!.valueGradientBorder!,
                  width: generalModifier?.valueGradientBorderSize ?? 1.0)
              : generalModifier?.valueBorder,
          shape: generalModifier?.valueShape ?? BoxShape.rectangle,
          image: generalModifier?.valueBackgroundImage != null
              ? DecorationImage(
                  image:
                      mGetImageProvider(generalModifier!.valueBackgroundImage!),
                  fit: generalModifier?.valueBackgroundImageFit,
                )
              : null,
        ),
        padding: ignoreList.contains(IgnoreModifierInGeneral.padding)
            ? null
            : generalModifier?.valuePadding,
        margin: generalModifier?.valueMargin,
        child: child,
      );
    }

    if (generalModifier?.valueFullWidth != null ||
        generalModifier?.valueFullHeight != null) {
      child = SizedBox(
        width: generalModifier?.valueFullWidth,
        height: generalModifier?.valueFullHeight,
        child: child,
      );
    }

    /// Must use the InkWell in before last one.
    /// otherwise the event will not be triggered in some area such as margin.
    if (generalModifier?.valueOnTap != null ||
        generalModifier?.valueOnLongPress != null ||
        generalModifier?.valueOnLongPressMoveUpdate != null ||
        generalModifier?.valueOnLongPressUp != null) {
      child = GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: generalModifier?.valueOnTap,
        onLongPress: generalModifier?.valueOnLongPress,
        onLongPressMoveUpdate: generalModifier?.valueOnLongPressMoveUpdate,
        onLongPressUp: generalModifier?.valueOnLongPressUp,
        child: child,
      );
    }

    if (generalModifier?.valueOpacity != null) {
      child = Opacity(opacity: generalModifier!.valueOpacity!, child: child);
    }

    if (generalModifier?.valueSigmaX != null ||
        generalModifier?.valueSigmaY != null) {
      if (generalModifier is DefineMImageModifier) {
        child = ClipRect(
          child: ImageFiltered(
            imageFilter: ImageFilter.compose(
              // Blur.
              // 模糊
              outer: ImageFilter.blur(
                sigmaX: generalModifier?.valueSigmaX ?? 0,
                sigmaY: generalModifier?.valueSigmaY ?? 0,
              ),
              // tilt
              // 倾斜
              inner: ImageFilter.matrix(Matrix4.skewY(0).storage),
            ),
            child: child,
          ),
        );
      } else {
        child = ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: generalModifier?.valueSigmaX ?? 0,
              sigmaY: generalModifier?.valueSigmaY ?? 0,
            ),
            child: child,
          ),
        );
      }
    }

    if (generalModifier?.valueMaskColor != null) {
      child = Stack(
        children: [
          child,
          Container(color: generalModifier!.valueMaskColor!),
        ],
      );
    }

    if (generalModifier?.valueMaterialType != null ||
        generalModifier?.valueMaterialElevation != null) {
      child = Material(
        type: generalModifier?.valueMaterialType ?? MaterialType.transparency,
        elevation: generalModifier?.valueMaterialElevation ?? 0,
        child: child,
      );
    }

    if (generalModifier?.valueCenterAlign != null &&
        generalModifier!.valueCenterAlign!) {
      child = Center(child: child);
    }

    if (generalModifier?.valueGravity != null) {
      final gravityValue = generalModifier!.valueGravity == MGravity.center
          ? MainAxisAlignment.center
          : generalModifier!.valueGravity == MGravity.top
              ? MainAxisAlignment.start
              : MainAxisAlignment.end;
      child = Column(mainAxisAlignment: gravityValue, children: [child]);
    }

    if (generalModifier?.valueDragOutToStatusBar != null) {
      if (generalModifier?.valueHeight == null) {
        throw Exception("generalModifier?.valueHeight must not be null.");
      }
      child = MDragOut(
        height: generalModifier!.valueHeight!,
        child: child,
        onDismiss: generalModifier!.valueDragOutToStatusBar!,
      );
    }

    if (generalModifier?.valueScrollable ?? false) {
      child = SingleChildScrollView(child: child);
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
