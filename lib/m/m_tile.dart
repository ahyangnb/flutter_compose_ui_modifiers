import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_compose_ui_modifiers/config/m_theme_config.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'package:get/get.dart';

class MTile extends StatelessWidget {
  final DefineMTileModifier? modifier;
  final String? label;

  MTile({
    this.modifier,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    final fontSize = modifier?.styleValue.fontSize ?? 18.px;
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: MRow(
        modifier: MRowModifier.mainAxisAlignment(MainAxisAlignment.start)
            .crossAxisAlignment(CrossAxisAlignment.center)
            .paddingHorizontal(16.px)
            .height(54.px)
            .backgroundColor(MThemeConfig.bgWhite22)
            .borderRadiusSet(
              (modifier?.valueBorderRadius as BorderRadius?) ??
                  BorderRadius.all(Radius.circular(8.px)),
            )
            .marginHorizontal(16.px),
        children: [
          if (modifier?.valueIcon != null)
            Image.asset(modifier!.valueIcon!).setSize(30.px).marginRight(10.px),
          Text(label ?? "Label")
              .color(Colors.white)
              .fontSize(fontSize)

              /// If use it will not center of the item.
              // .heightSize(modifier?.styleValue.height ?? (25.px / fontSize))
              .expanded(),
          if (modifier?.valueWidgetRight != null) modifier!.valueWidgetRight!,
        ],
      ),
    );
  }
}

final MTileModifier = DefineMTileModifier();

class DefineMTileModifier extends MGeneralModifier {
  final TextStyle styleValue;
  final TextAlign? valueTextAlign;
  final String? valueIcon;
  final Widget? valueWidgetRight;

  const DefineMTileModifier({
    this.styleValue = const TextStyle(),
    this.valueTextAlign,
    this.valueIcon,
    this.valueWidgetRight,

    /// Container
    super.valuePadding,
    super.valueMargin,
    super.valueOnTap,
    super.valueOnLongPress,
    super.valueOnLongPressMoveUpdate,
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
  });

  DefineMTileModifier copyWith({
    TextStyle? styleValue,
    TextAlign? valueTextAlign,
    String? valueIcon,
    Widget? valueWidgetRight,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? valuePadding,
    EdgeInsets? valueMargin,
    VoidCallback? valueOnTap,
    GestureLongPressCallback? valueOnLongPress,
    GestureLongPressMoveUpdateCallback? valueOnLongPressMoveUpdate,
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
  }) {
    return DefineMTileModifier(
      styleValue: styleValue ?? this.styleValue,
      valueTextAlign: valueTextAlign ?? this.valueTextAlign,
      valueIcon: valueIcon ?? this.valueIcon,
      valueWidgetRight: valueWidgetRight ?? this.valueWidgetRight,

      /// Container
      valuePadding: valuePadding ?? this.valuePadding,
      valueMargin: valueMargin ?? this.valueMargin,
      valueOnTap: valueOnTap ?? this.valueOnTap,
      valueOnLongPress: valueOnLongPress ?? this.valueOnLongPress,
      valueOnLongPressMoveUpdate:
          valueOnLongPressMoveUpdate ?? this.valueOnLongPressMoveUpdate,
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
    );
  }
}

extension MTileModifierPropertys on DefineMTileModifier {
  DefineMTileModifier color(Color color) {
    return setColor(color);
  }

  DefineMTileModifier colorHex(int color) {
    return setColor(Color(color));
  }

  DefineMTileModifier colorValue(int color) {
    return setColor(Color(color));
  }

  DefineMTileModifier setColor(Color color) {
    final newStyle = this.styleValue.copyWith(color: color);
    final DefineMTileModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier fontSize(double fontSize) {
    return setFontSize(fontSize);
  }

  DefineMTileModifier setFontSize(double fontSize) {
    final newStyle = this.styleValue.copyWith(fontSize: fontSize);
    final DefineMTileModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier letterSpacing(double value) {
    final newStyle = this.styleValue.copyWith(letterSpacing: value);
    final DefineMTileModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier fontFamily(String value) {
    final newStyle = this.styleValue.copyWith(fontFamily: value);
    final DefineMTileModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier lineHeight(double value) {
    return heightLine(value);
  }

  /// The line height, not container size Height.
  // DefineMTileModifier height(double value) {
  //   return heightLine(value);
  // }

  DefineMTileModifier textHeight(double value) {
    return heightLine(value);
  }

  DefineMTileModifier heightLine(double value) {
    final newStyle = this.styleValue.copyWith(height: value);
    final DefineMTileModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier textAlign(TextAlign value) {
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueTextAlign: value);
    return newModifierValue;
  }

  DefineMTileModifier fontWeight(FontWeight fontWeight) {
    return setFontWeight(fontWeight);
  }

  DefineMTileModifier setFontWeight(FontWeight fontWeight) {
    final newStyle = this.styleValue.copyWith(fontWeight: fontWeight);
    final DefineMTileModifier newModifierValue =
        this.copyWith(styleValue: newStyle);
    return newModifierValue;
  }

  DefineMTileModifier style(TextStyle value) {
    final DefineMTileModifier newModifierValue =
        this.copyWith(styleValue: value);
    return newModifierValue;
  }

  DefineMTileModifier icon(String? value) {
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueIcon: value);
    return newModifierValue;
  }

  DefineMTileModifier widgetRight([Widget? value]) {
    final DefineMTileModifier newModifierValue =
        this.copyWith(valueWidgetRight: value);
    return newModifierValue;
  }

  DefineMTileModifier copyButton({
    String? buttonText,
    String? copyContent,
    double? width,
    double? height,
    double? radius,
    VoidCallback? onCopy,
  }) {
    final heightResult = height ?? 32.px;
    final DefineMTileModifier newModifierValue = this.copyWith(
      valueWidgetRight: MButton(
        text: buttonText ?? "Copy",
        fontSize: 16.px,
        width: width ?? 66.px,
        height: heightResult,
        maxHeight: heightResult,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 16.px)),
        onTap: () async {
          await Clipboard.setData(ClipboardData(text: copyContent ?? ""));
          if (onCopy != null) onCopy();
        },
      ),
    );
    return newModifierValue;
  }

  DefineMTileModifier switchButton({
    required RxBool value,
    final ValueChanged<bool>? onChanged,
  }) {
    final DefineMTileModifier newModifierValue = this.copyWith(
      valueWidgetRight: Obx(
        () {
          return CupertinoSwitch(
            value: value.value,
            onChanged: (v) {
              value.value = v;
              if (onChanged != null) onChanged(v);
            },
            activeColor: Color(0xffFD211E),
            trackColor: Colors.white.withOpacity(0.3),
          );
        },
      ),
    );
    return newModifierValue;
  }
}
