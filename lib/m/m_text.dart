import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

/// example:
/// ```dart
/// MText(
//   modifier: MTextModifier.color(Colors.blue)
//       .onClick(() => logger.d("hi"))
//       .fontSize(50.px)
//       .fontWeight(FontWeight.w200)
//       .backgroundColor(Colors.red.withOpacity(0.3))
//       .size(const Size(200, 300))
//       .marginBottom(300.px)
//       .paddingTop(50.px)
//       .center(true),
//   data: 'can click hhhhhh',
// )
/// ```
class MText extends StatelessWidget {
  final MTextModifierDefine modifier;
  final String data;

  MText({
    this.modifier = const MTextModifierDefine(),
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: Text(
        data,
        style: TextStyle(
          color: modifier.styleValue.color ?? modifier.styleValue.color,
          fontSize:
              modifier.styleValue.fontSize ?? modifier.styleValue.fontSize,
          fontWeight:
              modifier.styleValue.fontWeight ?? modifier.styleValue.fontWeight,
        ),
        textAlign: modifier.valueTextAlign,
      ),
    );
  }
}

final MTextModifier = MTextModifierDefine();

class MTextModifierDefine extends MGeneralModifier {
  final TextStyle styleValue;
  final TextAlign? valueTextAlign;

  const MTextModifierDefine({
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
  });

  MTextModifierDefine copyWith({
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
  }) {
    return MTextModifierDefine(
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
    );
  }
}

extension MTextModifierPropertys on MTextModifierDefine {
  MTextModifierDefine color(Color color) {
    return setColor(color);
  }

  MTextModifierDefine setColor(Color color) {
    final newStyle = this.styleValue.copyWith(color: color);
    final MTextModifierDefine newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  MTextModifierDefine fontSize(double fontSize) {
    return setFontSize(fontSize);
  }

  MTextModifierDefine setFontSize(double fontSize) {
    final newStyle = this.styleValue.copyWith(fontSize: fontSize);
    final MTextModifierDefine newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  MTextModifierDefine letterSpacing(double value) {
    final newStyle = this.styleValue.copyWith(letterSpacing: value);
    final MTextModifierDefine newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  MTextModifierDefine lineHeight(double value) {
    return heightLine(value);
  }

  MTextModifierDefine heightLine(double value) {
    final newStyle = this.styleValue.copyWith(height: value);
    final MTextModifierDefine newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  MTextModifierDefine textAlign(TextAlign value) {
    final MTextModifierDefine newModifierValue =
        this.copyWith(valueTextAlign: value);
    return newModifierValue;
  }

  MTextModifierDefine fontWeight(FontWeight fontWeight) {
    return setFontWeight(fontWeight);
  }

  MTextModifierDefine setFontWeight(FontWeight fontWeight) {
    final newStyle = this.styleValue.copyWith(fontWeight: fontWeight);
    final MTextModifierDefine newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  /// General============Start
  MTextModifierDefine paddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MTextModifierDefine paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MTextModifierDefine padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  MTextModifierDefine paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  MTextModifierDefine setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  MTextModifierDefine marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MTextModifierDefine marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MTextModifierDefine marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  MTextModifierDefine marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  MTextModifierDefine marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  MTextModifierDefine marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  MTextModifierDefine marginSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valueMargin?.left,
        right: horizontal ?? this.valueMargin?.right,
        top: vertical ?? this.valueMargin?.top,
        bottom: vertical ?? this.valueMargin?.bottom,
      ),
    );
  }

  MTextModifierDefine marginOnly({
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

  MTextModifierDefine marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  MTextModifierDefine margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  MTextModifierDefine backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  MTextModifierDefine center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  MTextModifierDefine size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  MTextModifierDefine width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  MTextModifierDefine height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  MTextModifierDefine onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  MTextModifierDefine onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  MTextModifierDefine click(VoidCallback onTap) {
    return setClick(onTap);
  }

  MTextModifierDefine setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  MTextModifierDefine flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  MTextModifierDefine expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  /// General============End
}
