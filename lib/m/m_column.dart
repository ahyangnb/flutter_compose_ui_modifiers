import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/modifier_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MColumn extends StatelessWidget {
  final MColumnModifierDefine? modifier;
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

final MColumnModifier = MColumnModifierDefine();

class MColumnModifierDefine extends MGeneralModifier {
  final List<Widget>? children;
  final bool? valueReverse;

  /// Always align to Top even reverse.
  final bool? valueAlignTop;
  final bool? valueShrinkWrap;
  final ScrollPhysics? valuePhysics;
  final CrossAxisAlignment? valueCrossAxisAlignment;
  final MainAxisAlignment? valueMainAxisAlignment;

  const MColumnModifierDefine({
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
  });

  /// Create a copyWith().
  MColumnModifierDefine copyWith({
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
  }) {
    return MColumnModifierDefine(
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
    );
  }
}

extension MColumnModifierPropertys on MColumnModifierDefine {
  MColumnModifierDefine reverse(bool value) {
    return setReverse(value);
  }

  MColumnModifierDefine setReverse(bool value) {
    return this.copyWith(valueReverse: value);
  }

  MColumnModifierDefine physics(ScrollPhysics physics) {
    return setPhysics(physics);
  }

  MColumnModifierDefine setPhysics(ScrollPhysics physics) {
    return this.copyWith(valuePhysics: physics);
  }

  MColumnModifierDefine add(Widget child) {
    return this.copyWith(children: (this.children ?? [])..add(child));
  }

  MColumnModifierDefine addList(List<Widget> value) {
    return this.copyWith(children: (this.children ?? [])..addAll(value));
  }

  MColumnModifierDefine crossAxisAlignment(CrossAxisAlignment value) {
    return this.copyWith(valueCrossAxisAlignment: value);
  }

  MColumnModifierDefine mainAxisAlignment(MainAxisAlignment value) {
    return this.copyWith(valueMainAxisAlignment: value);
  }

  /// General============Start
  ///
  MColumnModifierDefine shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  MColumnModifierDefine shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  MColumnModifierDefine padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  MColumnModifierDefine paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  MColumnModifierDefine setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  MColumnModifierDefine paddingTop(double value) {
    return setPaddingTop(value);
  }

  MColumnModifierDefine setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MColumnModifierDefine paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  MColumnModifierDefine setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  MColumnModifierDefine paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  MColumnModifierDefine setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  MColumnModifierDefine paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MColumnModifierDefine marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MColumnModifierDefine marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MColumnModifierDefine marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  MColumnModifierDefine marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  MColumnModifierDefine marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  MColumnModifierDefine marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  MColumnModifierDefine marginSymmetric(
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

  MColumnModifierDefine marginOnly({
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

  MColumnModifierDefine marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  MColumnModifierDefine margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  MColumnModifierDefine backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  MColumnModifierDefine center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  MColumnModifierDefine size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  MColumnModifierDefine width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  MColumnModifierDefine height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  MColumnModifierDefine onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  MColumnModifierDefine onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  MColumnModifierDefine click(VoidCallback onTap) {
    return setClick(onTap);
  }

  MColumnModifierDefine setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  MColumnModifierDefine borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  MColumnModifierDefine borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  MColumnModifierDefine borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  MColumnModifierDefine borderRadiusOnly({
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

  MColumnModifierDefine borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  /// General============End
}
