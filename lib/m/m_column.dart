import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/modifier_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MColumn extends StatelessWidget {
  final DefineMColumnModifier? modifier;
  final List<Widget>? children;

  MColumn({
    this.children,
    this.modifier,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> valueChildrenResult = <Widget>[
      ...children ?? [],
      ...modifier?.children ?? [],
    ];
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: Column(
        crossAxisAlignment: modifier?.valueCrossAxisAlignment ??
            ModifierConfig.defColumnCrossAxisAlignment,
        mainAxisAlignment: modifier?.valueMainAxisAlignment ??
            ModifierConfig.defColumnMainAxisAlignment,
        children: modifier?.valueReverse == true
            ? valueChildrenResult.reversed.toList()
            : valueChildrenResult,
      ),
    );
  }
}

final MColumnModifier = DefineMColumnModifier();

class DefineMColumnModifier extends MGeneralModifier {
  final List<Widget>? children;
  final bool? valueReverse;
  final CrossAxisAlignment? valueCrossAxisAlignment;
  final MainAxisAlignment? valueMainAxisAlignment;

  const DefineMColumnModifier({
    this.children,
    this.valueReverse,
    this.valueCrossAxisAlignment,
    this.valueMainAxisAlignment,
    super.valuePadding,
    super.valueMargin,
    super.valueOnTap,
    super.valueOnLongPress,
    super.valueOnLongPressMoveUpdate,
    super.valueOnLongPressUp,
    super.valueDragOutToStatusBar,
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
    super.valueGravity,
    super.valueGradientBorder,
    super.valueGradientBorderSize,
    super.valueFullWidth,
    super.valueFullHeight,

    /// Position Widget
    super.valueLeft,
    super.valueRight,
    super.valueTop,
    super.valueBottom,

    // Blur
    super.valueSigmaX,
    super.valueSigmaY,
    super.valueMaskColor,

    /// Material
    super.valueMaterialType,
    super.valueMaterialElevation,

    /// Other
    super.valueScrollable,
  });

  /// Create a copyWith().
  DefineMColumnModifier copyWith({
    List<Widget>? children,
    bool? valueReverse,
    CrossAxisAlignment? valueCrossAxisAlignment,
    MainAxisAlignment? valueMainAxisAlignment,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    GestureTapCallback? valueOnTap,
    GestureLongPressCallback? valueOnLongPress,
    GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate,
    GestureLongPressUpCallback? valueOnLongPressUp,
    VoidCallback? valueDragOutToStatusBar,
    Color? valueBackgroundColor,
    BorderRadius? valueBorderRadius,
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
    MGravity? valueGravity,
    Gradient? valueGradientBorder,
    double? valueFullWidth,
    double? valueFullHeight,

    /// Position Widget
    double? valueLeft,
    double? valueRight,
    double? valueTop,
    double? valueBottom,

    /// Blur
    double? valueSigmaX,
    double? valueSigmaY,
    Color? valueMaskColor,

    /// Material
    MaterialType? valueMaterialType,
    double? valueMaterialElevation,

    /// Other
    bool? valueScrollable,
  }) {
    return DefineMColumnModifier(
      children: children ?? this.children,
      valueReverse: valueReverse ?? this.valueReverse,
      valueCrossAxisAlignment:
          valueCrossAxisAlignment ?? this.valueCrossAxisAlignment,
      valueMainAxisAlignment:
          valueMainAxisAlignment ?? this.valueMainAxisAlignment,

      /// The following properties are inherited from MGeneralModifier.
      valuePadding: valuePadding ?? this.valuePadding,
      valueMargin: valueMargin ?? this.valueMargin,
      valueOnTap: valueOnTap ?? this.valueOnTap,
      valueOnLongPress: valueOnLongPress ?? this.valueOnLongPress,
      valueOnLongPressMoveUpdate:
          valueOnLongPressMoveUpdate ?? this.valueOnLongPressMoveUpdate,
      valueOnLongPressUp: valueOnLongPressUp ?? this.valueOnLongPressUp,
      valueDragOutToStatusBar:
          valueDragOutToStatusBar ?? this.valueDragOutToStatusBar,
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
      valueGravity: valueGravity ?? this.valueGravity,
      valueGradientBorder: valueGradientBorder ?? this.valueGradientBorder,
      valueFullWidth: valueFullWidth ?? this.valueFullWidth,
      valueFullHeight: valueFullHeight ?? this.valueFullHeight,

      /// Position Widget
      valueLeft: valueLeft ?? this.valueLeft,
      valueRight: valueRight ?? this.valueRight,
      valueTop: valueTop ?? this.valueTop,
      valueBottom: valueBottom ?? this.valueBottom,

      // Blur
      valueSigmaX: valueSigmaX ?? this.valueSigmaX,
      valueSigmaY: valueSigmaY ?? this.valueSigmaY,
      valueMaskColor: valueMaskColor ?? this.valueMaskColor,

      // Material
      valueMaterialType: valueMaterialType ?? this.valueMaterialType,
      valueMaterialElevation:
          valueMaterialElevation ?? this.valueMaterialElevation,

      // Other
      valueScrollable: valueScrollable ?? this.valueScrollable,
    );
  }
}

extension MColumnModifierPropertys on DefineMColumnModifier {
  DefineMColumnModifier reverse(bool value) {
    return setReverse(value);
  }

  DefineMColumnModifier setReverse(bool value) {
    return this.copyWith(valueReverse: value);
  }

  DefineMColumnModifier add(Widget child) {
    return this.copyWith(children: (this.children ?? [])..add(child));
  }

  DefineMColumnModifier addList(List<Widget> value) {
    return this.copyWith(children: (this.children ?? [])..addAll(value));
  }

  DefineMColumnModifier centerCross() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.center);
  }

  DefineMColumnModifier crossAxisAlignment(CrossAxisAlignment value) {
    return this.copyWith(valueCrossAxisAlignment: value);
  }

  DefineMColumnModifier centerMain() {
    return this.copyWith(valueMainAxisAlignment: MainAxisAlignment.center);
  }

  DefineMColumnModifier mainAxisAlignment(MainAxisAlignment value) {
    return this.copyWith(valueMainAxisAlignment: value);
  }

  DefineMColumnModifier mainAxisCenter() {
    return this.copyWith(valueMainAxisAlignment: MainAxisAlignment.center);
  }

  DefineMColumnModifier mainAxisEnd() {
    return this.copyWith(valueMainAxisAlignment: MainAxisAlignment.end);
  }

  DefineMColumnModifier crossAxisCenter() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.center);
  }

  DefineMColumnModifier crossAxisEnd() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.end);
  }

  DefineMColumnModifier crossStart() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.start);
  }

  DefineMColumnModifier startAlign() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.start);
  }

  DefineMColumnModifier mainCenter() {
    return this.copyWith(valueMainAxisAlignment: MainAxisAlignment.center);
  }
}
