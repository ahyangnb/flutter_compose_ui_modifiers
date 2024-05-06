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
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: Row(
        crossAxisAlignment: modifier?.valueCrossAxisAlignment ??
            ModifierConfig.defRowCrossAxisAlignment,
        mainAxisAlignment: modifier?.valueMainAxisAlignment ??
            ModifierConfig.defRowMainAxisAlignment,
        children: [
          ...children ?? [],
          ...modifier?.children ?? [],
        ],
      ),
    );
  }
}

final MRowModifier = DefineMRowModifier();

class DefineMRowModifier extends MGeneralModifier {
  final List<Widget>? children;
  final bool? valueReverse;

  /// Always align to Top even reverse.
  final bool? valueAlignTop;
  final bool? valueShrinkWrap;
  final ScrollPhysics? valuePhysics;
  final CrossAxisAlignment? valueCrossAxisAlignment;
  final MainAxisAlignment? valueMainAxisAlignment;

  const DefineMRowModifier({
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
  DefineMRowModifier copyWith({
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
    return DefineMRowModifier(
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

extension MRowModifierPropertys on DefineMRowModifier {
  DefineMRowModifier reverse(bool value) {
    return setReverse(value);
  }

  DefineMRowModifier setReverse(bool value) {
    return this.copyWith(valueReverse: value);
  }

  DefineMRowModifier physics(ScrollPhysics physics) {
    return setPhysics(physics);
  }

  DefineMRowModifier setPhysics(ScrollPhysics physics) {
    return this.copyWith(valuePhysics: physics);
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

  /// General============Start
  ///
  DefineMRowModifier shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  DefineMRowModifier shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  DefineMRowModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMRowModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMRowModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMRowModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMRowModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMRowModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMRowModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMRowModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMRowModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMRowModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMRowModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMRowModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMRowModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMRowModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMRowModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMRowModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMRowModifier marginSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valueMargin?.left,
        right: horizontal ?? this.valueMargin?.right,
        top: vertical ?? this.valueMargin?.top,
        bottom: vertical ?? this.valueMargin?.bottom,
      ),
    );
  }

  DefineMRowModifier marginOnly({
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

  DefineMRowModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMRowModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMRowModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMRowModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMRowModifier size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMRowModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMRowModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMRowModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMRowModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMRowModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMRowModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMRowModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMRowModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMRowModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMRowModifier borderRadiusOnly({
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

  DefineMRowModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMRowModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMRowModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  /// General============End
}
