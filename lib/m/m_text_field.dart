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
  MTextFieldModifierDefine copyWith({
    final InputDecoration? decorationValue,
    final TextStyle? styleValue,
    final bool? expandsValue,
    final int? maxLinesValue,

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
    return MTextFieldModifierDefine(
      decorationValue: decorationValue ?? this.decorationValue,
      styleValue: styleValue ?? this.styleValue,
      expandsValue: expandsValue ?? this.expandsValue,
      maxLinesValue: maxLinesValue ?? this.maxLinesValue,

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
    return this.copyWith(valueShadow: value);
  }

  MTextFieldModifierDefine shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  MTextFieldModifierDefine padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  MTextFieldModifierDefine paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  MTextFieldModifierDefine setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  MTextFieldModifierDefine paddingTop(double value) {
    return setPaddingTop(value);
  }

  MTextFieldModifierDefine setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MTextFieldModifierDefine paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  MTextFieldModifierDefine setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  MTextFieldModifierDefine paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  MTextFieldModifierDefine setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  MTextFieldModifierDefine paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MTextFieldModifierDefine marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  MTextFieldModifierDefine marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  MTextFieldModifierDefine marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  MTextFieldModifierDefine marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  MTextFieldModifierDefine marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  MTextFieldModifierDefine marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  MTextFieldModifierDefine marginSymmetric(
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

  MTextFieldModifierDefine marginOnly({
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

  MTextFieldModifierDefine marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  MTextFieldModifierDefine margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  MTextFieldModifierDefine backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  MTextFieldModifierDefine center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  MTextFieldModifierDefine size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  MTextFieldModifierDefine width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  MTextFieldModifierDefine height(double? value) {
    return this.copyWith(valueHeight: value);
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

  MTextFieldModifierDefine setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  MTextFieldModifierDefine borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  MTextFieldModifierDefine borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  MTextFieldModifierDefine borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  MTextFieldModifierDefine borderRadiusOnly({
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

  MTextFieldModifierDefine borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  /// General============End
}
