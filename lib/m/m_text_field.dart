/// todo feature: Auto jump to next line when click enter key.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MTextField extends StatelessWidget {
  final MTextFieldModifierDefine? modifier;
  final TextEditingController? controller;

  MTextField({
    this.controller,
    this.modifier,
  });

  @override
  Widget build(BuildContext context) {
    return MGeneralLayoutModifierWidget(
      generalModifier: modifier,
      child: TextField(
        controller: controller ?? TextEditingController(),
        decoration: modifier?.decorationValue,
        style: modifier?.styleValue,
        expands: modifier?.expandsValue ?? false,
        maxLines: modifier?.maxLinesValue,
      ),
    );
  }
}

final MTextFieldModifier = MTextFieldModifierDefine();

class MTextFieldModifierDefine extends MGeneralModifier {
  final InputDecoration? decorationValue;
  final TextStyle? styleValue;
  final bool? expandsValue;
  final int? maxLinesValue;

  const MTextFieldModifierDefine({
    this.decorationValue,
    this.styleValue,
    this.expandsValue,
    this.maxLinesValue,
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

  /// Create a copyWith().
  MTextFieldModifierDefine copyWith({
    final InputDecoration? decorationValue,
    final TextStyle? styleValue,
    final bool? expandsValue,
    final int? maxLinesValue,

    /// The following properties are inherited from MGeneralModifier.
    EdgeInsets? paddingValue,
    EdgeInsets? marginValue,
    GestureTapCallback? onTapValue,
    Color? backgroundColorValue,
    BorderRadius? borderRadiusValue,
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
    return MTextFieldModifierDefine(
      decorationValue: decorationValue ?? this.decorationValue,
      styleValue: styleValue ?? this.styleValue,
      expandsValue: expandsValue ?? this.expandsValue,
      maxLinesValue: maxLinesValue ?? this.maxLinesValue,

      /// The following properties are inherited from MGeneralModifier.
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

extension MTextFieldModifierPropertys on MTextFieldModifierDefine {
  MTextFieldModifierDefine hintText(String value) {
    return this.copyWith(
      decorationValue:
          (this.decorationValue ?? InputDecoration()).copyWith(hintText: value),
    );
  }

  MTextFieldModifierDefine hintStyle(TextStyle value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(hintStyle: value),
    );
  }

  MTextFieldModifierDefine hintColor(Color value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintStyle: (this.decorationValue?.hintStyle ?? TextStyle())
              .copyWith(color: value)),
    );
  }

  MTextFieldModifierDefine hintFontSize(double value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintStyle: (this.decorationValue?.hintStyle ?? TextStyle())
              .copyWith(fontSize: value)),
    );
  }

  MTextFieldModifierDefine hintFontWeight(FontWeight value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintStyle: (this.decorationValue?.hintStyle ?? TextStyle())
              .copyWith(fontWeight: value)),
    );
  }

  MTextFieldModifierDefine noneBorder() {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(border: InputBorder.none),
    );
  }

  MTextFieldModifierDefine underlineBorder(Color color) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
        border: UnderlineInputBorder(borderSide: BorderSide(color: color)),
      ),
    );
  }

  MTextFieldModifierDefine contentPadding(EdgeInsetsGeometry value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: value),
    );
  }

  EdgeInsets? get thisPadding =>
      (this.decorationValue?.contentPadding is EdgeInsets? &&
              this.decorationValue?.contentPadding != null)
          ? this.decorationValue?.contentPadding as EdgeInsets
          : EdgeInsets.zero;

  MTextFieldModifierDefine contentPaddingHorizontal(double value) {
    final newPadding = EdgeInsets.only(
      top: thisPadding?.top ?? 0,
      bottom: thisPadding?.bottom ?? 0,
      left: value,
      right: value,
    );
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
        contentPadding: newPadding,
      ),
    );
  }

  MTextFieldModifierDefine contentPaddingVertical(double value) {
    final newPadding = EdgeInsets.only(
      top: value,
      bottom: value,
      left: thisPadding?.left ?? 0,
      right: thisPadding?.right ?? 0,
    );
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
        contentPadding: newPadding,
      ),
    );
  }

  MTextFieldModifierDefine contentPaddingNone() {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: EdgeInsets.zero),
    );
  }

  MTextFieldModifierDefine decoration(InputDecoration value) {
    return this.copyWith(decorationValue: value);
  }

  MTextFieldModifierDefine style(TextStyle value) {
    return this.copyWith(styleValue: value);
  }

  MTextFieldModifierDefine expands(bool? value) {
    return this.copyWith(expandsValue: value);
  }

  MTextFieldModifierDefine maxLines(int? value) {
    return this.copyWith(maxLinesValue: value);
  }

  MTextFieldModifierDefine labelColor(Color value) {
    return this.copyWith(
        styleValue: (this.styleValue ?? TextStyle()).copyWith(color: value));
  }

  MTextFieldModifierDefine labelFontSize(double value) {
    return this.copyWith(
        styleValue: (this.styleValue ?? TextStyle()).copyWith(fontSize: value));
  }

  MTextFieldModifierDefine labelFontWeight(FontWeight value) {
    return this.copyWith(
        styleValue:
            (this.styleValue ?? TextStyle()).copyWith(fontWeight: value));
  }

  /// General============Start
  ///
  MTextFieldModifierDefine shadow(BoxShadow value) {
    return this.copyWith(shadowValue: value);
  }

  MTextFieldModifierDefine shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(shadowValue: value);
  }

  MTextFieldModifierDefine padding(EdgeInsets value) {
    return setPadding(value);
  }

  MTextFieldModifierDefine setPadding(EdgeInsets? value) {
    return this.copyWith(
      paddingValue: value ?? this.paddingValue ?? EdgeInsets.zero,
    );
  }

  MTextFieldModifierDefine paddingTop(double value) {
    return setPaddingTop(value);
  }

  MTextFieldModifierDefine setPaddingTop(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MTextFieldModifierDefine paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  MTextFieldModifierDefine setPaddingHorizontal(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  MTextFieldModifierDefine paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  MTextFieldModifierDefine setPaddingVertical(double value) {
    return this.copyWith(
      paddingValue: (this.paddingValue ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  MTextFieldModifierDefine paddingBottom(double value) {
    return this.copyWith(
      paddingValue:
          (this.paddingValue ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MTextFieldModifierDefine marginTop(double value) {
    return this.copyWith(
      marginValue: (this.marginValue ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MTextFieldModifierDefine marginBottom(double value) {
    return this.copyWith(
      marginValue:
          (this.marginValue ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MTextFieldModifierDefine margin(EdgeInsets? marginValue) {
    return this.copyWith(marginValue: marginValue);
  }

  MTextFieldModifierDefine backgroundColor(Color? value) {
    return this.copyWith(backgroundColorValue: value);
  }

  MTextFieldModifierDefine center(bool value) {
    return this.copyWith(centerAlignValue: value);
  }

  MTextFieldModifierDefine size(Size value) {
    return this.copyWith(widthValue: value.width, heightValue: value.height);
  }

  MTextFieldModifierDefine width(double? value) {
    return this.copyWith(widthValue: value);
  }

  MTextFieldModifierDefine height(double? value) {
    return this.copyWith(heightValue: value);
  }

  MTextFieldModifierDefine onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  MTextFieldModifierDefine onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  MTextFieldModifierDefine click(VoidCallback onTap) {
    return setClick(onTap);
  }

  MTextFieldModifierDefine setClick(VoidCallback onTapValue) {
    return this.copyWith(onTapValue: onTapValue);
  }

  MTextFieldModifierDefine borderRadius(double value) {
    return this.copyWith(borderRadiusValue: BorderRadius.circular(value));
  }

  MTextFieldModifierDefine borderRadiusVertical(double value) {
    return this.copyWith(
        borderRadiusValue: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  MTextFieldModifierDefine borderRadiusHorizontal(double value) {
    return this.copyWith(
        borderRadiusValue: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  /// General============End
}
