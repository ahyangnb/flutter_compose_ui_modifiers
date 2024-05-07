/// todo feature: Auto jump to next line when click enter key.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

class MTextField extends StatelessWidget {
  final DefineMTextFieldModifier? modifier;
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
        autofocus: modifier?.valueAutoFocus ?? false,
        controller: controller ?? TextEditingController(),
        decoration: modifier?.decorationValue,
        style: modifier?.styleValue,
        expands: modifier?.expandsValue ?? false,
        maxLines: modifier?.maxLinesValue,
        onSubmitted: modifier?.valueOnSubmitted,
        keyboardType: modifier?.valueKeyboardType,
        textInputAction: modifier?.valueTextInputAction,
      ),
    );
  }
}

final MTextFieldModifier = DefineMTextFieldModifier();

class DefineMTextFieldModifier extends MGeneralModifier {
  final InputDecoration? decorationValue;
  final TextStyle? styleValue;
  final bool? expandsValue;
  final int? maxLinesValue;
  final bool? valueAutoFocus;
  final ValueChanged<String>? valueOnSubmitted;
  final TextInputType? valueKeyboardType;
  final TextInputAction? valueTextInputAction;

  const DefineMTextFieldModifier({
    this.decorationValue,
    this.styleValue,
    this.expandsValue,
    this.maxLinesValue,
    this.valueAutoFocus,
    this.valueOnSubmitted,
    this.valueKeyboardType,
    this.valueTextInputAction,
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
  DefineMTextFieldModifier copyWith({
    final InputDecoration? decorationValue,
    final TextStyle? styleValue,
    final bool? expandsValue,
    final int? maxLinesValue,
    final bool? valueAutoFocus,
    final ValueChanged<String>? valueOnSubmitted,
    final TextInputType? valueKeyboardType,
    final TextInputAction? valueTextInputAction,

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
    return DefineMTextFieldModifier(
      decorationValue: decorationValue ?? this.decorationValue,
      styleValue: styleValue ?? this.styleValue,
      expandsValue: expandsValue ?? this.expandsValue,
      maxLinesValue: maxLinesValue ?? this.maxLinesValue,
      valueAutoFocus: valueAutoFocus ?? this.valueAutoFocus,
      valueOnSubmitted: valueOnSubmitted ?? this.valueOnSubmitted,
      valueKeyboardType: valueKeyboardType ?? this.valueKeyboardType,
      valueTextInputAction: valueTextInputAction ?? this.valueTextInputAction,

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

extension MTextFieldModifierPropertys on DefineMTextFieldModifier {
  DefineMTextFieldModifier textInputAction(TextInputAction value) {
    return this.copyWith(valueTextInputAction: value);
  }

  DefineMTextFieldModifier keyboardType(TextInputType value) {
    return this.copyWith(valueKeyboardType: value);
  }

  DefineMTextFieldModifier onSubmitted(ValueChanged<String>? value) {
    return this.copyWith(valueOnSubmitted: value);
  }

  DefineMTextFieldModifier hintText(String value) {
    return this.copyWith(
      decorationValue:
          (this.decorationValue ?? InputDecoration()).copyWith(hintText: value),
    );
  }

  DefineMTextFieldModifier hintStyle(TextStyle value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(hintStyle: value),
    );
  }

  DefineMTextFieldModifier hintColor(Color value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintStyle: (this.decorationValue?.hintStyle ?? TextStyle())
              .copyWith(color: value)),
    );
  }

  DefineMTextFieldModifier hintFontSize(double value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintStyle: (this.decorationValue?.hintStyle ?? TextStyle())
              .copyWith(fontSize: value)),
    );
  }

  DefineMTextFieldModifier hintFontWeight(FontWeight value) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
          hintStyle: (this.decorationValue?.hintStyle ?? TextStyle())
              .copyWith(fontWeight: value)),
    );
  }

  DefineMTextFieldModifier border(InputBorder value) {
    return this.copyWith(
      decorationValue:
          (this.decorationValue ?? InputDecoration()).copyWith(border: value),
    );
  }

  DefineMTextFieldModifier autoFocus(bool value) {
    return this.copyWith(valueAutoFocus: value);
  }

  DefineMTextFieldModifier noneBorder() {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(border: InputBorder.none),
    );
  }

  DefineMTextFieldModifier underlineBorder(Color color) {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration()).copyWith(
        border: UnderlineInputBorder(borderSide: BorderSide(color: color)),
      ),
    );
  }

  DefineMTextFieldModifier contentPadding(EdgeInsetsGeometry value) {
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

  DefineMTextFieldModifier contentPaddingHorizontal(double value) {
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

  DefineMTextFieldModifier contentPaddingVertical(double value) {
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

  DefineMTextFieldModifier contentPaddingNone() {
    return this.copyWith(
      decorationValue: (this.decorationValue ?? InputDecoration())
          .copyWith(contentPadding: EdgeInsets.zero),
    );
  }

  DefineMTextFieldModifier decoration(InputDecoration value) {
    return this.copyWith(decorationValue: value);
  }

  DefineMTextFieldModifier style(TextStyle value) {
    return this.copyWith(styleValue: value);
  }

  DefineMTextFieldModifier expands(bool? value) {
    return this.copyWith(expandsValue: value);
  }

  DefineMTextFieldModifier maxLines(int? value) {
    return this.copyWith(maxLinesValue: value);
  }

  DefineMTextFieldModifier labelColor(Color value) {
    return this.copyWith(
        styleValue: (this.styleValue ?? TextStyle()).copyWith(color: value));
  }

  DefineMTextFieldModifier labelFontSize(double value) {
    return this.copyWith(
        styleValue: (this.styleValue ?? TextStyle()).copyWith(fontSize: value));
  }

  DefineMTextFieldModifier labelFontWeight(FontWeight value) {
    return this.copyWith(
        styleValue:
            (this.styleValue ?? TextStyle()).copyWith(fontWeight: value));
  }

  /// General============Start
  ///
  DefineMTextFieldModifier shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  DefineMTextFieldModifier shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  DefineMTextFieldModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMTextFieldModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMTextFieldModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMTextFieldModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMTextFieldModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMTextFieldModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMTextFieldModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMTextFieldModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMTextFieldModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMTextFieldModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMTextFieldModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMTextFieldModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMTextFieldModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMTextFieldModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMTextFieldModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMTextFieldModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMTextFieldModifier marginSymmetric(
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

  DefineMTextFieldModifier marginOnly({
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

  DefineMTextFieldModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMTextFieldModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMTextFieldModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMTextFieldModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMTextFieldModifier size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMTextFieldModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMTextFieldModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMTextFieldModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMTextFieldModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMTextFieldModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMTextFieldModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMTextFieldModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextFieldModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMTextFieldModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMTextFieldModifier borderRadiusOnly({
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

  DefineMTextFieldModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMTextFieldModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextFieldModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  /// General============End
}
