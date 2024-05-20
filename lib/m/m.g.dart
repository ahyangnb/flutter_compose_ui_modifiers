import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'dart:math' as math;

extension MTextFiledGenerator on DefineMTextFieldModifier {
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

  DefineMTextFieldModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMTextFieldModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMTextFieldModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMTextFieldModifier size(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
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

  DefineMTextFieldModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
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

  DefineMTextFieldModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMTextFieldModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMTextFieldModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMTextFieldModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMTextFieldModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMTextFieldModifier border(Border value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMTextFieldModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextFieldModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextFieldModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMTextFieldModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMTextFieldModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMTextFieldModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMTextFieldModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMTextFieldModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMTextFieldModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMTextFieldModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMTextFieldModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMTextFieldModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMTextFieldModifier position({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return this.copyWith(
      valueTop: top,
      valueBottom: bottom,
      valueLeft: left,
      valueRight: right,
    );
  }

  DefineMTextFieldModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMTextFieldModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMTextFieldModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMTextFieldModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }
}

extension MTextGeneralGenerator on DefineMTextModifier {
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

  DefineMTextModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMTextModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMTextModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMTextModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMTextModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
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

  DefineMTextModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMTextModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMTextModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMTextModifier size(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMTextModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMTextModifier heightSize(double? value) {
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

  DefineMTextModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
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

  DefineMTextModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMTextModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMTextModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMTextModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMTextModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMTextModifier border(Border value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMTextModifier flex([int? value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextModifier expanded([int? value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMTextModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMTextModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMTextModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMTextModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMTextModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMTextModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMTextModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMTextModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMTextModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMTextModifier position({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return this.copyWith(
      valueTop: top,
      valueBottom: bottom,
      valueLeft: left,
      valueRight: right,
    );
  }

  DefineMTextModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMTextModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMTextModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMTextModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }
}

extension MRowGeneralGenerator on DefineMRowModifier {
  DefineMRowModifier shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  DefineMRowModifier shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  DefineMRowModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMRowModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMRowModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMRowModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMRowModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMRowModifier paddingLeft(double value) {
    return setPaddingLeft(value);
  }

  DefineMRowModifier setPaddingLeft(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMRowModifier paddingRight(double value) {
    return setPaddingRight(value);
  }

  DefineMRowModifier setPaddingRight(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMRowModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMRowModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMRowModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMRowModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMRowModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMRowModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMRowModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMRowModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMRowModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMRowModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMRowModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMRowModifier marginSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valueMargin?.left,
        right: horizontal ?? this.valueMargin?.right,
        top: vertical ?? this.valueMargin?.top,
        bottom: vertical ?? this.valueMargin?.bottom,
      ),
    );
  }

  DefineMRowModifier marginOnly({
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

  DefineMRowModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMRowModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMRowModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMRowModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMRowModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMRowModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMRowModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMRowModifier size(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMRowModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMRowModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMRowModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMRowModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMRowModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMRowModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMRowModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
  }

  DefineMRowModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMRowModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMRowModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMRowModifier borderRadiusOnly({
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

  DefineMRowModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMRowModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMRowModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMRowModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMRowModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMRowModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMRowModifier border(Border value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMRowModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMRowModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMRowModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMRowModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMRowModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMRowModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMRowModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMRowModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMRowModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMRowModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMRowModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMRowModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMRowModifier position({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return this.copyWith(
      valueTop: top,
      valueBottom: bottom,
      valueLeft: left,
      valueRight: right,
    );
  }

  DefineMRowModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMRowModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMRowModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMRowModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }
}

extension MListViewGeneralGenerator on DefineMListViewModifier {
  DefineMListViewModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMListViewModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMListViewModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMListViewModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMListViewModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMListViewModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMListViewModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMListViewModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMListViewModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMListViewModifier paddingLeft(double value) {
    return setPaddingLeft(value);
  }

  DefineMListViewModifier setPaddingLeft(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMListViewModifier paddingRight(double value) {
    return setPaddingRight(value);
  }

  DefineMListViewModifier setPaddingRight(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMListViewModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMListViewModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMListViewModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMListViewModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMListViewModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMListViewModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMListViewModifier border(Border value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMListViewModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMListViewModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMListViewModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMListViewModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMListViewModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMListViewModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMListViewModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMListViewModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMListViewModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMListViewModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMListViewModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMListViewModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMListViewModifier position({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return this.copyWith(
      valueTop: top,
      valueBottom: bottom,
      valueLeft: left,
      valueRight: right,
    );
  }

  DefineMListViewModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMListViewModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMListViewModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMListViewModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }
}

extension MColumnGeneralGenerator on DefineMColumnModifier {
  DefineMColumnModifier shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  DefineMColumnModifier shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  DefineMColumnModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMColumnModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMColumnModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMColumnModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMColumnModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMColumnModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMColumnModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMColumnModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMColumnModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMColumnModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMColumnModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMColumnModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMColumnModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMColumnModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMColumnModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMColumnModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMColumnModifier marginSymmetric(
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

  DefineMColumnModifier marginOnly({
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

  DefineMColumnModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMColumnModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMColumnModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMColumnModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMColumnModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMColumnModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMColumnModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMColumnModifier size(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMColumnModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMColumnModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMColumnModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMColumnModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMColumnModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMColumnModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMColumnModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
  }

  DefineMColumnModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMColumnModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMColumnModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMColumnModifier borderRadiusOnly({
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

  DefineMColumnModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMColumnModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMColumnModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMColumnModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMColumnModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMColumnModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMColumnModifier border(Border value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMColumnModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMColumnModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMColumnModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMColumnModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMColumnModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMColumnModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMColumnModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMColumnModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMColumnModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMColumnModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMColumnModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMColumnModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMColumnModifier position({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return this.copyWith(
      valueTop: top,
      valueBottom: bottom,
      valueLeft: left,
      valueRight: right,
    );
  }

  DefineMColumnModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMColumnModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMColumnModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMColumnModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }

  DefineMColumnModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMColumnModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMColumnModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }
}

extension MAddButtonGeneralGenerator on DefineMAddButtonModifier {
  DefineMAddButtonModifier shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  DefineMAddButtonModifier shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  DefineMAddButtonModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMAddButtonModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMAddButtonModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMAddButtonModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMAddButtonModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMAddButtonModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMAddButtonModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMAddButtonModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMAddButtonModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMAddButtonModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMAddButtonModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMAddButtonModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMAddButtonModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMAddButtonModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMAddButtonModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMAddButtonModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMAddButtonModifier marginSymmetric(
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

  DefineMAddButtonModifier marginOnly({
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

  DefineMAddButtonModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMAddButtonModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMAddButtonModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMAddButtonModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMAddButtonModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMAddButtonModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMAddButtonModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMAddButtonModifier size(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMAddButtonModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMAddButtonModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMAddButtonModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMAddButtonModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMAddButtonModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMAddButtonModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMAddButtonModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
  }

  DefineMAddButtonModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMAddButtonModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMAddButtonModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMAddButtonModifier borderRadiusOnly({
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

  DefineMAddButtonModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMAddButtonModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMAddButtonModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMAddButtonModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMAddButtonModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMAddButtonModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMAddButtonModifier border(Border value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMAddButtonModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMAddButtonModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMAddButtonModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMAddButtonModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMAddButtonModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMAddButtonModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMAddButtonModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMAddButtonModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMAddButtonModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMAddButtonModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMAddButtonModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMAddButtonModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMAddButtonModifier position({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return this.copyWith(
      valueTop: top,
      valueBottom: bottom,
      valueLeft: left,
      valueRight: right,
    );
  }

  DefineMAddButtonModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMAddButtonModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMAddButtonModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMAddButtonModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }
}

extension MAddStackGeneralGenerator on DefineMStackModifier {
  DefineMStackModifier shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  DefineMStackModifier shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  DefineMStackModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMStackModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMStackModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMStackModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMStackModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMStackModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMStackModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMStackModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMStackModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMStackModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMStackModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMStackModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMStackModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMStackModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMStackModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMStackModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMStackModifier marginSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valueMargin?.left,
        right: horizontal ?? this.valueMargin?.right,
        top: vertical ?? this.valueMargin?.top,
        bottom: vertical ?? this.valueMargin?.bottom,
      ),
    );
  }

  DefineMStackModifier marginOnly({
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

  DefineMStackModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMStackModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMStackModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMStackModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMStackModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMStackModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMStackModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMStackModifier size(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMStackModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMStackModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMStackModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMStackModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMStackModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMStackModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMStackModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
  }

  DefineMStackModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMStackModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMStackModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMStackModifier borderRadiusOnly({
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

  DefineMStackModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMStackModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMStackModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMStackModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMStackModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMStackModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMStackModifier border(Border value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMStackModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMStackModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMStackModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMStackModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMStackModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMStackModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMStackModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMStackModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMStackModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMStackModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMStackModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMStackModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMStackModifier position({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return this.copyWith(
      valueTop: top,
      valueBottom: bottom,
      valueLeft: left,
      valueRight: right,
    );
  }

  DefineMStackModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMStackModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMStackModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMStackModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMStackModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }

  DefineMStackModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }
}

extension MImageGeneralGenerator on DefineMImageModifier {
  DefineMImageModifier shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  DefineMImageModifier shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  DefineMImageModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMImageModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMImageModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMImageModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMImageModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMImageModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMImageModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMImageModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMImageModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMImageModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMImageModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMImageModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMImageModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMImageModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMImageModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMImageModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMImageModifier marginSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valueMargin?.left,
        right: horizontal ?? this.valueMargin?.right,
        top: vertical ?? this.valueMargin?.top,
        bottom: vertical ?? this.valueMargin?.bottom,
      ),
    );
  }

  DefineMImageModifier marginOnly({
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

  DefineMImageModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMImageModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMImageModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMImageModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMImageModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMImageModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMImageModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMImageModifier size(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMImageModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMImageModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMImageModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMImageModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMImageModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMImageModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMImageModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
  }

  DefineMImageModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMImageModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMImageModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMImageModifier borderRadiusOnly({
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

  DefineMImageModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMImageModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMImageModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMImageModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMImageModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMImageModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMImageModifier border(Border value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMImageModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMImageModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMImageModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMImageModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMImageModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMImageModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMImageModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMImageModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMImageModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMImageModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMImageModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMImageModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMImageModifier position({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return this.copyWith(
      valueTop: top,
      valueBottom: bottom,
      valueLeft: left,
      valueRight: right,
    );
  }

  DefineMImageModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMImageModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMImageModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMImageModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }
}

extension MTileGeneralGenerator on DefineMTileModifier {
  DefineMTileModifier shadow(BoxShadow value) {
    return this.copyWith(valueShadow: value);
  }

  DefineMTileModifier shadowDef({Color? color}) {
    final value = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: value);
  }

  DefineMTileModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMTileModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMTileModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMTileModifier paddingTop(double value) {
    return setPaddingTop(value);
  }

  DefineMTileModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMTileModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMTileModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMTileModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMTileModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMTileModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMTileModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMTileModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMTileModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMTileModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMTileModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMTileModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMTileModifier marginSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valueMargin?.left,
        right: horizontal ?? this.valueMargin?.right,
        top: vertical ?? this.valueMargin?.top,
        bottom: vertical ?? this.valueMargin?.bottom,
      ),
    );
  }

  DefineMTileModifier marginOnly({
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

  DefineMTileModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMTileModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMTileModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMTileModifier center(bool value) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMTileModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMTileModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMTileModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMTileModifier size(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMTileModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMTileModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMTileModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMTileModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMTileModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMTileModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMTileModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
  }

  DefineMTileModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMTileModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMTileModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMTileModifier borderRadiusOnly({
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

  DefineMTileModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMTileModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMTileModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMTileModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMTileModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMTileModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMTileModifier border(Border value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMTileModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTileModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTileModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMTileModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMTileModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMTileModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMTileModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMTileModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMTileModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMTileModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMTileModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMTileModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMTileModifier position({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return this.copyWith(
      valueTop: top,
      valueBottom: bottom,
      valueLeft: left,
      valueRight: right,
    );
  }

  DefineMTileModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMTileModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMTileModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMTileModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }
}
