import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MStack extends StatelessWidget {
  final DefineMStackModifier? modifier;
  final List<Widget>? children;

  MStack({
    this.modifier,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      ignoreList: [IgnoreModifierInGeneral.alignment],
      child: Stack(
        alignment: modifier?.valueAlignment ?? AlignmentDirectional.topStart,
        textDirection: modifier?.valueTextDirection,
        fit: modifier?.valueFit ?? StackFit.loose,
        clipBehavior: modifier?.valueClipBehavior ?? Clip.hardEdge,
        children: children ?? <Widget>[],
      ),
    );
  }
}

final MStackModifier = DefineMStackModifier();

class DefineMStackModifier extends MGeneralModifier {
  final AlignmentGeometry? valueAlignment;
  final TextDirection? valueTextDirection;
  final StackFit? valueFit;
  final Clip? valueClipBehavior;

  const DefineMStackModifier({
    this.valueAlignment,
    this.valueTextDirection,
    this.valueFit,
    this.valueClipBehavior,
    super.valuePadding,
    super.valueMargin,
    super.valueOnTap,
    super.valueOnLongPress,
    super.valueOnLongPressMoveUpdate,
    super.valueOnLongPressUp,
    super.valueBackgroundColor,
    super.valueBorderRadius,
    super.valueCenterAlign,
    super.valueWidth,
    super.valueHeight,
    super.valueShadow,
    super.valueTransform,
    super.valueConstraints,
    super.valueAspectRatio,
    super.valueFlex,
    super.valueHelp,
    super.valueOpacity,
    super.valueRotate,
    super.valueScale,
    super.valueGradient,
    super.valueBorder,
    super.valueShape,

    /// Position Widget
    super.valueLeft,
    super.valueRight,
    super.valueTop,
    super.valueBottom,

    /// Scroll
    super.valueScrollable,

    // Blur
    super.valueSigmaX,
    super.valueSigmaY,
  });

  DefineMStackModifier copyWith({
    final AlignmentGeometry? valueAlignment,
    final TextDirection? valueTextDirection,
    final StackFit? valueFit,
    final Clip? valueClipBehavior,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    VoidCallback? valueOnTap,
    GestureLongPressCallback? valueOnLongPress,
    GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate,
    GestureLongPressUpCallback? valueOnLongPressUp,
    Color? valueBackgroundColor,
    BorderRadiusGeometry? valueBorderRadius,
    bool? valueCenterAlign,
    double? valueWidth,
    double? valueHeight,
    BoxShadow? valueShadow,
    Matrix4? valueTransform,
    BoxConstraints? valueConstraints,
    double? valueAspectRatio,
    int? valueFlex,
    String? valueHelp,
    double? valueOpacity,
    double? valueRotate,
    double? valueScale,
    Gradient? valueGradient,
    Border? valueBorder,
    BoxShape? valueShape,

    /// Position Widget
    double? valueLeft,
    double? valueRight,
    double? valueTop,
    double? valueBottom,

    /// Scroll
    bool? valueScrollable,

    /// Blur
    double? valueSigmaX,
    double? valueSigmaY,
  }) {
    return DefineMStackModifier(
      valueAlignment: valueAlignment ?? this.valueAlignment,
      valueTextDirection: valueTextDirection ?? this.valueTextDirection,
      valueFit: valueFit ?? this.valueFit,
      valueClipBehavior: valueClipBehavior ?? this.valueClipBehavior,

      /// Container.
      valuePadding: valuePadding ?? this.valuePadding,
      valueMargin: valueMargin ?? this.valueMargin,
      valueOnTap: valueOnTap ?? this.valueOnTap,
      valueOnLongPress: valueOnLongPress ?? this.valueOnLongPress,
      valueOnLongPressMoveUpdate:
          valueOnLongPressMoveUpdate ?? this.valueOnLongPressMoveUpdate,
      valueOnLongPressUp: valueOnLongPressUp ?? this.valueOnLongPressUp,
      valueBackgroundColor: valueBackgroundColor ?? this.valueBackgroundColor,
      valueBorderRadius: valueBorderRadius ?? this.valueBorderRadius,
      valueCenterAlign: valueCenterAlign ?? this.valueCenterAlign,
      valueWidth: valueWidth ?? this.valueWidth,
      valueHeight: valueHeight ?? this.valueHeight,
      valueShadow: valueShadow ?? this.valueShadow,
      valueTransform: valueTransform ?? this.valueTransform,
      valueConstraints: valueConstraints ?? this.valueConstraints,
      valueAspectRatio: valueAspectRatio ?? this.valueAspectRatio,
      valueFlex: valueFlex ?? this.valueFlex,
      valueHelp: valueHelp ?? this.valueHelp,
      valueOpacity: valueOpacity ?? this.valueOpacity,
      valueRotate: valueRotate ?? this.valueRotate,
      valueScale: valueScale ?? this.valueScale,
      valueGradient: valueGradient ?? this.valueGradient,
      valueBorder: valueBorder ?? this.valueBorder,
      valueShape: valueShape ?? this.valueShape,

      /// Position Widget
      valueLeft: valueLeft ?? this.valueLeft,
      valueRight: valueRight ?? this.valueRight,
      valueTop: valueTop ?? this.valueTop,
      valueBottom: valueBottom ?? this.valueBottom,

      /// Scroll
      valueScrollable: valueScrollable ?? this.valueScrollable,

      // Blur
      valueSigmaX: valueSigmaX ?? this.valueSigmaX,
      valueSigmaY: valueSigmaY ?? this.valueSigmaY,
    );
  }
}

extension MStackModifierPropertys on DefineMStackModifier {
  DefineMStackModifier alignment(AlignmentGeometry value) {
    return this.copyWith(valueAlignment: value);
  }

  DefineMStackModifier centerAlignStack() {
    return this.copyWith(valueAlignment: Alignment.center);
  }

  DefineMStackModifier alignCenterStack() {
    return this.copyWith(valueAlignment: Alignment.center);
  }

  DefineMStackModifier textDirection(TextDirection value) {
    return this.copyWith(valueTextDirection: value);
  }

  DefineMStackModifier fit(StackFit value) {
    return this.copyWith(valueFit: value);
  }
}
