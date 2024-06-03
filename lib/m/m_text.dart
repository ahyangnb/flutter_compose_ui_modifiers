import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/config/m_color.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:flutter_compose_ui_modifiers/util/log.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

/// @todo HighlightNamesText function with MText.

/// example:
/// ```dart
/// MText(
//   modifier: MTextModifier.textColor(Colors.blue)
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
  final String? data;

  MText({
    this.modifier,
    this.data,
  });

  void onOpen(link) async {
    if (!await launchUrl(Uri.parse(link.url))) {
      throw Exception('Could not launch ${link.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    String text = data ?? modifier?.valueData ?? "";
    final useStyle = modifier?.valueStyle ?? TextStyle();
    final useValueSelectable = modifier?.valueSelectable ?? false;
    final useValueLinkDisplay = modifier?.valueLinkDisplay ?? false;
    Widget textWidget;
    if (useValueSelectable) {
      textWidget = useValueLinkDisplay
          ? SelectableLinkify(
              text: text,
              style: useStyle,
              textAlign: modifier?.valueTextAlign,
              maxLines: modifier?.valueMaxLines,
              // overflow: modifier?.valueOverflow,
              onOpen: onOpen,
            )
          : SelectableText(
              text,
              style: useStyle,
              textAlign: modifier?.valueTextAlign,
              maxLines: modifier?.valueMaxLines,
              // overflow: modifier?.valueOverflow,
            );
    } else {
      textWidget = useValueLinkDisplay
          ? Linkify(
              text: text,
              style: useStyle,
              textAlign: modifier?.valueTextAlign ?? TextAlign.start,
              maxLines: modifier?.valueMaxLines,
              overflow: modifier?.valueOverflow,
              onOpen: onOpen,
            )
          : Text(
              text,
              style: useStyle,
              textAlign: modifier?.valueTextAlign,
              maxLines: modifier?.valueMaxLines,
              overflow: modifier?.valueOverflow,
            );
    }

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

      textWidget = useValueSelectable
          ? SelectableText.rich(
              TextSpan(style: useStyle, children: textSpans),
              textAlign: modifier?.valueTextAlign ?? TextAlign.start,
              maxLines: modifier?.valueMaxLines,
              // overflow: modifier?.valueOverflow ??
              //     RichText(text: TextSpan()).overflow,
            )
          : RichText(
              text: TextSpan(style: useStyle, children: textSpans),
              textAlign: modifier?.valueTextAlign ?? TextAlign.start,
              maxLines: modifier?.valueMaxLines,
              overflow: modifier?.valueOverflow ??
                  RichText(text: TextSpan()).overflow,
            );
    }

    return MGeneralLayoutModifierWidget(
      key: modifier?.valueKey ?? key,
      generalModifier: modifier,
      child: textWidget,
    );
  }
}

final MTextModifier = DefineMTextModifier();

class DefineMTextModifier extends MGeneralModifier {
  final TextStyle valueStyle;
  final TextStyle? valueHighlightStyle;
  final TextAlign? valueTextAlign;
  final RegExp? valueHighlightRegExp;
  final int? valueMaxLines;
  final TextOverflow? valueOverflow;
  final String? valueData;
  final bool? valueSelectable;
  final bool? valueLinkDisplay;

  DefineMTextModifier({
    this.valueStyle = const TextStyle(),
    this.valueHighlightStyle,
    this.valueTextAlign,
    this.valueHighlightRegExp,
    this.valueMaxLines,
    this.valueOverflow,
    this.valueData,
    this.valueSelectable,
    this.valueLinkDisplay,

    /// Main.
    super.valueKey,

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
    super.valueContainerAlignment,

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

    /// Other
    super.valueScrollable,
    super.valueSafeArea,
  });

  DefineMTextModifier copyWith({
    TextStyle? valueStyle,
    TextStyle? valueHighlightStyle,
    TextAlign? valueTextAlign,
    RegExp? valueHighlightRegExp,
    final int? valueMaxLines,
    final TextOverflow? valueOverflow,
    String? valueData,
    bool? valueSelectable,
    bool? valueLinkDisplay,

    /// The following properties are inherited from MGeneralModifier.
    /// Main.
    Key? valueKey,

    /// Contents:
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
    AlignmentGeometry? valueContainerAlignment,

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
    SafeArea? valueSafeArea,
  }) {
    return DefineMTextModifier(
      valueStyle: valueStyle ?? this.valueStyle,
      valueHighlightStyle: valueHighlightStyle ?? this.valueHighlightStyle,
      valueTextAlign: valueTextAlign ?? this.valueTextAlign,
      valueHighlightRegExp: valueHighlightRegExp ?? this.valueHighlightRegExp,
      valueMaxLines: valueMaxLines ?? this.valueMaxLines,
      valueOverflow: valueOverflow ?? this.valueOverflow,
      valueData: valueData ?? this.valueData,
      valueSelectable: valueSelectable ?? this.valueSelectable,
      valueLinkDisplay: valueLinkDisplay ?? this.valueLinkDisplay,

      /// Main.
      valueKey: valueKey ?? this.valueKey,

      /// Contents:
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
      valueContainerAlignment:
          valueContainerAlignment ?? this.valueContainerAlignment,

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
      valueSafeArea: valueSafeArea ?? this.valueSafeArea,
    );
  }

