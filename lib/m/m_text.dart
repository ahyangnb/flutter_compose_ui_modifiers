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
      ),
    );
  }
}

final MTextModifier = MTextModifierDefine();

class MTextModifierDefine extends MGeneralModifier {
  final TextStyle styleValue;

  const MTextModifierDefine({
    this.styleValue = const TextStyle(),
    super.paddingValue,
    super.marginValue,
    super.onTapValue,
    super.backgroundColorValue,
    super.borderRadiusValue,
    super.centerAlignValue,
    super.widthValue,
    super.heightValue,
    super.shadowValue,
    super.transformValue,
    super.constraintsValue,
    super.aspectRatioValue,
    super.flexValue,
    super.helpValue,
    super.opacityValue,
    super.rotateValue,
    super.scaleValue,
  });

  MTextModifierDefine copyWith({
    TextStyle? styleValue,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? paddingValue,
    EdgeInsets? marginValue,
    VoidCallback? onTapValue,
    Color? backgroundColorValue,
    BorderRadiusGeometry? borderRadiusValue,
    bool? centerAlignValue,
    double? widthValue,
    double? heightValue,
    BoxShadow? shadowValue,
    Matrix4? transformValue,
    BoxConstraints? constraintsValue,
    double? aspectRatioValue,
    int? flexValue,
    String? helpValue,
    double? opacityValue,
    double? rotateValue,
    double? scaleValue,
  }) {
    return MTextModifierDefine(
      styleValue: styleValue ?? this.styleValue,
      paddingValue: paddingValue ?? this.paddingValue,
      marginValue: marginValue ?? this.marginValue,
      onTapValue: onTapValue ?? this.onTapValue,
      backgroundColorValue: backgroundColorValue ?? this.backgroundColorValue,
      borderRadiusValue: borderRadiusValue ?? this.borderRadiusValue,
      centerAlignValue: centerAlignValue ?? this.centerAlignValue,
      widthValue: widthValue ?? this.widthValue,
      heightValue: heightValue ?? this.heightValue,
      shadowValue: shadowValue ?? this.shadowValue,
      transformValue: transformValue ?? this.transformValue,
      constraintsValue: constraintsValue ?? this.constraintsValue,
      aspectRatioValue: aspectRatioValue ?? this.aspectRatioValue,
      flexValue: flexValue ?? this.flexValue,
      helpValue: helpValue ?? this.helpValue,
      opacityValue: opacityValue ?? this.opacityValue,
      rotateValue: rotateValue ?? this.rotateValue,
      scaleValue: scaleValue ?? this.scaleValue,
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
      paddingValue: (this.paddingValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MTextModifierDefine paddingBottom(double value) {
    return this.copyWith(
      paddingValue:
          (this.paddingValue ?? EdgeInsets.zero).copyWith(bottom: value),
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
      paddingValue: value ?? this.paddingValue ?? EdgeInsets.zero,
    );
  }

  MTextModifierDefine marginTop(double value) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MTextModifierDefine marginBottom(double value) {
    return this.copyWith(
      marginValue:
          (this.marginValue ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MTextModifierDefine marginLeft(double value) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  MTextModifierDefine marginRight(double value) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(right: value),
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
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.marginValue?.left,
        right: horizontal ?? this.marginValue?.right,
        top: vertical ?? this.marginValue?.top,
        bottom: vertical ?? this.marginValue?.bottom,
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
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(
        left: left ?? this.marginValue?.left,
        right: right ?? this.marginValue?.right,
        top: top ?? this.marginValue?.top,
        bottom: bottom ?? this.marginValue?.bottom,
      ),
    );
  }

  MTextModifierDefine marginSet(EdgeInsets? value) {
    return this.copyWith(marginValue: value);
  }

  MTextModifierDefine margin(double? value) {
    return this.copyWith(marginValue: EdgeInsets.all(value ?? 0));
  }

  MTextModifierDefine backgroundColor(Color? value) {
    return this.copyWith(backgroundColorValue: value);
  }

  MTextModifierDefine center(bool value) {
    return this.copyWith(centerAlignValue: value);
  }

  MTextModifierDefine size(Size value) {
    return this.copyWith(widthValue: value.width, heightValue: value.height);
  }

  MTextModifierDefine width(double? value) {
    return this.copyWith(widthValue: value);
  }

  MTextModifierDefine height(double? value) {
    return this.copyWith(heightValue: value);
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

  MTextModifierDefine setClick(VoidCallback onTapValue) {
    return this.copyWith(onTapValue: onTapValue);
  }

  /// General============End
}
