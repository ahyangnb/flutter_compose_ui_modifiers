import 'package:flutter/material.dart';
import 'package:flutter_compose_ui_modifiers/flutter_compose_ui_modifiers.dart';

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

  DefineMTextModifier size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
  }

  DefineMTextModifier width(double? value) {
    return this.copyWith(valueWidth: value);
  }

  DefineMTextModifier height(double? value) {
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

  DefineMRowModifier size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
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

  DefineMColumnModifier size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
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

  DefineMAddButtonModifier size(Size value) {
    return this.copyWith(valueWidth: value.width, valueHeight: value.height);
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
}
