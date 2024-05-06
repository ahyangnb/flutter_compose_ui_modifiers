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
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: Column(
        crossAxisAlignment: modifier?.valueCrossAxisAlignment ??
            ModifierConfig.defColumnCrossAxisAlignment,
        mainAxisAlignment: modifier?.valueMainAxisAlignment ??
            ModifierConfig.defColumnMainAxisAlignment,
        children: [
          ...children ?? [],
          ...modifier?.children ?? [],
        ],
      ),
    );
  }
}

final MColumnModifier = DefineMColumnModifier();

class DefineMColumnModifier extends MGeneralModifier {
  final List<Widget>? children;
  final bool? valueReverse;

  /// Always align to Top even reverse.
  final bool? valueAlignTop;
  final bool? valueShrinkWrap;
  final ScrollPhysics? valuePhysics;
  final CrossAxisAlignment? valueCrossAxisAlignment;
  final MainAxisAlignment? valueMainAxisAlignment;

  const DefineMColumnModifier({
    this.children,
    this.valueReverse,
    this.valueAlignTop,
    this.valueShrinkWrap,
    this.valuePhysics,
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
  DefineMColumnModifier copyWith({
    List<Widget>? children,
    bool? valueReverse,
    bool? valueAlignTop,
    bool? valueShrinkWrap,
    ScrollPhysics? valuePhysics,
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
    return DefineMColumnModifier(
      children: children ?? this.children,
      valueReverse: valueReverse ?? this.valueReverse,
      valueAlignTop: valueAlignTop ?? this.valueAlignTop,
      valueShrinkWrap: valueShrinkWrap ?? this.valueShrinkWrap,
      valuePhysics: valuePhysics ?? this.valuePhysics,
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

extension MColumnModifierPropertys on DefineMColumnModifier {
  DefineMColumnModifier reverse(bool value) {
    return setReverse(value);
  }

  DefineMColumnModifier setReverse(bool value) {
    return this.copyWith(valueReverse: value);
  }

  DefineMColumnModifier physics(ScrollPhysics physics) {
    return setPhysics(physics);
  }

  DefineMColumnModifier setPhysics(ScrollPhysics physics) {
    return this.copyWith(valuePhysics: physics);
  }

  DefineMColumnModifier add(Widget child) {
    return this.copyWith(children: (this.children ?? [])..add(child));
  }

  DefineMColumnModifier addList(List<Widget> value) {
    return this.copyWith(children: (this.children ?? [])..addAll(value));
  }

  DefineMColumnModifier crossAxisAlignment(CrossAxisAlignment value) {
    return this.copyWith(valueCrossAxisAlignment: value);
  }

  DefineMColumnModifier mainAxisAlignment(MainAxisAlignment value) {
    return this.copyWith(valueMainAxisAlignment: value);
  }

  /// General============Start
  ///
  DefineMColumnModifier shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  DefineMColumnModifier shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  DefineMColumnModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMColumnModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMColumnModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMColumnModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMColumnModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMColumnModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMColumnModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMColumnModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMColumnModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMColumnModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMColumnModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMColumnModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMColumnModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMColumnModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMColumnModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMColumnModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMColumnModifier marginSymmetric(
      {double? horizontal, double? vertical}) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valueMargin?.left,
        right: horizontal ?? this.valueMargin?.right,
        top: vertical ?? this.valueMargin?.top,
        bottom: vertical ?? this.valueMargin?.bottom,
      ),
    );
  }

  DefineMColumnModifier marginOnly({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: left ?? this.valueMargin?.left,
        right: right ?? this.valueMargin?.right,
        top: top ?? this.valueMargin?.top,
        bottom: bottom ?? this.valueMargin?.bottom,
      ),
    );
  }

  DefineMColumnModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMColumnModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMColumnModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMColumnModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMColumnModifier size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMColumnModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMColumnModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMColumnModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMColumnModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMColumnModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMColumnModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMColumnModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMColumnModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMColumnModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMColumnModifier borderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMColumnModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMColumnModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMColumnModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  /// General============End
}
