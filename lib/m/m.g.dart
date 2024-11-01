import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';
import 'dart:math' as math;

import 'package:get/get.dart';

extension MTextFiledGenerator on DefineMTextFieldModifier {
  DefineMTextFieldModifier shadow({
    required Offset offset,
    required double blurRadius,
    required double spreadRadius,
    required Color color,
  }) {
    return this.copyWith(
        valueShadow: BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      color: color,
    ));
  }

  DefineMTextFieldModifier shadowDef({Color? color}) {
    final valueShadow = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMTextFieldModifier shadowOffset(double dx, double dy) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(dx, dy),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMTextFieldModifier shadowBlur(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: value,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMTextFieldModifier shadowSpread(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: value,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMTextFieldModifier shadowColor(Color value) {
    final valueShadow = BoxShadow(
      color: value,
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMTextFieldModifier paddingContainer(double value) {
    return setPaddingContainerEdge(EdgeInsets.all(value));
  }

  DefineMTextFieldModifier paddingContainerSet(EdgeInsets value) {
    return setPaddingContainerEdge(value);
  }

  DefineMTextFieldModifier setPaddingContainerEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMTextFieldModifier paddingContainerTop(double value) {
    return setPaddingContainerTop(value);
  }

  DefineMTextFieldModifier setPaddingContainerTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMTextFieldModifier paddingContainerHorizontal(double value) {
    return setPaddingContainerHorizontal(value);
  }

  DefineMTextFieldModifier setPaddingContainerHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMTextFieldModifier paddingContainerVertical(double value) {
    return setPaddingContainerVertical(value);
  }

  DefineMTextFieldModifier setPaddingContainerVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMTextFieldModifier paddingContainerSymmetric(
      {double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMTextFieldModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
  }

  DefineMTextFieldModifier paddingContainerBottom(double value) {
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

  DefineMTextFieldModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMTextFieldModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMTextFieldModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMTextFieldModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextFieldModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMTextFieldModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMTextFieldModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMTextFieldModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMTextFieldModifier center([bool value = true]) {
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

  DefineMTextFieldModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
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

  DefineMTextFieldModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMTextFieldModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
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

  DefineMTextFieldModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMTextFieldModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMTextFieldModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMTextFieldModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMTextFieldModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMTextFieldModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMTextFieldModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMTextFieldModifier outsideBorderVertical(
      {Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMTextFieldModifier outsideBorderHorizontal(
      {Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMTextFieldModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMTextFieldModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMTextFieldModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMTextFieldModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMTextFieldModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMTextFieldModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMTextFieldModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMTextFieldModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMTextFieldModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextFieldModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextFieldModifier outSizeFlex() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMTextFieldModifier expandedOutSide() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMTextFieldModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMTextFieldModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
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

  DefineMTextFieldModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextFieldModifier corner(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextFieldModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextFieldModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextFieldModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextFieldModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMTextFieldModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }

  DefineMTextFieldModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMTextFieldModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMTextFieldModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMTextFieldModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMTextFieldModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMTextFieldModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMTextFieldModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMTextFieldModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMTextFieldModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMTextFieldModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMTextFieldModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMTextFieldModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMTextFieldModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMTextFieldModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMTextFieldModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMTextFieldModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMTextFieldModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTextFieldModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTextFieldModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTextFieldModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTextFieldModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMTextFieldModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMTextFieldModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMTextFieldModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMTextFieldModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMTextFieldModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMTextFieldModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMTextFieldModifier alignContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMTextFieldModifier alignContainerCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMTextFieldModifier alignContainerRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMTextFieldModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMTextFieldModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMTextFieldModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMTextFieldModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMTextFieldModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  DefineMTextFieldModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMTextFieldModifier scroll([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMTextFieldModifier scrollController(ScrollController value) {
    return this.copyWith(valueScrollController: value);
  }

  DefineMTextFieldModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMTextFieldModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMTextFieldModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMTextFieldModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMTextFieldModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMTextFieldModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
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

  DefineMTextModifier paddingSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMTextModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
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

  DefineMTextModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMTextModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMTextModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMTextModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMTextModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMTextModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMTextModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMTextModifier center([bool value = true]) {
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

  DefineMTextModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
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

  DefineMTextModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMTextModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
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

  DefineMTextModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMTextModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMTextModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMTextModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMTextModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMTextModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMTextModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMTextModifier outsideBorderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMTextModifier outsideBorderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMTextModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMTextModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMTextModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMTextModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMTextModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMTextModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMTextModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMTextModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMTextModifier flex([int? value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextModifier expanded([int? value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTextModifier outSizeFlex() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMTextModifier expandedOutSide() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMTextModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMTextModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
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

  DefineMTextModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextModifier corner(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMTextModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTextModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMTextModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }

  DefineMTextModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMTextModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMTextModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMTextModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMTextModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMTextModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMTextModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMTextModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMTextModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMTextModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMTextModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMTextModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMTextModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMTextModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMTextModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMTextModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMTextModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTextModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTextModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTextModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTextModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMTextModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMTextModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMTextModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMTextModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMTextModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMTextModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMTextModifier align(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMTextModifier alignCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMTextModifier alignRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMTextModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMTextModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMTextModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMTextModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMTextModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  DefineMTextModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMTextModifier scroll([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMTextModifier scrollController(ScrollController value) {
    return this.copyWith(valueScrollController: value);
  }

  DefineMTextModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMTextModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMTextModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMTextModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMTextModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMTextModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
  }
}

extension MRowGeneralGenerator on DefineMRowModifier {
  DefineMRowModifier shadow({
    required Offset offset,
    required double blurRadius,
    required double spreadRadius,
    required Color color,
  }) {
    return this.copyWith(
        valueShadow: BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      color: color,
    ));
  }

  DefineMRowModifier shadowDef({Color? color}) {
    final valueShadow = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMRowModifier shadowOffset(double dx, double dy) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(dx, dy),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMRowModifier shadowBlur(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: value,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMRowModifier shadowSpread(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: value,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMRowModifier shadowColor(Color value) {
    final valueShadow = BoxShadow(
      color: value,
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMRowModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMRowModifier paddingAll(double value) {
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

  DefineMRowModifier paddingSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMRowModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
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

  DefineMRowModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMRowModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMRowModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMRowModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMRowModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMRowModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMRowModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMRowModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMRowModifier center([bool value = true]) {
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

  DefineMRowModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
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

  DefineMRowModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMRowModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
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

  DefineMRowModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMRowModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMRowModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMRowModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMRowModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMRowModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMRowModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMRowModifier outsideBorderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMRowModifier outsideBorderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMRowModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMRowModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMRowModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMRowModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMRowModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMRowModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMRowModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMRowModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMRowModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMRowModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMRowModifier outSizeFlex() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMRowModifier expandedOutSide() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMRowModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMRowModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
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

  DefineMRowModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMRowModifier corner(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMRowModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMRowModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMRowModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMRowModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMRowModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }

  DefineMRowModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMRowModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMRowModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMRowModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMRowModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMRowModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMRowModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMRowModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMRowModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMRowModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMRowModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMRowModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMRowModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMRowModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMRowModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMRowModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMRowModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMRowModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMRowModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMRowModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMRowModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMRowModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMRowModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMRowModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMRowModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMRowModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMRowModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMRowModifier align(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMRowModifier alignCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMRowModifier alignRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMRowModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMRowModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMRowModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMRowModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMRowModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  DefineMRowModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMRowModifier scroll([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMRowModifier scrollController(ScrollController value) {
    return this.copyWith(valueScrollController: value);
  }

  DefineMRowModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMRowModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMRowModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMRowModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMRowModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMRowModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
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

  DefineMListViewModifier paddingSymmetric(
      {double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMListViewModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
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

  DefineMListViewModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMListViewModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
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

  DefineMListViewModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMListViewModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMListViewModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMListViewModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMListViewModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMListViewModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMListViewModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMListViewModifier outsideBorderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMListViewModifier outsideBorderHorizontal(
      {Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMListViewModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMListViewModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMListViewModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMListViewModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMListViewModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMListViewModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMListViewModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMListViewModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMListViewModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMListViewModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMListViewModifier outSizeFlex() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMListViewModifier expandedOutSide() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMListViewModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMListViewModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
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

  DefineMListViewModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMListViewModifier corner(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMListViewModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMListViewModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMListViewModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMListViewModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMListViewModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }

  DefineMListViewModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMListViewModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMListViewModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMListViewModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMListViewModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMListViewModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMListViewModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMListViewModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMListViewModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMListViewModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMListViewModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMListViewModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMListViewModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMListViewModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMListViewModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMListViewModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMListViewModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMListViewModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMListViewModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMListViewModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMListViewModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMListViewModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMListViewModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMListViewModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMListViewModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMListViewModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMListViewModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMListViewModifier align(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMListViewModifier alignCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMListViewModifier alignRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMListViewModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMListViewModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMListViewModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMListViewModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMListViewModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  // DefineMListViewModifier scrollable([bool value = true]) {
  //   return this.copyWith(valueScrollable: value);
  // }
  //
  // DefineMListViewModifier scroll([bool value = true]) {
  //   return this.copyWith(valueScrollable: value);
  // }

  DefineMListViewModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMListViewModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMListViewModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMListViewModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMListViewModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMListViewModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
  }

  DefineMListViewModifier shadow({
    required Offset offset,
    required double blurRadius,
    required double spreadRadius,
    required Color color,
  }) {
    return this.copyWith(
        valueShadow: BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      color: color,
    ));
  }

  DefineMListViewModifier shadowDef({Color? color}) {
    final valueShadow = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMListViewModifier shadowOffset(double dx, double dy) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(dx, dy),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMListViewModifier shadowBlur(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: value,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMListViewModifier shadowSpread(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: value,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMListViewModifier shadowColor(Color value) {
    final valueShadow = BoxShadow(
      color: value,
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMListViewModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMListViewModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMListViewModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMListViewModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMListViewModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMListViewModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMListViewModifier marginSymmetric(
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

  DefineMListViewModifier marginOnly({
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

  DefineMListViewModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMListViewModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMListViewModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMListViewModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMListViewModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMListViewModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMListViewModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMListViewModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMListViewModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMListViewModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMListViewModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMListViewModifier center([bool value = true]) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMListViewModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMListViewModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMListViewModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMListViewModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
  }

  DefineMListViewModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMListViewModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMListViewModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMListViewModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMListViewModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMListViewModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMListViewModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
  }

  DefineMListViewModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMListViewModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMListViewModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMListViewModifier borderRadiusOnly({
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

  DefineMListViewModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }
}

extension MColumnGeneralGenerator on DefineMColumnModifier {
  DefineMColumnModifier shadow({
    required Offset offset,
    required double blurRadius,
    required double spreadRadius,
    required Color color,
  }) {
    return this.copyWith(
        valueShadow: BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      color: color,
    ));
  }

  DefineMColumnModifier shadowDef({Color? color}) {
    final valueShadow = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMColumnModifier shadowOffset(double dx, double dy) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(dx, dy),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMColumnModifier shadowBlur(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: value,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMColumnModifier shadowSpread(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: value,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMColumnModifier shadowColor(Color value) {
    final valueShadow = BoxShadow(
      color: value,
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
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

  DefineMColumnModifier paddingSymmetric(
      {double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMColumnModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
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

  DefineMColumnModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMColumnModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMColumnModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMColumnModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMColumnModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMColumnModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMColumnModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMColumnModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMColumnModifier center([bool value = true]) {
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

  DefineMColumnModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
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

  DefineMColumnModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMColumnModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
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

  DefineMColumnModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMColumnModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMColumnModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMColumnModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMColumnModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMColumnModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMColumnModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMColumnModifier outsideBorderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMColumnModifier outsideBorderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMColumnModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMColumnModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMColumnModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMColumnModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMColumnModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMColumnModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMColumnModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMColumnModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMColumnModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMColumnModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMColumnModifier outSizeFlex() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMColumnModifier expandedOutSide() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMColumnModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMColumnModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
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

  DefineMColumnModifier radiusAll(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMColumnModifier corner(double value) {
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

  DefineMColumnModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMColumnModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMColumnModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMColumnModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
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

  DefineMColumnModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMColumnModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMColumnModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMColumnModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMColumnModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMColumnModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMColumnModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMColumnModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMColumnModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMColumnModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMColumnModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMColumnModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMColumnModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMColumnModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMColumnModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMColumnModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMColumnModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMColumnModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMColumnModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMColumnModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMColumnModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMColumnModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMColumnModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMColumnModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMColumnModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMColumnModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMColumnModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMColumnModifier align(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMColumnModifier alignCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMColumnModifier alignRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMColumnModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMColumnModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMColumnModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMColumnModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMColumnModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  DefineMColumnModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMColumnModifier scroll([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMColumnModifier scrollController(ScrollController value) {
    return this.copyWith(valueScrollController: value);
  }

  DefineMColumnModifier onScrollStop(VoidCallback value) {
    return this.copyWith(valueOnScrollStop: value);
  }

  DefineMColumnModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMColumnModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMColumnModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMColumnModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMColumnModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMColumnModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
  }
}

extension MAddButtonGeneralGenerator on DefineMAddButtonModifier {
  DefineMAddButtonModifier shadow({
    required Offset offset,
    required double blurRadius,
    required double spreadRadius,
    required Color color,
  }) {
    return this.copyWith(
        valueShadow: BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      color: color,
    ));
  }

  DefineMAddButtonModifier shadowDef({Color? color}) {
    final valueShadow = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMAddButtonModifier shadowOffset(double dx, double dy) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(dx, dy),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMAddButtonModifier shadowBlur(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: value,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMAddButtonModifier shadowSpread(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: value,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMAddButtonModifier shadowColor(Color value) {
    final valueShadow = BoxShadow(
      color: value,
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
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

  DefineMAddButtonModifier paddingSymmetric(
      {double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMAddButtonModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
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

  DefineMAddButtonModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMAddButtonModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMAddButtonModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMAddButtonModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMAddButtonModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMAddButtonModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMAddButtonModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMAddButtonModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMAddButtonModifier center([bool value = true]) {
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

  DefineMAddButtonModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
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

  DefineMAddButtonModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMAddButtonModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
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

  DefineMAddButtonModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMAddButtonModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMAddButtonModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMAddButtonModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMAddButtonModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMAddButtonModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMAddButtonModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMAddButtonModifier outsideBorderVertical(
      {Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMAddButtonModifier outsideBorderHorizontal(
      {Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMAddButtonModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMAddButtonModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMAddButtonModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMAddButtonModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMAddButtonModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMAddButtonModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMAddButtonModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMAddButtonModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMAddButtonModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMAddButtonModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMAddButtonModifier outSizeFlex() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMAddButtonModifier expandedOutSide() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMAddButtonModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMAddButtonModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
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

  DefineMAddButtonModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMAddButtonModifier corner(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMAddButtonModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMAddButtonModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMAddButtonModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMAddButtonModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMAddButtonModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }

  DefineMAddButtonModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMAddButtonModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMAddButtonModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMAddButtonModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMAddButtonModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMAddButtonModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMAddButtonModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMAddButtonModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMAddButtonModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMAddButtonModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMAddButtonModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMAddButtonModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMAddButtonModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMAddButtonModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMAddButtonModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMAddButtonModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMAddButtonModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMAddButtonModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMAddButtonModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMAddButtonModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMAddButtonModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMAddButtonModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMAddButtonModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMAddButtonModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMAddButtonModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMAddButtonModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMAddButtonModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMAddButtonModifier align(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMAddButtonModifier alignCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMAddButtonModifier alignRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMAddButtonModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMAddButtonModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMAddButtonModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMAddButtonModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMAddButtonModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  DefineMAddButtonModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMAddButtonModifier scroll([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMAddButtonModifier scrollController(ScrollController value) {
    return this.copyWith(valueScrollController: value);
  }

  DefineMAddButtonModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMAddButtonModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMAddButtonModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMAddButtonModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMAddButtonModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMAddButtonModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
  }
}

extension MAddStackGeneralGenerator on DefineMStackModifier {
  DefineMStackModifier shadow({
    required Offset offset,
    required double blurRadius,
    required double spreadRadius,
    required Color color,
  }) {
    return this.copyWith(
        valueShadow: BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      color: color,
    ));
  }

  DefineMStackModifier shadowDef({Color? color}) {
    final valueShadow = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMStackModifier shadowOffset(double dx, double dy) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(dx, dy),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMStackModifier shadowBlur(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: value,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMStackModifier shadowSpread(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: value,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMStackModifier shadowColor(Color value) {
    final valueShadow = BoxShadow(
      color: value,
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
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

  DefineMStackModifier paddingSymmetric(
      {double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMStackModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
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

  DefineMStackModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMStackModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMStackModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMStackModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMStackModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMStackModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMStackModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMStackModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMStackModifier center([bool value = true]) {
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

  DefineMStackModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
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

  DefineMStackModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMStackModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
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

  DefineMStackModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMStackModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMStackModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMStackModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMStackModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMStackModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMStackModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMStackModifier outsideBorderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMStackModifier outsideBorderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMStackModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMStackModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMStackModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMStackModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMStackModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMStackModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMStackModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMStackModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMStackModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMStackModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMStackModifier outSizeFlex() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMStackModifier expandedOutSide() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMStackModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMStackModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
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

  DefineMStackModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMStackModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }

  DefineMStackModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMStackModifier corner(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMStackModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMStackModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMStackModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMStackModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMStackModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }

  DefineMStackModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMStackModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMStackModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMStackModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMStackModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMStackModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMStackModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMStackModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMStackModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMStackModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMStackModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMStackModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMStackModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMStackModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMStackModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMStackModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMStackModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMStackModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMStackModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMStackModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMStackModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMStackModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMStackModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMStackModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMStackModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMStackModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMStackModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMStackModifier alignContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMStackModifier alignContainerCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMStackModifier alignContainerRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMStackModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMStackModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMStackModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMStackModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMStackModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  DefineMStackModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMStackModifier scroll([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMStackModifier scrollController(ScrollController value) {
    return this.copyWith(valueScrollController: value);
  }

  DefineMStackModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMStackModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMStackModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMStackModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMStackModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMStackModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
  }
}

extension MImageGeneralGenerator on DefineMImageModifier {
  DefineMImageModifier shadow({
    required Offset offset,
    required double blurRadius,
    required double spreadRadius,
    required Color color,
  }) {
    return this.copyWith(
        valueShadow: BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      color: color,
    ));
  }

  DefineMImageModifier shadowDef({Color? color}) {
    final valueShadow = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMImageModifier shadowOffset(double dx, double dy) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(dx, dy),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMImageModifier shadowBlur(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: value,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMImageModifier shadowSpread(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: value,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMImageModifier shadowColor(Color value) {
    final valueShadow = BoxShadow(
      color: value,
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
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

  DefineMImageModifier paddingSymmetric(
      {double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMImageModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
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

  DefineMImageModifier marginAll(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMImageModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMImageModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMImageModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMImageModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMImageModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMImageModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMImageModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMImageModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMImageModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMImageModifier center([bool value = true]) {
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

  DefineMImageModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
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

  DefineMImageModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMImageModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
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

  DefineMImageModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMImageModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMImageModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMImageModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMImageModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMImageModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMImageModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMImageModifier outsideBorderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMImageModifier outsideBorderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMImageModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMImageModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMImageModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMImageModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMImageModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMImageModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMImageModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMImageModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMImageModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMImageModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMImageModifier outSizeFlex() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMImageModifier expandedOutSide() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMImageModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMImageModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
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

  DefineMImageModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMImageModifier corner(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMImageModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMImageModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMImageModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMImageModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMImageModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }

  DefineMImageModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMImageModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMImageModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMImageModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMImageModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMImageModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMImageModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMImageModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMImageModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMImageModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMImageModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMImageModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMImageModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMImageModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMImageModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMImageModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMImageModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMImageModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMImageModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMImageModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMImageModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMImageModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMImageModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMImageModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMImageModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMImageModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMImageModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMImageModifier align(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMImageModifier alignCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMImageModifier alignRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMImageModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMImageModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMImageModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMImageModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMImageModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  DefineMImageModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMImageModifier scroll([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMImageModifier scrollController(ScrollController value) {
    return this.copyWith(valueScrollController: value);
  }

  DefineMImageModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMImageModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMImageModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMImageModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMImageModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMImageModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
  }
}

extension MTileGeneralGenerator on DefineMTileModifier {
  DefineMTileModifier shadow({
    required Offset offset,
    required double blurRadius,
    required double spreadRadius,
    required Color color,
  }) {
    return this.copyWith(
        valueShadow: BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      color: color,
    ));
  }

  DefineMTileModifier shadowDef({Color? color}) {
    final valueShadow = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMTileModifier shadowOffset(double dx, double dy) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(dx, dy),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMTileModifier shadowBlur(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: value,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMTileModifier shadowSpread(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: value,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMTileModifier shadowColor(Color value) {
    final valueShadow = BoxShadow(
      color: value,
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
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

  DefineMTileModifier paddingSymmetric({double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMTileModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
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

  DefineMTileModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMTileModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMTileModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMTileModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMTileModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMTileModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMTileModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMTileModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMTileModifier center([bool value = true]) {
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

  DefineMTileModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
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

  DefineMTileModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMTileModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
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

  DefineMTileModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMTileModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMTileModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMTileModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMTileModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMTileModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMTileModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMTileModifier outsideBorderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMTileModifier outsideBorderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMTileModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMTileModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMTileModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMTileModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMTileModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMTileModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMTileModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMTileModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMTileModifier flex([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTileModifier expanded([int value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMTileModifier outSizeFlex() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMTileModifier expandedOutSide() {
    return this.copyWith(valueOutSizeFlex: true);
  }

  DefineMTileModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMTileModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
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

  DefineMTileModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMTileModifier corner(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMTileModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMTileModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMTileModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMTileModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMTileModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }

  DefineMTileModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMTileModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMTileModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMTileModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMTileModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMTileModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMTileModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMTileModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMTileModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMTileModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMTileModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMTileModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMTileModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMTileModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMTileModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMTileModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMTileModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTileModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTileModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTileModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMTileModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMTileModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMTileModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMTileModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMTileModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMTileModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMTileModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMTileModifier align(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMTileModifier alignCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMTileModifier alignRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMTileModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMTileModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMTileModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMTileModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMTileModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  DefineMTileModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMTileModifier scroll([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMTileModifier scrollController(ScrollController value) {
    return this.copyWith(valueScrollController: value);
  }

  DefineMTileModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMTileModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMTileModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMTileModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMTileModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMTileModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
  }
}

extension MContainerGeneralGenerator on DefineMContainerModifier {
  DefineMContainerModifier shadow({
    required Offset offset,
    required double blurRadius,
    required double spreadRadius,
    required Color color,
  }) {
    return this.copyWith(
        valueShadow: BoxShadow(
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
      color: color,
    ));
  }

  DefineMContainerModifier shadowDef({Color? color}) {
    final valueShadow = BoxShadow(
      color: color ?? Color(0xff000000).withOpacity(0.1),
      offset: const Offset(0, 2),
      blurRadius: 4,
      spreadRadius: 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMContainerModifier shadowOffset(double dx, double dy) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(dx, dy),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMContainerModifier shadowBlur(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: value,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMContainerModifier shadowSpread(double value) {
    final valueShadow = BoxShadow(
      color: this.valueShadow?.color ?? Color(0xff000000).withOpacity(0.1),
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: value,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMContainerModifier shadowColor(Color value) {
    final valueShadow = BoxShadow(
      color: value,
      offset: Offset(this.valueShadow?.offset.dx ?? 0.0,
          this.valueShadow?.offset.dy ?? 0.0),
      blurRadius: this.valueShadow?.blurRadius ?? 4,
      spreadRadius: this.valueShadow?.spreadRadius ?? 0,
    );
    return this.copyWith(valueShadow: valueShadow);
  }

  DefineMContainerModifier paddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMContainerModifier paddingBottom(double value) {
    return this.copyWith(
      valuePadding:
          (this.valuePadding ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMContainerModifier padding(double value) {
    return setPaddingEdge(EdgeInsets.all(value));
  }

  DefineMContainerModifier paddingSet(EdgeInsets value) {
    return setPaddingEdge(value);
  }

  DefineMContainerModifier setPaddingEdge(EdgeInsets? value) {
    return this.copyWith(
      valuePadding: value ?? this.valuePadding ?? EdgeInsets.zero,
    );
  }

  DefineMContainerModifier setPaddingTop(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMContainerModifier paddingHorizontal(double value) {
    return setPaddingHorizontal(value);
  }

  DefineMContainerModifier setPaddingHorizontal(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(left: value, right: value),
    );
  }

  DefineMContainerModifier paddingVertical(double value) {
    return setPaddingVertical(value);
  }

  DefineMContainerModifier setPaddingVertical(double value) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero)
          .copyWith(top: value, bottom: value),
    );
  }

  DefineMContainerModifier paddingSymmetric(
      {double? horizontal, double? vertical}) {
    return this.copyWith(
      valuePadding: (this.valuePadding ?? EdgeInsets.zero).copyWith(
        left: horizontal ?? this.valuePadding?.left,
        right: horizontal ?? this.valuePadding?.right,
        top: vertical ?? this.valuePadding?.top,
        bottom: vertical ?? this.valuePadding?.bottom,
      ),
    );
  }

  DefineMContainerModifier positioned(
      {double? top, double? bottom, double? left, double? right}) {
    return this.copyWith(
        valueTop: top, valueBottom: bottom, valueLeft: left, valueRight: right);
  }

  DefineMContainerModifier marginTop(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(top: value),
    );
  }

  DefineMContainerModifier marginBottom(double value) {
    return this.copyWith(
      valueMargin:
          (this.valueMargin ?? EdgeInsets.zero).copyWith(bottom: value),
    );
  }

  DefineMContainerModifier marginLeft(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(left: value),
    );
  }

  DefineMContainerModifier marginRight(double value) {
    return this.copyWith(
      valueMargin: (this.valueMargin ?? EdgeInsets.zero).copyWith(right: value),
    );
  }

  DefineMContainerModifier marginHorizontal(double value) {
    return marginSymmetric(horizontal: value);
  }

  DefineMContainerModifier marginVertical(double value) {
    return marginSymmetric(vertical: value);
  }

  DefineMContainerModifier marginSymmetric(
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

  DefineMContainerModifier marginOnly({
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

  DefineMContainerModifier marginSet(EdgeInsets? value) {
    return this.copyWith(valueMargin: value);
  }

  DefineMContainerModifier margin(double? value) {
    return this.copyWith(valueMargin: EdgeInsets.all(value ?? 0));
  }

  DefineMContainerModifier backgroundColor(Color? value) {
    return this.copyWith(valueBackgroundColor: value);
  }

  DefineMContainerModifier backgroundColorHex(int value) {
    return this.copyWith(valueBackgroundColor: Color(value));
  }

  DefineMContainerModifier outsideBackgroundColor(Color? value) {
    return this.copyWith(valueOutsideBackgroundColor: value);
  }

  DefineMContainerModifier outsideBackgroundColorHex(int value) {
    return this.copyWith(valueOutsideBackgroundColor: Color(value));
  }

  DefineMContainerModifier outsideBorderRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMContainerModifier outsideBorderRadiusSet(BorderRadius value) {
    return this.copyWith(valueOutsideBorderRadius: value);
  }

  DefineMContainerModifier outsideBorderRadiusVertical(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMContainerModifier outsideBorderRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return this.copyWith(
      valueOutsideBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
      ),
    );
  }

  DefineMContainerModifier outsideBorderRadiusHorizontal(double value) {
    return this.copyWith(
        valueOutsideBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMContainerModifier center([bool value = true]) {
    return this.copyWith(valueCenterAlign: value);
  }

  DefineMContainerModifier centered() {
    return this.copyWith(valueCenterAlign: true);
  }

  DefineMContainerModifier sizeSet(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMContainerModifier sizeAll(double value) {
    return this.copyWith(valueWidth: value, valueHeight: value);
  }

  DefineMContainerModifier size(double valueWidth, double valueHeight) {
    return this.copyWith(valueWidth: valueWidth, valueHeight: valueHeight);
  }

  DefineMContainerModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMContainerModifier height(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMContainerModifier heightSize(double? value) {
    return this.copyWith(valueHeight: value);
  }

  DefineMContainerModifier onTap(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMContainerModifier onClick(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMContainerModifier click(VoidCallback onTap) {
    return setClick(onTap);
  }

  DefineMContainerModifier setClick(VoidCallback valueOnTap) {
    return this.copyWith(valueOnTap: valueOnTap);
  }

  DefineMContainerModifier clipCircle() {
    return this.copyWith(
        valueBorderRadius: BorderRadius.circular(
            math.max(valueWidth ?? 0, valueHeight ?? 0) / 2));
  }

  DefineMContainerModifier borderRadius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMContainerModifier borderRadiusSet(BorderRadius value) {
    return this.copyWith(valueBorderRadius: value);
  }

  DefineMContainerModifier borderRadiusVertical(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.vertical(
            top: Radius.circular(value), bottom: Radius.circular(value)));
  }

  DefineMContainerModifier borderRadiusOnly({
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

  DefineMContainerModifier borderRadiusHorizontal(double value) {
    return this.copyWith(
        valueBorderRadius: BorderRadius.horizontal(
            left: Radius.circular(value), right: Radius.circular(value)));
  }

  DefineMContainerModifier borderAll({Color? color, double? width}) {
    return this.copyWith(
      valueBorder: Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMContainerModifier borderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide),
    );
  }

  DefineMContainerModifier borderVertical({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMContainerModifier borderHorizontal({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMContainerModifier borderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(top: borderSide),
    );
  }

  DefineMContainerModifier borderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(left: borderSide),
    );
  }

  DefineMContainerModifier borderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueBorder: Border(right: borderSide),
    );
  }

  DefineMContainerModifier border(Border? value) {
    return this.copyWith(valueBorder: value);
  }

  DefineMContainerModifier borderWhite() {
    return this
        .copyWith(valueBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMContainerModifier borderColor(Color value) {
    return this.copyWith(
        valueBorder:
            Border.all(color: value, width: this.valueBorder?.left.width ?? 1));
  }

  DefineMContainerModifier borderColorHex(int value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: Color(value), width: this.valueBorder?.left.width ?? 1));
  }

  DefineMContainerModifier borderWidth(double value) {
    return this.copyWith(
        valueBorder: Border.all(
            color: this.valueBorder?.left.color ?? Colors.white, width: value));
  }

  DefineMContainerModifier outsideBorderAll({Color? color, double? width}) {
    return this.copyWith(
      valueOutsideBorder:
          Border.all(color: color ?? Colors.white, width: width ?? 1),
    );
  }

  DefineMContainerModifier outsideBorderBottom({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide),
    );
  }

  DefineMContainerModifier outsideBorderVertical(
      {Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(bottom: borderSide, top: borderSide),
    );
  }

  DefineMContainerModifier outsideBorderHorizontal(
      {Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide, right: borderSide),
    );
  }

  DefineMContainerModifier outsideBorderTop({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(top: borderSide),
    );
  }

  DefineMContainerModifier outsideBorderLeft({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(left: borderSide),
    );
  }

  DefineMContainerModifier outsideBorderRight({Color? color, double? width}) {
    final borderSide =
        BorderSide(color: color ?? Colors.white, width: width ?? 1);
    return this.copyWith(
      valueOutsideBorder: Border(right: borderSide),
    );
  }

  DefineMContainerModifier outsideBorder(Border? value) {
    return this.copyWith(valueOutsideBorder: value);
  }

  DefineMContainerModifier outsideBorderWhite() {
    return this.copyWith(
        valueOutsideBorder: Border.all(color: Colors.white, width: 1));
  }

  DefineMContainerModifier outsideBorderColor(Color value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: value, width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMContainerModifier outsideBorderColorHex(int value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: Color(value),
            width: this.valueOutsideBorder?.left.width ?? 1));
  }

  DefineMContainerModifier outsideBorderWidth(double value) {
    return this.copyWith(
        valueOutsideBorder: Border.all(
            color: this.valueOutsideBorder?.left.color ?? Colors.white,
            width: value));
  }

  DefineMContainerModifier flex([int? value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMContainerModifier expanded([int? value = 1]) {
    return this.copyWith(valueFlex: value);
  }

  DefineMContainerModifier gradient([Gradient? value]) {
    return this.copyWith(valueGradient: value);
  }

  DefineMContainerModifier gradientMain() {
    return this.copyWith(valueGradient: MThemeConfig.gradientMain);
  }

  DefineMContainerModifier gradientDef([Color? color]) {
    return this.copyWith(
        valueGradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [(color ?? Colors.blue), Colors.white],
      stops: [0, 0.3],
    ));
  }

  DefineMContainerModifier top(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMContainerModifier bottom(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMContainerModifier left(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMContainerModifier right(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMContainerModifier topPosition(double? value) {
    return this.copyWith(valueTop: value);
  }

  DefineMContainerModifier bottomPosition(double? value) {
    return this.copyWith(valueBottom: value);
  }

  DefineMContainerModifier leftPosition(double? value) {
    return this.copyWith(valueLeft: value);
  }

  DefineMContainerModifier rightPosition(double? value) {
    return this.copyWith(valueRight: value);
  }

  DefineMContainerModifier position({
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

  DefineMContainerModifier shapeCircle() {
    return this.copyWith(valueShape: BoxShape.circle);
  }

  DefineMContainerModifier shape(BoxShape value) {
    return this.copyWith(valueShape: value);
  }

  DefineMContainerModifier onLongPressMoveUpdate(
      GestureLongPressMoveUpdateCallback value) {
    return this.copyWith(valueOnLongPressMoveUpdate: value);
  }

  DefineMContainerModifier onLongPress(GestureLongPressCallback value) {
    return this.copyWith(valueOnLongPress: value);
  }

  DefineMContainerModifier radius(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMContainerModifier corner(double value) {
    return this.copyWith(valueBorderRadius: BorderRadius.circular(value));
  }

  DefineMContainerModifier radiusTop(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier radiusBottom(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier radiusLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier radiusRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier radiusTopLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier radiusTopRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier radiusBottomLeft(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier radiusBottomRight(double value) {
    return this.copyWith(
      valueBorderRadius:
          ((this.valueBorderRadius as BorderRadius?) ?? BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier outsideRadius(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMContainerModifier outsideCorner(double value) {
    return this
        .copyWith(valueOutsideBorderRadius: BorderRadius.circular(value));
  }

  DefineMContainerModifier outsideRadiusTop(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier outsideRadiusBottom(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier outsideRadiusLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier outsideRadiusRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier outsideRadiusTopLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topLeft: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier outsideRadiusTopRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        topRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier outsideRadiusBottomLeft(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomLeft: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier outsideRadiusBottomRight(double value) {
    return this.copyWith(
      valueOutsideBorderRadius:
          ((this.valueOutsideBorderRadius as BorderRadius?) ??
                  BorderRadius.zero)
              .copyWith(
        bottomRight: Radius.circular(value),
      ),
    );
  }

  DefineMContainerModifier opacity(double value) {
    return this.copyWith(valueOpacity: value);
  }

  DefineMContainerModifier blur({double sigmaX = 10.0, double sigmaY = 10.0}) {
    return this.copyWith(valueSigmaX: sigmaX, valueSigmaY: sigmaY);
  }

  DefineMContainerModifier onLongPressUp(GestureLongPressUpCallback value) {
    return this.copyWith(valueOnLongPressUp: value);
  }

  DefineMContainerModifier material(
      [MaterialType value = MaterialType.transparency]) {
    return this.copyWith(valueMaterialType: value);
  }

  DefineMContainerModifier elevation([double value = 10.0]) {
    return this.copyWith(valueMaterialElevation: value);
  }

  DefineMContainerModifier outSideCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMContainerModifier outSideTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMContainerModifier gravityTop() {
    return this.copyWith(valueGravity: MGravity.top);
  }

  DefineMContainerModifier gravityBottom() {
    return this.copyWith(valueGravity: MGravity.bottom);
  }

  DefineMContainerModifier gravityCenterVertical() {
    return this.copyWith(valueGravity: MGravity.centerVertical);
  }

  DefineMContainerModifier gravityCenterHorizontal() {
    return this.copyWith(valueGravity: MGravity.centerHorizontal);
  }

  DefineMContainerModifier gravity(MGravity value) {
    return this.copyWith(valueGravity: value);
  }

  DefineMContainerModifier gravityRight() {
    return this.copyWith(valueGravity: MGravity.right);
  }

  DefineMContainerModifier gravityLeft() {
    return this.copyWith(valueGravity: MGravity.left);
  }

  DefineMContainerModifier backgroundImageFit(BoxFit value) {
    return this.copyWith(valueBackgroundImageFit: value);
  }

  DefineMContainerModifier backgroundImage(String value) {
    return this.copyWith(valueBackgroundImage: value);
  }

  DefineMContainerModifier dragOutToStatusBar(VoidCallback value) {
    return this.copyWith(valueDragOutToStatusBar: value);
  }

  DefineMContainerModifier maskColor([Color? value]) {
    return this
        .copyWith(valueMaskColor: value ?? Colors.black.withOpacity(0.5));
  }

  DefineMContainerModifier constraints({
    double? minWidth,
    double? maxWidth,
    double? minHeight,
    double? maxHeight,
  }) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: minWidth ?? oldValue.minWidth,
      maxWidth: maxWidth ?? oldValue.maxWidth,
      minHeight: minHeight ?? oldValue.minHeight,
      maxHeight: maxHeight ?? oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMContainerModifier minWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: value,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMContainerModifier maxWidth(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: value,
      minHeight: oldValue.minHeight,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMContainerModifier minHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: value,
      maxHeight: oldValue.maxHeight,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  DefineMContainerModifier maxHeight(double value) {
    final oldValue = this.valueConstraints ?? BoxConstraints();
    final useValue = oldValue.copyWith(
      minWidth: oldValue.minWidth,
      maxWidth: oldValue.maxWidth,
      minHeight: oldValue.minHeight,
      maxHeight: value,
    );
    return this.copyWith(valueConstraints: useValue);
  }

  // If it doesn't work, set the fullWidth or fullHeight.
  DefineMContainerModifier gradientBorder({
    Gradient? value,
    double width = 1.0,
  }) {
    return this.copyWith(
      valueGradientBorder:
          value ?? LinearGradient(colors: [Colors.red, Colors.blue]),
      valueWidth: width,
    );
  }

  DefineMContainerModifier fullSize([double? value]) {
    return this.copyWith(valueFullWidth: value, valueFullHeight: value);
  }

  DefineMContainerModifier fullWidth([double? value]) {
    return this.copyWith(valueFullWidth: value);
  }

  DefineMContainerModifier fullHeight([double? value]) {
    return this.copyWith(valueFullHeight: value);
  }

  DefineMContainerModifier containerAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMContainerModifier alignmentContainer(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMContainerModifier align(AlignmentGeometry? value) {
    return this.copyWith(valueContainerAlignment: value);
  }

  DefineMContainerModifier alignCenter() {
    return this.copyWith(valueContainerAlignment: Alignment.center);
  }

  DefineMContainerModifier alignRight() {
    return this.copyWith(valueContainerAlignment: Alignment.centerRight);
  }

  DefineMContainerModifier outSideAlignment(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMContainerModifier alignmentOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMContainerModifier alignOutSide(AlignmentGeometry? value) {
    return this.copyWith(valueOutSideAlignment: value);
  }

  DefineMContainerModifier alignOutSideCenter() {
    return this.copyWith(valueOutSideAlignment: Alignment.center);
  }

  DefineMContainerModifier alignOutSideRight() {
    return this.copyWith(valueOutSideAlignment: Alignment.centerRight);
  }

  DefineMContainerModifier scrollable([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMContainerModifier scroll([bool value = true]) {
    return this.copyWith(valueScrollable: value);
  }

  DefineMContainerModifier scrollController(ScrollController value) {
    return this.copyWith(valueScrollController: value);
  }

  DefineMContainerModifier safeArea({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) {
    return this.copyWith(
      valueSafeArea: SafeArea(
        top: top,
        bottom: bottom,
        left: left,
        right: right,
        child: Container(),
      ),
    );
  }

  DefineMContainerModifier key(Key key) {
    return this.copyWith(valueKey: key);
  }

  DefineMContainerModifier visible(bool value) {
    return this.copyWith(valueVisible: value);
  }

  DefineMContainerModifier tabLength(int value) {
    return this.copyWith(valueTabLength: value);
  }

  DefineMContainerModifier cancelFocusWhenClick([bool value = true]) {
    return this.copyWith(valueCancelFocusWhenClick: value);
  }

  DefineMContainerModifier obxListener(Rx<dynamic> value) {
    return this.copyWith(valueObxListener: value);
  }
}
