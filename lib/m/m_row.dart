import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/modifier_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MRow extends StatelessWidget {
  final DefineMRowModifier? modifier;
  final List<Widget>? children;

  MRow({
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
      child: Row(
        crossAxisAlignment: modifier?.valueCrossAxisAlignment ??
            ModifierConfig.defRowCrossAxisAlignment,
        mainAxisAlignment: modifier?.valueMainAxisAlignment ??
            ModifierConfig.defRowMainAxisAlignment,
        children: modifier?.valueReverse == true
            ? valueChildrenResult.reversed.toList()
            : valueChildrenResult,
      ),
    );
  }
}

final MRowModifier = DefineMRowModifier();

class DefineMRowModifier extends MGeneralModifier {
  final List<Widget>? children;
  final bool? valueReverse;

  final CrossAxisAlignment? valueCrossAxisAlignment;
  final MainAxisAlignment? valueMainAxisAlignment;

  const DefineMRowModifier({
    this.children,
    this.valueReverse,
    this.valueCrossAxisAlignment,
    this.valueMainAxisAlignment,
    super.valuePadding,
    super.valueMargin,
    super.valueOnTap,
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
    super.valueLeft,
    super.valueRight,
    super.valueTop,
    super.valueBottom,
  });

  /// Create a copyWith().
  DefineMRowModifier copyWith({
    List<Widget>? children,
    bool? valueReverse,
    CrossAxisAlignment? valueCrossAxisAlignment,
    MainAxisAlignment? valueMainAxisAlignment,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    GestureTapCallback? valueOnTap,
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
    double? valueLeft,
    double? valueRight,
    double? valueTop,
    double? valueBottom,
  }) {
    return DefineMRowModifier(
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

      valueLeft: valueLeft ?? this.valueLeft,
      valueRight: valueRight ?? this.valueRight,
      valueTop: valueTop ?? this.valueTop,
      valueBottom: valueBottom ?? this.valueBottom,
    );
  }
}

extension MRowModifierPropertys on DefineMRowModifier {
  DefineMRowModifier reverse(bool value) {
    return setReverse(value);
  }

  DefineMRowModifier setReverse(bool value) {
    return this.copyWith(valueReverse: value);
  }

  DefineMRowModifier add(Widget child) {
    return this.copyWith(children: (this.children ?? [])..add(child));
  }

  DefineMRowModifier addList(List<Widget> value) {
    return this.copyWith(children: (this.children ?? [])..addAll(value));
  }

  DefineMRowModifier centerCross() {
    return this.copyWith(valueCrossAxisAlignment: CrossAxisAlignment.center);
  }

  DefineMRowModifier crossAxisAlignment(CrossAxisAlignment value) {
    return this.copyWith(valueCrossAxisAlignment: value);
  }

  DefineMRowModifier centerMain() {
    return this.copyWith(valueMainAxisAlignment: MainAxisAlignment.center);
  }

  DefineMRowModifier mainAxisAlignment(MainAxisAlignment value) {
    return this.copyWith(valueMainAxisAlignment: value);
  }
}
