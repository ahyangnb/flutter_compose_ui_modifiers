import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/m_color.dart';
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
    String text = data;
    final useStyle = modifier?.styleValue ?? TextStyle();
    Widget textWidget = Text(
      text,
      style: useStyle,
      textAlign: modifier?.valueTextAlign,
    );

    if (modifier?.valueHighlightRegExp != null) {
      List<TextSpan> textSpans = [];

      text.splitMapJoin(
        modifier!.valueHighlightRegExp!,
        onMatch: (m) {
          textSpans.add(
            TextSpan(
              text: m.group(0),
              style: modifier?.valueHighlightStyle != null
                  ? modifier?.valueHighlightStyle
                  : useStyle.copyWith(color: Colors.red),
            ),
          );
          return m.group(0)!;
        },
        onNonMatch: (n) {
          textSpans.add(TextSpan(text: n, style: useStyle));
          return n;
        },
      );

      textWidget = RichText(
        text: TextSpan(style: useStyle, children: textSpans),
        textAlign: modifier?.valueTextAlign ?? TextAlign.start,
      );
    }

    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: textWidget,
    );
  }
}

final MTextModifier = DefineMTextModifier();

class DefineMTextModifier extends MGeneralModifier {
  final TextStyle styleValue;
  final TextStyle? valueHighlightStyle;
  final TextAlign? valueTextAlign;
  final RegExp? valueHighlightRegExp;

  const DefineMTextModifier({
    this.styleValue = const TextStyle(),
    this.valueHighlightStyle,
    this.valueTextAlign,
    this.valueHighlightRegExp,

    /// Container
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

    /// Blur
    super.valueSigmaX,
    super.valueSigmaY,
    super.valueMaskColor,

    /// Material
    super.valueMaterialType,
    super.valueMaterialElevation,
  });

  DefineMTextModifier copyWith({
    TextStyle? styleValue,
    TextStyle? valueHighlightStyle,
    TextAlign? valueTextAlign,
    RegExp? valueHighlightRegExp,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    VoidCallback? valueOnTap,
    GestureLongPressCallback? valueOnLongPress,
    GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate,
    GestureLongPressUpCallback? valueOnLongPressUp,
    VoidCallback? valueDragOutToStatusBar,
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
  }) {
    return DefineMTextModifier(
      styleValue: styleValue ?? this.styleValue,
      valueHighlightStyle: valueHighlightStyle ?? this.valueHighlightStyle,
      valueTextAlign: valueTextAlign ?? this.valueTextAlign,
      valueHighlightRegExp: valueHighlightRegExp ?? this.valueHighlightRegExp,

      /// Container
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

  DefineMTextModifier centerText() {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueTextAlign: TextAlign.center);
    return newModifierValue;
  }

  DefineMTextModifier alignCenter() {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueTextAlign: TextAlign.center);
    return newModifierValue;
  }

  DefineMTextModifier textCenter() {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueTextAlign: TextAlign.center);
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

  DefineMTextModifier deleteLine() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        styleValue:
            this.styleValue.copyWith(decoration: TextDecoration.lineThrough));
    return newModifierValue;
  }

  DefineMTextModifier lineThrough() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        styleValue:
            this.styleValue.copyWith(decoration: TextDecoration.lineThrough));
    return newModifierValue;
  }

  DefineMTextModifier throughLine() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        styleValue:
            this.styleValue.copyWith(decoration: TextDecoration.lineThrough));
    return newModifierValue;
  }

  DefineMTextModifier underLine() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        styleValue:
            this.styleValue.copyWith(decoration: TextDecoration.underline));
    return newModifierValue;
  }

  DefineMTextModifier under() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        styleValue:
            this.styleValue.copyWith(decoration: TextDecoration.underline));
    return newModifierValue;
  }

  /// High light
  DefineMTextModifier styleHighlight(TextStyle value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueHighlightStyle: value);
    return newModifierValue;
  }

  DefineMTextModifier highLightColor(Color value) {
    final DefineMTextModifier newModifierValue = this.copyWith(
        valueHighlightStyle:
            (this.valueHighlightStyle ?? TextStyle()).copyWith(color: value));
    return newModifierValue;
  }

  DefineMTextModifier highLightColorHex(int value) {
    final DefineMTextModifier newModifierValue = this.copyWith(
        valueHighlightStyle: (this.valueHighlightStyle ?? TextStyle())
            .copyWith(color: Color(value)));
    return newModifierValue;
  }

  DefineMTextModifier highlightRegExp(RegExp value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueHighlightRegExp: value);
    return newModifierValue;
  }

  DefineMTextModifier highlightText(List<String> value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueHighlightRegExp: RegExp(value.join("|")));
    return newModifierValue;
  }

  DefineMTextModifier styleLight(TextStyle value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueHighlightStyle: value);
    return newModifierValue;
  }

  DefineMTextModifier lightColor(Color value) {
    final DefineMTextModifier newModifierValue = this.copyWith(
        valueHighlightStyle:
            (this.valueHighlightStyle ?? TextStyle()).copyWith(color: value));
    return newModifierValue;
  }

  DefineMTextModifier lightColorHex(int value) {
    final DefineMTextModifier newModifierValue = this.copyWith(
        valueHighlightStyle: (this.valueHighlightStyle ?? TextStyle())
            .copyWith(color: Color(value)));
    return newModifierValue;
  }

  DefineMTextModifier lightRegExp(RegExp value) {
    return highlightRegExp(value);
  }

  DefineMTextModifier lightText(List<String> value) {
    return highlightText(value);
  }

  DefineMTextModifier chipWhite() {
    final borderWidth = 1.px;
    final DefineMTextModifier newModifierValue = this.copyWith(
      styleValue: (this.styleValue).copyWith(
        color: Colors.white,
        fontSize: 12.px,
      ),
      valueBorder: Border.all(color: Colors.white, width: borderWidth),
      valueBorderRadius: BorderRadius.all(Radius.circular(17.px)),
      valuePadding: EdgeInsets.symmetric(
          horizontal: 10.px - borderWidth, vertical: 5.px - borderWidth),
      valueBackgroundColor: Colors.white.withOpacity(0.2),
      valueMargin: EdgeInsets.only(right: 10.px, bottom: 10.px),
    );
    return newModifierValue;
  }

  DefineMTextModifier chipGradient() {
    final borderWidth = 1.px;
    return chipWhite()
        .backgroundColor(Colors.black)
        .border(Border.all(color: Colors.transparent, width: borderWidth))
        .gradient(MColor.button.primaryBackgroundGradient);
  }
}
