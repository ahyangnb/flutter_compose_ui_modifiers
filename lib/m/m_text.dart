import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

/// @todo HighlightNamesText function with MText.

/// example:
/// ```dart
/// MText(
//   modifier: MTextModifier.color(Colors.blue)
//       .onClick(() => print("hi"))
//       .fontSize(50)
//       .fontWeight(FontWeight.w200)
//       .backgroundColor(Colors.red.withOpacity(0.3))
//       .size(const Size(200, 300))
//       .marginBottom(300)
//       .paddingTop(50)
//       .center(true),
//   data: 'can click me!',
// )
/// ```
class MText extends StatelessWidget {
  final DefineMTextModifier? modifier;
  final String data;

  MText({
    this.modifier,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: Text(
        data,
        style: modifier?.styleValue ?? TextStyle(),
        textAlign: modifier?.valueTextAlign,
      ),
    );
  }
}

final MTextModifier = DefineMTextModifier();

class DefineMTextModifier extends MGeneralModifier {
  final TextStyle styleValue;
  final TextAlign? valueTextAlign;

  const DefineMTextModifier({
    this.styleValue = const TextStyle(),
    this.valueTextAlign,
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

  DefineMTextModifier copyWith({
    TextStyle? styleValue,
    TextAlign? valueTextAlign,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    VoidCallback? valueOnTap,
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
    double? valueLeft,
    double? valueRight,
    double? valueTop,
    double? valueBottom,
  }) {
    return DefineMTextModifier(
      styleValue: styleValue ?? this.styleValue,
      valueTextAlign: valueTextAlign ?? this.valueTextAlign,
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

extension MTextModifierPropertys on DefineMTextModifier {
  DefineMTextModifier color(Color color) {
    return setColor(color);
  }

  DefineMTextModifier colorHex(int color) {
    return setColor(Color(color));
  }

  DefineMTextModifier colorValue(int color) {
    return setColor(Color(color));
  }

  DefineMTextModifier setColor(Color color) {
    final newStyle = this.styleValue.copyWith(color: color);
    final DefineMTextModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier fontSize(double fontSize) {
    return setFontSize(fontSize);
  }

  DefineMTextModifier setFontSize(double fontSize) {
    final newStyle = this.styleValue.copyWith(fontSize: fontSize);
    final DefineMTextModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier letterSpacing(double value) {
    final newStyle = this.styleValue.copyWith(letterSpacing: value);
    final DefineMTextModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier fontFamily(String value) {
    final newStyle = this.styleValue.copyWith(fontFamily: value);
    final DefineMTextModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier lineHeight(double value) {
    return heightLine(value);
  }

  DefineMTextModifier textHeight(double value) {
    return heightLine(value);
  }

  DefineMTextModifier heightLine(double value) {
    final newStyle = this.styleValue.copyWith(height: value);
    final DefineMTextModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier textAlign(TextAlign value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueTextAlign: value);
    return newModifierValue;
  }

  DefineMTextModifier fontWeight(FontWeight fontWeight) {
    return setFontWeight(fontWeight);
  }

  DefineMTextModifier setFontWeight(FontWeight fontWeight) {
    final newStyle = this.styleValue.copyWith(fontWeight: fontWeight);
    final DefineMTextModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier style(TextStyle value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(styleValue: value);
    return newModifierValue;
  }

  /// General============Start
  DefineMTextModifier paddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMTextModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMTextModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMTextModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMTextModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMTextModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMTextModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMTextModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMTextModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMTextModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMTextModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMTextModifier marginSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valueMargin?.left,
        right: horizontal ?? this.valueMargin?.right,
        top: vertical ?? this.valueMargin?.top,
        bottom: vertical ?? this.valueMargin?.bottom,
      ),
    );
  }

  DefineMTextModifier marginOnly({
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

  DefineMTextModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMTextModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMTextModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMTextModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMTextModifier size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMTextModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMTextModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMTextModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMTextModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMTextModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMTextModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMTextModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMTextModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMTextModifier borderRadiusOnly({
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

  DefineMTextModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMTextModifier flex([int? value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextModifier expanded([int? value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  /// General============End
}