  double getTextWidth(String data) {
    return getTextSize(data).width;
  }

  double getTextHeight(String data) {
    return getTextSize(data).height;
  }

  Size getTextSize(String data) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: data, style: valueStyle),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}

class MFontWeight {
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight bold = FontWeight.w600;
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
    final newStyle = this.valueStyle.copyWith(color: color);
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier textColor(Color color) {
    return setColor(color);
  }

  DefineMTextModifier textColorHex(int color) {
    return setColor(Color(color));
  }

  DefineMTextModifier textColorValue(int color) {
    return setColor(Color(color));
  }

  DefineMTextModifier setTextColor(Color color) {
    final newStyle = this.valueStyle.copyWith(color: color);
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier fontSize(double fontSize) {
    return setFontSize(fontSize);
  }

  DefineMTextModifier setFontSize(double fontSize) {
    final newStyle = this.valueStyle.copyWith(fontSize: fontSize);
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier letterSpacing(double value) {
    final newStyle = this.valueStyle.copyWith(letterSpacing: value);
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier fontFamily(String value) {
    final newStyle = this.valueStyle.copyWith(fontFamily: value);
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier lineHeight(double value) {
    return heightLine(value);
  }

  DefineMTextModifier textHeight(double value) {
    return heightLine(value);
  }

  DefineMTextModifier heightLine(double value) {
    final newStyle = this.valueStyle.copyWith(height: value);
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
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
    final newStyle = this.valueStyle.copyWith(fontWeight: fontWeight);
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueStyle: newStyle);
    return newModifierValue;
  }

  DefineMTextModifier style(TextStyle value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueStyle: value);
    return newModifierValue;
  }

  DefineMTextModifier deleteLine() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        valueStyle:
            this.valueStyle.copyWith(decoration: TextDecoration.lineThrough));
    return newModifierValue;
  }

  DefineMTextModifier lineThrough() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        valueStyle:
            this.valueStyle.copyWith(decoration: TextDecoration.lineThrough));
    return newModifierValue;
  }

  DefineMTextModifier throughLine() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        valueStyle:
            this.valueStyle.copyWith(decoration: TextDecoration.lineThrough));
    return newModifierValue;
  }

  DefineMTextModifier underLine() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        valueStyle:
            this.valueStyle.copyWith(decoration: TextDecoration.underline));
    return newModifierValue;
  }

  DefineMTextModifier under() {
    final DefineMTextModifier newModifierValue = this.copyWith(
        valueStyle:
            this.valueStyle.copyWith(decoration: TextDecoration.underline));
    return newModifierValue;
  }

  DefineMTextModifier textDecoration(TextDecoration value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueStyle: this.valueStyle.copyWith(decoration: value));
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
      valueStyle: (this.valueStyle).copyWith(
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

  DefineMTextModifier maxLines(int value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueMaxLines: value);
    return newModifierValue;
  }

  DefineMTextModifier overflow(TextOverflow value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueOverflow: value);
    return newModifierValue;
  }

  DefineMTextModifier overflowEllipsis() {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueOverflow: TextOverflow.ellipsis);
    return newModifierValue;
  }

  DefineMTextModifier overflowClip() {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueOverflow: TextOverflow.clip);
    return newModifierValue;
  }

  DefineMTextModifier textOverflow(TextOverflow value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueOverflow: value);
    return newModifierValue;
  }

  DefineMTextModifier textOverflowEllipsis() {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueOverflow: TextOverflow.ellipsis);
    return newModifierValue;
  }

  DefineMTextModifier textOverflowClip() {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueOverflow: TextOverflow.clip);
    return newModifierValue;
  }

  DefineMTextModifier data(String value) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueData: value);
    return newModifierValue;
  }

  DefineMTextModifier selectable([bool value = true]) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueSelectable: value);
    return newModifierValue;
  }

  DefineMTextModifier linkDisplay([bool value = true]) {
    final DefineMTextModifier newModifierValue =
        this.copyWith(valueLinkDisplay: value);
    return newModifierValue;
  }
}
